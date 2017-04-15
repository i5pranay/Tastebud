ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :name, :email, :address,:password, :password_confirmation, :city, :state

  controller do
    def create
      # Good
      @user = User.new(permitted_params[:user])
      if @user.save
      else
        flash[:msg] = 'error';

      end
      end
  end

  #menu false
  #menu parent: "Blog"
  #menu label: "My Posts"
  form do |f|
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :email
          f.input :name
          f.input :address
          f.input :city
          f.input :state
          f.input :password
          f.input :password_confirmation
        end
      end
    end
    f.actions
  end

  #index view of user




# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
