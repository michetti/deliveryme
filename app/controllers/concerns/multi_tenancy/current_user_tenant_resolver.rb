module MultiTenancy::CurrentUserTenantResolver
  extend ActiveSupport::Concern

  included do
    helper_method :current_tenant
  end

  def current_tenant
    @current_tenant ||= find_by_current_user
  end

  def find_by_current_user
    Tenant.find_by_id(current_user.tenant_id) if current_user.present?
  end
end
