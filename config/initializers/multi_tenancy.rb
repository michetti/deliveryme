require "multi_tenancy/i18n_backend"

### MultiTenancy Configuration
Rails.application.config.tenant_class  = Restaurant
Rails.application.config.tenant_column = "restaurant_id"

### Themes Configuration
Rails.application.config.themes_root_path = "/opt/themes"

Dir["#{Rails.application.config.themes_root_path}/*"].each do |path|
  Rails.application.config.assets.paths.unshift(path)
end

### I18n
I18n.load_path += Dir["#{Rails.application.config.themes_root_path}/*/i18n/*.yml"]
I18n.backend = MultiTenancy::I18nBackend.new
