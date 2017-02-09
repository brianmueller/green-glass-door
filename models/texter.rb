def send_message(queries)
  to_phone = ("+1" + to_phone.to_s)

  account_sid = ENV["TWILIO_KEY"]
  auth_token = ENV["TWILIO_TOKEN"]

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create(
    from: '+14342605034',
    to: ENV["CELL_NUMBER"],
    body: "You have #{queries} queries remaining."
  )
end