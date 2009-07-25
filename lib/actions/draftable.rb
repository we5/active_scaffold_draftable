module ActiveScaffold::Actions
  module Draftable

    def publish
      @record = find_if_allowed(params[:id], :update)
      @record.publish!
      flash[:info] = "#{@record.class.name.humanize} published"
      respond_to do |format|
        format.js { render :action => "draftable" }
      end
    end

    def draft
      @record = find_if_allowed(params[:id], :update)
      @record.draft!
      flash[:info] = "#{@record.class.name.humanize} drafted"
      respond_to do |format|
        format.js { render :action => "draftable" }
      end
    end
  end
end