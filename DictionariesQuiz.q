
system"l init.q_"

createDict: {x!y}

createDict["kdb";1 2 3]  //test output before submitting

dictToTable: {@[flip;x;flip (key x)!enlist each x[key x]]}
//a: `k`d`b!0.1 0.2 0.3
//flip (key a)!(enlist each a[key a])

dictToTable `k`d`b!0.1 0.2 0.3
dictToTable `k`d`b!(0.1 1; 0.2 2; 0.3 3)
dictToTable `k`d`b!("ab";`this`is;1 2 )

countHandles: {count each x}

countHandles`k`d`b!("HELLO_WORLD";`k`d`b;enlist 7)

removeHandles: {x except\: y}

removeHandles["tqb"!(110 112i;enlist 110i;110 101i);110]

removeHandles["tqb"!(110 112i;enlist 110i;110 101i);110 112i]  //test output before submitting

.trn.checkAnswers[]

results

.trn.submitAnswers[]
