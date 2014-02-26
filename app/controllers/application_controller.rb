class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Resolve current Tenant from domain or subdomain
  resolve_tenant_by_domain_or_subdomain

  # Scope requests to current tenant
  scope_requests_to_current_tenant

  # Add view per tenant view personalization
  include MultiTenancy::Personalization
end
