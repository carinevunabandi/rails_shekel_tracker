require "rails_helper"

describe HomeController do
  describe "index" do
    it "renders the index page" do
      expect(get(:index)).to render_template :"home/index"
    end
  end
end
