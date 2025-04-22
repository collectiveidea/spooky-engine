# SpookyEngine
Quickly drop a [Ghost](https://ghost.org) blog into a Rails app. Uses the `Spooky` gem (hence the name) to connect to Ghost's API. 

Have access to your blog at `/blog` or wherever you want it. No assumptions. It can use use your layouts and styles with minimal configuration. All views can be quickly overridden by providing your own templates. 

## Installation
Add this line to your application's Gemfile:

```ruby
# Need our fork of spooky for now. 
gem "spooky", git: "https://github.com/collectiveidea/spooky", branch: "active_model" 
gem "spooky-engine"
```

## Usage

1. Add this to your `routes.rb` and change the `at:` path as you desire: 

```ruby
mount Spooky::Engine, at: "/blog", as: "blog"
```

2. Set ENV vars for Spooky to connect to your Ghost instance: 
```
GHOST_API_URL="https://blog.yourdomain.com"
GHOST_CONTENT_API_KEY="abc123"
```

3. Optionally configure (mainly for the Atom feed right now). Add this in an initializer: 

```ruby
Rails.application.config.spooky_engine.config do |config|
  config.title = "My Amazing Blog"
  config.subtitle = "This is some cool stuff you should read."
  config.rights = "© 2025 Me. All rights reserved."
  config.icon =  "icon.png" # gets passed to asset_url()
  config.logo =  "logo.png" # gets passed to asset_url()
end
```

## Customizing

The provided views are intentionally simplistic. You can style them however you want, or replace all or some of them entirely. 

Put your own views in `app/views/spooky/*` and they'll take priority. To link to any blog-related resources, make sure you prefix with `spooky_engine.`. Example: `spooky_engine.page_path("about")`

### Customize layout

The layout is the one thing you'll probalby want to change. 

Either way, make sure to add the link to the Atom feed in your `<head>`

```ruby
<%= auto_discovery_link_tag :atom, spooky_engine.atom_path %>
```

#### Option 1: New Layout

Add a new layout in `app/views/layouts/spooky/application.html.erb` and it will work. 

#### Option 2: Use an existing layout. 

Add this to an initializer: 

```ruby
Rails.application.config.to_prepare do
  # Use your application layout, or any you prefer.
  Spooky::ApplicationController.layout "application"
end
```

## Routes

Routes exist for Posts, Pages, Authors and Tags. We use `slug` instead everywhere, so you get nice URLs, like `/pages/about`.

## Webhooks

Receive Ghost's webhooks easily. Point them at `/blog/webhooks` (assuming you mounted the engine at `/blog`) and then you can subscribe via ActiveSupport::Notifications: 

```ruby
ActiveSupport::Notifications.subscribe('webhook.spooky') do |event|
  event.payload # webhook body
end
```

## Version support
This was built expecting Rails 8+. It probalby works with older versions but hasn't been tested. Fork it, try it, and PRs welcome!

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
