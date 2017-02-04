require 'rails_helper'

RSpec.describe Contributor, type: :model do
  let(:contributor) { build(:contributor) }
  subject { contributor }

  it { is_expected.to be_valid }
  it { expect(subject).to belong_to(:movie) }
  it { expect(subject).to belong_to(:person) }
end
