require 'rails_helper'
require_relative '../../../app/controllers/graphql_controller'

describe 'Invoice Query', type: :request do
  it 'does shit' do
  # include_context 'GraphQL Client'
    client = GraphqlController.new

    # let(:query) do
    #   <<-GRAPHQL
        # query() {
        #   shots() {
        #     id
        #     clubId
        #     playerID
        #   }
        # }
    #   GRAPHQL
    # end

    headers = {
     "ACCEPT" => "application/json"
    }


    # '{"query":"{\n  shots(){\n\t\tid\n    clubId\n    playerId\n  }\n}","variables":null}'

    post "/graphql", :params => {:query => '{query:"{\n  shots(){\n\t\tid\n    clubId\n    playerId\n  }\n}","variables":null}'}, :headers => headers
    expect(response.status).to eq(200)
    require "pry"; binding.pry
  end
end
