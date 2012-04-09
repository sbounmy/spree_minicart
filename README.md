SpreeMinicart
=============

Minicart feature extracted from [http://www.hallyustyle.com](http://www.hallyustyle.com).

Your shopping cart is an incredibly important part of your e-commerce website.

Minicart allows customer to add/remove an item from their cart without ever leaving the page they're on.
Let your customers preview their cart before they start the checkout process.

Installation
------------

To install Spree Minicart, just add the following to your Gemfile:

```ruby
gem 'spree_minicart', '~> 0.0.3'
```

Now, bundle up with:

```ruby
bundle
```

And finally run the install generator to automatically insert 'require store/spree_minicart' in your asset file.

```ruby
rails g spree_minicart:install
```

Make sure manifest is inserted correctly, it should look like :

- app/assets/stylesheets/store/all.css :

```css
/*
 *= require store/spree_core
 *= require store/spree_auth
 *= require store/spree_api
 *= require store/spree_promo

 *= require store/spree_minicart
*/
```

- app/assets/javascripts/store/all.js :

```javascript
//= require store/spree_core
//= require store/spree_auth
//= require store/spree_api
//= require store/spree_promo
//= require store/spree_minicart
```

Customization
-------------

The minicart markup should let you customize the way you want your minicart by using Deface or overriding _minicart.html.erb and _minicart_line_items.html.erb in your spree app.
See [Spree Guide](http://guides.spreecommerce.com/view_customization.html) for more information.

If you need to change the js response when you add / update the minicart, check out : orders/populate.js.erb and orders/update.js.erb.

Example
-------

![Spree Minicart](http://i41.tinypic.com/2n8zszs.png)

Todo
-------

- Better html markup and HTML test for customization
- Better css design
- Can update minicart's item quantity
- Add a pagination to the minicart items list using jcarousel

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test app
    $ bundle exec rspec spec

Compatibility
------------

Tested under Spree 1.0.0

Contribute
----------

Pull requests for features and bug fix with tests are welcome.

Copyright (c) 2012 [Stéphane Bounmy], released under the New BSD License
