# -*- coding: utf-8 -*-
"""
Created on Sat Aug 24 16:06:55 2019

@author: Dan-L
"""

import pandas as pd
from pandas import ExcelWriter
from pandas import ExcelFile

#execl file must have numbers in top row, not sure why
#first 2 columns must be parents. First will be A, second is B
# SNPs changed to H (hetero), A, B, or U (if N)
#format:
#1   2   3   4   5
#T   C   T   TC  C
#G   N   C   C   G  

df = pd.read_excel(r'C:\Users\Dan-L\Documents\Summer_2019\QSNP_Calling_num_mod.xlsx')
#df = pd.read_excel(r'C:\Users\Dan-L\Documents\Summer_2019\jmTest.xlsx')

#cut out columns don't need
df.drop(df.columns[[0,1,2]], axis=1, inplace = True)
print(df)
print("\n")
writeDf=df

def findUnknownValue(row, knownValue):
    counter = 0;
    for items in row.iteritems():
        if counter>1:
            currentValue = items[1]
            if len(currentValue) == 1 and currentValue != knownValue and currentValue != "N":
                return currentValue
        counter=counter+1


i = 0
for index, row in df.iterrows():
    v = 0
    p1 = ""
    p2 = ""
    print("progress: " + str((i/df.shape[0])*100) + "%")
    for items in row.iteritems():
        currentValue = items[1]
        if v == 0:
            p1 = currentValue
        elif v == 1:
            p2 = currentValue
        
            if p1 == "N":
                p1 = findUnknownValue(row, p2)
            if p2 == "N":
                p2 = findUnknownValue(row, p1)
        else:
            if  len(currentValue) == 2:
                writeDf.set_value(i,v+1, "H")
            elif currentValue == p1:
                writeDf.set_value(i,v+1, "A")
            elif currentValue == p2:
                writeDf.set_value(i,v+1, "B")
            elif currentValue == "N":
                writeDf.set_value(i,v+1, "U")
            else:
                writeDf.set_value(i,v+1, "ERROR")
        v=v+1
    i=i+1   


writer = ExcelWriter(r"C:\Users\Dan-L\Documents\Summer_2019\jmResult.xlsx")
df.to_excel(writer,'Sheet1',index=False)
writer.save()
print(writeDf)
#writeDf.to_excel(r'C:\Users\Dan-L\Documents\Summer_2019\QSNP_Calling_m6_f35.snp.filtered_for_JoinMapResult.xlsx')
#writeDf.to_excel(r"C:\Users\Dan-L\Documents\Summer_2019\jmResult.xlsx")


    
    