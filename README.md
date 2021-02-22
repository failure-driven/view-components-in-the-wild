# View Components in the Wild

* there has been a very good 101 on view components in 2020
  * https://github.com/rails-oceania/melbourne-ruby/issues/158
  * https://youtu.be/Lzsb-Q5Lm9g
  * by Julián Pinzón - check out his github https://github.com/pinzonjulian
* I am going to look how we at Fresho have used view components
  * Fresho is a closed marketplace for fresh food where wholesalers sell to restaurants
  * During Covid we also did a bit of B2C on behalf of some of our wholesalers
    in the main cities you can sign up at http://fresho.com - yep we are
    international - going big guns and hiring
    We have just hired a junior and still looking for a couple of mids to senior
    if writing high quality code through pairing and testing is your thing come
    and drop us a line michael@fresho.com
  * Fresho is a rails app with an ember front end and active admin backend with
    a couple web services off to the side
  * we started writing new front ends in react but found a lot of simple forms
    would just be easier to build in plain old rails
  * as we are all about testing we started testing our views but something
    didn't quite feel right so when we had the opportunity to try view
    components and get the benefits of decomposition and unit testing like in
    react we were all in
  * more info on view components at https://viewcomponent.org/
  * or check out the getting started video from Julian
* Let's take a step back and build out some rails forms
* not so quickly let's drive them out with tests
* we would have an integration test
* and unit test everything along the way
* what's the difference?
  * header
  * more info
  * name
  * email
  * password
  * submit
* but what if I wanted to have a specific submit button
* or add error handling to my fields
* and what if I wanted the benefits of decomposition smaller more testable
  reusable components
* what if I didn't want to write tests that all need to be updated if I update
  some generic component
* so let's assume you have view components installed
* with a simple call to `render` we can render a view component
* we can also test drive a view component
* here we mock out a form and the calls to it
* now we can refactor our code to use this
* also have various content parts
* add slots
* simple to get started, more testable, composable front ends

# README from rails new

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
