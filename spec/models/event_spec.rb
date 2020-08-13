# frozen_string_literal: true

require 'rails_helper'

describe Event, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reservations) }
  end

  describe 'validatations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:rows) }
    it { is_expected.to validate_presence_of(:columns) }

    describe 'rows numericality' do
      let(:event) { build(:event, rows: rows) }

      context 'when reservation receive a number between 1 and 26' do
        let(:rows) { 15 }

        it 'reservation has been validated' do
          expect(event.valid?).to be_truthy
        end
      end

      context 'when reservation receive a number out of permitted range' do
        let(:rows) { 27 }

        it 'reservation has not been validated' do
          expect(event.valid?).to be_falsey
        end
      end
    end
  end
end
