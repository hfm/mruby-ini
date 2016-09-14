# mruby-ini   [![Build Status](https://travis-ci.org/hfm/mruby-ini.svg?branch=master)](https://travis-ci.org/hfm/mruby-ini)
Ini class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'hfm/mruby-ini'
end
```
## example
```ruby
p Ini.file_load('path_to.ini')
#=> {"DEFAULT"=>{"global"=>"variable"}, "section1"=>{"key"=>"value", "int"=>1, "float"=>1.5, "bool"=>true}, "section2"=>{"hello"=>"world"}, "section3"=>{"true"=>false}}
p = Ini.parse "[section1]\nkey = value\nbool = true"
#=> {"section1"=>{"key"=>"value", "bool"=>true}}
```

## License
under the MIT License:
- see [LICENSE](./LICENSE) file
