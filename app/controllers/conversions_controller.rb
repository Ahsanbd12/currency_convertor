class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.all
  end

  def new
    @conversion = Conversion.new
  end

  def create
    @conversion = Conversion.new(exchange_params)
    if @conversion.save
      redirect_to @conversion
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
