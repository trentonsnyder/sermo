class UploadDocumentJob < ApplicationJob  
  queue_as :default

  def perform(obj, file) 
    obj.upload_file(file.tempfile)
  end 

end  