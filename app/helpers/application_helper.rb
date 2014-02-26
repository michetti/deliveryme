module ApplicationHelper

  def has_error?(resource, field)
    'has-error' if resource.present? and resource.errors[field].present?
  end

  def error_message(resource, field)
    return unless resource.present?
    html = ""

    resource.errors[field].each do |error|
      html += '<span class="help-block">'
      html +=  error
      html += '</span>'
    end

    html.html_safe
  end

  def menu_item(name, link_path, active_on_controller, options)
    html  = "<li class='#{'active' if active_on_controller.to_s == controller_name}' #{options[:class] || ''}>"
    html += link_to name, link_path
    html += "</li>"

    html.html_safe
  end

end
