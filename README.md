# MultipleFilesGzipReader

It is a library which allows to read a gzip archive with multiple files in it.

Currently Ruby standard library called `Zlib::GzipReader` cannot do this: [issue](https://bugs.ruby-lang.org/issues/9790), [issue](https://bugs.ruby-lang.org/issues/11180).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multiple_files_gzip_reader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multiple_files_gzip_reader

## Usage

`Zlib::GzipReader`:

```ruby
> file = File.open("test/fixtures/test.json.gz")

> Zlib::GzipReader.new(file).each_line { |line| puts line }
# foo
# => nil
```

`MultipleFilesGzipReader`:

```ruby
> file = File.open("test/fixtures/test.json.gz")

> MultipleFilesGzipReader.new(file).each_line { |line| puts line }
# foo
# bar
# => nil

> puts `gunzip -c test/fixtures/test.json.gz`
# foo
# bar
# => nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Running tests

    $ ruby -Ilib:test test/multiple_files_gzip_reader_test.rb

## Contributing

1. Fork it ( https://github.com/[my-github-username]/multiple_files_gzip_reader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
