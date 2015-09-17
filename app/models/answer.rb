class Answer < ActiveRecord::Base
  validates :title, length: { minimum: 10 } #10
  validates :body, length: { minimum: 20 }  #50
  belongs_to :question
end
