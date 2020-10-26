FactoryBot.define do
  factory :user do
    nickname              {Faker: :Name.initials(number: 2)}
    email                 {Faker: :Internet. free_email}
    password              {Faker: :Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date            {Faker: :Internet. free_birth_date}
    family_name           {Faker: :Name.initials(number: 2)}
    name                  {Faker: :Name.initials(number: 2)}
    family_name_kana      {Faker: :Name.initials(number: 2)}
    name_kana             {Faker: :Name.initials(number: 2)}
  end
end