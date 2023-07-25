# -*- coding: utf-8 -*-

# -- Sheet --

# # Rock Paper Scissors - Mini Python Project


import random

user_wins = 0
computer_wins = 0
draw = 0 
count = 0 

options = ["rock","paper","scissors"]

print("Hi there! welcome to pao ying chub game!")

while True:
    user_pick = input("Type rock/paper/scissors or Q to quit: ").lower() 
    if user_pick == "q":
        break
    
    if user_pick not in options:
        continue

    computer_pick = random.choice(options)
    print(f"computer picked: {computer_pick}.")

    if user_pick == computer_pick:
        print("You tie!")
        draw += 1 
        count += 1
    elif user_pick == "rock" and computer_pick == "scissors":
        print("You won!")
        user_wins += 1
        count += 1
    elif user_pick == "paper" and computer_pick == "rock":
        print("You won!")
        user_wins += 1
        count += 1
    elif user_pick == "scissors" and computer_pick == "paper":
        print("You win!")
        user_wins += 1
        count += 1
    else:
        print("You lose.")
        computer_wins += 1 
        count += 1

print(f"You played {count} times.")
print(f"ํYou drew with computer {draw} times.")
print(f"You won {user_wins} times.")
print(f"The computer won {computer_wins} times.")
print("Thanks for playing!")



