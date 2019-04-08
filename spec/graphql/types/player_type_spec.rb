require 'rails_helper'
require_relative '../../../app/controllers/graphql_controller'

describe 'Player Query', type: :request do
  before(:each) do
    @player_1 = Player.create(id: 100, name: "Happy Gilmore", email: "happy@gmail.com", password: "password")
    @player_2 = Player.create(id: 200, name: "Billy Maddison", email: "Billy@gmail.com", password: "word")
    @player_3 = Player.create(id: 300, name: "Little Nicky", email: "PopeysChicken@gmail.com", password: "pass")
  end

  it 'returns all players' do
    def query
      <<~GQL
        query {
          players()
          {
            id
            name
            email
          }
        }
      GQL
    end

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:data][:players].length).to eq(3)
    expect(json[:data][:players][0]).to have_key(:id)
    expect(json[:data][:players][0]).to have_key(:name)
    expect(json[:data][:players][0]).to have_key(:email)
  end

  it 'returns players by particular ids' do
    def query
      <<~GQL
        query {
          players(ids: [100,200])
          {
            id
            name
            email
          }
        }
      GQL
    end

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:data][:players].length).to eq(2)
    expect(json[:data][:players][0]).to have_key(:id)
    expect(json[:data][:players][0]).to have_key(:name)
    expect(json[:data][:players][0]).to have_key(:email)
    expect(json[:data][:players][0][:name]).to eq("Happy Gilmore")
    expect(json[:data][:players][1][:name]).to eq("Billy Maddison")
    expect(json[:data][:players][1][:name]).to_not eq("Little Nicky")
  end

  it 'returns one player by id' do
    def query
      <<~GQL
        query {
          players(ids: [100])
          {
            id
            name
            email
          }
        }
      GQL
    end

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:data][:players].length).to eq(1)
    expect(json[:data][:players][0]).to have_key(:id)
    expect(json[:data][:players][0]).to have_key(:name)
    expect(json[:data][:players][0]).to have_key(:email)
    expect(json[:data][:players][0][:name]).to eq("Happy Gilmore")
    expect(json[:data][:players][0][:name]).to_not eq("Billy Maddison")
    expect(json[:data][:players][0][:name]).to_not eq("Little Nicky")
  end


end
