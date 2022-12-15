require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
   describe 'GET index' do
    it 'assigns @user' do
      user = User.create
      get :index
      except(as) 
end
