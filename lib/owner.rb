class Owner 
  attr_reader:species, :name, :pets 
  
  @@owner = []
  @@pets = {:dogs => [], :cats => []}
  
  def initialize(name)
    @species= "human"
    @name = name 
    @@owner << self 
  end 
  
  def say_species 
    "I am a #{@species}."
  end 
  
  def self.all 
    @@owner
  end 
  
  def self.count 
    @@owner.size 
  end 
  
  def self.reset_all 
    @@owner.clear
  end 
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(cat_name)
    @@pets[:cats] << Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    @@pets[:dogs] << Dog.new(dog_name, self)
  end

  def walk_dogs
   self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
   self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.cats.each do |cat|
      self.cats.delete(cat)
      Cat.owner = nil
      Cat.mood = "nervous"
  self.dogs.each do |dog|
      self.dogs.delete(dog)
      Dog.owner = nil
      Dog.mood = "nervous"
    end 
  end 
end 
end 



