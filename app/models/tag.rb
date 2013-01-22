class Tag < ActiveRecord::Base
  attr_accessible :name, :photo_id, :tag_list

  has_many :photos, through: :taggings
  has_many :taggings, dependent: :destroy

  def to_s
	  name
	end

end
