class MultiTenancy::I18nBackend < I18n::Backend::Simple

  def lookup(locale, key, scope = [], options = {})
    theme_path = current_theme_path

    if theme_path.present?
      locale = "#{theme_path}_#{locale.to_s}".to_sym
    end

    init_translations unless initialized?
    keys = I18n.normalize_keys(locale, key, scope, options[:separator])

    keys.inject(translations) do |result, _key|
      _key = _key.to_sym
      return nil unless result.is_a?(Hash) && result.has_key?(_key)
      result = result[_key]
      result = resolve(locale, _key, result, options.merge(:scope => nil)) if result.is_a?(Symbol)
      result
    end
  end

  def load_file(filename)
    type = File.extname(filename).tr('.', '').downcase
    raise UnknownFileType.new(type, filename) unless respond_to?(:"load_#{type}", true)
    data = send(:"load_#{type}", filename)
    unless data.is_a?(Hash)
      raise InvalidLocaleData.new(filename, 'expects it to return a hash, but does not')
    end

    data.each do |locale, d|
      if filename =~ /^\/opt\/themes\/(.*)\/i18n\/.*\.yml$/
        theme_path = $1
        locale = "#{theme_path}_#{locale.to_s}".to_sym
      end

      store_translations(locale, d || {})
    end
  end

protected
  def current_tenant
    tenant_id = MultiTenancy::Tenant.current_id
    tenant_id.present? ? Restaurant.find_by_id(tenant_id) : nil
  end

  def current_theme_path
    tenant = current_tenant
    if tenant.present? and tenant.theme_id.present?
      theme = Theme.find(tenant.theme_id)
      return theme.path if theme.present?
    end

    return nil
  end

end
