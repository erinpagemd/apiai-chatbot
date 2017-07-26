class WundergroundService
  include HTTParty

  def get_city_state_weather(variables)
    city = variables["geo-city"]
    state = variables["geo-state-us"]
    key = ENV["wunderground_key"]
    base_uri = "http://api.wunderground.com/api/"

    url = base_uri + "#{key}/conditions/q/#{state}/#{city}.json"

    res = HTTParty.get(url)

    json_res = JSON.parse(res.body)

    weather = json_res["current_observation"]["weather"]

    text = "The weather in #{city}, #{state} is #{weather}."

    return {
      speech: text,
      displayText: text
    }
  end
end