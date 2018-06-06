require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user

    @current_campaign = FactoryBot.create(:campaign, user: @current_user)
    @current_campaign.save
  end

  describe "POST #create" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    it "returns http success" do
      post :create, name: "Hugo", email: "hugo@gmail.com", campaign_id: @current_campaign.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    it "returns http success" do
      test_member = create(:member, campaign: @current_campaign)
      delete :destroy, params: {id: test_member.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    before(:each) do
      @member_attributes = attributes_for(:member)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end
    it "returns http success" do
      member = create(:member, campaign: @current_campaign)
      put :update, params: {id: member.id, member: @member_attributes}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #opened " do
    it "returns http success" do
      gif = Base64.decode64("R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==")
      subject = create(:member, campaign: @current_campaign)
      subject.set_pixel

      get :opened, token: subject.token

      expect(response).eql? gif
    end

  end
end
