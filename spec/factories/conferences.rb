FactoryGirl.define do
  factory :conference do
    title 			"Automation"
    description "Some text"
    place 			"Lviv"
    date        Time.now
  end
end
