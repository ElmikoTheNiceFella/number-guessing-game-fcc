#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$((1 + $RANDOM % 1000))
# echo $SECRET_NUMBER
echo Enter your username:
read NAME
USER_NAME="$($PSQL "SELECT name FROM users WHERE name='$NAME'")"
BEST_SCORE="$($PSQL "SELECT best_score FROM users WHERE name='$NAME'")"
if [[ -z $USER_NAME ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  INSERT_DATA="$($PSQL "INSERT INTO users(name, number_of_games, best_score) VALUES('$NAME', 0,0)")"
else
  GAMES_PLAYED="$($PSQL "SELECT number_of_games FROM users WHERE name='$NAME'")"
  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
fi
echo "Guess the secret number between 1 and 1000:"
read GUESS
NUMBER_OF_GUESSES=1
while [[ $GUESS != $SECRET_NUMBER ]]
do
  ((NUMBER_OF_GUESSES++))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
done
if [[ -z $BEST_SCORE || $NUMBER_OF_GUESSES < $BEST_SCORE ]]
then
  UPDATE_BEST_GUESS="$($PSQL "UPDATE users SET best_score=$NUMBER_OF_GUESSES WHERE name='$NAME'")"
fi
INCREMENT_GAMES_PLAYES="$($PSQL "UPDATE users SET number_of_games=number_of_games+1 WHERE name='$NAME'")"
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
