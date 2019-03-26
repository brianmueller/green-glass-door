require "net/http"
require "uri"

def send_message(queries)
  uri = URI.parse("https://maker.ifttt.com/trigger/ggd/with/key/hkgMxPyvl3IqVBpshDZcG483pMN6IJLS6NJ5pAxlpF5")
  response = Net::HTTP.post_form(uri, {"value1" => queries})
end

# send_message("test")