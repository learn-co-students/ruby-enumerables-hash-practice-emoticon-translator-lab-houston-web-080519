# require modules here
require 'yaml'
def load_library(file_path)
  # code goes here
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
end
result
end 


def get_japanese_emoticon(file_path = './lib/emoticons.yml', emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_emoticon"].include? (emoticon)
    library['get_emoticon'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else 
    "Sorry, that emoticon was not found"
  # code goes here
end
end