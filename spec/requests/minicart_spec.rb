require 'spec_helper'

feature "minicart", :js => true do
  background { @product = Factory(:product, :name => "ror mug", :price => 30) }

  scenario "customer should be able to add and delete a product in the minicart" do
    visit spree.products_path
    click_link("ror mug")

    click_button "Add To Cart"

    within("#link-to-cart a") do
      page.should have_content("(1)")
    end

    within("#minicart") do
      page.should have_content("ror mug")
      page.should have_content("$30")
    end

    page.execute_script '$("#minicart-items li").trigger("mouseenter")'
    within "li div.minicart-actions" do
      page.should have_content("Delete")
      # manually sliding down the minicart actions, dont know why its not working
      page.execute_script '$("#minicart-items li div.minicart-actions").slideDown()'
      click_link "Delete"
    end

    URI.parse(current_url).path.should =~ /products/

    within("#minicart") do
      page.should_not have_content("ror mug")
      page.should_not have_content("$30")
    end

  end

  scenario 'minicart should not freak out standard cart', :js => false do
    visit spree.products_path
    click_link("ror mug")
    click_button "Add To Cart"
    URI.parse(current_url).path.should == "/cart"
  end
end
