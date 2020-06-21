
system "l init.q_"

myMax: |/

myMax 3 6 2 9       / test output before submitting

myMin: &/

myMin 3 6 2 9       / test output before submitting

myCount: {-1 + (+/) @[x,0N; ::; :;1]}

t:{-1 + (+/) @[x,0N; ::; :; 1]}
t 1 2 3 4 5
t "hello"

myCount "hi there"              / test output before submitting

myDistinct2: {
    sort: desc -1_ `int$x,0N;
    sortSum: (-) ': [sort];
    els: where sortSum <> 0;
    :els: "c"$sort[els]
    }

isIn:{y in x}

myDistinct: {
    (isIn/) x
    }

show myDistinct "helllo"

myDistinct "ctcttft"                / test output before submitting

.trn.checkAnswers[]

results

.trn.submitAnswers[]
