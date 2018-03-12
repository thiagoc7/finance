class TransactionsController < ApplicationController
  before_action :persist_query_params, :set_transaction

  def index
  end


  def edit
    render :index
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to transactions_url, notice: 'Transaction was successfully created.'
    else
      render :index
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to transactions_url, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private

  def persist_query_params
    @account_id_param = params[:account_id] || session[:account_id] || Account.first.id
    session[:account_id] = @account_id_param

    @month_param = params[:month] || session[:month] || Date.today.last_month
    session[:month] = @month_param

    @transaction_type = params[:transaction_type] || session[:transaction_type] || 'expense'
    session[:transaction_type] = @transaction_type

    @account_type = params[:account_type] || session[:account_type] || 'bank'
    session[:account_type] = @account_type
  end

  def set_transaction
    @transaction = params[:id] ?
                       Transaction.find(params[:id]) :
                       Transaction.new(
                           date: Date.new(@month_param.first(4).to_i, @month_param.last(2).to_i, 15),
                           account_id: @account_id_param,
                           transaction_type: @transaction_type
                       )
    @transactions = Transaction.where(account_id: @account_id_param)
  end

  def transaction_params
    params.require(:transaction).permit(:date, :category, :amount, :comments, :transaction_type, :account_id, :transfer_to_account_id)
  end
end
