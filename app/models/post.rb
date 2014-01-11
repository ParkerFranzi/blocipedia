class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  attr_accessible :body, :title, :public, :user_ids => []
  belongs_to :user
  has_many :post_collaborations
  has_many :users, through: :post_collaborations

  default_scope order('created_at DESC')
  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }

  # validates :title, length: { minimum: 5 }, presence: true
  # validates :body, length: { minimum: 20 }, presence: true
  # validates :user, presence: true  
end
