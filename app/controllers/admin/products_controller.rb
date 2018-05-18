# frozen_string_literal: true

class Admin::ProductsController < AdminController
  def index
    @products = Product.all.order(:position, :name)
  end

  def new
    @product = Product.new
  end

  def edit
    product
  end

  def show
    product
  end

  def create
    @product = Product.create!(permit_params)
    @product.update(code: @product.slug)
    redirect_after_update_or_create(@product)
  end

  def update
    product.update(permit_params)
    redirect_after_update_or_create(product)
  end

  def destroy
    if product.destroy!
      flash[:notice] = "#{product.name} deleted successfully"
    else
      flash[:alert] = "#{product.name} deleted failed"
    end
    redirect_to products_path
  end

  private

    def permit_params
      params.require(:product).permit(:name, :slug, :position)
    end

    def product
      return @product if @product
      @product = Product.find(params[:id])
    end
end
