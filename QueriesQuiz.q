
//system "l init.q_"

//.trn.nbName:"QueriesQuiz"

//schemas are loaded in
trade
meta quote 

randQuote: {`quote insert (.z.P; (1?`JPM`GE`BP`MSFT)[0]; (1?10000j)[0]; (1?10000j)[0]; (1?10000j)[0]; (1?10000j)[0]; (1?`N`L`T)[0])}


randQuote[]   // test output before submitting
quote 

randTrade: {`trade insert (.z.P; (1?`JPM`GE`BP`MSFT)[0]; (1?10000j)[0]; (1?10000j)[0]; (1?`B`S)[0]; (1?`N`L`T)[0])}


randTrade[]      // test output before submitting
trade

filterOnSym:{[t;s] $[-11h=type s;tmp:(enlist s);tmp:s]; select from t where sym in tmp}

// test output before submitting
filterOnSym[`trade;`GE]         

filterOnSym[`trade;`GE`BP`JPM] 

getVolumePerSym: {select sum size by sym from trade}

getVolumePerSym[]    // test output before submitting

getVWAPPerSym: {select vwap:sum(price) % sum(size) by sym from trade}

getVWAPPerSym[]      // test output before submitting

getLargerThanAvgTrades: {select from trade where size>(avg;size) fby sym}

getLargerThanAvgTrades[]      // test output before submitting

renameColumn: {[t;c;nc] col:cols t; (@[col;col?c;:;nc]) xcol t}

c:`sym
nc:`test
@[cols trade;(cols trade)?c;:;nc]

renameColumn[trade;`exchange;`ex]      // test output before submitting

renameColumn[quote;`bid;`buy]      // test output before submitting

.trn.checkAnswers[]

results

.trn.submitAnswers[]
