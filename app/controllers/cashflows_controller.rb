class CashflowsController < ApplicationController

    def index
        cashflows = Cashflow.all
        render json: cashflows, status: :ok
    end
    
    def show
        cashflow = Cashflow.find(params[:id])
        render json: cashflow, status: :ok
    end
    
    def create
        cashflow = Cashflow.new(cashflow_params)
        if cashflow.save
            render json: cashflow, status: :ok
        else
            render json: cashflows.errors, status: :unprocessable_entity
        end
    end

    def update
        cashflow = Cashflow.new(cashflow_params)
        if cashflow.update_attributes(cashflow_params)
            render json: cashflow, status: :ok
        else
            render json: cashflows.errors, status: :unprocessable_entity
        end
    end

    def destroy
        cashflow = Cashflow.find(params[:id])
        cashflow.destroy
        render json: cashflow, status: :ok
    end

    private

    def cashflow_params
        params.require(:cashflow).permit(:account_id, :batch_id, :date, :flowtype, :name, :amount)
    end

end