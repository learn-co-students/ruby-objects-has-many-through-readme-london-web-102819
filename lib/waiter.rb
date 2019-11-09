class Waiter
    attr_accessor :name, :yrs_experience
    @@all = [ ]

    def initialize (name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all<<self
    end 

    def self.all
        @@all
    end 

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total,tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter ==self}
    end 

    def best_tipper
        best_tipped_meal= meals.max{|meal_1, meal_2| meal_1.tip <=> meal_2.tip}
        best_tipped_meal.customer
    end 

    def customer_visits
        hsh={}
        meals.each {|meal| hsh[meal.customer]=0}
        meals.each{|meal|  hsh[meal.customer]+=1}
        hsh
    end

    def frequent_customer
        customer_visits.max_by{|key, value| value}[0]
    end
end