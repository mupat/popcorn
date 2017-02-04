namespace :diagram do
  if defined? RailRoady
    # override diagram format from svg to pdf or defined via environment variable
    RailRoady::RakeHelpers.class_variable_set(:@@DIAGRAM_FORMAT, ENV['FILE_FORMAT'] || 'pdf')
    # make sure we override the constants for the existing task to respect the new format
    @MODELS_ALL         = RailRoady::RakeHelpers.full_path("models_complete.#{RailRoady::RakeHelpers.format}").freeze
    @MODELS_BRIEF       = RailRoady::RakeHelpers.full_path("models_brief.#{RailRoady::RakeHelpers.format}").freeze
    @CONTROLLERS_ALL    = RailRoady::RakeHelpers.full_path("controllers_complete.#{RailRoady::RakeHelpers.format}").freeze
    @CONTROLLERS_BRIEF  = RailRoady::RakeHelpers.full_path("controllers_brief.#{RailRoady::RakeHelpers.format}").freeze
    @SED                = RailRoady::RakeHelpers.sed
  end

  desc 'generate models diagram'
  task models: :environment do
    Rake::Task["diagram:models:complete"].invoke
  end
end
