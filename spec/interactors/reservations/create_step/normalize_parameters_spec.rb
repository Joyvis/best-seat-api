require 'rails_helper'

describe Reservations::CreateStep::NormalizeParameters, type: :interactor do
  subject { described_class.call(reservations_params: reservations) }

  context 'with valid parameters' do
    context 'and it is receiving a hash parameter' do
     let(:reservations) { [attributes_for(:reservation)] }

     it 'parameters have been filtered' do
       expect(subject.reservations_params).to be_a(Array)
       expect(subject.reservations_params.first).to be_a(Hash)
     end
    end

    context 'and it is receiving a controller parameter' do
     let(:reservations) do
       ActionController::Parameters
         .new(reservations: [attributes_for(:reservation)])
     end

     it 'parameters have been filtered' do
       expect(subject.reservations_params).to be_a(Array)
       expect(subject.reservations_params.first)
         .to be_a(ActionController::Parameters)
     end
    end
  end

  context 'with invalid parameters' do
    let(:reservations) { nil }

    it 'raises an error' do
      expect{ subject }.to raise_error(NoMethodError)
    end
  end
end
