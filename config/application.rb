require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HiuCircles
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| %(#{html_tag}).html_safe }
  end
end

# monkey patch to fix the issue with the timestamped migrations
# https://qiita.com/mochimochifarao/items/a836665645e66ab65105
# still not fixed in Rails 7.1.3
# https://github.com/jpmcgrath/shortener/pull/165
class ActiveRecord::Base
  singleton_class.attr_accessor :timestamped_migrations
  self.timestamped_migrations = true
end