# Game Statistics Service
for more information about Reverse Hangman Online check the documentation
 
[Reverse Hangman Online Documentation](https://github.com/Epic-Chainsaw-Massacre)

## Table of Contents
- [What is Game Statistics Service?](#what-is-game-stastistics-service)
- [Saving Game Results to Database](#saving-game-results-to-database)
  - [What kind of data will be saved?](#what-kind-of-data-will-be-saved)

# What is Game Statistics Service?
This service sits between the service [Reverse Hangman Online Frontend](https://github.com/Epic-Chainsaw-Massacre/reverse-hangman-online-frontend) and the database. In the image below you can see the service and which containers it directly communicates with. This service gets data from the frontend, and saves it to the database. The service can also extract data from the database and give it to the frontend.

![image](https://user-images.githubusercontent.com/74303221/173060337-098085b5-4a8b-4c0a-b8f8-7becc982a934.png)

# Saving Game Results to Database
The data will be saved using Entity Framework. Entity Framework is an ORM for .NET. It basically means I dont have to create tables and fields in my database. Using Entity Framework I can do it all in my application its classes. Important to note, data should only be saved if a game is completed, not if someone plays halfway through and decides to quit.

## What kind of data will be saved?
The data I want to save are the words that are used in Reverse Hangman Online. Also would I like to save the amount of times letters haven been guessed. And of course the total amount of games that haven been completed. 
