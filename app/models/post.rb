class Post < ActiveRecord::Base
  attr_accessible :body, :title, :public
  belongs_to :user
  has_many :collaborators

  default_scope order('created_at DESC')
  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }

  # validates :title, length: { minimum: 5 }, presence: true
  # validates :body, length: { minimum: 20 }, presence: true
  # validates :user, presence: true  
end
