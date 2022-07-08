# formatter for categories and condition on index and show pages.

module ListingsHelper
    def format_condition(condition)
        words = condition.split("_").map do |word|
            word.capitalize
        end
        words.join(" ")
    end
end