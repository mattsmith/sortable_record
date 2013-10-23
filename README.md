# SortableRecord

Allows you to create a sortable list from your ActiveRecord model, can use a belongs_to relationship to act as the scope.

## Installation

Add this line to your application's Gemfile:

    gem 'sortable_record'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sortable_record

## Usage

Make a model sortable

```ruby
class Book < ActiveRecord::Base
  has_many :chapters
end

class Chapter < ActiveRecord::Base 
  include SortableRecord
  is_sortable :position, :book
  belongs_to :book
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
