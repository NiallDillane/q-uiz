
system"l init.q_"

isWholeNumber: {(type x) in (-5h;-6h;-7h)}

//test here before moving on! 
isWholeNumber 4.5
isWholeNumber 4
isWholeNumber 4h
isWholeNumber 4j
isWholeNumber"a"

doubleSecondItem:{@[x;1;*;2]}       //Accepts a list and returns the list with the second item doubled 
                               //CHALLENGE: minimal char count: 12 (all including function brackets)

//test here before moving on! 
doubleSecondItem 10 20 30 40 50

dropLastTwoItems:{-2_x}       //Accepts a list and returns the list with the last two items removed
                              //CHALLENGE: minimal char count: 6

dropLastTwoItems 1 2 3 4
dropLastTwoItems "abcde"

transpose:flip     //Accepts an M x N matrix and returns an N x M matrix
                         //CHALLENGE: minimal char count: 4

transpose(1 2 3 4;10 20 30 40;100 200 300 400)

getIndexOf:{x?y}      //Returns the index of an item in a list
                       //CHALLENGE: minimal char count: 5

getIndexOf[`john`mike`pat`tim`harry;`pat]

firstDayOfNextMonth:{`date$ 1 + `month$ x}    //takes any date and returns the first date of the next month

//test here before moving on! 
firstDayOfNextMonth 2015.01.01
firstDayOfNextMonth 2015.01.11
firstDayOfNextMonth 2015.01.31
firstDayOfNextMonth 2015.02.27

whereDivisibleBy:{x[where not x mod y]}   //Dyadic function that takes a numeric list and long as its two arguments, 
                                        //only returning the items in the list that are wholly divisible by the long
                                        //CHALLENGE: minimal char count: 19 (all including function brackets)

//test here before moving on! 
whereDivisibleBy[1 3 5 6 10 20;5]

roundDown:{`long$ floor x}        //Takes a numeric atom or list as its sole argument and returns the number(s) 
                             //rounded down to the next lowest whole number
                             //CHALLENGE: minimal char count: 9 

//test here before moving on! 
roundDown 4.1
roundDown 4.1 4.3 4.5 4.8 5.0

.trn.checkAnswers[]

results

.trn.submitAnswers[]
