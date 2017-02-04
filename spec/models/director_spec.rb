require 'rails_helper'

RSpec.describe Director, type: :model do
  let(:director) { build(:director) }
  subject { director }

  it { is_expected.to be_valid }
  it { expect(subject).to belong_to(:movie) }
  it { expect(subject).to belong_to(:person) }
  it { expect(subject.type).to eql 'Director' }
end
