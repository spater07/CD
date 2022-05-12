def Propogation(grammar):
    for i in range(len(grammar)):
        c=getChars(grammar[i])
        if len(c)>3:
            continue
            for j in range(i+1,len(grammar)):
                if c[0] in grammar[j]:
                    grammar[j]=grammar[j].replace(c[0],c[2])
    print(grammar)

def constantFolding(grammar):
    for i in range(len(grammar)):
        c=getChars(grammar[i])
        try:
            b=int(c[2])
            d=int(c[4])
            grammar[i]=str(c[0])+' = '+ str(b+d)
        except:
            pass
print(grammar)

