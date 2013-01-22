class Collection < ActiveRecord::Base
  attr_accessible :name, :user_id, :photos_attributes
  belongs_to :user

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: lambda { |a| a[:image].blank? }, allow_destroy: true
end
