# frozen_string_literal: true

require 'rails_helper'

describe Events::CreateStep::NormalizeParameters, type: :interactor do
  subject { described_class.call(event_params: event) }

  context 'with valid parameters' do
    context 'and it is receiving a hash parameter' do
      let(:event) { attributes_for(:event) }

      it 'parameters have been filtered' do
        expect(subject.event_params).to be_a(Hash)
      end
    end

    context 'and it is receiving a controller parameter' do
      let(:event) do
        ActionController::Parameters.new(event: attributes_for(:event))
      end

      it 'parameters have been filtered' do
        expect(subject.event_params).to be_a(ActionController::Parameters)
      end
    end
  end

  context 'with invalid parameters' do
    let(:event) { nil }

    it 'raises an error' do
      expect { subject }.to raise_error(NoMethodError)
    end
  end
end
