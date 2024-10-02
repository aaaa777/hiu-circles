FactoryBot.define do
  factory :news do
    title { "MyString" }
    caption { "MyString" }
    content { "MyString" }
    link { "MyString" }
    is_external { false }
    type { "" }
  end
end
