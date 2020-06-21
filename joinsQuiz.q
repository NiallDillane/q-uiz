
system"l init.q_"

keyJoin: {x lj y}

N:5
trade:([]sym:N#`BARC`MSFT`PSN;price:.5+til N;size:100*1+til N)
ind:([sym:`BARC`PSN]ind:`Banking`Construction)
keyJoin[trade;ind]    //test output before submitting

keyFilterJoin: {x ij y}

keyFilterJoin[trade;ind]     //test output before submitting

getPrevailingQuote: {aj[`sym`time;trade;quote]}

show trade:([]sym:`BP`IBM`IBM`JPM;time:"u"$4.5 6.2 9.8 12;px:5 11 8 4f)                                         
show quote:([]sym:`IBM`IBM`JPM`JPM;time:"u"$4 6 6.5 10;bid:.5+1 2 3 4;ask:.5+1 2 3 4) 

getPrevailingQuote[]      //test output before submitting

getPrevailingLocalQuote: {(aj[`ex`sym`time;trade;quote])}

show trade:([]sym:`BP`IBM`IBM`JPM;time:"u"$4.5 6.2 9.8 10;px:5 11 8 4f;ex:`A`A`A`B)                                         
show quote:([]sym:`IBM`IBM`JPM`JPM;time:"u"$4 6 6.5 10;bid:.5+1 2 3 4;ask:.5+1 2 3 4;ex:`A`A`A`A) 
    
getPrevailingLocalQuote[]  //test output before submitting

.trn.checkAnswers[]

results

.trn.submitAnswers[]
