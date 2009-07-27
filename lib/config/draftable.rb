module ActiveScaffold::Config
  class Draftable < Base
    def initialize(core_config)
      core_config.create.columns.exclude :state
      core_config.update.columns.exclude :state
    end
  end
end