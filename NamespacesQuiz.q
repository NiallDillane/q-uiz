
system "l init.q_"

createNamespace:{[ns;n;v] namespace:(`$(".",string ns));
    $[ns in key `;
        @[namespace;n;:;v];
        [namespace set enlist[`]!enlist(::);@[namespace;n;:;v]]
    ]
    }         / write your code here

//test output before submitting!
createNamespace[`animals;`dogs`cats;`Rover`Whiskers]        
.animals

//test output before submitting!
//adding to a new namespace - creating where its not there
createNamespace[`animals_again;`dogs`cats;`Rover`Whiskers]         
.animals_again
//adding more to the same namespace, we don't lose the first values
createNamespace[`animals_again;`fox`budgie;`MrFox`Tweety]
.animals_again

.trn.checkAnswers[]

results

.trn.submitAnswers[]
