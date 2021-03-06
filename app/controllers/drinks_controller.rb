class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to '/drinks'
    else
      render :new
    end
  end

  def index
    if params[:category_id]
      @drinks = Drink.where(category_id: params[:category_id]).page(params[:page])
    else
      @drinks = Drink.page(params[:page])
    end
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description, :featured, :category_id, :alcohol_level)
  end
end
