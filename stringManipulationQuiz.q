
\l init.q_

//Tomorrow's date as a string e.g "2020.01.01"
tomorrow: {string x + 1}

//split "aa/bb/cc/dd"  
a: "aa/bb/cc/dd"
formatList: "/" vs a

capitalCity: {[x] upper ltrim rtrim x}
capitalCity "  newry  "

s:("Monday comes";"_after Sunday")
combine: {[x] " " sv x}
remove: {[x] ssr[x;"day";""]}

res: remove combine s
res

s:("wK<<<De<<< arB33e &:n";"Ia<<< quSe<<<sGREATt!")

remAmp: {[x] ssr[x;"[&]","o"]}
remChev: {[x] ssr[x;"<<<",""]}
remCaps: {[x] ssr[x;.Q.A;""]}
remNums: {[x] ssr[x;"[0-9]";""]}
combine: {[x] " " sv x}


replace: remAmp remNums combine s
replace

.trn.checkAnswers[]

results

.trn.submitAnswers[]
