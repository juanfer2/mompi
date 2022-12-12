RSpec.describe V1::Rides::CreateService, type: :service do
  subject do
    described_class.new(current_rider, current_location_latitude, current_location_longitude)
  end

  let(:current_rider) { create(:rider) }
  let(:current_location_latitude) { Faker::Address.latitude }
  let(:current_location_longitude) { Faker::Address.longitude }
  let!(:driver) { create(:driver) }

  before do
    allow(V1::Rides::ValidateCurrentLocationService).to receive(:call)
  end

  describe '#call' do
    context 'when current location is invalid' do
      before do
        allow(V1::Rides::ValidateCurrentLocationService).to receive(:call).
          and_raise(Api::ParamsError, "error")
      end

      it 'return error' do
        expect { subject.call }.to raise_error(Api::ParamsError)
      end
    end

    context 'when ride cannot able be create' do
      before do
        allow(subject).to receive(:ride).and_return(double(save: false,
          errors: double(full_messages: double(join: 'failed'))))
      end

      it 'return error' do
        expect { subject.call }.to raise_error(Api::RideError)
      end
    end

    context 'when ride is create' do
      let(:ride) { subject.call }

      it 'validates new ride' do
        expect(ride.id.present?).to be_truthy
        expect(ride.rider_id).to eq(current_rider.id)
        expect(ride.driver_id).to eq(driver.id)
        expect(ride.active?).to be_truthy
        expect(ride.start_at.present?).to be_truthy
        expect(ride.base_fee).to eq(350000)
        expect(ride.currency).to eq('COP')
        expect(ride.start_location_latitude).to eq(current_location_latitude)
        expect(ride.start_location_longitude).to eq(current_location_longitude)
      end
    end
  end
end
