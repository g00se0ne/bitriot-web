class AweberService
  BUSINESS_HACKS_LIST = 4646052.freeze
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+[\.[a-z]+]*\.[a-z]+\z/i

  def initialize
    @oauth = AWeber::OAuth.new(ENV['AWEBER_KEY'], ENV['AWEBER_SECRET'])
    @oauth.authorize_with_access(ENV['AWEBER_ACCESS_TOKEN'], ENV['AWEBER_ACCESS_SECRET'])
  end

  def subscribe(email: )
    new_subscriber = { "email" => email }

    if valid?(email)
      subscribers.create(new_subscriber)
    else
      false
    end
  end

  def subscribers
    client.account.lists[BUSINESS_HACKS_LIST].subscribers
  end

  private

  def valid?(email)
    !(EMAIL_REGEX =~ email).nil?
  end

  def client
    @client ||= AWeber::Base.new(oauth)
  end

  attr_reader :oauth
end
