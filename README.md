# Backlog

TODO: Write a gem description

## Installation

    $ git clone git@github.com:nakanowax/backlog-cmd.git
    $ rake build
    $ gem install pkg/backlog-0.0.1.gem
    $ backlog init -s [space] -u [user] -p [password]

<!--
Add this line to your application's Gemfile:

    gem 'backlog'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backlog
-->

## Usage

    ### settings
    $ backlog init -s [space] -u [user] -p [password]

    ### project
    $ backlog project
    $ backlog project -k KEY
    $ backlog project -i ID

    ### issue
    $ backlog issue -k KEY-111
    $ backlog issue -k KEY-111 -U --description '[description]'

    ### status
    $ backlog status -k KEY-111
    $ backlog status -k KEY-111 -U -s 4 (完了) -a [user_id]

    ### users
    $ backlog users --project-id [project_id]

## Contributing

1. Fork it ( http://github.com/[my-github-username]/backlog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
