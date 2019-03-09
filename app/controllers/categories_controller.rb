class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :update, :edit, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category Saved Successfully"
    else
      flash[:alert] = "Category could not be saved"
      render :new
    end
  end

  def index
    @categories = Category.order(created_at: :desc)
    @category = Category.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_path(@category), notice: "Category updated Successfully" }
        format.json { respond_with_bip(@category) }
      else
        format.html do
          flash[:alert] = "Category could not be Updated"
          render :edit
        end
        format.json { respond_with_bip(@category) }
      end
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category removed successfully"
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit([:name])
  end
end
