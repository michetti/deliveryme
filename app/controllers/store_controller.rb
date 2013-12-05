class StoreController < ApplicationController
  # include theme support
  include MultiTenancy::TenantViewsResolver

  def index
    authorize! :index, :store
    @products = Product.all
    @tags = @products.tag_counts
    @categories = []

    @tags.each do |tag|
      @categories << {
        name: tag,
        products: Product.tagged_with(tag)
      }
    end
  end
end
