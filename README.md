# TDD Playing Cards in Ruby

The goal of this Kata is to incrementally build up a functional deck of playing cards using Minitest and Ruby using a test driven approach and coming to our final solution via approximation.

## Getting Started

This Kata can be performed in any version of Ruby, however Minitest is only in as of 1.9 and later, so I suggest you start there. I can see no reason today to use 1.8.

1. Fork the repository and clone it to your system.
2. Open ```playing_cards.rb``` in your favorite editor, which by now should be VIM.
3. Uncomment the first test.
4. Write the passing implementation above the test code.
5. Run the file using ```ruby -rminitest/pride playing_cards.rb```
6. Your first test should pass.
7. Uncomment the next test and repeat the process

## Step 1 - What a fucking slime-ball....

Examine the first test. It asserts that there will be a local variable called ```cards``` and that it will be a collection of 52 items. Since it does not specify anything beyond that, we will do something I do frequently when starting new tests and code, I will slime them.

Sliming is the process of giving the failing test what it is asking for to make the tests green, even though that thing you gave it isn't really what it should take. But it does get the test to pass, which is an important piece of feedback. This step of sliming also teaches us something important about tests. When they are all green, you need to write another test.

That next test will get you even closer to what you want, but it probably wont get you all the way there. You will still have to handle more code paths and possible icky parameter values. So you meet the current expectations and then you write another failing test to hit a different vector.

So back to sliming.... Here is how it looks

{% gist 11075696 %}

What I did here was write just enough code to get my test to pass. The test wanted a collection of 52 "cards" so that is what I gave it. I composed 2 functions to handle the creation for me. ```times``` and ```map```.

So 52 times I want this to iterate, and I want it to return an array, thus the ```map```. ```map``` takes a block, and we just stick a string in it to return to us. Now we have a local variable called ```cards``` and that has 52 strings representing cards in it.

## Step 2 - She's all heart, that one

To get closer to a deck of cards, our next step will be to represent ranks and suits. We look at the next test and uncomment it.

So there is a let statement here, that simply defines ```all_hearts``` as a subset of an array, thus the ```select``` call. ```select``` acts as a filter, only returning those items that match the block, in this case we have a regular expression string to match against. Should it have 'hearts' in the string, then it is returned and the iteration continues, otherwise it is discarded.

So to get this next test to pass we need a single suit, and a set of 13 ranks in which to build the cards from. The only suit we care about for the moment is hearts.

{% gist 11075852 %}

So what I do here is create a local variable to hold the array of suits. I create these using Ruby's shortcut for arrays of symbols, %i. %i like %w lets me create arrays without typing comma over and over, because the seperator is the space, not a comma. The %i creates an array of symbols whereas the %w creates strings.

I only define hearts here as that is all the test asks for.

However the test clearly says it wants 13 hearts. So I need to do something similar for ranks, but this time fill it out so I can iterate over it's 13 ranks and create a heart for each one.

The tests are run, and surprise, our new test passes, but our initial test fails! However if you re-read the test it is clear what happened here.

We originally had 52 "cards", now we have 13 "hearts", "ace" through "king", when the "ace" is treated as the low card. So I propose we skip that test again, and continue on. When we complete the other tests, we should have a total of 52 and we can turn that test back on.

### Clubbing the night away!

As we continue down our path to a functional deck of cards, we read the next test. It looks identical to the previous test except it is about Clubs this time. So I uncomment it and run the tests, and sure enough, it fails as I have 13 hearts but 0 clubs.

This is rediculously easy to fix however, given our current implementation. All I have to do is go to the top, and add a new string to the suits array of symbols. This time clubs:

{% gist 11075940 %}

## Continuing down the line

Now as you can see, the final 2 tests look identical again to the last 2. And since the last one was so easy to implement, this will be more of the same. However, only add the "diamonds" when the tests asks for "diamonds". So uncomment and continue to "spades". You know what to do.

## Finally, back to our first test!

Now unskip that initial test again. Run your tests.

They should be green, all 5 assertions. This is because 13 * 4 is 52.

## Why not just metaprogram these assertions?

The question may have come to you before now. Since the impementation of the test for hearts through spades were all the same minus the suit name, why not generalize?

If this were implementation code I absolutely would collapse it into a more general function. However in my tests I was to see plainly before me what is going on. I don't like a lot of indirection in my tests.

## What is the point of this code?

It might look like a toy to you, but you have just written some very powerful ruby in just 3 lines. I will leave you to poner that until next time, when take this code into OO land.

Till we meet again, keep it functional and immutable whenever possible!
