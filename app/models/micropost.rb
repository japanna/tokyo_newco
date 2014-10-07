class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 340 }

  private

    def picture_size
      if picture.size > 3.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
