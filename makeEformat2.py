import pandas as pd
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("SsrFile", help = "The .ssr file")

args = parser.parse_args()

SsrFile = args.SsrFile

outputDf = pd.read_csv(SsrFile,sep = '\t', header=[0])


def isNotMono(row):
    row = row[3:]
    known = []
    for i in row:
        if i.startswith('0') == False:
            known.append(i)
    if len(set(known)) == 1:
        return False        
    return True

def removeMonomorph(df):
    return df[df.apply(isNotMono,1)]

outputDf = removeMonomorph(outputDf)

linkMap = []
listTable = []
for index, row in outputDf.iterrows():
    newRow = [row[0]]
    for element in row[3:]:
        newRow.append(element.split(','))
    listTable.append(newRow)
    
    #
for r in listTable:
    linkMapRow = [r[0]]
    for e in r[1:]:
        if e[0] == '0':
            linkMapRow.append('?/?')
        else:
            linkMapRow.append(e[0] + '/' + e[1])
    linkMap.append(linkMapRow)

newDf = pd.DataFrame(linkMap)
headers = outputDf.columns.values.tolist()
del headers[1:3]
newDf.columns = headers
newDfTrans = newDf.transpose() 
newDfTrans.to_csv(SsrFile + ".Eformat", sep= "\t")

