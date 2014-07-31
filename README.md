# Backlog

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'backlog'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backlog

## Usage

project list:

    ### settings
    $ bundle exec backlog init -s [space] -u [user] -p [password]

    ### project
    $ bundle exec backlog project
    $ bundle exec backlog project -k KEY
    $ bundle exec backlog project -i ID

    ### issue
    $ bundle exec backlog issue -k KEY-111

    ### status
    $ bundle exec backlog status -k KEY-111
    $ bundle exec backlog status -k KEY-111 -U -s 4 (完了) -a [user_id]

## Contributing

1. Fork it ( http://github.com/[my-github-username]/backlog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
