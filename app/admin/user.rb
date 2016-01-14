ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

 permit_params :email, :password, :password_confirmation, :first, :last, :address, :city, :state, :zip, :phone, :reset_password_token, :reset_password_sent_at

  index do
    selectable_column
    id_column
    column :email
   # column :reset_password_token
   # column :reset_password_sent_at
   # column :current_sign_in_at
   # column :last_sign_in_at
   # column "Number of times signed in", :sign_in_count
    column :created_at
    column :first
    column :last
    column :address
    column :city
    column :state
    column :zip
    column :phone do |user|
     div :class => "phone" do
    	number_to_phone user.phone
     end
    end
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      # f.input :password
      # f.input :password_confirmation
      f.input :first
      f.input :last
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :phone
    end
    f.actions
  end



end
