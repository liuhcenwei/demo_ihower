class Event < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :attendees, -> { order("id DESC") }, :dependent => :destroy

  has_one :location
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank

  has_many :event_groupships
  has_many :groups, :through => :event_groupships
  
  has_many :memberships
  has_many :users, :through => :memberships

  belongs_to :category
end
