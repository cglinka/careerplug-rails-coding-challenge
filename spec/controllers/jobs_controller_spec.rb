require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe "GET #index" do
    it "should show an error when there is no logged in user" do
      get :index
      expect(response).to_not be_success
    end
  end
end
