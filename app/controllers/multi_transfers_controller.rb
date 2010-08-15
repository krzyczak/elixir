class MultiTransfersController < ApplicationController
  def index
    @multi_transfers = MultiTransfer.all
  end

  def show
    multi_transfer_data
  end

  #def new
  #  #@multi_transfer = MultiTransfer.new
  #  new_multiple
  #end
  
  def edit
    @multi_transfer = MultiTransfer.find(params[:id])
  end

  def create
    @multi_transfer = MultiTransfer.new(params[:multi_transfer])

    if @multi_transfer.save
      redirect_to(@multi_transfer, :notice => 'Multi transfer was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /multi_transfers/1
  # PUT /multi_transfers/1.xml
  #def update
  #  @multi_transfer = MultiTransfer.find(params[:id])
  #
  #  respond_to do |format|
  #    if @multi_transfer.update_attributes(params[:multi_transfer])
  #      format.html { redirect_to(@multi_transfer, :notice => 'Multi transfer was successfully updated.') }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @multi_transfer.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  def destroy
    @multi_transfer = MultiTransfer.find(params[:id])
    @multi_transfer.destroy
    redirect_to(multi_transfers_url)
  end
  
  def choose_people
    @people = current_user.people
  end
  
  def new_multiple
    @multi_transfer = MultiTransfer.new
    people_ids = params[:people_ids]
    people_ids.each do |pid|
      @multi_transfer.multi_transfer_parts.build.person_id = pid
      @multi_transfer.multi_transfer_parts.last.person = Person.find(pid)
    end
  end
  
  def download
    multi_transfer_data
    elixir_to_file(@elixir, 'result.pli', 'IBM852')
    send_file 'result.pli', :type => "application/pli", :x_sendfile => true
    FileUtils.remove('result.pli')
  end
  
  private
  def multi_transfer_data
    @multi_transfer = MultiTransfer.find(params[:id])
    account = current_user.accounts.first
    @elixir = @multi_transfer.elixir(account.bank_number, account.account_number, current_user.company_name, current_user.street, current_user.street_no, current_user.postal_code, current_user.city)
  end
end
