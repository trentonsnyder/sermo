class Api::V1::HooksController < BaseController
   def messenger
      # configure cors to only allow requests from twilio
      begin
        company = Company.find_by(phone_number: params[:To])
        client = company.clients.find_by(phone_number: params[:From])
        # parse message by text and mms
        # check for !bang and send back coresponding command request
        if (params[:Body][0] == '!')
          Message.check_command(params, client)
        else
          # save message (if it's not a command) and attachments (message model will broadcast to logged in users)
          client.messages.create(body: params[:Body])
        end
      rescue
        # logger.add_tags 'TWILIO_MESSAGE_HOOK_FAILURE', "#{Time.now}, #{params[:From]}"
      end
      head :ok

    #   {
    #     "ToCountry" => "US",
    #       "ToState" => "NY",
    # "SmsMessageSid" => "SMd3511bdcae0151f46f7fdb09dda32abe",
    #       "NumMedia" => "0",
    #         "ToCity" => "BROOKLYN",
    #       "FromZip" => "",
    #         "SmsSid" => "SMd3511bdcae0151f46f7fdb09dda32abe",
    #     "FromState" => "UT",
    #     "SmsStatus" => "received",
    #       "FromCity" => "SALT LAKE CITY",
    #           "Body" => "This is a message",
    #   "FromCountry" => "US",
    #             "To" => "+13478537309",
    #         "ToZip" => "11238",
    #   "NumSegments" => "1",
    #     "MessageSid" => "SMd3511bdcae0151f46f7fdb09dda32abe",
    #     "AccountSid" => "AC212cdad37b95dc7e351693f67aab731a",
    #           "From" => "+13852098463",
    #     "ApiVersion" => "2010-04-01",
    #     "controller" => "api/v1/hooks",
    #         "action" => "messenger"
    #   }
   end
end