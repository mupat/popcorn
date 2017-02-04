require 'rails_helper'

RSpec.describe Actor, type: :model do
  let(:actor) { build(:actor) }
  subject { actor }

  it { is_expected.to be_valid }
  it { expect(subject).to belong_to(:movie) }
  it { expect(subject).to belong_to(:person) }
  it { expect(subject.type).to eql 'Actor' }
end
