require_relative '../app/simple_warehouse'
require_relative '../app/store'

RSpec .describe SimpleWarehouse do
  describe '#store' do
    it "should raise an error when trying to store a crate at a position which doesn't exist" do
      @warehouse = Store.new 2, 2
      expect { @warehouse.store(3, 3, 1, 1, 'a') }.to raise_error 'Position doesn\'t exist.'
    end
    it "should raise an error when trying to store a crate which doesn't fit" do
      @warehouse = Store.new 2, 2
      expect { @warehouse.store(1, 1, 3, 3, 'a') }.to raise_error 'Product doesn\'t fit.'
    end
    it "should raise an error when trying to remove a crate which doesn't exist" do
      @warehouse = Store.new 2, 2
      expect { @warehouse.remove(3, 3) }.to raise_error 'No crate in position 3, 3'
    end
  end

end