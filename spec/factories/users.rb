FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'aaaa11'}
    password_confirmation {password}
    birth_date            {'2001-1-1'}
    family_name           {"牛尾"}
    name                  {"友彦"}
    family_name_kana      {"ナナ"}
    name_kana             {"ナナ"}
  end
end