class BaseClient
  include HTTParty

  def self.config
    @@config ||= Rails.application.config_for('clients').with_indifferent_access.dig(config_key)
  end

  def self.config_key
    name.deconstantize.underscore
  end

  def get(link, params = {})
    uri_params = params.present? ? "?#{URI.encode_www_form(params)}" : ''
    self.class.get("#{link}#{uri_params}")
  end

  def config
    self.class.config
  end
end
