class Meal
    attr_reader :waiter, :customer
    attr_accessor :total, :tip

    @@all = [ ] 
    def initialize (waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        @@all <<self
    end 

    def self.all
        @@all
    end 

    

end