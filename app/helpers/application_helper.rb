module ApplicationHelper
  def current_user
    User.find(:first)
  end
  
  def nice_account_number(number)
    result = "#{number[0..1]} "
    result += "#{number[2..5]} "
    result += "#{number[6..9]} "
    result += "#{number[10..13]} "
    result += "#{number[14..17]} "
    result += "#{number[18..21]} "
    result += "#{number[22..25]}"
  end
end
