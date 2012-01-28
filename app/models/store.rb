class Store < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable_on :tags
  scope :by_date, order("created_at DESC")
  #has_many :taggings, :dependent => :destroy
  #has_many :tags, :through => :taggings
  validates_uniqueness_of :url, :scope => :user_id
  attr_accessor :tags
  #after_save :assign_tags
  
  private
  
 
end
