#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo "Enter your username:"
read USERNAME

USERNAME_EXISTS=$($PSQL "SELECT games_played, best_game FROM game_history WHERE username = '$USERNAME';")
if [[ -z $USERNAME_EXISTS ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "$USERNAME_EXISTS" | while read GAMES_PLAYED BAR BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
fi


SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
CNT_GUESSES=0
echo "Guess the secret number between 1 and 1000:"

while [[ $USER_NUMBER -ne $SECRET_NUMBER ]]
do 
  read USER_NUMBER
  if ! [[ "$USER_NUMBER" =~ ^[0-9]+$ ]] 
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  CNT_GUESSES=$((CNT_GUESSES + 1))

  if [[ $USER_NUMBER -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $USER_NUMBER -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  fi
done


if [[ -z $USERNAME_EXISTS ]]
then
  GAMES_PLAYED=1
  BEST_GAME=$CNT_GUESSES
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO game_history(username, games_played, best_game) VALUES('$USERNAME', $GAMES_PLAYED, $BEST_GAME);")
else
  GAMES_PLAYED=$((GAMES_PLAYED + 1))
  if [[ $CNT_GUESSES -lt $BEST_GAME ]]
  then
    BEST_GAME=$CNT_GUESSES
  fi
  UPDATE_GAME_RESULT=$($PSQL "UPDATE game_history SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username = '$USERNAME';")
fi

echo "You guessed it in $CNT_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
