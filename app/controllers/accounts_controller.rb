# encoding: UTF-8

class AccountsController < ApplicationController
  def index
    #@accounts = Account.all
    @accounts = current_user.accounts
  end

  def show
    #@account = Account.find(params[:id])
    @account = current_user.accounts.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def edit
    #@account = Account.find(params[:id])
    @account = current_user.accounts.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])
  end

  def update
    #@account = Account.find(params[:id])
    @account = current_user.accounts.find(params[:id])

    if @account.update_attributes(params[:account])
      redirect_to(@account, :notice => 'Account was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to(accounts_url)
  end
end
