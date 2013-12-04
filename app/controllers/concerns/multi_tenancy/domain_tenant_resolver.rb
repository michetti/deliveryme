module MultiTenancy::DomainTenantResolver
  extend ActiveSupport::Concern

  included do
    helper_method :current_tenant
  end

  def current_tenant
    @current_tenant ||= find_by_domain(request.host)
  end

  def find_by_domain(domain)
    Tenant.find_by_domain(domain)
  end
end
