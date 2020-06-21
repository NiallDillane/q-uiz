
/system"l init.q_"

getPartitionPath: {[d;p;t]
    $[`par.txt in key d; [
        r: read0 ` sv d,`par.txt;
        fp: r p mod count r;
        ` sv (hsym `$fp),(`$string p),t
        ];[
        ` sv d,(`$string p),t
        ]
    ]
    }

getPartitionPath[`:partDB;2020.01.01;`quote]
getPartitionPath[`:partDB;2020.01.02;`quote]
getPartitionPath[`:partDB;2020.01.03;`quote]
getPartitionPath[`:partDB;2020.01.04;`quote]
getPartitionPath[`:partDB;2020.01.05;`quote]

2020.01.01 2020.01.02 2020.01.03 2020.01.04 2020.01.05 mod\: 4
getPartitionPath[`:segmentedDBRoot;2020.01.01;`quote]
getPartitionPath[`:segmentedDBRoot;2020.01.02;`quote]
getPartitionPath[`:segmentedDBRoot;2020.01.03;`quote]
getPartitionPath[`:segmentedDBRoot;2020.01.04;`quote]
getPartitionPath[`:segmentedDBRoot;2020.01.05;`quote]


writePartition: {[dir;p;t] 
    enumT: .Q.en[dir;value t];
    path: ` sv dir,(`$string p),t,`$"/";
    path set select from enumT
    }


writePartitionSeg:{[d;p;t]
    $[`par.txt in key d; [
        .Q.par[d;p;t] set select from .Q.en[.Q.par[d;p;t];value t]
        ];
        writePartition[d;p;t]
    ]
    }

show 5 sublist quote:get `:partDB/2020.01.02/quote
show p:writePartitionSeg[`:partDB;2020.01.07;`quote]
show s:writePartitionSeg[`:segmentedDBRoot;2020.01.08;`quote] / test output before submitting

5 sublist get p 
5 sublist get s 

allPaths:{
    dts: key[x] where key[x] like "[0-9]*";
    paths:` sv' (x,/:dts)
    }

allPathsSeg:{
    $[`par.txt in key x; [
        r: read0 ` sv x,`par.txt;
        raze allPaths each hsym `$r
        ];[
        allPaths x
        ]
    ]
    }

allPathsSegMM:{$[like [string x; "*Root"];[
        l: hsym each `$ read0 ` sv x,`par.txt; 
        raze allPaths'[l]];
        allPaths x
        ]
    }

//show string key each paths;
//raze/[paths(,)'' (`$1_string key each paths)]

allPathsSeg `:partDB
(allPathsSeg `:segmentedDBRoot)  / test output before submitting

softDelete1Col:{[t;c] 
    fp: (hsym `$"" sv(string t,"/.d"));
    fp set get[fp] except c
    }

softDeleteCol:{[p;t;c] 
    paths: ` sv' allPaths[p],\:t;
    softDelete1Col[;c] each paths;
    paths
    }

softDeleteColSeg:{[d;t;c]
    $[`par.txt in key d;[
        r: read0 ` sv d,`par.txt;
        paths: raze allPaths each hsym `$r;
        fullPaths: ` sv' paths,\:t;
        softDelete1Col[;c] each fullPaths
        ];[
        softDeleteCol[d;t;c]
        ]
    ]
    }

show p:softDeleteColSeg[`:partDB;`quote;`bid]      / test output before submitting
show s:softDeleteColSeg[`:segmentedDBRoot;`quote;`bid]

5 sublist get ` sv -1_ ` vs first p   //bid should be gone
5 sublist get ` sv -1_ ` vs first s

order1Cols:{[t;c] 
    fp: (hsym `$"" sv(string t,"/.d"));
    fp set c
    }

orderCols: {[p;t;cs]
    paths: ` sv' allPaths[p],\:t;
    order1Cols[;cs] each paths;
    paths
    }

orderColsSeg:{[d;t;cs]
    $[`par.txt in key d; [
        r: read0 ` sv d,`par.txt;
        paths: raze allPaths each hsym `$r;
        fullPaths: ` sv' paths,\:t;
        order1Cols[;cs] each fullPaths
        ];
        orderCols[d;t;cs]
    ]
    }

show p:orderColsSeg[`:partDB;`trade;`time`price`size`stop`cond`ex`sym]   / test output before submitting
show s:orderColsSeg[`:segmentedDBRoot;`trade;`time`price`size`stop`cond`ex`sym]

get first p
5 sublist get ` sv -1_ ` vs first p   
get first s
5 sublist get ` sv -1_ ` vs first s

delete1Col: {[t;c] 
    fp: (hsym `$"" sv(string t,"/.d"));
    cmd: "rm ", 1_string (hsym `$"" sv(string t,"/",c));
    @[system;cmd;"r"];
    fp set get[fp] except c
    }

deleteCol:{[p;t;c] 
    paths: ` sv' allPaths[p],\:t;
    delete1Col[;c] each paths;
    paths
    }

deleteColSeg:{[d;t;c]
    $[`par.txt in key d;[
        show r: read0 ` sv d,`par.txt;
        paths: raze allPaths each hsym `$r;
        show fullPaths: ` sv' paths,\:t;
        delete1Col[;c] each fullPaths
        ];[
        deleteCol[d;t;c]
        ]
    ]
    }

/show p: deleteColSeg[`:partDB;`quote;`ask]     / test output before submitting
show s: deleteColSeg[`:segmentedDBRoot;`quote;`ask] 

get first p
`ask in key  ` sv -1_ ` vs first p   
get first s
`ask in key  ` sv -1_ ` vs first s

add1Col:{[t;c;def]
    fp: hsym `$"" sv(string t,"/.d");
    colFile: hsym `$"" sv(string t,"/",c);
    $[c in cols hsym (`$ -3_string fp); ['`exists]; [
        n:count get (`$ -3_string fp);
        colFile set n?enlist def;
        fp set get[fp],c;
        colFile
        ]
    ]
    }

addCol:{[p;t;c;v]
    paths: ` sv' allPaths[p],\:t;
    add1Col[;c;v] each paths;
    paths
    }


addColSeg:{[d;t;c;v]
    $[`par.txt in key d;[
        r: read0 ` sv d,`par.txt;
        paths: raze allPaths each hsym `$r;
        fullPaths: ` sv' paths,\:t;
        add1Col[;c;v] each fullPaths
        ];[
        addCol[d;t;c;v]
        ]
    ]
    }

\c 100 100
/show p:addColSeg[`:partDB;`quote;`new;22]   / test output before submitting
show s:addColSeg[`:segmentedDBRoot;`quote;`new;22]

/5 sublist get first p
5 sublist get first s

.trn.checkAnswers[]

\c 100 100
results

//Once you know your answers are correct delete the db and segments again then run the following
.trn.submitAnswers[]
