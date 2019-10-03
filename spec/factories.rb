FactoryBot.define do
  sequence :label do |n|
    "Label-#{n}"
  end

  factory :payload do
    label { generate(:label) }
  end
end
