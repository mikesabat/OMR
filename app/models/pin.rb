class Pin < ActiveRecord::Base
  attr_accessible :description, :image

  validates :description, :presence => true
  validates :user_id, :presence => true
  validates_attachment_presence :image #:presence => true,
  #not sure if the syntax below is correct http://stackoverflow.com/questions/1751537/paperclip-validates-attachment-content-type-for-mp3-triggered-when-attaching-mp3
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  #again, below may be bad syntax - same link as above
  validates_attachment_size :image, :less_than => 5.megabytes
  							   #:content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
  							   #:size => { :less_than => 5.megabytes}

  belongs_to :user
  has_attached_file :image, :styles => {:medium => "360x240>"}
  #http://stackoverflow.com/questions/7079999/paperclipnotidentifiedbyimagemagickerror-image-is-not-recognized-by-the-ident
end
