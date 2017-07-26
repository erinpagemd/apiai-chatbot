class ApiaiController < ApplicationController
  def post
    action = params[:result][:action]
    variables = params[:result][:parameters]

    response_object = {
      speech: 'THIS IS NOT WORKING',
      displayText: 'THIS IS NOT WORKING'
    }

    if (action == 'weather.city-state')
      response_object = WundergroundService.new.get_city_state_weather(variables)
    end


    render json: response_object.as_json
  end
end
