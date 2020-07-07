
system"l init.q_"

// let's start our job IDS at 1000 (completely arbitrary)
show .timer.ID:1000;
// alternative way of defining a table
show .timer.jobs:1!flip`jobId`func`args`typ`interval`start`end!"j**sjpp"$\:();
// insert a dummy record in the first row that will enforce the args column to remain generic
`.timer.jobs upsert (0N;`;enlist(::);`;0N;0Wp;-0Wp);
//table with null row
.timer.jobs

.timer.add:{[func; args; typ; interval; start; end]
    .timer.ID+:1;
    `.timer.jobs upsert (.timer.ID;func;args;typ;interval;start;end);
    }

// test output before submitting
dummyPrint:{0N!"The current time is ",string .z.P;}
.timer.add[`dummyPrint;enlist(::);`R;"j"$10*10 xexp 9;.z.P;.z.P+00:01]

.timer.jobs

.timer.run:{[id]
    if[0 < type id; id:id 0];
    r: .timer.jobs[id;`func] . .timer.jobs[id;`args];
    $[.timer.jobs[id;`typ]=`O;
        .timer.delete[id]; [
        .timer.jobs[id;`start]+:2* .timer.jobs[id;`interval];
        ]
    ];
    r
    }

.timer.run 1001    /test output before submitting

.timer.run

.timer.delete:{[id]
    delete from `.timer.jobs where jobId = id;
    }

.timer.add[`dummyPrint;enlist(::);`R;"j"$10*10 xexp 9;.z.P;.z.P+00:01]

.timer.jobs

.timer.delete[1008]   / test output before submitting

.timer.jobs

.z.ts: {
    toEx: value each select jobId from `.timer.jobs where start <= .z.P; //& end > .z.P;
    .timer.run each toEx;
    }

.z.ts[]

.timer.enable:{[x]
    system"t ",string x;
    }

.timer.disable:{
     system"t 0"
    }

.timer.enable 500  /test output before submitting

.timer.jobs

.z.ts[]   /test output before submitting

.timer.disable[]   /test output before submitting

.z.ts[]   /test output before submitting

func:{setTime::.z.P};
.timer.add[`func;enlist`otherVar;`R;"j"$1*10 xexp 9;.z.P-0D00:00:01.000;.z.d+(init+04:00)];
show jobID: first last key .timer.jobs;
show .timer.jobs;
.z.ts[]
show .timer.jobs;
show (`second$.timer.jobs[jobID;`start])
show `second$setTime + .timer.jobs[jobID;`interval]

.trn.checkAnswers[]

results

// Once you have checked all your answers are correct restart the kernel before submitting your answers
.trn.submitAnswers[]

\cat compareQ_timer.q
