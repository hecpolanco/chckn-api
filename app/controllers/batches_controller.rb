class BatchesController < ApplicationController

    def index
        batches = Batch.all
        render json: batches, status: :ok
    end
    
    def show
        batch = Batch.find(params[:id])
        render json: batch, status: :ok
    end
    
    def create
        batch = Batch.new(batch_params)
        if batch.save
            render json: batch, status: :ok
        else
            render json: batchs.errors, status: :unprocessable_entity
        end
    end

    def update
        batch = Batch.new(batch_params)
        if batch.update_attributes(batch_params)
            render json: batch, status: :ok
        else
            render json: batchs.errors, status: :unprocessable_entity
        end
    end

    def destroy
        batch = Batch.find(params[:id])
        batch.destroy
        render json: batch, status: :ok
    end

    private

    def batch_params
        params.require(:batch).permit(:account_id, :date, :income, :expenses, :balance)
    end

end