require "slack-notify"
require "clockwork"
require 'dotenv/load'


module Clockwork
    n = 1
    client = SlackNotify::Client.new(webhook_url: ENV["WEBHOOK_URL"])
    

    handler do |job|
        puts "Running #{job}"
        msg = "Hello world! The bot is still here working for you. This is the Message #{n} sent at #{Time.now}"
        client.notify(msg)
        n += 1
    end
    every(3.minutes, 'Slack Bot running')

end