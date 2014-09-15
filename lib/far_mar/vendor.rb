module FarMar
  class Vendor
    attr_reader :id, :name, :employees, :market_id

    def initialize(vendor_array)
      @id = vendor_array[0].to_i
      @name = vendor_array[1]
      @employees = vendor_array[2].to_i
      @market_id = vendor_array[3].to_i
    end

    def self.all(file_path="./support/vendors.csv")
      file_contents = CSV.read(file_path)
      @@vendors = file_contents.collect do |vendor|
        temp = Vendor.new(vendor)
        Market.find(temp.market_id).vendors << temp
      end
    end
  end
end
