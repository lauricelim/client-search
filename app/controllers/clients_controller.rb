class ClientsController < ApplicationController
  def query
    result = Client::Query.new.search(params["q"])
    render json: result
  end

  def query_from_file
    result = Client::Query.new(params["client_file"]).search(params["search"], params["search_for"])
    render json: result
  end

  def find_duplicate
    result = Client::Query.new.find_duplicate
    render json: result
  end
end