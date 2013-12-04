class ProductsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource except: [:new, :create]

  def index
  end

  def show
  end

  def new
    @product = Product.new
    authorize! :create, @product
  end

  def create
    @product = Product.new(product_params)
    authorize! :create, @product

    if @product.save
      redirect_to(@product, notice: "Product Created")
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to(@product, notice: "Product Updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @product.destroy
    redirect_to(products_path, notice: "Product Deleted")
  end

private
  def product_params
    params.require(:product).permit(:photo, :title, :description, :price, :tag_list)
  end
end
