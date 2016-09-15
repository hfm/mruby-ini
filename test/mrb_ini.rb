##
## Ini Test
##

assert("Ini.#parse") do
  content = "[section1]\nkey=value\nint = 1\n    float      = 1.5\n\nbool=   true   "
  expect = {
    "section1" => {
      "key" => "value",
      "int" => 1,
      "float" => 1.5,
      "bool" => true
    },
  }

  assert_equal expect, Ini.parse(content)

  content = "[section1]\nkey = value\nbool = true\n[section2]"
  expect = {
    "section1" => {
      "key" => "value",
      "bool" => true,
    },
    "section2" => {},
  }

  assert_equal expect, Ini.parse(content)

  content =  "[section1]\nkey = value\nbool = true\n\n[section2]"
  assert_equal expect, Ini.parse(content)
end

assert("Ini.#load_file") do
  expect = {
    "DEFAULT" => {
      "global" => "variable"
    },
    "section1" => {
      "key" => "value",
      "int" => 1,
      "float" => 1.5,
      "bool" => true
    },
    "section2" => {
      "hello" => "world"
    },
    "section3" => {
      "true" => false
    },
    "section 4 (empty)" => {},
    "section5" => {
      "with space" => "a & 1",
      "nil" => nil
    },
  }

  path = File.join(File.dirname(File.expand_path('.', __FILE__)), 'sample.ini')
  puts path
  assert_equal expect, Ini.load_file(path)
end

assert("Ini.#dump") do
  content = {
    "section1" => {
      "key" => "value",
      "int" => 1,
      "float" => 1.5,
      "bool" => true
    },
  }

  expect = "[section1]\nkey=value\nint=1\nfloat=1.5\nbool=true"

  assert_equal expect, Ini.dump(content)
end
