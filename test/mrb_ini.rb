##
## Ini Test
##

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
    }
  }

  path = File.join(File.dirname(File.expand_path('.', __FILE__)), 'sample.ini')
  puts path
  assert_equal expect, Ini.load_file(path)
end
