
.trn.nbName:"splayedQuiz";
system"l init.q_"

writeSplay:{[d;t] (hsym `$"" sv(string d,"/",t,"/")) set .Q.en[`$(string d),"/";value t]}

trade:([]time:3#.z.P;sym:`JPM`GE`GE;size:100 200 300;price:375 412 231;exchange:`N`N`T);
trade 

writeSplay[`:db1;`trade]      // test output before submitting

get `:db1/trade/
key `:db1
key `:db1/trade/

softDelete1Col:{[d;t;c] 
    fp: (hsym `$"" sv(string d,"/",t,"/.d"));
    fp set get[fp] except c
    }

softDelete1Col[`:db1;`trade;`price]    // test output before submitting
get `:db1/trade

order1Cols:{[d;t;c] 
    fp: (hsym `$"" sv(string d,"/",t,"/.d"));
    fp set c
    }

order1Cols[`:db1;`trade;`time`sym`price`size`exchange]    // test output before submitting
get `:db1/trade

delete1Col: {[d;t;c] 
    fp: (hsym `$"" sv(string d,"/",t,"/.d"));
    cmd: "rm ", 1_string (hsym `$"" sv(string d,"/",t,"/",c));
    @[system;cmd;"r"];
    fp set get[fp] except c
    }

testRm:{[d;t;c]system"rm ", 1_string (hsym `$"" sv(string d,"/",t,"/",c))}
testRm[`:db1;`trade;`price]

delete1Col[`:db1;`trade;`price]    // test output before submitting
get `:db1/trade
key `:db1/trade

add1Col:{[dir;t;c;def]
    fp: hsym `$"" sv(string dir,"/",t,"/.d");
    colFile: hsym `$"" sv(string dir,"/",t,"/",c);
    $[c in cols hsym `$-3_string fp; ['`exists]; [
        n:count get `$-3_string fp;
        colFile set n?enlist def;
        fp set get[fp],c;
        colFile
        ]
    ]
    }

add1Col[`:db1;`trade;`price;500] // test output before submitting

add1Col[`:db1;`trade;`new;500]      // test output before submitting
get `:db1/trade

deleteRows:{[d;t;inds] 
    fp: (hsym `$"" sv(string d,"/",t));
    tmp: get fp;
    ok:(til count tmp) except inds;
    fp set tmp[ok]
    }

`:hdb2/trade/ set .Q.en[`:hdb2;([]date:6#2016.01.01;sym:`JPM`GE`GE`KX`FD`FD;size:100 50 50 50 50 30;exchange:6#`N)]
get `:hdb2/trade/

deleteRows[`:hdb2;`trade;3 4]                        /test output before submitting
get `:hdb2/trade

.trn.checkAnswers[]

results

.trn.submitAnswers[]
