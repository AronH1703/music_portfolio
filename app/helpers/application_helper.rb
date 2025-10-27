module ApplicationHelper
  def asset_exists?(logical_path)
    return false if logical_path.blank?
    if Rails.configuration.assets.compile
      # Development: check Sprockets environment
      Rails.application.assets&.find_asset(logical_path).present?
    else
      # Production: check precompiled manifest
      Rails.application.assets_manifest&.assets&.key?(logical_path)
    end
  end
end
