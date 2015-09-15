require 'factory_girl'

FactoryGirl.define do

  factory :question do
    sequence(:title) { |n| "How long is this going to take? I feel like I have been working on this for #{n} hours" }
    body "This assignment is super long. Are we supposed to do \
      this all in one night? And how many characters is 140? It is the length of a tweet? \
      How long is that? Is this 140 characters?"
  end

  factory :answer do
    sequence(:title) { |n| "Answer number #{n}:" }
    body "This is the answer to the question and it needs to be fifty characters long!"
    question_id 1
  end

end
