require 'rails_helper'

RSpec.describe "Plants", type: :request do
  describe "GET /index" do
    it "returns an array of all plants" do
      # Create some plants using the Plant model
      plant1 = Plant.create(name: "Rose", image: "rose.jpg", price: 9.99)
      plant2 = Plant.create(name: "Lily", image: "lily.jpg", price: 12.99)

      # Make the GET request to /plants
      get "/plants"

      # Assert the response
      expect(response).to have_http_status(200)
      expect(response.content_type).to include("application/json")
      expect(JSON.parse(response.body)).to eq([plant1.as_json, plant2.as_json])
    end
  end
end
