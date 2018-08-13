# stats

An expressive implementation of statistical distributions.
Compatible with crystal v0.26.1

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  stats:
    github: Nephos/stats
```


## Usage

### Include it

```crystal
require "stats"
include Stats
```

### Normal distribution

```crystal
NormaleDistribution.between # less_than, greater_than
  standard_deviation: 15,
  esperance: 100,
  min: 85,
  max: 115
  # => 0.6826894921370859
```

### Binomial distribution

```crystal
Math.binomial_distribution(
  tries: 3,
  probability: 0.5,
  success: 1)
  # => 0.375
```

### Binomial coefficient

```crystal
Math.coef_binomial(5, 2) # => 10
```

### Factorial

```crystal
Math.factorial(4) # => 24
```

### Radian and degree

```crystal
90.radian # => (Math::PI / 2)
(Math::PI / 4) # => 45.0
```

### Series & Statistics

```crystal
[1, 2, 3].mean # => 2.0
[1, 2, 3].variance # => 0.6667
[1, 2, 3].standard_deviation # => 0.8165
[1, 2, 3].quadratic_mean # => 2.16
[2, 32].geometric_mean # => 8.0
[40, 60].harmonic_mean # => 48.0
[1,2,3,2,1].macd 3 # => [2.0, 2.333, 2.0]
```

### Correlations

```crystal
[1,2,3,4].covariance [4,2,1,0] # => -1.625
[1,2,3,4].correlation_coef [1,2,3,3] + 1 > 1.5 # => true
[1,2,3,4].correlation_coef [-14,14,101,-100] + 1 > 1.5 # => false
```

## Development

- The lib is adapted to be usable with BigInt and BigFloat values

## Contributing

1. Fork it ( https://github.com/Nephos/stats/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Nephos](https://github.com/Nephos) Arthur Poulet - creator, maintainer
