class User < ActiveRecord::Base
  attr_accessible :name, :collections_attributes

  has_many :collections, dependent: :destroy

  accepts_nested_attributes_for :collections, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
end
