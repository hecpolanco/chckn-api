class AccountsController < ApplicationController

    def index
        accounts = Account.all
        render json: AccountSerializer.new(accounts), status: :ok
    end
    
    def show
        account = Account.find(params[:id])
        render json: AccountSerializer.new(account), status: :ok
    end
    
    def create
        account = Account.new(account_params)
        if account.save
            render json: account, status: :ok
        else
            render json: accounts.errors, status: :unprocessable_entity
        end
    end

    def update
        account = Account.new(account_params)
        if account.update_attributes(account_params)
            render json: account, status: :ok
        else
            render json: accounts.errors, status: :unprocessable_entity
        end
    end

    def destroy
        account = Account.find(params[:id])
        account.destroy
        render json: account, status: :ok
    end

    private

    def account_params
        params.require(:account).permit(:user_id, :balance)
    end

end