Deface::Override.new(:virtual_path => 'spree/shared/_store_menu',
                    :name => 'add_mini_cart',
                    :insert_bottom => "#link-to-cart",
                    :partial => "spree/shared/minicart")

Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
                    :name => 'set_remote_to_true_to_add_to_cart',
                    :replace => "code[erb-loud]:contains('form_for :order, :url => populate_orders_url do |f|')",
                    :text => "<%= form_for :order, :url => populate_orders_url, :remote => true do |f| %>",
                    :original => "<%= form_for :order, :url => populate_orders_url do |f| %>")

