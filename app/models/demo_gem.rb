class DemoGem < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  # Validations
  validates :name, presence: true, length: { in: 8..32 }, uniqueness: true
  validates :description, presence: true, length: { in: 16..128 }

  validates :github, format: { with: URI::regexp(%w(http https)), message: 'Invalid url' }
  validates :rubygems, format: { with: URI::regexp(%w(http https)), message: 'Invalid url' }

  validates_presence_of :image
  validates_integrity_of :image
  validates_processing_of :image

end
