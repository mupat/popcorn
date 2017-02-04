require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { build(:movie) }
  subject { movie }

  it { is_expected.to be_valid }

  it_behaves_like 'a model with translated attributes', :title, :summary

  it { expect(subject).to have_many(:pictures) }
  it { expect(subject).to have_many(:actors) }
  it { expect(subject).to have_one(:director) }
end
