module ApplicationHelper
  def abbreviated_number(number)
    return number.to_s if number.nil?
    if number >= 1_000_000
      "#{(number / 1_000_000.0).round(1)}млн"
    elsif number >= 1_000
      "#{(number / 1_000.0).round(1)}к"
    else
      number.to_s
    end
  end

  def abbreviated_likes_count(post)
    likes_count = post.likes_count || 0
    if likes_count >= 1_000_000
      "#{(likes_count / 1_000_000.0).round(1)}млн"
    elsif likes_count >= 1_000
      "#{(likes_count / 1_000.0).round(1)}к"
    else
      likes_count.to_s
    end
  end
end
