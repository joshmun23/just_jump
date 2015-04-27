Just Jump allows users to find their favorite foods at the right price point for them. The app is still a work in progress but currently has basic user functionality.

The application also has basic user-search statistics that will be a fragment of a larger algorithm tracking search data and providing suggestions to benefit the user.

Designed to provide ease of use on the client side, I aimed to re-factor the back-end as well to provide a better experience for the developer as well. There is still much re-factoring to be done, but those changes should be coming soon.

There were a lot of changes made near the end of the project's due time that should allow code to be cleaned up massively.


<h3><strong>Ruby 2.1.5</strong></h3>

<h3><strong>APIs</strong></h3>
  Locu
  Yelp (Currently not in use until new features added)

<h3><strong>Database</strong></h3>
  Use the 'pg' gem (PostgreSQL DB)
  rake db:create
  rake db:migrate

<h3><strong>Front-End</strong></h3>
  Foundation Framework
  Foundation icons
  Carousels provided by http://kenwheeler.github.io/slick/

<h3><strong>Gems</strong></h3>
  Devise (For User Functionality)
  https://github.com/plataformatec/devise

  Geocoder (For Location)
  https://github.com/alexreisner/geocoder

  Faraday (For HTTP requests)
  https://github.com/lostisland/faraday

  Kaminari (For Pagination)
  https://github.com/amatsuda/kaminari

  Locu (For Menu Item & Restaurant Information)
  https://dev.locu.com/
  # You will need to sign up for an account & API key

  Yelp
  https://github.com/Yelp/yelp-ruby
  # You will need to sign up for an account & API key
