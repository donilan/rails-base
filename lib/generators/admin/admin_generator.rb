require 'rails/generators/resource_helpers'

class AdminGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers
  source_root File.expand_path('../templates', __FILE__)

  class_option :orm, banner: "NAME", type: :string, required: true,
               desc: "ORM to generate the controller for"

  class_option :prefix_name, banner: "admin", type: :string, default: "admin",
               desc: "Define the prefix of controller"
  argument :attributes, type: :array, default: [], banner: "fieldA fieldB"

  def generate_all
    template "controller.rb.erb", File.join('app/controllers', prefix, class_path, "#{controller_file_name}_controller.rb")
    template "index.html.haml.erb", File.join("app/views", prefix, controller_file_path, 'index.html.haml')
    template "_form.html.haml.erb", File.join("app/views", prefix, controller_file_path, '_form.html.haml')
    template "new.html.haml.erb", File.join("app/views", prefix, controller_file_path, 'new.html.haml')
    template "edit.html.haml.erb", File.join("app/views", prefix, controller_file_path, 'edit.html.haml')
    template "locale.zh-CN.yml.erb", "config/locales/model_#{controller_file_path}.zh-CN.yml"
  end

  protected
  def prefixed_class_name
    "#{prefix.capitalize}::#{class_name}"
  end

  def prefix
    options[:prefix_name]
  end

  def prefixed_route_url
    "/#{prefix}#{route_url}"
  end

  def prefixed_index_helper
    "#{prefix}_#{index_helper}"
  end

  def prefixed_controller_class_name
    "#{prefix.capitalize}::#{controller_class_name}"
  end

end
