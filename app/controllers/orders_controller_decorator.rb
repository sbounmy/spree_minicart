module Spree
  OrdersController.class_eval do
    respond_to :js, :only => [:populate, :update]
  end
end