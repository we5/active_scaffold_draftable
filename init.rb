require "actions/draftable.rb"
require "config/draftable.rb"
require "helpers/draftable_helpers.rb"

ActionView::Base.send :include, ActiveScaffold::Helpers::DraftableHelpers