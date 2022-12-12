require 'spec_helper'

RSpec.describe 'Riders controller', type: :request do
  describe 'POST /api/v1/riders/rides' do
    let!(:rider) { create(:rider) }
    let!(:driver) { create(:driver) }
    let(:current_location_latitude) { Faker::Address.latitude }
    let(:current_location_longitude) { Faker::Address.longitude }
    let(:request)  { post "/api/v1/riders/rides", params.to_json, headers }
    
    let(:params)  do 
      { 
        "currentLocationLatitude" => current_location_latitude,
	      "currentLocationLongitude" => current_location_longitude
      }
    end

    before { request }

    context 'when token is null' do
      let(:headers) { {} }

      it 'returns errors with status 403' do
        expect(last_response.status).to eq(403)
        expect(response_body).to eq({"error"=>"rider is unauthorize"})
      end
    end

    context 'when token is invalid' do
      let(:headers) { { 'Authorization' => 'Bearer InvalidToken' } }

      it 'returns errors with status 403' do
        expect(last_response.status).to eq(403)
        expect(response_body).to eq({"error" => "rider is unauthorize"})
      end
    end

    context 'when rider is authorize' do
      context 'when params are currentLocationLatitude is nil' do
        let(:headers) do
          { 
            'HTTP_ACCEPT' => "application/json",
            'HTTP_AUTHORIZATION' => "Bearer #{rider.token}"
          }
        end

        let(:params) { {} }
  
        it 'returns errors with status 403' do
          expect(last_response.status).to eq(403)
          expect(response_body).to eq({"error"=>"currentLocationLatitude is required"})
        end
      end

      context 'when params are currentLocationLatitude is nil' do
        let(:headers) do
          { 
            'HTTP_ACCEPT' => "application/json",
            'HTTP_AUTHORIZATION' => "Bearer #{rider.token}"
          }
        end

        let(:params) { { "currentLocationLatitude" => current_location_latitude } }
  
        it 'returns errors with status 403' do
          expect(last_response.status).to eq(403)
          expect(response_body).to eq({"error"=>"currentLocationLongitude is required"})
        end
      end

      context 'when params are correct' do
        let(:headers) do
          { 
            'HTTP_ACCEPT' => "application/json",
            'HTTP_AUTHORIZATION' => "Bearer #{rider.token}"
          }
        end

        let(:params)  do 
          { 
            "currentLocationLatitude" => current_location_latitude,
            "currentLocationLongitude" => current_location_longitude
          }
        end
  
        it 'returns success response' do
          expect(last_response.status).to eq(200)
          expect(response_body['rider']['id']).to eq(rider.id)
          expect(response_body['driver'].present?).to be_truthy
          expect(response_body['status']).to eq('active')
          expect(response_body['currency']).to eq('COP')
        end
      end
    end
  end
end
