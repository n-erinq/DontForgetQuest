# gem httpartyを読み込む
require 'httparty'
# URIモジュールを読み込む（URLのエンコードや解析に使われる）
require 'uri'

class CheckRecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @check_list = @user.open_check_list
    @check_items = @check_list.check_items
  end
  
  def create
    @user = current_user
    @check_list = @user.open_check_list
    @check_items = @check_list.check_items
    @check_record = @check_list.check_records.new(check_record_params)
      if @check_record.save
         @check_list.reload
         redirect_needed = false
      if @check_list.days_3? && @check_list.check_records.count == 3 ||
         @check_list.weeks_3? && @check_list.check_records.count == 21 ||
         @check_list.months_3? && @check_list.check_records.count == 84
          redirect_to congratulations_path
          redirect_needed = true
       end
       unless redirect_needed
        flash[:success] = '本日のチェックが完了しました'
        redirect_to user_path(current_user)
       end
       else
        flash.now[:danger] = '全てチェックしよう！'
        render :new, status: :unprocessable_entity
      end
  end

  def weather
    latitude = params[:latitude]
    longitude = params[:longitude]

    response = WeatherService.new(latitude, longitude).fetch_weather
    if response.success?
      weather_data = response.parsed_response
      weather = {
        name: weather_data["name"],
        temp_celsius: weather_data["main"]["temp"].round(1),
        temp_min_celsius: weather_data["main"]["temp_min"].round(2),
        temp_max_celsius: weather_data["main"]["temp_max"].round(2),
        humidity: weather_data["main"]["humidity"],
        description: weather_data["weather"][0]["description"]
      }
      render json: { weather: weather }
    else
      render json: { error: "Unable to fetch weather data" }, status: :bad_request
    end

  end
   
  private

  def check_record_params
    params.require(:check_record).permit(check_item_ids: [])
  end

  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end

end

class WeatherService
  # HTTPartyモジュールをWeatherServiceクラスにインクルード
  include HTTParty
  # OpenWeatherMap APIのベースURIを設定
  base_uri 'api.openweathermap.org'

  def initialize(latitude, longitude)
    # 環境変数からOpenWeatherMapのAPIキーを取得
    api_key = ENV['OPENWEATHERMAP_API_KEY']
    # APIリクエストのためのオプションを設定
    @options = { query: { lat: latitude, lon: longitude, appid: api_key, lang: 'ja', units: 'metric' } }
  end

  def fetch_weather
    # HTTPartyによって提供されるgetメソッドをクラスメソッドとして呼び出す
    self.class.get("/data/2.5/weather", @options)
  end
end