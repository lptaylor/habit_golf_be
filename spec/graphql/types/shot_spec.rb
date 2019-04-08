require 'rails_helper'
require_relative '../../../app/controllers/graphql_controller'

describe 'Shot Query', type: :request do
  before(:each) do
    @player = Player.create(id: 100, name: "Happy Gilmore", email: "happy@gmail.com", password: "password")
    @club = Club.create(style_of_club: 1, id: 1)
    @club.shots.create(rating: 1, player_id: @player.id, id: 1)
    @club.shots.create(rating: 2, player_id: @player.id)
    @club.shots.create(rating: 3, player_id: @player.id)
    @club.shots.create(rating: 4, player_id: @player.id)
    @club.shots.create(rating: 5, player_id: @player.id)
    @club.shots.create(rating: 6, player_id: @player.id)
  end

  it 'returns all shots' do
    client = GraphqlController.new
    def query
      <<~GQL
        query {
          shots()
          {
            rating
            clubId
            playerId
          }
        }
      GQL
    end

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:data][:shots].length).to eq(6)
    expect(json[:data][:shots][0]).to have_key(:rating)
    expect(json[:data][:shots][0]).to have_key(:clubId)
    expect(json[:data][:shots][0]).to have_key(:playerId)
  end

  it 'returns all shots of a particular rating' do
    client = GraphqlController.new
    def query
      <<~GQL
        query {
          shots(rating: 1)
          {
            rating
            clubId
            playerId
          }
        }
      GQL
    end

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:data][:shots].length).to eq(1)
    expect(json[:data][:shots][0]).to have_key(:rating)
    expect(json[:data][:shots][0]).to have_key(:clubId)
    expect(json[:data][:shots][0]).to have_key(:playerId)
  end

  it 'returns all shots of a playerId rating' do
    client = GraphqlController.new
    def query
      <<~GQL
        query {
          shots(playerIds: 100)
          {
            rating
            clubId
            playerId
          }
        }
      GQL
    end

    player_2 = Player.create(id: 2, name: "Grizzly Adams", email: "HadABeard@gmail.com", password: "cool")
    club_2 = Club.create(style_of_club: 3, id: 2)
    club_2.shots.create(rating: 1, player_id: player_2.id)

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:data][:shots].length).to eq(6)
    expect(json[:data][:shots][0]).to have_key(:rating)
    expect(json[:data][:shots][0]).to have_key(:clubId)
    expect(json[:data][:shots][0]).to have_key(:playerId)
  end

  it 'returns one shot based on shot id' do
    client = GraphqlController.new
    def query
      <<~GQL
        query {
          shots(ids: 1)
          {
            id
            rating
            clubId
            playerId
          }
        }
      GQL
    end

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:data][:shots].length).to eq(1)
    expect(json[:data][:shots][0][:id]).to eq("1")
    expect(json[:data][:shots][0]).to have_key(:id)
    expect(json[:data][:shots][0]).to have_key(:rating)
    expect(json[:data][:shots][0]).to have_key(:clubId)
    expect(json[:data][:shots][0]).to have_key(:playerId)
  end
end
