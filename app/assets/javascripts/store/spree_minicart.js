//= require store/spree_core
//= require store/jquery.hoverintent

(function($){
  $(document).ready(function(){
    var config = {
      over: function(){
        $("#minicart").slideDown();
      },
      timeout: 250, // number = milliseconds delay before onMouseOut
      out: function(){
        $("#minicart").slideUp();
      }
    };

    $("#link-to-cart").hoverIntent( config )

    // hoverintent items created by js http://rndnext.blogspot.com/2009/02/jquery-live-and-plugins.html
    $(document).on('mouseover', "ul#minicart-items li", function(e)
    {
      if (!$(this).data('init'))
      {
        $(this).data('init', true);
        $(this).hoverIntent
        ({
          over: function(){
            $(this).find("[data-hook='minicart_item_description']").hide()
            $(this).find("[data-hook='minicart_item_actions']").show()
          },
          timeout: 100, // number = milliseconds delay before onMouseOut
          out: function(){
            $(this).find("[data-hook='minicart_item_description']").show()
            $(this).find("[data-hook='minicart_item_actions']").hide()
          }
        });
        $(this).trigger(e);
      }
    });


    $(document).on('click', 'form#update-minicart a.delete', function(e){
      $(this).parent().siblings('div[data-hook="minicart_item_quantity"]').find("input.line_item_quantity").val(0);
      $(this).parents('form').first().submit();
      e.preventDefault();
    });

    $(document).on("ajax:beforeSend", "form[data-remote]", function(){
      $("#progress").slideDown();
    })

    $(document).on("ajax:complete", "form[data-remote]", function(){
      $("#progress").slideUp();
    })
  });
})(jQuery);