require 'unirest'

def is_noun?(word)
  response = Unirest.get "https://wordsapiv1.p.rapidapi.com/words/#{word}",
    headers:{
      "X-RapidAPI-Key" => ENV["WORDS_KEY"]
    }
  body = response.body
  part_of_speech = body["results"][0]["partOfSpeech"]

  if part_of_speech == "noun"
    return true
  else
    return false
  end
end
