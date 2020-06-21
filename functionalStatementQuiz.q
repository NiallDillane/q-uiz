
system "l init.q_"

trade

getColsForSyms:{[t;c;s] ?[t;enlist(=;`sym;enlist s);0b;c!c]}

getColsForSyms[`trade;`time`exchange;`GE]   /test output before submitting

dynamicBy: {[t;c] ?[t;();enlist [c]!enlist c;()]}

dynamicBy[`trade;`time]   /test output before submitting

dynamicBy[`trade;`sym]    /test output before submitting

.trn.checkAnswers[]

.trn.submitAnswers[]
