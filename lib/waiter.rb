class Waiter

    attr_reader :name, :years_of_experience

    @@all = []

    def initialize(name, years_of_experience)
        @name=name
        @years_of_experience=years_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def best_tipper
        best_tipped_meal = self.meals.max_by { |meal| meal.tip }
        best_tipped_meal.customer
    end
end