## WelcomeController
require 'quandl'
class WelcomeController < ApplicationController
  include ActionView::Helpers::TextHelper
  def index
  end

  ## Listing Quandl Data in Tabluar Mode
  def listing_quandl_data
    Quandl::ApiConfig.api_key = ENV['quandl_api_key']
    Quandl::ApiConfig.api_version = ENV['quandl_api_version']
    begin
      @quandl_datas = Quandl::Database.get(params[:code]).datasets
    rescue => error
      @error = error
    end
  end

  def change_code_from_name
    if params[:name] == 'stocks'
      @codes = ['KFRENCH']
    elsif params[:name] == 'bonds'
      @codes = ['FED']
    end
  end
end
