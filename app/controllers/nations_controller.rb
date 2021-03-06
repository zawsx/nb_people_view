class NationsController < ApplicationController
  def index
    @nations = Nation.all
  end

  def new
    @nation = Nation.new
  end

  def create
    @nation = Nation.new(params[:nation])

    if @nation.save
      flash[:success] = "Nation created"
      redirect_to nations_path
    else
      render :new
    end
  end

  def edit
    @nation = Nation.find(params[:id])
  end

  def update
    @nation = Nation.find(params[:id])
    if @nation.update_attributes(params[:nation])
      flash[:success] = "Nation updated"
      redirect_to nations_path
    else
      render :edit
    end
  end

  def destroy
    @nation = Nation.find(params[:id])
    @nation.destroy
    redirect_to nations_path
  end
end