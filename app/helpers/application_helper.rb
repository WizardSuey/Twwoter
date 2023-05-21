module ApplicationHelper
   def abbreviated_number(number)
        if number >= 1_000_000
          "#{(number / 1_000_000.0).round(1)}млн"
        elsif number >= 1_000
          "#{(number / 1_000.0).round(1)}к"
        else
          number.to_s
        end
    end
end
