class Asset < ActiveRecord::Base
  belongs_to :student

  has_attached_file :asset, :styles => { :medium => '256x256>', :thumb => '128x128>' }, :default_url => "/images/:style/art_icon.png"
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/

  def self.carousel
    Asset.order('created_at DESC')[0..20].shuffle[0..5]
  end
end
