class Store
  attr_reader :width, :height
  
  def initialize(x, y)
    @width = x.to_i
    @height = y.to_i
    @crates = []
    @warehousearray = Array.new(@height) { |i| Array.new(@width) {'-'} }
  end

  def store(posX, posY, width, height, product_code)
    posX = posX.to_i
    posY = posY.to_i
    width = width.to_i
    height = height.to_i

    if ((posX > (@width - 1)) || (posY > (@height - 1)))
      raise 'Position doesn\'t exist.'
    end

    products_to_store = []
    on_iterate(posX, posY, width, height) do |_posx, _posy|
      if @warehousearray[_posy][_posx] == '-'
        products_to_store.push [_posy.to_i, _posx.to_i, product_code]
      else
        raise 'Product doesn\'t fit.'
      end
    end

    @crates.push [posX, posY, width, height, product_code]
    products_to_store.each do |p|
      @warehousearray[p[0]][p[1]] = p[2]
    end
  end

  def locate(product_code)
    found  = []
    @warehousearray.each_with_index do |column, vidx|
      column.each_with_index do |pos, hidx|
        if pos == product_code
          found.push [vidx, hidx]
        end
      end
    end
    found
  end

  def remove(posX, posY)
    @crates.each do |crate|
      if crate[0] == posX.to_i && crate[1] == posY.to_i
        return _remove(crate)
      end
    end
    raise "No crate in position #{posX}, #{posY}"
  end

  def view
    @warehousearray.reverse.each do |a|
      puts a.join "\t"
    end
  end

  private

  def _remove(crate)
    crate = posX, posY, width, height, product_code

    on_iterate(posX, posY, width, height) do |_posx, _posy|
      @warehousearray[_posy][_posx] = '-'
    end
    @crates.delete_at(@crates.index(crate))
  end

  def on_iterate(posX, posY, width, height)
    (posY..posY+height-1).each do |_posy|
      (posX..posX+width-1).each do |_posx|
        yield(_posx, _posy)
      end
    end
  end
end
