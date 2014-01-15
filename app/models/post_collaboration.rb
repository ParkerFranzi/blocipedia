class PostCollaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  # attr_accessible :title, :body
end
