
system"l init.q_"

isFile2:{0>type key hsym x}
isFile:{not () ~ key hsym x}

//code golf challenge 20 characters

isFile[`:init.q_]   //test your code before submitting

isFile[`.ipynb_checkpoints] //test your code before submitting
isFile[`:.allMadeUP]
isFile[`:quote.csv]

loadCSV1:{[f;t] (t;enlist csv) 0: hsym f}                 / write your code here 
                                                   //code golf challenge 24 

//setting up our table for testing
quote:([]sym:`JPM`GE`BP;ask:23.5 33.2 45.9;bid:12 41 46)
save`quote.csv

loadCSV1[`:quote.csv;"SFJ"]   //test your code before submitting

quote~loadCSV1[`:quote.csv;"SFJ"] 

loadCSV1[`quote.csv;"SFJ"]    //should work with non-hsyms also!

string[loadCSV1] like "*0:*"  

loadCSV2:{[f;t] 
        fp: hsym f;
        head: `$"," vs first read0 fp;
        data: flip vs[",";] each 1_read0 fp;
        flip head!(t$data)
    }

//setting up our table for testing
quote:([]sym:`JPM`GE`BP;ask:23.5 33.2 45.9;bid:12 41 46)
save`quote.csv

loadCSV2[`:quote.csv;"SFJ"]   //test your code before submitting

quote~loadCSV2[`:quote.csv;"SFJ"] 

loadCSV2[`quote.csv;"SFJ"]    //should work with non-hsyms also!

not string[loadCSV2] like "*0:*"  

changeDelimiter: {x 0:ssr'[read0 x;y;z]} / write your code here
                                             //code golf challenge 28

quote:([]sym:`JPM`GE`BP;ask:23.5 33.2 45.9;bid:12 41 46)
save`quote.csv
read0 `:quote.csv

changeDelimiter[`:quote.csv;",";"*"]   

read0`:quote.csv

("sym*ask*bid";
    "JPM*23.5*12";
    "GE*33.2*41";
    "BP*45.9*46") ~read0`:quote.csv

.trn.checkAnswers[]

results 

.trn.submitAnswers[]
