require 'spec_helper'

describe SessionsController do
  let(:valid_attributes){ FactoryGirl.attributes_for(:user) }
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
