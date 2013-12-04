module MultiTenancy::ScopeToTenantFilter
  extend ActiveSupport::Concern

  included do
    around_filter :scope_request_to_current_tenant
  end

  def scope_request_to_current_tenant
    tenant = current_tenant
    MultiTenancy::Tenant.current_id = tenant.present? ? tenant.id : nil

    # if a user is signed in, check if he has access to this tenant
    if current_user.present?
      if current_user_tenant_id != tenant.id
        render file: "public/401", status: :unauthorized
        return
      end
    end

    yield
  ensure
    MultiTenancy::Tenant.current_id = nil
  end

  def current_user_tenant_id
    current_user.tenant_id
  end
end
