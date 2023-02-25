#ordering pizza at Pizza Bar
#pizza
pizza_id <- c(1,2,3,4)
pizza_type <- c("Four seasons", "Double cheeze", "Meat feast","BBQ Chiken")
df_menu <- data.frame(pizza_id, pizza_type)

#size
size <- c("S","M","L")
price_size <- c(299,399,499)
df_size <- data.frame(size,price_size)

#side dish
side <- c("Salad", "French fries","None")
price_side <- c(120,80,0)
df_side <- data.frame(side,price_side)

#drink
drinks <- c("Coke","Lemonade","None")
price_drink <- c(30,35,0)
df_drink <- data.frame(drinks,price_drink)

#payment
pay_id <- c(1,2)
pay <- c("card","cash")
df_pay <- data.frame(pay_id,pay)

##############################chat#################################
#Q1 greeting and get customer name
print("Hi there!")
print("Welcome to Pizza Bar")
print("May I have your name please?")
user_name <- readLines("stdin",n=1)                                
print(paste("Hi!", user_name,"Thank you for choosing Pizza Bar"))

#Q2 order pizza
order_again <- 1
while (order_again == 1) {
  print("What would you like to order today?")
  print(df_menu)
  print("Please type number to order")
  order_pz <- as.numeric(readLines("stdin",n=1))
  order_again <- order_again + 1
  if (order_pz == 1) {
    order_pz <- "Four seasons"
    print(paste("Alright! you choose", pizza_type[1], "this is the signature menu"))
  } else if (order_pz == 2) {
    order_pz <- "Double cheeze"
    print(paste("Good choice!", pizza_type[2], "is the best seller"))
  } else if (order_pz == 3) {
    order_pz <- "Meat feast"
    print(paste("Wow! you choose", pizza_type[3],"this is the new menu")) 
  } else if (order_pz == 4 ) {
    order_pz <- "BBQ Chiken"
    print(paste("Okay, you choose",pizza_type[4])) 
  } else {
    print("Please type 1 to 4 to order your pizza")
  } 

#Q3 size
print("Which size do you prefer? : Type S/M/L")
print(df_size)
order_size <- toupper(readLines("stdin",n=1))
  if (order_size == "S"){
    order_size <- "Small"
    price_size <- 299
    print(paste("Small size it's 299 THB")) 
  } else if(order_size == "M") {
    order_size <- "Medium"
    price_size <- 399
    print(paste("Medium size it's 399 THB"))
  } else if (order_size == "L") {
    order_size <- "Large"
    price_size <- 499
    print(paste("Large size it's 499 THB"))
  } else {
    print("Please type S/M/L to select your pizza size")
  }
  
#Q4 side dish 
  print("Would you like any sides with that? : Type 1 to 3")
  print(df_side)
  order_side <- as.numeric(readLines("stdin",n=1))
  if (order_side == 1) {
    order_side <- "Salad"
    price_side <- 120
    print(paste("Your side dish is",side[1],"120 THB"))
  } else if (order_side == 2) {
    order_side <- "French fries"
    price_side <- 80
    print(paste("Your side dish is",side[2],"80 THB"))
  } else if (order_side == 3){
    order_side <- "None"
    price_side <- 0
    print(paste("Your side dish is",side[3]))
  } else {
    print("Please try again")
  }
  
#Q5 drink
  print("Do you want some drink? : Type 1 to 3")
  print(df_drink)
  order_dk <- as.numeric(readLines("stdin",n=1))
    if (order_dk == 1) {
      order_dk <- "Coke"
      price_drink <- 30
      print(paste("Your drink is",drinks[1],"30 THB"))
  } else if (order_dk == 2) {
      order_dk <- "Lemonade"
      price_drink <- 35
      print(paste("Your drink is",drinks[2],"35 THB"))
  } else if (order_dk == 3){
      order_dk <- "None"
      price_drink <- 0
      print(paste("Your drink is",drinks[3]))
  } else {
    print("Please try again")
  }
  
}

# summarize order
print(paste("Let me repeat your order. So, that's", order_pz, order_size,"size","with", order_side,"side dish", "and your drink is", order_dk))
#Q6 payment
print("Which payment do you prefer? : Type card/cash")
print(df_pay)
payment <- tolower(readLines("stdin",n=1))
  if (payment == "card" ){
    pay <- "card on your phone"
    print(paste("Please complete your online payment within 10 minutes"))
  } else if (payment == cash ){
    pay <- "cash to driver"
    print("Please have the correct change for the driver")
  }

#Q7 address 
print("May I have your address for delivery please?")
Address <- readLines("stdin",n=1)
print(paste("Okay, your address is", Address))
print("Delivery time will be approximately 30 minutes.")

price_pz <- 0
pizza <- c(order_size,order_side,order_dk)
price<- c(price_size,price_side,price_drink)
total_price <- sum(price)
df_pizza <- data.frame(pizza,price)

#Q8 receipt
print("Your receipt here!")
print("=============================================")
print("===================RECEIPT===================")
print(paste("Customer Name:", user_name ))
print(paste("Customer Address:", Address ))
print("---------------------------------------------")
print(paste("Order:",order_pz))
print(df_pizza)
print(paste("Total amount:", total_price))
print(paste("Payment:" ,payment))
print("---------------------------------------------")
print("===================Pizza Bar=================")
print("=====================Enjoy===================")