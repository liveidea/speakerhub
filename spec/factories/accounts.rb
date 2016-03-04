FactoryGirl.define do
  factory :account do
  	theme_ids        ['1', '2']
  	city_id          1
    f_name           "Vova"
    l_name           "Gula"
    phone      	     "097-11-11-111"
    facebook_account "freevova"
    skype_account    "freevova"
  end
end
