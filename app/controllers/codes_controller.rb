class CodesController < ApplicationController

  before_action :set_code, only: [:update]

  def index
    @codes = Code.all
  end

  def new
    @code = Code.new
  end

  def edit
    @code = Code.find(params[:id])
  end

  def create
    @code = Code.new(code_params)
    if @code.save
      redirect_to edit_code_path(@code)
      #render json: @code, status: :created
    else
      render json: @code.errors, status: :unprocessable_entity
    end
  end

  def update
    if @code.update(code_params)
      redirect_to edit_code_path(@code)
    else
      render json: @code.errors, status: :unprocessable_entity
    end
  end

  def submit
    @code = Code.find(params[:id])
    @output = @code.submit
    respond_to do |f|
      f.js
    end
  end

  def destroy
    @code = Code.find(params[:id])
    @code.destroy
    redirect_to codes_path()
  end

  private

  def set_code
    @code = Code.find(params[:id])
  end

  def code_params
    params.require(:code).permit(:id, :titulo, :entrada, :codigo, :category)
  end
end
