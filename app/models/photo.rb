class Photo < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  
  belongs_to :user
  has_and_belongs_to_many :likers, class_name: 'User', join_table: :likes
  has_many :comments

# photo = Photo.first
# all_people_who_liked_that_photo = photo.:likers

# other_person = User.second
# # To make 'other_person' like 'photo':
# photo.likers << other_person # When they click the like button
# photos.likers.destroy(other_person)

# 
  def liked_by?(user)
    likers.exists?(user.id)
  end

  def toggle_liked_by(user)
    # If photo has been liked by user
    if likers.exists?(user.id)
      likers.destroy(user.id)
    else
      likers << user
    end
  end

end