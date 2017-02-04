require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:picture) { build(:picture) }
  subject { picture }

  it { is_expected.to be_valid }
  it { expect(subject).to belong_to(:picturable) }

  it_behaves_like 'a model with file upload', :picture
end
