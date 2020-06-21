
system"l init.q_"

/write your code here
BATCH:1b;
show trade:([]time:`timestamp$();sym:`$();size:`long$();price:`long$();side:`$();exchange:`$())
show quote:([]time:`timestamp$();sym:`$();bid:`long$();ask:`long$();bidSize:`long$();askSize:`long$();exchange:`$())


//check there are defined correctly before continuing
.trn.checkDefns[]

// write your code here
upd:{[t;d] tmp::get t; $[BATCH;t insert d; [`tmp insert d; tmp]]}

//test output before submitting using the above example
//Batch mode off
BATCH:0b
upd[`trade;(2#.z.P;`ASD`IBM;300 400;4000 6000;`O`P;`N`D)]  //test with two records
trade                                     // underlying table should be unchanged

BATCH:0b
upd[`quote;(.z.P;`MSFT;745;755;100;200;`T)]  // should work with a single row also
quote //again, table is unchanged

//Batch mode on
BATCH:1b
upd[`quote;(.z.P;`APPL;15;20;190;650;`T)] // indices returned
quote // underlying table has been modified

upd[`quote;(.z.P;`SHL;945;1055;200;250;`X)]
quote // table is growing

upd[`trade;(2#.z.P;`ASD`IBM;300 400;4000 6000;`O`P;`N`D)]
trade

returnKeyedTable: {[t;k] k xkey get t}

//test output before submitting
trade:flip`time`sym`size`prize`side`exchange!(2#2016.04.22D15:02:31.169380000;`GE`BP;150 210;1025 1050;`B`S;`N`L)
returnKeyedTable[`trade;`sym]      

trade //shouldn't change

applyKeyToTable: {y xkey x}

applyKeyToTable[`trade;`sym]    //test output before submitting

trade //this time, it should change

.trn.checkAnswers[]

results

.trn.submitAnswers[]
