# encoding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    User.find(:first)
  end
  
  def elixir_to_file(elixir, file_path, encoding)
    f = File.open(file_path, "w:#{encoding}")
    f.write(elixir)
    f.close
  end
end
