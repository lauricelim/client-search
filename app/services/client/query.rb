class Client::Query
  SEARCH_FIELD = ["id", "full_name", "email"].freeze

  attr_reader :clients

  def initialize(file = nil)
    @clients = JSON.parse(File.read(file || "./client.json"))
  end

  def search(search, field = nil)
    field = SEARCH_FIELD.include?(field) ? field : "full_name"
    result = clients.select { |client| client[field].downcase.include?(search)}
    { result: result, searched_field: field }
  end

  def find_duplicate
    result = clients.group_by { |client| client["email"] }.select{|key,val| val.length > 1}
    { result: result }
  end
  
end