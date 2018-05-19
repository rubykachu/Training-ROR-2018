# frozen_string_literal: true

class Admin::ProductsController < AdminController
  def index
    @products = Product.all.order(:name)
  end

  def new
    @product = Product.new
  end

  def edit
    the_product
  end

  def show
    the_product
  end

  def create
    @product = Product.create(permit_params)
    redirect_after_update_or_create(@product)
  end

  def update
    the_product.update(permit_params)
    redirect_after_update_or_create(the_product)
  end

  def destroy
    if the_product.destroy!
      flash[:notice] = "#{the_product.name} deleted successfully"
    else
      flash[:alert] = "#{the_product.name} deleted failed"
    end
    redirect_to products_path
  end

  private

    def permit_params
      params[:product][:slug] = format_slug
      params.require(:product).permit(%i[name code slug price quantity available_on discontinue_on])
    end

    def the_product
      return @product if @product
      @product = Product.find(params[:id])
    end

    def format_slug
      slug = params[:product][:slug]
      product = Product.find_by(slug: slug)
      return slug unless product
      "#{slug}-#{product.id}"
    end
end
