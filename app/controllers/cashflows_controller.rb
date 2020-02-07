require 'date'

class CashflowsController < ApplicationController

    @@income = Cashflow.where(flowtype: "Income")
        .map{ |transaction| transaction.amount }
        .reduce(0) { |sum, num| sum + num }

    @@expense = Cashflow.where(flowtype: "Expense")
        .map{ |transaction| transaction.amount }
        .reduce(0) { |sum, num| sum + num }

    def index
        if params[:start_date] && params[:end_date]
            start_date = params[:start_date]
            end_date = params[:end_date]

            cashflows = Cashflow.where(date: start_date..end_date).sort_by{|transaction| transaction.date}
            render json: cashflows, status: :ok
        else
            cashflows = Cashflow.all
            render json: cashflows, status: :ok
        end
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

    def income
        if params[:start_date] && params[:end_date]
            start_date = params[:start_date]
            end_date = params[:end_date]

            income = Cashflow.where(date: start_date..end_date, flowtype: "Income")
            .map{ |transaction| transaction.amount }
            .reduce(0) { |sum, num| sum + num }
            render json: income, status: :ok
        else
            income = Cashflow.where(flowtype: "Income")
            .map{ |transaction| transaction.amount }
            .reduce(0) { |sum, num| sum + num }
            render json: income, status: :ok
        end
    end

    def expense
        if params[:start_date] && params[:end_date]
            start_date = params[:start_date]
            end_date = params[:end_date]

            expense = Cashflow.where(date: start_date..end_date, flowtype: "Expense")
            .map{ |transaction| transaction.amount }
            .reduce(0) { |sum, num| sum + num }
            render json: expense, status: :ok
        else
            expense = Cashflow.where(flowtype: "Expense")
            .map{ |transaction| transaction.amount }
            .reduce(0) { |sum, num| sum + num }
            render json: expense, status: :ok
        end
    end

    def balance
        if params[:start_date] && params[:end_date]
            start_date = params[:start_date]
            end_date = params[:end_date]

            income = Cashflow.where(date: start_date..end_date, flowtype: "Income")
            .map{ |transaction| transaction.amount }
            .reduce(0) { |sum, num| sum + num }

            expense = Cashflow.where(date: start_date..end_date, flowtype: "Expense")
            .map{ |transaction| transaction.amount }
            .reduce(0) { |sum, num| sum + num }

            @balance = income - expense
            render json: @balance, status: :ok
        else
            @balance = @@income - @@expense
            render json: @balance, status: :ok
        end
    end

    def spend_allowance
        if params[:start_date] && params[:end_date]
            start_date = params[:start_date]
            end_date = params[:end_date]

            income = Cashflow.where(date: start_date..end_date, flowtype: "Income")
            .map{ |transaction| transaction.amount }
            .reduce(0) { |sum, num| sum + num }

            expense = Cashflow.where(date: start_date..end_date, flowtype: "Expense")
            .map{ |transaction| transaction.amount }
            .reduce(0) { |sum, num| sum + num }

            balance = income - expense
            days = (Date.parse(end_date) - Date.parse(start_date)).to_i
            
            spend_allowance = balance / days

            render json: spend_allowance, status: :ok
        end
    end

        def find_end_date
            year = 2020
            month = 2
            start_date = Date.new(year, month, 1)
            end_date = Date.new(year, month, -1)
            render json: [start_date, end_date], status: :ok
        end

    private

    def cashflow_params
        params.require(:cashflow).permit(:account_id, :batch_id, :date, :flowtype, :name, :amount)
    end

end