def send_message(queries)
  to_phone = ("+1" + to_phone.to_s)

  account_sid = 'ACed3ed813257f8acedfce46a695216257'
  auth_token = 'cb1dd832eda91ea39319fe6827f1650b'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create(
    from: '+14342605034',
    to: '+17209512343',
    body: "You have #{queries} queries remaining."
  )
end
