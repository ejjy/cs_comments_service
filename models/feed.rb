class Feed
  include Mongoid::Document
  include Mongoid::Timestamps

  field :feed_type, type: String
  field :info, type: Hash

  belongs_to :actor, class_name: "User", inverse_of: :activities, index: true
  belongs_to :target, inverse_of: :activities, polymorphic: true

  attr_accessible :feed_type, :info

  validates_presence_of :feed_type
  validates_presence_of :actor
  validates_presence_of :target

  has_and_belongs_to_many :subscribers, class_name: "User", inverse_of: :subscribed_feeds
end