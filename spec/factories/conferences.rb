FactoryGirl.define do
  factory :conference do
    title 			"Automation"
    description "Some text"
    place 			"Lviv"
    start_date  Time.now
    finish_date Time.now
  end
end
