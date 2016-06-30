# stats

An expressive implementation of statistical distributions.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  Stats:
    github: Nephos/stats
```


## Usage


```crystal
require "stats"
```

You should read the specs to understand how it works.
```crystal
Math.binomial_distribution(tries: 1, probability: 0.4, success: 1) # => 0.4
NormaleDistribution::between      standard_deviation: 15, esperance: 100, a: 85, b: 115 # => 0.6826894921370859
NormaleDistribution::less_than    standard_deviation: 15, esperance: 100, a: 85 # => 0.15865525393145707
NormaleDistribution::greater_than standard_deviation: 15, esperance: 100, a: 115 # => 0.15865525393145707
Math.binomial_distribution(tries: 1, probability: 0.5, success: 1) # => 0.5
Math.binomial_distribution(tries: 2, probability: 0.5, success: 1) # => 0.5
Math.binomial_distribution(tries: 3, probability: 0.5, success: 1) # => 0.375
```


## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/Nephos/crystal_proba/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Nephos](https://github.com/Nephos) Arthur Poulet - creator, maintainer
