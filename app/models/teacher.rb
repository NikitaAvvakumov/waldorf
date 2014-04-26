class Teacher < ActiveRecord::Base

  validates :name, presence: true
  validates :subjects, presence: true
  validates :bio, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  has_attached_file :photo, :styles => { :medium => '256x256>', :thumb => '128x128>' }, :default_url => "/images/:style/wiz_hat.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
