require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /home" do
    it "正常にレスポンスを返答すること" do
      get home_index_path
      expect(response).to have_http_status(200)
    end
  end
end
