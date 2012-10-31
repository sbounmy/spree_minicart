require 'spec_helper'

feature "minicart", :js => true do
  background { @product = FactoryGirl.create(:product, :name => "ror mug", :price => 30, :on_hand => 2) }

  scenario "customer should be able to add and delete a product in the minicart" do
    visit spree.products_path

    click_link("ror mug")

    within("li#link-to-cart") do
      page.should have_content("Cart: (Empty)")
    end

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

    within("li#link-to-cart") do
      page.should have_content("Cart: (Empty)")
    end

    URI.parse(current_url).path.should =~ /products/

    within("#minicart") do
      page.should_not have_content("ror mug")
      page.should_not have_content("$30")
    end

  end

  scenario "delete a line item with multiple quantity should totally remove from minicart" do
    visit spree.products_path
    click_link("ror mug")

    within("li#link-to-cart") do
      page.should have_content("Cart: (Empty)")
    end

    click_button "Add To Cart"
    click_button "Add To Cart"

    within("#link-to-cart a") do
      page.should have_content("(2)")
    end

    within("#minicart") do
      page.should have_content("ror mug")
      within("#minicart-details") do
        page.should have_content("$60")
      end
    end

    page.execute_script '$("#minicart-items li").trigger("mouseenter")'

    within "li div.minicart-actions" do
      page.should have_content("Delete")
      # manually sliding down the minicart actions, dont know why its not working
      page.execute_script '$("#minicart-items li div.minicart-actions").slideDown()'
      click_link "Delete"
    end

    within("li#link-to-cart") do
      page.should have_content("Cart: (Empty)")
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

  scenario 'minicart should not create new order for every visitor', :js => false do
    expect {
      visit spree.products_path
    }.to_not change(Spree::Order, :count)
  end

  scenario 'with allowbackorders to false minicart should not be able to item multiple time' do
    reset_spree_preferences do |config|
      config[:allow_backorders] = false
    end
    @product.master.update_column :count_on_hand, 1

    visit spree.products_path
    click_link("ror mug")

    within("li#link-to-cart") do
      page.should have_content("Cart: (Empty)")
    end

    click_button "Add To Cart"
    click_button "Add To Cart"

    within("#link-to-cart a") do
      page.should have_content("(1)")
    end

  end

end
