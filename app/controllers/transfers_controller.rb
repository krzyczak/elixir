# encoding: UTF-8

class TransfersController < ApplicationController
  def index
    @transfers = Transfer.all
  end

  def show
    @transfer = Transfer.find(params[:id])
    
    account = current_user.accounts.first
    
    @elixir = @transfer.elixir(account.bank_number, account.account_number, current_user.company_name, current_user.street, current_user.street_no,
    current_user.postal_code, current_user.city)
    
    elixir_to_file(@elixir, '/media/Multimedia/pli/result.pli', 'IBM852')
  end

  def new
    @transfer = Transfer.new
  end

  def edit
    @transfer = Transfer.find(params[:id])
  end

  def create
    @transfer = Transfer.new(params[:transfer])
    
    if @transfer.save
      redirect_to(@transfer, :notice => 'Transfer was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @transfer = Transfer.find(params[:id])

    if @transfer.update_attributes(params[:transfer])
      redirect_to(@transfer, :notice => 'Transfer was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @transfer = Transfer.find(params[:id])
    @transfer.destroy
    redirect_to(transfers_url)
  end
end
