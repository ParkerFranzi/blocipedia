class Collaborator < ActiveRecord::Base
  attr_accessible :access
  belongs_to :post
end
