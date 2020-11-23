class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render json: @cats, include: :colonies, status: :ok
  end

  def show
    @cat = Cat.find(params[:id])
    render json: @cat, include: :colonies, status: :ok
  end
end