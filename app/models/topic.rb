class Topic < ActiveRecord::Base
  has_many :posts

 require 'paginate.rb'
    
    validates :name, length: {minimum: 5}, presence: true
end
