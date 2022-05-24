class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.all
  end

  def new
    @conversion = Conversion.new
  end

  def create
    @conversion = Conversion.new(exchange_params)
    if @conversion.valid?
      ActiveRecord::Base.transaction do
        exchange_rate = Exchange.new.get_rate(exchange_params[:from_currency], exchange_params[:to_currency])
        @conversion.exchange_rate = exchange_rate
        @conversion.save!
        redirect_to @conversion
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
     @conversion = Conversion.find(params[:id])
  end

  private

  def exchange_params
    params.require(:conversion).permit(:from_currency, :to_currency, :amount)
  end
end
