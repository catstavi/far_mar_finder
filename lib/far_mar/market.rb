module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_array)
      @id = market_array[0]
      @name = market_array[1]
      @address = market_array[2]
      @city = market_array[3]
      @county = market_array[4]
      @state = market_array[5]
      @zip = market_array[6]
    end

    def self.make_many(file_path="./support/markets.csv")
      file_contents = CSV.read(file_path)
      file_contents.collect { |market| Market.new(market) }
    end
  end
end
