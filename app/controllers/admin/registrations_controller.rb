class Admin::RegistrationsController < Devise::RegistrationsController
  layout 'admin'
  before_action :authenticate_admin_user!

  protected

  def after_update_path_for(resource)
    admin_root_path
  end
end

