require 'rails_helper'

describe Ticket do
  it { should be_open }
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should have_enum status: %w{open in_progress finished} }

  describe 'state machine' do
    it { expect(subject).to have_state :open }
    it { expect(subject).to transition_from(:open).to(:in_progress).on_event(:take) }
    it { expect(subject).to \
         transition_from(:in_progress).to(:finished).on_event(:finish) }
  end

  describe '#trigger!' do
    subject { create :ticket, user: create(:user) }
    it 'raises event if can_trigger?' do
      subject.trigger! :take
      expect(subject).to be_in_progress
    end

    it 'does nothing unless can_trigger?' do
      subject.trigger! :random
      expect(subject).to be_open
    end
  end

  describe '#can_trigger?' do
    it 'is truthy if event is permitted' do
      expect(subject.can_trigger? :take).to be_truthy
    end
    it 'is falsey if event is not permitted' do
      expect(subject.can_trigger? :invalid).to be_falsey
    end
  end
end
