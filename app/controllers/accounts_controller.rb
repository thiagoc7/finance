class AccountsController < ApplicationController
  before_action :set_account

  def index
  end


  def edit
    render :index
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to accounts_url, notice: 'Account was successfully created.'
    else
      render :index
    end
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_url, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
    def set_account
      @account = params[:id] ? Account.find(params[:id]) : Account.new
      @accounts = Account.all
    end

    def account_params
      params.require(:account).permit(:name, :initial_balance, :investment)
    end
end
