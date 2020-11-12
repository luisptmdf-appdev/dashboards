class ForexController < ApplicationController 

  def index
    raw_data = open("https://api.exchangerate.host/symbols").read
    parsed_data =  JSON.parse(raw_data)
    @currency_key_vector = parsed_data.fetch("symbols").keys
    render({:template => "forex/index.html.erb"})
  end

  def second_currency
    @first_currency = params.fetch("first_currency")
    raw_data = open("https://api.exchangerate.host/symbols").read
    parsed_data =  JSON.parse(raw_data)
    @currency_key_vector = parsed_data.fetch("symbols").keys
    render({:template => "forex/second_currency.html.erb"})
  end

  def conversion_result
    @first_currency = params.fetch("first_currency")
    @second_currency = params.fetch("second_currency")
    raw_data = open("https://api.exchangerate.host/convert?from=" + @first_currency + "&to=" + @second_currency).read
    parsed_data =  JSON.parse(raw_data)
    @conversion_rate = parsed_data.fetch("result")
  end

end