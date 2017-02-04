require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { build(:person) }
  subject { person }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  it { expect(subject).to have_many(:contributors) }
  it { expect(subject).to have_many(:actors) }
  it { expect(subject).to have_many(:directors) }
end
