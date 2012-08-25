module Spree
  OrdersController.class_eval do
    before_filter :set_current_order, :only => [:populate]

    respond_to :js, :only => [:populate, :update]

    ssl_allowed :populate, :update

    def set_current_order
      current_order(true)
    end
  end
end