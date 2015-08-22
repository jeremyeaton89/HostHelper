class Build < ActiveRecord::Base

  def build_url(base)
    "itms-services://?action=download-manifest&url=#{base}/builds/#{slug}/xml"
  end

end
