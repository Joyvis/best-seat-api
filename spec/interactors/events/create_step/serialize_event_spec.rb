require 'rails_helper'

describe Events::CreateStep::SerializeEvent, type: :interactor do
  subject { described_class.call(event: event) }

  let(:event) { create(:event) }

  it 'event has been serialized' do
    expect(subject.event).to be_a(EventSerializer)
  end
end
