
system "l init.q_"

addToEnum:?      // write your code here
                 //CHALLENGE: minimal char count: 1

addToEnum[`sym;`JPM`GE`GE`JPM]     //test output before submitting
sym 
addToEnum[`sym;`JPM] 
sym
addToEnum[`sym;`GE`BP`BP]
sym

resolveEnum:get
                     // CHALLENGE: minimal char count: 3

en:`sym$`JPM`GE`BP               // let's create an enum
en                               //we can see it's an enum
resolveEnum en                   // test output before submitting

isEnum:{20=type x}
                        //CHALLENGE: minimal char count: 11

isEnum en

isEnum `JPM`GE`BP   // test output before submitting

.trn.checkAnswers[]

results

.trn.submitAnswers[]
