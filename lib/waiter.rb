class Waiter

    attr_accessor :name, :yrs_experience
    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        largest_tip = 0
        best_customer = nil

        meals.each do |meal|
            
            if meal.tip > largest_tip
                largest_tip = meal.tip
                best_customer = meal.customer
            end
        end
        best_customer
    end

end