module MultiTenancy::TenantViewsResolver
  extend ActiveSupport::Concern

  included do
    before_filter :set_tenant_theme_path
  end

  def get_themes_root_path
    Rails.application.config.themes_root_path
  end

  def set_tenant_theme_path
    if current_tenant.present? and current_tenant.theme_id.present?
      # get tenant
      theme = Theme.find(current_tenant.theme_id)

      # add tenant path to resolution array
      paths = [theme.path]

      # check tenant hierarchy
      while(theme.present? and theme.parent.present?)
        theme = theme.find_parent
        paths << theme.path if theme.present?
      end

      # add path hierarchy to resolution array
      paths.reverse.each do |path|
        prepend_view_path "#{get_themes_root_path}/#{path}/views"
      end
    end
  end
end
