require_relative './store'

class SimpleWarehouse

  def run
    @live = true
    puts 'Initialise the warehouse with `init W H`'
    print '> '
    initargs = gets.chomp.split ' '
    command = initargs.shift
    return show_unrecognized_message if !initargs[0] || !initargs[1]

    width, height = *initargs
    @store = Store.new width, height
    puts "Store initiated with a table of #{width} x #{height}"
    puts '-------------------------------------------------------'
    puts 'Begin using the warehouse with the following commands:'
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      args = gets.chomp.split ' '
      command = args.shift

      case command
        when 'store'
          return show_not_initiated if @store.nil?

          begin
            @store.store(*args)
            puts 'Product successfully saved.'
          rescue Exception => e
            show_invalid_message(e.message)
          end
        when 'remove'
          return show_not_initiated if @store.nil?

          begin
            @store.remove(*args)
            puts "Crate successfully removed!"
          rescue Exception => e
            show_invalid_message(e.message)
          end
        when 'locate'
          return show_not_initiated if @store.nil?

          found = @store.locate *args
          if found.size > 0
            puts "Product #{args[0]} found in: ", found.map { |f| f.join ', ' }
          else
            puts "No product found of type #{args[0]}"
          end
        when 'view'
          return show_not_initiated if @store.nil?
          @store.view
        when 'help'
          show_help_message
        when 'exit'
          exit
        else
          show_unrecognized_message
      end
    end
  end

  private

  def show_help_message
    puts <<~HELP
      help             Shows this help message
      store X Y W H P  Stores a crate of product code P and of size W x H at position (X,Y).
      locate P         Show a list of all locations occupied by product code P.
      remove X Y       Remove the entire crate occupying the location (X,Y).
      view             Output a visual representation of the current state of the grid.
      exit             Exits the application.
    HELP
  end

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end

  def show_invalid_message(error = nil)
    puts error || 'Sorry there was an error.'
  end

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end

  def exit
    puts 'Thank you for using simple_warehouse!'
    @live = false
  end

end
