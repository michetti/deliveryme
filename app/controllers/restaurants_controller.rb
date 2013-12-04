class RestaurantsController < ApplicationController
  before_filter :authenticate_user! , only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:new, :create]

  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
    authorize! :create, @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize! :create, @restaurant

    if @restaurant.valid?
      # set user as restaurant owner
      @restaurant.users.first.is_owner = true

      @restaurant.save!
      redirect_to(@restaurant, notice: "Restaurant Created")
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @restaurant.update_attributes!(restaurant_params)
      redirect_to(@restaurant, notice: "Restaurant Updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to(restaurants_path, notice: "Restaurant Deleted")
  end

private
  def restaurant_params
    params.require(:restaurant).permit(:name, :domain, :subdomain, users_attributes: [
      :email, :password, :password_confirmation
    ])
  end
end
