
//.trn.nbName:"PartitionedQuiz"
//system"l init.q_"

\ls

writePartition: {[dir;p;t] 
    enumT: .Q.en[dir;value t];
    path: ` sv dir,(`$string p),t,`$"/";
    path set select from enumT //where time = p
    }

trade:([]time:3#.z.P;sym:`JPM`GE`GE;size:100 200 300;price:375 412 231;exchange:`N`N`T)

writePartition[`:hdb1;2016.03.20;`trade]

writePartition[`:hdb1;2016.03.21;`trade]  / test output before submitting

\l hdb1  //load the newly created hdb or open in a new notebook.
select from trade   //should match the above
\cd ../
\pwd

allPaths:{
    dts: key[x] where key[x] like "[0-9]*";
    paths:` sv' (x,/:dts)
    }

allPaths `:.     / test output before submitting
/allPaths `:hdb1

appendToTable:{[d;p;t;x]
    path: ` sv d,(`$string p),t,`$"/";
    path upsert .Q.en[d]x;
    }

/ test output before submitting
appendToTable[`:hdb2;2016.01.01;`trade;([]sym:`JPM`GE`GE;size:100 200 300;exchange:`N)]    

appendToTable[`:hdb2;2016.01.01;`trade;([]sym:`JPM`BP;size:700;exchange:`T)]  / test output before submitting

\l hdb2
select from trade
\cd ..
\pwd 

modifyCells:{[d;p;t;c;r;v] 
    show colPath: ` sv d,(`$string p),t,c;
    colPath set @[get colPath; r; :; v]
    }

//.[get colPath; where (colPath[i]) in r; :;v]

modifyCells[`:hdb2;2016.01.01;`trade;`size;1 2;5000]                   / test output before submitting

\l hdb2
select from trade 
\cd ../
\pwd

add1Col:{[t;c;def]
    fp: hsym `$"" sv(string t,"/.d");
    colFile: hsym `$"" sv(string t,"/",c);
    $[c in cols hsym `$-3_string fp; ['`exists]; [
        n:count get `$-3_string fp;
        colFile set n?enlist def;
        fp set get[fp],c;
        colFile
        ]
    ]
    }

delete1Col: {[t;c] 
    fp: (hsym `$"" sv(string t,"/.d"));
    cmd: "rm ", 1_string (hsym `$"" sv(string t,"/",c));
    @[system;cmd;"r"];
    fp set get[fp] except c
    }

order1Cols:{[t;c] 
    fp: (hsym `$"" sv(string t,"/.d"));
    fp set c
    }

orderCols: {[p;t;cs]
    paths: ` sv' allPaths[p],\:t;
    order1Cols[;cs] each paths;
    paths
    }

orderCols[`:hdb1;`trade;`time`sym`price`size`exchange]   /test output before submitting

\l hdb1 
select from trade
\cd ../
\pwd

deleteCol:{[p;t;c] 
    paths: ` sv' allPaths[p],\:t;
    delete1Col[;c] each paths;
    paths
    }

deleteCol[`:hdb1;`trade;`size]     / test output before submitting

\l hdb1
select from trade
\cd ../
\pwd 

`size in key `:hdb1/2016.03.20/trade

addCol:{[p;t;c;v]
    paths: ` sv' allPaths[p],\:t;
    add1Col[;c;v] each paths;
    paths
    }

addCol[`:hdb1;`trade;`size;700]     / test output before submitting

\l hdb1
select from trade
\cd ../
\pwd

.trn.checkAnswers[]

results

.trn.submitAnswers[]
