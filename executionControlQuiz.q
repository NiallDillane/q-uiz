
\l init.q_

ensureStr: {$[0 < type x; x;string x]}
type "abc"

ensureStr"a"
ensureStr"abc"
ensureStr`abc
ensureStr 2
ensureStr 10     / test your ouput before submitting

// CHALLENGE: minimal char count: 11 (all including function brackets) 
isAllCaps: {not 0b in not x in .Q.a}

isAllCaps"a"
isAllCaps"A"
isAllCaps"aaB"
isAllCaps"BBB"
isAllCaps"ABC_123"
isAllCaps "ABC|~"     / test your ouput before submitting

// CHALLENGE: minimal char count: 14 (all including function brackets)

startsWith:

startsWith["abcdef";"abc"]
startsWith["abcdef";"bc"]   / test your ouput before submitting

.trn.checkAnswers[]

results

.trn.submitAnswers[]
