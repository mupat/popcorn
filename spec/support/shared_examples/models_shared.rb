RSpec.shared_examples "a model with translated attributes" do |*attributes|
  attributes.each do |attr|
    let(:model) { build ActiveModel::Naming.singular(described_class) }

    before do
      @available_locales = I18n.available_locales
      @locale = I18n.locale
      I18n.available_locales = [:en, :de]
      I18n.locale = :en
      model.send("#{attr}=", 'en name')
      I18n.locale = :de
      model.send("#{attr}=", 'de name')
    end

    after do
      I18n.available_locales = @available_locales
      I18n.locale = @locale
    end

    context 'when locale is en' do
      before { I18n.locale = :en }
      it { expect(model.send(attr)).to eq 'en name' }
    end

    context 'when locale is de' do
      before { I18n.locale = :de }
      it { expect(model.send(attr)).to eq 'de name' }
    end
  end
end

RSpec.shared_examples 'a model with file upload' do |object_as_sym|
  let(:object) { build(object_as_sym) }
  let(:persisted_object) { create(object_as_sym) }

  describe '#name' do
    context 'object is not persisted' do
      subject { object.name }
      it { is_expected.to be nil }
    end

    context 'object is persisted' do
      subject { persisted_object.name }
      it { is_expected.not_to be nil }
    end
  end
end
