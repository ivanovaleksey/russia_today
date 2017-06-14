require 'spec_helper'

RSpec.describe RussiaToday do
  it 'has a version number' do
    expect(RussiaToday::VERSION).not_to be nil
  end

  describe '#holiday?' do
    subject { date.holiday? }

    context 'with holiday' do
      let(:date) { Date.new(2017, 6, 12) }

      it { is_expected.to be_truthy }
    end

    context 'with workday' do
      let(:date) { Date.new(2017, 6, 13) }

      it { is_expected.to be_falsey }
    end
  end
end
