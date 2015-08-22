class Build < ActiveRecord::Base

  def url
    "https://#{$AWS_BUCKET}.s3.amazonaws.com/#{self.link}"
  end

  def build_url(base)
    "itms-services://?action=download-manifest&url=#{base}/builds/#{slug}/xml"
  end

end
