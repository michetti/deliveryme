module MultiTenancy::ScopeToTenant
  extend ActiveSupport::Concern

  included do
    default_scope do
      if MultiTenancy::Tenant.current_id.present?
        where(Rails.application.config.tenant_column => MultiTenancy::Tenant.current_id)
      end
    end
  end
end
