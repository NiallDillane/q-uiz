
/.trn.nbName:"BinaryLoggingQuiz"
/system"l init.q_"

getLogLength: {(-11!(-2;x)) 0}

n: getLogLength[`:../TPlogs/blQuizLog]

sensor:([]time:();sensor:();temp:())
show lastSensorValue:([sensor:()]time:();temp:())

upd: {[t;v] $[t~`sensor; [insert[t;v]; [`lastSensorValue upsert flip `sensor`time`temp!(v 1 0 2)]]; 'notsensor]}


-11! (getLogLength[`:../TPlogs/blQuizLog];`:../TPlogs/blQuizLog)

/lastSensorValue: select last(time), last(temp) by sensor from sensor 

//testing 
sensor 
lastSensorValue

.trn.checkAnswers[]

results 

.trn.submitAnswers[]

value flip 2#sensor

count lastSensorValue

\pwd
