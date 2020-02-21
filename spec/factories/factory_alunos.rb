FactoryBot.define do
  factory :student do
    sequence(:nome){ |v| "theo#{v}" }
    sequence(:email){|j| "e#{j}mail@email.com"}
    sequence(:matricula){|b| "#{b}456#{99-b}"}
  end
end

