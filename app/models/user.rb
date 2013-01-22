class User < ActiveRecord::Base
  attr_accessible :name, :collections_attributes

  validates :name, presence: true, length: { maximum: 50 }

  has_many :collections, dependent: :destroy

  accepts_nested_attributes_for :collections, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
end
