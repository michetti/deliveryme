module MultiTenancy::Personalization
  extend ActiveSupport::Concern

  included do
    helper_method :personalization
  end

  def personalization(key)
    puts key
    case key
    when :name
      current_tenant.present? ? current_tenant.name : "Delivery Me"
    when :title
      current_tenant.present? ? current_tenant.name : "Delivery Me"
    end
  end

  def find_by_subdomain(subdomain)
    Tenant.find_by_subdomain(subdomain)
  end
end
