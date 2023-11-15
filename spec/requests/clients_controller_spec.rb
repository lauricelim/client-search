require 'rails_helper'

RSpec.describe "ClientsController", type: :request do
  let(:search_file) { file_fixture("client2.json") }
  let(:query_result) { JSON.parse(file_fixture("em_search_result.json").read) }
  let(:query_from_file_result) { JSON.parse(file_fixture("gmail_search_result.json").read) }
  let(:duplicate_result) { JSON.parse(file_fixture("find_duplicate_result.json").read) }

  describe "GET /query" do
    it "search for client name" do
      get "/clients/query", params: {q: "em"}
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(query_result)
    end
  end

  describe "POST /query_from_file" do
    it "search for field" do
      post "/clients/query_from_file", params: {search: "@gmail", search_for: "email", client_file: search_file}
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(query_from_file_result)
    end
  end

  describe "POST /find_duplicate" do
    it "search for field" do
      post "/clients/find_duplicate"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(duplicate_result)
    end
  end
end
