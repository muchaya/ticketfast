# TicketFast

#### This demo application demonstrates how to integrate South Africa's PayFast payment gateway into a Ruby on Rails application using the PayFast Ruby library.

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
    bundle add tailwindcss-rails
    bundle
    rails tailwindcss:install
  
### 3. Confifure payfast credentials: 
    Edit config/initializers/payfast.yml to set the credentials applicable to your Payfast account

### 4. Setup the database:
    rails db:create
    rails db:setup

### 5. Start the application
    bin/dev
 