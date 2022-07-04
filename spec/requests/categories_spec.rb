require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /body_parts" do
    it "returns http success" do
      get "/categories/body_parts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /car_audio" do
    it "returns http success" do
      get "/categories/car_audio"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /cooling" do
    it "returns http success" do
      get "/categories/cooling"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /driveline" do
    it "returns http success" do
      get "/categories/driveline"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /electrical" do
    it "returns http success" do
      get "/categories/electrical"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /engine" do
    it "returns http success" do
      get "/categories/engine"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /filters" do
    it "returns http success" do
      get "/categories/filters"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /fuel_ignition" do
    it "returns http success" do
      get "/categories/fuel_ignition"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /steering" do
    it "returns http success" do
      get "/categories/steering"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /suspension" do
    it "returns http success" do
      get "/categories/suspension"
      expect(response).to have_http_status(:success)
    end
  end

end
