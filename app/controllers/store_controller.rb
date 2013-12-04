class StoreController < ApplicationController
  def index
    authorize! :index, :store
    tags = Product.all.tag_counts
    @categories = []

    tags.each do |tag|
      @categories << {
        name: tag,
        products: Product.tagged_with(tag)
      }
    end
  end
end
