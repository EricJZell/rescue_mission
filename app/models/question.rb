class Question < ActiveRecord::Base
  validates :title, length: { minimum: 10 } #50
  validates :body, length: { minimum: 20 }  #150
  has_many :answers, :dependent => :destroy
end
