FactoryBot.define do
  factory :label do
    label_name { 'chiba' }
  end

  factory :second_label, class: Label do
    label_name { 'funa' }
  end
end
