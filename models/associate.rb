require 'unirest'

def get_associations(word)
  response = Unirest.get "https://twinword-word-associations-v1.p.mashape.com/associations/?entry=#{word}",
  headers:{
    "X-Mashape-Key" => ENV["TWINWORD_KEY"]
  }
  header = response.headers
  body = response.body
  
  remaining = header[:x_ratelimit_requests_remaining]
  associations_array = body["associations_array"]

  return {"associations_array" => associations_array, "remaining" => remaining}
end

# print get_associations("hockey")
# print get_associations("whiteboard")
