class MultiTransfer < ActiveRecord::Base
  has_many :multi_transfer_parts, :dependent => :destroy
  
  accepts_nested_attributes_for :multi_transfer_parts
  
  def elixir(company_bank_number, company_account, company_name, company_street, company_street_no, commpany_postal_code, company_city)
    data = ""
    multi_transfer_parts.each do |mtp|
      #puts "########## DEBUG: #{mtp.title}"
      data += "110,#{date.to_s.gsub('-', '')},#{(mtp.quota*100).to_i.to_s},#{company_bank_number},0,\"#{company_account}\",\"#{mtp.person.account}\",\"#{company_name} ||#{company_street} #{company_street_no}|#{commpany_postal_code} #{company_city}\",\"#{mtp.person.elixir}\",0,#{mtp.person.bank_number},\"#{mtp.title}|||\",\"\",\"\",\"51\"\n"
    end
    return data
  end
end
