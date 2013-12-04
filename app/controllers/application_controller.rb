class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Resolve current Tenant from domain or subdomain
  include MultiTenancy::DomainOrSubdomainTenantResolver

  # Scope requests to current tenant
  include MultiTenancy::ScopeToTenantFilter

  # Add view per tenant view personalization
  include MultiTenancy::Personalization

private
  # overhide current_user_tenant_id method
  def current_user_tenant_id
    current_user.restaurant_id
  end

  # overhide default find_by_domain method
  def find_by_domain(domain)
    Restaurant.find_by_domain(domain)
  end

  # overhide default find_by_subdomain method
  def find_by_subdomain(subdomain)
    Restaurant.find_by_subdomain(subdomain)
  end
end
