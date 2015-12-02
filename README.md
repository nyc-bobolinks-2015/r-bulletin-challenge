# r-bulletin revisited: 

##The story so far

Our senior engineer is undisciplined and only does the work he feels like. He's implemented some of our application, but hasn't stuck to the release schedule. 

Our colleague has been fairly diligent about writing tests, and has set up [SimpleCov](https://github.com/colszowka/ simplecov) to generate code coverage reports from the tests. Run ```rake spec``` then look at the index.html file generated in the coverage folder.

Your job is to pick up the application and start adding new features to it. 

You should follow the user stories list below. The features struck through are already implemented. Your job is to do the others.

To get started clone this repo and check you are on the branch called wednesday. If you've cloned this repo before, clone it again into a new folder, as it's changed.

```bundle install``` the ```rake db:drop && rake db:create && rake db:migrate && rake db:seed``` The seeds will take a while as there's a decent volume of test data.

Implement the remaining features. Keep the test coverage score at 100%

User stories

###R0
* ~~As a visitor I want to see a list of topics~~
* ~~As a visitor I want to see a list of conversations in a topic~~
* ~~As a visitor I want to read a conversation (see the messages in it.)~~
* As a visitor I want to see a list of recently active conversations

###R1
* ~~As a visitor I want to register a new account with email, username and password~~
* ~~As a user I want to log in~~

###R2
* ~~As a logged in user, I want to add messages to existing conversations.~~
* As a logged in user, I want to start new conversations in a topic.
* As a logged in user, I want to see my most recent messages.
* As a logged in user, I want to see conversations I started.

###R3
Convert the add messages and start conversations functionality to use ajax

###R4
* As a logged in user, I want to like user messages.
* As a logged in user, I should only be able to like a message once.
* As a logged in user, I should be able to see a list of my likes.
* As a visitor viewing a conversation, I should see the like count on each message.

###R5
* As a logged in user viewing an existing conversation, I should be able to click a user name to see that user's most recent messages.
* As a logged in user looking at my or another user's messages, I want to click to see the rest of the conversation that contains the message.
* As a logged in user I should be able to maintain a list of "watched" conversations that I can get back to quickly later.

###Stretch releases (or things for later)
* As a visitor I want to register to log in with twitter (read up on omniauth.)
* As a visitor registered with twitter I want to choose a screen name different from my twitter handle.
* As a logged in user I want to be able to perform a word search that should return messages containing that word, along with topics and conversations whose title contains those words (have a look at ransack.)
* As a logged in user creating a message, I want to upload 1 to 4 pictures with my message (read up on paperclip / carrierwave)
* As a registered user, I should get a welcome email (take a look at actionmailer and activejob. For local development you might want to check out mailcatcher)
* As a user watching a conversation, I should get an email when someone posts a message in that conversation (look at cron.)
* As a user watching a conversation, I should be able to click a link in the mail say "enough already" with the emails and turn them off for a single conversation or all conversations.
