class Student < ActiveRecord::Base

  validates :name, presence: true #, uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :grade, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 12 }
  validates :about, presence: true

  has_attached_file :photo, :styles => { :medium => '256x256>', :thumb => '128x128>' }, :default_url => "/images/:style/wiz_hat.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_many :assets, dependent: :destroy do
    def persisted
      collect { |asset| asset if asset.persisted? }
    end
  end
  accepts_nested_attributes_for :assets
end
