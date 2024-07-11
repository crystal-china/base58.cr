# base58.cr
 Generate random strings with Base58 alphabet.
 
 Base58 string may contain alphanumeric characters except `0`, `O`, `I` and `l`, it can be build use following Crystal code.
 
```ruby
("0".."9").to_a + ("A".."Z").to_a + ("a".."z").to_a - ["0", "O", "I", "l"]
```
   
 Better performance than [valenciaj/crystal-base58](https://github.com/valenciaj/crystal-base58), thanks a lot for the discussion in the [forum](https://forum.crystal-lang.org/t/is-this-a-good-way-to-generate-a-random-string/6986)
 
```
Random.base58(base58.cr)        33.17M ( 30.15ns) (± 3.27%)  32.0B/op        fastest
Base58.random(crystal-base58)   3.52M (284.24ns) (± 3.82%)   401B/op   9.43× slower
```

## How to use it.

Add this shard into shard.yml, then run `shards install`

```yaml
dependencies:
  base58:
    github: crystal-china/base58.cr
```

Use it.

```crystal
require "base58"

Random.base58(20)  # => bbTmPChwQAPKyUV2P9oZ
```

## Contributing

1. Fork it (<https://github.com/crystal-china/base58.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Billy.Zheng](https://github.com/zw963) - creator and maintainer

