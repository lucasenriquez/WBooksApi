ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :password, :password_confirmation, :first_name,
  #:last_name, :reset_password_token, :reset_password_sent_at, :remember_created_at, :image_url,
  #:locale
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :password, :password_confirmation, :first_name,
  #:last_name,
  #:reset_password_token, :reset_password_sent_at, :remember_created_at, :image_url, :locale]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end