class Question < ActiveRecord::Base
  validates :title, length: { minimum: 40 }
  validates :body, length: { minimum: 140 }
  has_many :answers, :dependent => :destroy
end
