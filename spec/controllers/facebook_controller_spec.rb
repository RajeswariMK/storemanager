require 'spec_helper'

describe FacebookController do

  describe "GET 'canvas'" do
    it "returns http success" do
      get 'canvas'
      response.should be_success
    end
  end

end
