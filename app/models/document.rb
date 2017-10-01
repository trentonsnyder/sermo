class Document < ApplicationRecord
  belongs_to :client

  def get_presigned_url
    presigner = Aws::S3::Presigner.new
    presigner.presigned_url(:get_object, bucket: ENV['S3_BUCKET_NAME'], key: self.url, expires_in: 300).to_s
  end
  
  def upload(file, url)
    s3 = Aws::S3::Resource.new
    s3_bucket = ENV['S3_BUCKET_NAME']
    obj = s3.bucket(s3_bucket).object(url)
    UploadDocumentJob.perform_now(obj, file)
  end

end