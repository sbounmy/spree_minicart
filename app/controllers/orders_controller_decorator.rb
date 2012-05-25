module Spree
  OrdersController.class_eval do
    respond_to :js, :only => [:populate, :update]

    ssl_allowed :populate, :update
  end
end