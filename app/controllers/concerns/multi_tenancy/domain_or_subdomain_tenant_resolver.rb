module MultiTenancy::DomainOrSubdomainTenantResolver
  extend ActiveSupport::Concern

  included do
    helper_method :current_tenant
  end

  def current_tenant
    @current_tenant ||= find_by_domain(request.host)
    @current_tenant ||= find_by_subdomain(request.subdomains.first)
  end

  def find_by_domain(domain)
    Tenant.find_by_domain(domain)
  end

  def find_by_subdomain!(subdomain)
    Tenant.find_by_subdomain!(subdomain)
  end
end
