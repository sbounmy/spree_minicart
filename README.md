SpreeMinicart
=============

Minicart feature extracted from http://501kfactory.com.

```ruby
rails g spree_minicart:install
```

Make sure manifest is appened correctly, it should look like :
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

Example
=======

Example goes here.

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test app
    $ bundle exec rspec spec

Copyright (c) 2012 [Stéphane Bounmy], released under the New BSD License
