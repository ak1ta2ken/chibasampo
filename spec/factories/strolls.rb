FactoryBot.define do
  factory :stroll do
    title { "chiba" }
    content { "chibasampo" }
    tag {"観る・遊ぶ・体験する"}
  end

  factory :second_stroll, class: Stroll do
    title { "funa" }
    content { "funasampo" }
    tag {"グルメ"}
  end

  factory :third_stroll, class: Stroll do
    title { "niho" }
    content { "nihosampo" }
    tag {"グルメ"}
  end
end
