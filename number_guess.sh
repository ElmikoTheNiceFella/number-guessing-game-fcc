#!/bin/bash
NUM_TO_GUESS=$((($RANDOM % 100) + 1))
PSQL="psql --username=freecodecamp --dbname=guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
USERNAME_FROM_DATABASE="$($PSQL "SELECT username FROM guesses WHERE username='$USERNAME'")"
GAMES_PLAYED="$($PSQL "SELECT games_played FROM guesses WHERE username='$USERNAME'")"
BEST_GAME="$($PSQL "SELECT best_game FROM guesses WHERE username='$USERNAME'")"
if [[ -z $USERNAME_FROM_DATABASE ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME="$($PSQL "INSERT INTO guesses(username) VALUES('$USERNAME')")"
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
read GUESS
GUESSES=1
while [[ $GUESS != $NUM_TO_GUESS ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $NUM_TO_GUESS ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  read GUESS
  ((GUESSES++))
done
if [[ -z $BEST_GAME || $GUESSES -lt $BEST_GAME ]]
then
  UPDATE_BEST_GUESS="$($PSQL "UPDATE guesses SET best_game=$GUESSES WHERE username='$USERNAME'")"
fi
if [[ -z $GAMES_PLAYED ]]
then
  SET_GAMES_PLAYED="$($PSQL "UPDATE guesses SET games_played=1 WHERE username='$USERNAME'")"
else
  UPDATE_GAMES_PLAYED="$($PSQL "UPDATE guesses SET games_played=games_played+1 WHERE username='$USERNAME'")"
fi
echo "You guessed it in $GUESSES tries. The secret number was $NUM_TO_GUESS. Nice job!"
