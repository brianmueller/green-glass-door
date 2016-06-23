require 'unirest'

def get_associations(word)
  response = Unirest.get "https://twinword-word-associations-v1.p.mashape.com/associations/?entry=#{word}",
  headers:{
    "X-Mashape-Key" => "zuXTIGm8drmshzKubwZLBRQNV0sFp1XDtp5jsnOKpYs4VuyWsC"
  }
  header = response.headers
  body = response.body

  remaining = header[:x_ratelimit_queries_remaining]
  associations_array = body["associations_array"]

  return {"associations_array" => associations_array, "remaining" => remaining}
end

# print get_associations("hockey")
# print get_associations("whiteboard")
