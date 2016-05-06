ActiveAdmin.register Pin do

  permit_params :photo, :description, :name, :user_id

  belongs_to :user, optional: true

  index do
    id_column
    column :photo do |pin|
      image_tag(pin.photo, :class => 'img-thumbnail')
    end
    column :name
    column :description
    column :created_at
    column :updated_at
    actions #show edit delete

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
