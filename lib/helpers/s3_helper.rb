require 'aws/s3'

class S3Helper

  def self.upload(file, token)
    object_key = "ipas/#{token}.ipa"

    s3 = AWS::S3.new(
      :access_key_id => ENV['HH_AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['HH_AWS_SECRET_ACCESS_KEY']
    )

    bucket = s3.buckets[ENV['HH_AWS_BUCKET'] || 'hosthelper']
    build  = bucket.objects[object_key]
    build.write(open(file.tempfile.path), :acl => :public_read, :content_type => 'application/octet-stream')

    object_key
  end

end
