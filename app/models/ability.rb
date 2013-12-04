class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.id.present?
      # user is signed in...
      if MultiTenancy::Tenant.current_id == user.restaurant_id
        # ... on a restaurant/tenant he belongs to...
        if user.is_owner?
          # ... and which he is owner of
          can [:read, :edit, :update, :destroy], Restaurant do |restaurant|
            restaurant.id == user.restaurant_id
          end

          can :manage, Product
          can :manage, User
        else
          # ... but he is just an employee (not owner)
          can :read,   Product
        end

        # he can browse his own store
        can :index, :store

      elsif MultiTenancy::Tenant.current_id.present?
        # ... but he does not belong to this tenant
        # ... so can't do anything

      else
        # ... on the master tenant
        # ... can't do anything
      end
    else
      # ... new users
      can :index, :store
      can :create, Restaurant
    end
  end
end
