require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
    describe 'GET index' do
        let(post) {create :post}
        it 'assigns @post' do
            user = Post.create
            get :index
            except(assigns(post)).to eq([post])
        end
    end

end
