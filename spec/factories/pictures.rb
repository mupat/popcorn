FactoryGirl.define do
  factory :picture do
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'cover.jpg')) }
    picturable { create(:movie) }
  end
end
