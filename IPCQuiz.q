
/.trn.nbName:"IPCQuiz"
/system"l init.q_"

\p 4001
show .ipc.handles:()      / an empty list

.z.po:{.ipc.handles,:x}


//code golf challenge 17 chars

.ipc.handles

invokeConnection[h]  

.ipc.handles

invokeConnection[4]  

.ipc.handles

.z.pc:{.ipc.handles: .ipc.handles except x}
                                   //code golf challenge 28 chars

.ipc.handles          

invokeClose[h]  

.ipc.handles           //should see the handles being removed 

invokeClose[h]  

.ipc.handles          

//Remember to open at least one handle to this process before checking your answers
.trn.checkAnswers[]

results

.trn.submitAnswers[]
