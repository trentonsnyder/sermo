class Message < ApplicationRecord
  belongs_to :client
  belongs_to :user, required: false

  validates :body,
    presence: true
  
  after_create_commit {MessageBroadcastJob.perform_now self}

  def self.check_command(message, client)
    case message[:Body].split.first.downcase
    when '!next-task'
      task = client.tasks.next_due
      sending = ''
      if task
        formatted_task = []
        formatted_task << task.name
        formatted_task << task.body
        sending = formatted_task.join(', ')
      else
        sending = 'No new tasks! :D'
      end
      begin
        twilio = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
        message = twilio.messages.create(
            body: sending,
            to: client.phone_number,
            from: client.company.phone_number)
      rescue Twilio::REST::TwilioError => e
        logger.info "TASK_MESSAGE_FAIL, #{message[:From]}"
      end
    end
  end

end
