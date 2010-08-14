class MultiTransferPart < ActiveRecord::Base
  belongs_to :multi_transfer
  belongs_to :person
end
