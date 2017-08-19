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

def total
  sum = 0.0
  @user_items.each do |item|
    sum += item[:price]
  end
  puts "Your total is: $#{sum.round(2)}".colorize(:green)
end


def tray
  @user_items.each_with_index do |dish, index|
    index = index + 1
    puts "#{index}. #{dish[:name]} $#{dish[:price]}"
  end
end

def side_dish
  SIDE_DISHES.each_with_index do |dish, index|
    index = index + 1
    puts "#{index}. #{dish[:name]} $#{dish[:price]}"
  end
input = gets.strip
  case input
  when '1'
    @user_items << (SIDE_DISHES[0])
  when '2'
    @user_items << (SIDE_DISHES[1])
  when '3'
    @user_items << (SIDE_DISHES[2])
  else
    raise "Invalid Selection, Try Again!"
  end
end

def main_dish
  MAIN_DISHES.each_with_index do |dish, index|
    index = index + 1
    puts "#{index}. #{dish[:name]} $#{dish[:price]}"
  end
input = gets.strip
  case input
  when '1'
    @user_items << (MAIN_DISHES[0])
  when '2'
    @user_items << (MAIN_DISHES[1])
  when '3'
    @user_items << (MAIN_DISHES[2])
  else
    raise "Invalid Selection, Try Again!"
  end
end

def menu
  puts "Welcome to the Cafeteria,"
  puts "Come get your slop!"
  main_dish
  puts "Get some slime with that!"
  side_dish
  puts "Get some more."
  side_dish
  puts "Here's your tray: "
  tray
  total
end

menu
