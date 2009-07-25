module ActiveScaffold
  module Helpers
    module DraftableHelpers

      def state_column(record)
        state   = record.state.to_sym
        actions = {:drafted => :publish, :published => :draft}
        action  = actions[state]

        permitted = respond_to?(:permitted_to?) ? permitted_to?(:publishing, record.class.to_s.tableize.to_sym) : true

        [
          state,
          (render_action_link(ActiveScaffold::DataStructures::ActionLink.new(action, { :type => :record, :position => false, :method => :put, :label => "#{action}!", :eid => "foo" }), params.merge({ :id => record.id, :controller => record.class.to_s.tableize })) if permitted)
        ].compact.join(": ")
      end
    end
  end
end