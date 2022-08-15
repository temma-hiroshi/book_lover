require 'rails_helper'

RSpec.describe "Home", type: :system do
  before do
    visit home_index_path
  end

  describe "GET /home" do
    it "あなたの好きを、誰かの好きに。と表示すること" do
      expect(page).to have_content("あなたの好きを、誰かの好きに。")
    end
  end
end
