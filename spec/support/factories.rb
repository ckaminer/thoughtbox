FactoryGirl.define do
  sequence :email do |n|
    "#{n}@email.com"
  end

  factory :user do
    email { generate(:email) }
    password "password"
    password_confirmation "password"

    factory :user_with_links do
      transient do
        link_count 3
      end

      after(:create) do |user, evaluator|
        create_list(:link, evaluator.link_count, user: user)
      end
    end
  end

  sequence :title do |n|
    "title#{n}"
  end

  sequence :url do |n|
    "http://www.test.com/#{n}"
  end

  factory :link do
    url { generate(:url) }
    title { generate(:title) }
    association :user
  end

end
