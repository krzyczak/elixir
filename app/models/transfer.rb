# encoding: UTF-8

class Transfer < ActiveRecord::Base
  def elixir(company_bank_number, company_account, company_name, company_street, company_street_no, commpany_postal_code, company_city)
    data = ""
    Person.all.each do |person|
      data += "110,#{date.to_s.gsub('-', '')},#{(quota*100).to_i.to_s},#{company_bank_number},0,\"#{company_account}\",\"#{person.account}\",\"#{company_name} ||#{company_street} #{company_street_no}|#{commpany_postal_code} #{company_city}\",\"#{person.elixir}\",0,#{person.bank_number},\"#{title}|||\",\"\",\"\",\"51\"\n"
    end
    data
  end
end
