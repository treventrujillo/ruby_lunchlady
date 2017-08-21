require "pry"
require "colorize"

MAIN_DISHES = [
   { name: "Green Slop".colorize(:light_green), price: 3.99},
   { name: "Blue Slop".colorize(:light_blue), price: 5.99 },
   { name: "Yellow Slop".colorize(:light_yellow), price: 4.99}
 ]
SIDE_DISHES = [
  { name: "Green Slime".colorize(:green), price: 1.49},
  { name: "Blue Slime".colorize(:blue), price: 1.99},
  { name: "Yellow Slime".colorize(:yellow), price: 0.99}
]

@user_items = []

def exit_program(choice)
  if choice.downcase == 'quit'
    puts "Come again!"
    exit
  end
end

def print_main_dishes
  puts "Main Dish Options:"
  MAIN_DISHES.each_with_index do |dish, index|
    index = index + 1
    puts "#{index}. #{dish[:name]} $#{dish[:price]}"
  end
end

def tray
  @user_items.each_with_index do |dish, index|
    index = index + 1
    puts "#{index}. #{dish[:name]} $#{dish[:price]}"
  end
end

def print_side_dishes
  puts "Side Dish Options:"
  SIDE_DISHES.each_with_index do |dish, index|
    index = index + 1
    puts "#{index}. #{dish[:name]} $#{dish[:price]}"
  end
end

def total(user_items)
  user_items
  sum = 0.0
  user_items.each do |user_items|
    sum += user_items[:price]
  end
  puts "Your total is: $#{sum.round(2)}".colorize(:green)
end

def side_dish(choice)
  dish = SIDE_DISHES[choice]
  @user_items << dish
  user_items = @user_items
  total(user_items)
end

def main_dish(choice)
  dish = MAIN_DISHES[choice]
  @user_items << dish
  user_items = @user_items
  total(user_items)
end

def menu
  user_items = @user_items
    puts "Welcome to the Cafeteria,"
    puts "Choose your main entree!"
    puts "Type QUIT to exit program"
    print_main_dishes
    choice1 = gets.strip
    exit_program(choice1)
    main_dish(choice1.to_i - 1)
    puts "First side dish?"
    print_side_dishes
    choice2 = gets.strip
    side_dish(choice2.to_i - 1)
    puts "Second side dish?"
    print_side_dishes
    choice3 = gets.strip
    side_dish(choice3.to_i - 1)
    puts "Here's your tray:"
    tray
    total(user_items)
end

while true do
  menu
end
