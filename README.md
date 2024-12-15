# TicketFast

This demo application demonstrates how to the [payfast_za](https://github.com/muchaya/payfast_za) gem in a Rails application using the PayFast Ruby library.

## Prerequisites

Ensure you have the following installed:

- **Ruby 2.7.0**
- **Bundler 2.1.4**

## Getting Started

Follow these steps to set up and run the demo application:

### 1. Clone the Repository:

    git clone https://github.com/muchaya/ticketfast.git
    cd ticketfast/

### 2. Install dependencies: 
    - Add the `requestjs-rails` gem to your Gemfile: `gem 'requestjs-rails'`
    - Add the `tailwindcss` gem to your Gemfile: `gem 'tailwindcss-rails'`

    - Run `./bin/bundle install`

    - Run `./bin/rails requestjs:install`
    - Run `./bin/rails tailwindcss:install`
  
### 3. Confifure payfast credentials: 
    Edit config/initializers/payfast.yml to set the credentials applicable to your Payfast account

### 4. Setup the database:
    rails db:create
    rails db:setup

### 5. Start the application
    bin/dev
 