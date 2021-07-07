# require modules here
require 'yaml'
def load_library(ruby_file)
  
  #load the file into a hash
  load_file_hash = YAML.load_file(ruby_file)
  
  #create a new empty hash and populate it with the two indicated keys
  emoticon_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  
  #iterate over the hash that contains the now loaded information, rearranging the info as indicated.
  load_file_hash.each do |hash_key, hash_value|
    
    #load the changed information into the new hash
    #remember that values in a nested hash come in an array
    emoticon_hash["get_meaning"][hash_value[1]] = hash_key
    emoticon_hash["get_emoticon"][hash_value[0]] = hash_value[1]
    
  end
  
  #return the new, now loaded, hash
  emoticon_hash
end
  
 
  

def get_japanese_emoticon(ruby_file, emo)
 library = load_library(ruby_file)
 returned_emote = library["get_emoticon"][emo]
 
 if !!returned_emote
   returned_emote
 else
   "Sorry, that emoticon was not found"
 end
  
end

def get_english_meaning(ruby_file, emo)
  library = load_library(ruby_file)
  returned_emote = library["get_meaning"][emo]
  
  if returned_emote
    returned_emote
  else
    "Sorry, that emoticon was not found"
  end
end