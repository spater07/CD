# -*- coding: utf-8 -*-
"""
Created on Mon Feb 28 13:00:28 2022

@author: tanis
"""

import sys
from sys import stdin
import math


def FIRSTALL(listnt):
    set1=set()
    for j in listnt:
        set1=set1.union(FIRST(j))
    return set1


def FIRST(nt):
    x=set()
    if nt==" ":
        return {' '}
    
    for j in nt:
        if(j.islower()):
            x.add(j)
            if(" " in x):
                x.remove(" ")
            return x
        else:
            x=x.union(FIRSTALL(inputGrammar[j]))
            if(" " not in x):
                return x
    return x



def FOLLOW(inputGrammar):

    for i in inputGrammar:
        for k in (inputGrammar[i]):
            for j in range(len(k)):
                
                if(k[j].isupper()):
                    x=k[j+1:]
                    if(x!=""):
                        f=FIRST(x)
                        if " " not in f:
                            follow[k[j]]=follow[k[j]].union(f)
                        else:
                            f.remove(" ")
                            follow[k[j]]=follow[k[j]].union(f)
                            follow[k[j]]=follow[k[j]].union(follow[i])
                    else:
                        follow[k[j]]=follow[k[j]].union(follow[i])
                

inputGrammar={'S': ['ABC', 'C'], 'A': ['a', 'bB',' '], 'B': ['p', ' '], 'C': ['c']}
startsymbol="S"

first={}

for i in inputGrammar:
    set1=FIRSTALL(inputGrammar[i])
    first[i]=set1

for i in first:
    print("FIRST["+str(i)+"] = ",first[i])
    

follow={}
for i in inputGrammar:
    follow[i]=set()

follow[startsymbol]={'$'}

FOLLOW(inputGrammar)
print()

for i in first:
    print("FOLLOW["+str(i)+"] = ",follow[i])
    
    
parssingTable=[]

for i in inputGrammar:
    x=inputGrammar[i]
    for j in x:
        if(j!=" "):
            rule=FIRST(j)
            for k in rule:
                parssingTable.append([(i,k),i+"->"+j])
        else:
            for k in follow[i]:
                parssingTable.append([(i,k),i+"->"+j])
                
                
print("\nThe Parsing Table is : ")     
for i in range(len(parssingTable)):
    print(parssingTable[i][0],"=",parssingTable[i][1])
