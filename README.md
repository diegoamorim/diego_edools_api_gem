# Diegoedoolsapi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/diegoedoolsapi`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'diegoedoolsapi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install diegoedoolsapi

## Usage

To setup the gem, follow this steps:

- Configure token_master for requests like create a school. `Diegoedoolsapi.configuration.token_master = "{TOKEN HERE}"`
```
Example : `Diegoedoolsapi.configuration.token_master = "e1245wtyr23552353262623632:63634773474373723445"`
```

> **Note 1 :** **the token master is used only to create a new school, 
however it's mandatory to configure it.**

- If you don't want to put the token master to create a new school, simply set the token of an existing school using the following command:  `Diegoedoolsapi.configuration.token = "{SCHOOL TOKEN HERE}"`

```
Example: Diegoedoolsapi.configuration.token = "12345789346et9wrwyy:24567334778wejgke436
```
> **Note 2 :** **if you create a school, the token is automatically stored in your section to make other requests without having to configure it**

### Class Methods:

- Create school: `Diegoedoolsapi.create_school("PARAMS")`

- Update school: `Diegoedoolsapi.update_school(SCHOOL ID, "PARAMS")`

- Create school product: `Diegoedoolsapi.create_school_product(SHCOOL ID, "PARAMS")`

- Create course: `Diegoedoolsapi.create_school_product("PARAMS")`

- Get endpoint objects: `Diegoedoolsapi.get_all("ENDPOINT")`

- Get students enrolled on especific school_product `Diegoedoolsapi.get_school_product_students(SCHOOL_PRODUCT_ID)`

- Invitation student to specific product `Diegoedoolsapi.invitation_student(PARAMS")`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/diegomaciel72/diegoedoolsapi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Diegoedoolsapi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/diegoedoolsapi/blob/master/CODE_OF_CONDUCT.md).
