#9 - Serialization and Working with Files

Two exercises that explain how to use files for reading and writing. Specifically for the Event Manager exercise, the task was to read the CSV file and use it to generate an email (using ERB) through an email template. The Hangman exercise focuses on reading a dictionary file and generating a game of [Hangman](http://en.wikipedia.org/wiki/Hangman_%28game%29) that means the word criteria. 

####1 - Event Manager

Warmup exercise that explains the basics of using files. This includes using files for reading the writing as well as error checking for cases of empty cells in the CSV file.

######To run:
```
cd 9-serialization/1 - Event Manager
```
```
ruby lib/event_manager.rb
```

####2 - Hangman

Replicating the game, [Hangman](http://en.wikipedia.org/wiki/Hangman_%28game%29), where the user needs to guess what a word is by initially only knowing the length of the word and using a limited number of guesses to guess if a particular letter is in the word. 

######To run:
```
cd 9-serialization/2 - Hangman
```
```
ruby hangman.rb
```