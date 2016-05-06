ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation

  controller do
    nested_belongs_to :pin, optional: true

    def scoped_collection
      super.includes :pins
    end
  end

  index do
      selectable_column
      id_column
      column :email
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
      column "Pins", :pins_of_user do |user|
        link_to user.pins.size, admin_user_pins_path(user)
      end
      actions #show edit delete
  end

  filter :pins
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  member_action :pins do
    @pins = User.find(params[:id]).pins
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
