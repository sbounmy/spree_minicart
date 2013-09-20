module Spree
  BaseHelper.module_eval do

    # removed current_page? check because link_to_cart is called everywhere by spree_minicart
    def link_to_cart(text = nil)
      text = text ? h(text) : Spree.t(:cart)
      css_class = nil

      if current_order.nil? or current_order.line_items.empty?
        text = "#{text}: (#{Spree.t(:empty)})"
        css_class = 'empty'
      else
        text = "#{text}: (#{current_order.item_count})  <span class='amount'>#{current_order.display_total}</span>".html_safe
        css_class = 'full'
      end

      link_to text, spree.cart_path, :class => css_class
    end

  end
end