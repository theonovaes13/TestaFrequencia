FactoryBot.define do
  factory :user do
    nome { "Theo" }
    sequence(:email) { |x| "email#{x}@email.com" }
    password { "321321" }
    sequence(:matricula) { |c| "1#{c}3654" }

    trait :admin do
      status {:admin}
    end
    trait :secretaria do
      status{:secretaria}
    end
    trait :professor do
      status{:professor}
    end
  end

end
