# Game Statistics Service
for more information about Reverse Hangman Online check the documentation
 
[Reverse Hangman Online Documentation](https://github.com/Epic-Chainsaw-Massacre)

## Table of Contents
- [What is Game Statistics Service?](#what-is-game-stastistics-service)
- [Saving Game Results to Database](#saving-game-results-to-database)
  - [What kind of data will be saved?](#what-kind-of-data-will-be-saved)
  - [What kind of data will be sent to the frontend?](#what-kind-of-data-will-be-sent-to-the-frontend)

# What is Game Statistics Service?
This service sits between the service [Reverse Hangman Online Frontend](https://github.com/Epic-Chainsaw-Massacre/reverse-hangman-online-frontend) and the database. In the image below i highlighted the game statistics service and which containers it directly communicates with. This service gets data from the frontend, and saves it to the database. The service can also extract data from the database and give it to the frontend.

![image](https://user-images.githubusercontent.com/74303221/173060337-098085b5-4a8b-4c0a-b8f8-7becc982a934.png)

# Saving Game Results to Database
The data will be saved using Entity Framework. Entity Framework is an ORM for .NET. It basically means I dont have to create tables and fields in my database. Using Entity Framework I can do it all in my application its classes. Important to note, data should only be saved if a game is completed, not if someone plays halfway through and decides to quit.

## What kind of data will be saved?
The data I want to save are the words that are used in Reverse Hangman Online. Also would I like to save the amount of times letters haven been guessed. And of course the total amount of games that haven been completed. 

## What kind of data will be sent to the frontend?
In the frontend i would like to show something like the top 100 words that have been used. It should show a list where 1 is the most used word and 100 is the least used from the top 100 words. Also would i like to show the 26 letters and how often they get guessed. So in my frontend again you would see a list with 1 for example the letter Z and 26 the letter E. Here is a very prototype-ish visualisation of how it should be.

![image](https://user-images.githubusercontent.com/74303221/173140351-2b0e7aa5-52af-45fa-8ebb-88a9da81f518.png)


