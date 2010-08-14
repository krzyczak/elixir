# encoding: UTF-8

class Person < ActiveRecord::Base
  belongs_to :user
  has_one :multi_transfer_part
  
  def elixir
    "#{last_name} #{first_name}||#{street} #{street_no}|#{postal_code} #{city}"
  end
end
