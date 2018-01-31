require 'rails_helper'

describe SessionsController do
  let(:valid_attributes){ FactoryBot.attributes_for(:user) }
  before do
    @user = User.create!(valid_attributes)
  end

  describe "GET 'new'" do
    subject(:action){ get 'new' }
    it "returns http success" do
      expect(subject).to be_success
    end
  end

  describe "GET 'create'" do
    subject(:action){ get 'create', user: attributes }
    context "with valid password" do
      let(:attributes){ { username: valid_attributes[:username], password: valid_attributes[:password] }}
      it "redirects to root" do
        expect(subject).to redirect_to(root_url)
      end
      it "resets session" do
        expect_any_instance_of(ActionDispatch::Request).to receive(:reset_session).once
        subject
      end
    end
    context "without valid password" do
      let(:attributes){ { username: valid_attributes[:username], password: "hogehoge" }}
      it "returns http success" do
        expect(subject).to be_success
      end
    end
  end

  describe "GET 'destroy'" do
    subject(:action){ get 'destroy' }
    it "returns http success" do
      expect(subject).to redirect_to(root_url)
    end
  end

end
