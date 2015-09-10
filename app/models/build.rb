class Build < ActiveRecord::Base

  def url
    "https://#{$AWS_BUCKET}.s3.amazonaws.com/#{self.link}"
  end

  def type 
    if self.link[-3..-1] == "ipa" then "ios" else "android" end
  end

  def build_url(base)
    if type == "ios"
      "itms-services://?action=download-manifest&url=#{base}/builds/#{slug}/xml"
    else
      url
    end
  end

end
