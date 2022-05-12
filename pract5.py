grammar=[('E','.E+T'),('E','.T'),('T','.T*F'),('T','.F'),('F','.(E)'),('F','.i')]

def getAugmentedGrammar(grammar):
  return {("E'",'.E')}

def closure(state):
  b=len(state)
  newState=set()
  for i in state:
    newState.add(i)
    if(i[1][-1]=='.'):
      continue
    for j in range(len(i[1])):
      if(i[1][j]=='.' and i[1][j+1].isupper()):
        for k in grammar:
          if(k[0]==i[1][j+1]):
            newState.add(k)
  if b==len(newState):
    return newState
  return closure(newState)

def goto(state,a):
  newState=set()
  for i in state:
    ind=i[1].index('.')
    if(ind<len(i[1])-1 and i[1][ind+1]==a):
      s=i[1].replace('.',"")
      s1=""
      for c in s:
        s1+=c
        if(c==a):
          s1+='.'
      newState.add((i[0],s1))
  cl=closure(newState)
  return cl
queue=[closure(getAugmentedGrammar(grammar))]
allStates=[]
assoStates=[]
while(len(queue)>0):
  c=queue.pop(0)
  for i in c:
    if(i[1][-1]=='.'):
      continue
    p=i[1][i[1].index('.')+1]
    s1=goto(c,i[1][i[1].index('.')+1])
    if(s1 not in allStates):
      queue.append(s1)
      allStates.append(s1)
      assoStates.append([c,p,s1])
print("Printing all the states:")
for i in allStates:
  print(i)
print("Printing associates:")
for i in assoStates:
  a=i[0]
  b=i[1]
  c=i[2]
  print("State :\n"+str(a)+"\nOn Goto:"+str(b)+"\nGoes to state:\n"+str(c) )
  print("\n\n")
