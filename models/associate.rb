require 'unirest'

def get_associations(word)
  response = Unirest.get "https://twinword-word-associations-v1.p.mashape.com/associations/?entry=#{word}",
  headers:{
    "X-Mashape-Key" => "zuXTIGm8drmshzKubwZLBRQNV0sFp1XDtp5jsnOKpYs4VuyWsC"
  }
#   puts "The response hash is #{response}"
  result = response.body
  header = response.headers
  remaining = header[:x_ratelimit_queries_remaining]
#   puts "Remaining: #{remaining} queries."
  associations = result["associations"]
  unless associations.nil?
    associations = associations.split(', ') 
  end
  return [associations, remaining]
end

# print get_associations("hockey")
# print get_associations("whiteboard")