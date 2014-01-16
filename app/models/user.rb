class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :stripe_customer_token, :user_ids
  has_many :posts
  has_many :post_collaborations
  has_many :shared_posts, through: :post_collaborations, source: :post
  has_one :subscription

  before_create :set_member
  #attr_accessible :title, :body

  ROLES = %w[member premium moderator admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end 

  private

  def set_member
    self.role = 'member'
  end 
end
