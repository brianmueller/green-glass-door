require 'unirest'

def is_noun?(word)
  response = Unirest.get "https://wordsapiv1.p.mashape.com/words/#{word}",
    headers:{
      "X-Mashape-Key" => "zuXTIGm8drmshzKubwZLBRQNV0sFp1XDtp5jsnOKpYs4VuyWsC",
      "Accept" => "application/json"
    }
  result = response.body
  part_of_speech = result["results"][0]["partOfSpeech"]
  
  if part_of_speech == "noun"
    return true
  else
    return false
  end
end

# puts is_noun?("basketball")
puts is_noun?("programming")