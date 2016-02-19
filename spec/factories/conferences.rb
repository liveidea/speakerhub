FactoryGirl.define do
  factory :conference do
    title 			"Automation"
    description "Some text"
    place 			"Lviv"
    start_date  DateTime.now.to_date
    finish_date DateTime.now.to_date + 1.day
  end
end