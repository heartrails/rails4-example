require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    subject(:action){ get 'new' }
    it "returns http success" do
      expect(subject).to be_success
    end
  end

  describe "GET 'create'" do
    subject(:action){ get 'create' }
    it "returns http success" do
      expect(subject).to be_success
    end
  end

  describe "GET 'destroy'" do
    subject(:action){ get 'destroy' }
    it "returns http success" do
      expect(subject).to be_success
    end
  end

end
