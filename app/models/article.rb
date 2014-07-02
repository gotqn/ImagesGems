class Article < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  # Relationships
  belongs_to :user

  # Validations
  #validates :name, presence: true, length: { in: 8..32 }, uniqueness: true
  #validates :description, presence: true, length: { in: 32..128 }

end
