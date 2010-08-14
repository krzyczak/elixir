# encoding: UTF-8

class User < ActiveRecord::Base
  has_many :accounts
  has_many :people
end
