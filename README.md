<p align="center">
  <img src="https://images.vexels.com/media/users/3/146452/isolated/preview/ff1dff030e21fb04a43b2303f3d75ec2-open-cardboard-box-icon-by-vexels.png" width="250" height="250" alt="Adop Shop logo"/>
</p>

# Crypto Box

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

A simpler way to manage crypto asset holdings. Users can track their current portfolio allocations whilst monitoring the price of bitcoin in real time. For each asset images can be assigned, helping to further guide investment decisions. 

## Getting Started


These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have rails installed, if not:

```
gem install rails 
```

### Installing

To get up and running in your browser clone this repo 

Install the dependenices

```
bundle install 
```

Create the database

```
rails db:create
```

Run the migrations

```
rails db:migrate
```

Start the server

```
rails server
```

Visit localhost:3000 in your browser to start managing your portfolio 

## Running the tests

Install the dependencies

```
bundle install
```

Run rspec

```
rspec
```


### Test Example

Each test ensures working functionality for a particular user story. 

```
describe "user login" do 
  it "can log a user in " do 
    create(:user, user_name: "nico24687", password: "donothackin")

    visit login_path 

    fill_in "user[user_name]", with: "nico24687"
    fill_in "user[password]", with: "donothackin"

    click_on "Login"

    expect(page).to have_content("Welcome nico24687")
  end 
end 
```

## Built With

* [Rails](https://github.com/rails/rails) 
* [Bootstrap](https://github.com/twbs/bootstrap-rubygem) 

## Versioning

Version 1.0

## Authors

* **Nico Lewis** [contact](https://github.com/nico24687)

## License

This project is licensed under the MIT License 
