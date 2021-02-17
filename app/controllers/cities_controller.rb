class CitiesController < ApplicationController

  def load
    render json: { data: Country.find(params[:country_id]).cities.select('cities.id, cities.city_name').as_json }
  end

end
