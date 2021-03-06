require 'spec_helper'
describe FarMar::Sale do

  describe "class methods" do
    it "responds to 'all'" do
      expect(FarMar::Sale).to respond_to :all
    end

    it "'all' should return" do
      expect(FarMar::Sale.all.count).to eq 12798
    end

    it "responds to 'find'" do
      expect(FarMar::Sale).to respond_to :find
    end

    it "searches by amount" do
      expect(FarMar::Sale.find_by_amount(1995).id).to eq 38
    end

    it "finds all sales on a certain date" do
      expect((FarMar::Sale.find_all_by_date(Date.new(2013,11,13))).count).to eq 669
    end

    it "finds all sales between a certain time" do
      start_time = DateTime.new(2013,11,13,0,0,01,'-8')
      end_time = DateTime.new(2013,11,13,23,59,59,'-8')
      expect(FarMar::Sale.between(start_time, end_time).count).to eq 669
    end

  end

  describe "attributes" do
    let(:sale) { FarMar::Sale.find(1) }
    # 1,People's Co-op Farmers FarMar::Sale,30,Portland,Multnomah,Oregon,97202

    it "has the id 1" do
      expect(sale.id).to eq 1
    end

    it "has the amount in cents 9290" do
      expect(sale.amount).to eq 9290
    end

    it "has the day 31" do
      expect(sale.purchase_time.day).to eq 7
    end

    it "has the vendor_id 1" do
      expect(sale.vendor_id).to eq 1
    end

    it "has the product_id 1" do
      expect(sale.product_id).to eq 1
    end

  end

  describe "instance methods" do
    let(:sale) { FarMar::Sale.find(1) }
    it "responds to vendor" do
      expect(sale).to respond_to :vendor
    end

    it "has the vendor" do
      expect(sale.vendor.id).to eq sale.vendor_id
    end
    it "responds to product" do
      expect(sale).to respond_to :product
    end
    it "has the product" do
      expect(sale.product.id).to eq sale.product_id
    end

  end
end
