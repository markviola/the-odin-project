#2 - Hangman

Replicating the game, [Hangman](http://en.wikipedia.org/wiki/Hangman_%28game%29), where the user needs to guess what a word is by initially only knowing the length of the word and using a limited number of guesses to guess if a particular letter is in the word. 

######To run:
```
cd 9-serialization/2 - Hangman
```
```
ruby lib/hangman.rb
```

######Outcome:

```
Do you want to load the game (Y/N): **N**
```
```
The current word is: *******
  _______
 |      |
 |      
 |     
 |     
 |
 |__________
 |||||||||||

 Letters you gave guessed: 
 You have 6 lives left
 Guess a letter or type 'solve' to solve: **R**
```
```
The current word is: R******
  _______
 |      |
 |      
 |     
 |     
 |
 |__________
 |||||||||||

 Letters you gave guessed: R
 You have 6 lives left
 Guess a letter or type 'solve' to solve: **Q**
```
```
The current word is: R******
  _______
 |      |
 |      0
 |     
 |     
 |
 |__________
 |||||||||||

 Letters you gave guessed: R, Q
 You have 5 lives left
 Guess a letter or type 'solve' to solve: 
```