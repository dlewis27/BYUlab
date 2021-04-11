library(readxl)
library(ggplot2)
library(plyr)
V1_4LG <- read_excel("Summer_2019/V2/V1.4LG.xlsx", 
                     sheet = "40_comparison to V2 assemblies")
scaffoldsToMap=read_excel("Summer_2019/18_scaffolds.xlsx")

assembleData=V1_4LG
assembleData=assembleData[-c(1:3,6,7,10,11,13,15,16,18,20,21,23)]

orderedChromeName <- scaffoldsToMap$...5

#-----PB.Chi.PBJP asssembly-------

#subset for PB.Chi.PBJP
PCPScaffoldstoMap=scaffoldsToMap$PB_Chi_PBJP
PCPfiltered=assembleData[assembleData$PB.Chi.PBJP_Scaffold %in% PCPScaffoldstoMap, ]
PCPtableCheck=table(PCPfiltered$PB.Chi.PBJP_Scaffold)
#View(PCPtableCheck)

#rename
PCPfiltered$PB.Chi.PBJP_Scaffold <- mapvalues(PCPfiltered$PB.Chi.PBJP_Scaffold, 
                                              from=PCPScaffoldstoMap, to=orderedChromeName)
#manual sorting
PCPfiltered$Group = factor(PCPfiltered$Group, levels = c(2, 13, 5, 12, 18, 25, 4, 14, 1, 3, 16, 8, 21,
                                                         15, 26, 9, 19, 22, 24, 11, 10, 20, 17, 7, 23,
                                                         6))

#plotting
ggplot(data = PCPfiltered) + 
  geom_point(mapping = aes(y = Position, x = PB.Chi.PBJP_Position)) + 
  facet_grid(Group ~ PB.Chi.PBJP_Scaffold, as.table=TRUE) + 
  theme(axis.text.x = element_blank(), axis.text.y = element_blank(),
        plot.title=element_text(size=18, face="bold", hjust=.5),
        axis.title=element_text( size=12, face="italic"),
        axis.ticks = element_blank()) + 
  ggtitle("PB+Chi+PBJP Assembly") + ylab("Genetic Position (cM)") + xlab("Physical Position (bp)") +
  scale_y_continuous(sec.axis = sec_axis(~.*0, name = "Linkage Group"))+
  scale_x_continuous(sec.axis = sec_axis(~.*0, name = "Scaffold"))

#------PB assembly-----

#subset for PB
PBScaffoldstoMap=scaffoldsToMap$PB
PBfiltered=assembleData[assembleData$PB_Scaffold %in% PBScaffoldstoMap, ]
PBtableCheck=table(PBfiltered$PB_Scaffold)
#View(PBtableCheck)

#rename
PBfiltered$PB_Scaffold <- mapvalues(PBfiltered$PB_Scaffold, 
                                              from=PBScaffoldstoMap, to=orderedChromeName)

#manual sorting
PBfiltered$Group = factor(PBfiltered$Group, levels = c(2, 13, 5, 12, 18, 25, 4, 14, 1, 3, 16, 8, 21,
                                                           15, 26, 9, 19, 22, 24, 11, 10, 20, 17, 7, 23,
                                                           6))
  
#plotting
ggplot(data = PBfiltered) + 
  geom_point(mapping = aes(y = Position, x = PB_Position)) + 
  facet_grid(Group ~ PB_Scaffold, as.table=TRUE) + 
  theme(axis.text.x = element_blank(), axis.text.y = element_blank(),
        plot.title=element_text(size=18, face="bold", hjust=.5),
        axis.title=element_text( size=12, face="italic"),
        axis.ticks = element_blank()) +
  ggtitle("PB Assembly") + ylab("Genetic Position (cM)") + xlab("Physical Position (bp)") +
  scale_y_continuous(sec.axis = sec_axis(~.*0, name = "Linkage Group"))+
  scale_x_continuous(sec.axis = sec_axis(~.*0, name = "Scaffold"))

#------PB-BN---------

#subset for BP-BN
PB_BNScaffoldstoMap=scaffoldsToMap$PB_BN
PB_BNfiltered=assembleData[assembleData$PB_BN_Scaffold %in% PB_BNScaffoldstoMap, ]
PB_BNtableCheck=table(PB_BNfiltered$PB_BN_Scaffold)
#View(PB_BNtableCheck)

#rename
PB_BNfiltered$PB_BN_Scaffold <- mapvalues(PB_BNfiltered$PB_BN_Scaffold, 
                                              from=PB_BNScaffoldstoMap, to=orderedChromeName)

#manual sorting
PB_BNfiltered$Group = factor(PB_BNfiltered$Group, levels = c(2, 13, 5, 12, 18, 25, 4, 14, 1, 3, 16, 8, 21,
                                                           15, 26, 9, 24, 19, 22, 11, 10, 20, 17, 7, 23,
                                                           6))
  
#plotting
ggplot(data = PB_BNfiltered) + 
  geom_point(mapping = aes(y = Position, x = PB_BN_Position)) + 
  facet_grid(Group ~ PB_BN_Scaffold, as.table=TRUE) + 
  theme(axis.text.x = element_blank(), axis.text.y = element_blank(),
        plot.title=element_text(size=18, face="bold", hjust=.5),
        axis.title=element_text( size=12, face="italic"),
        axis.ticks = element_blank()) +
  ggtitle("PB+BN Assembly") + ylab("Genetic Position (cM)") + xlab("Physical Position (bp)") +
  scale_y_continuous(sec.axis = sec_axis(~.*0, name = "Linkage Group"))+
  scale_x_continuous(sec.axis = sec_axis(~.*0, name = "Scaffold"))

#--------PB_Chi------

#subset for PB_Chi
PB_ChiScaffoldstoMap=scaffoldsToMap$PB_Chi
PB_Chifiltered=assembleData[assembleData$PB_Chi_Scaffold %in% PB_ChiScaffoldstoMap, ]
PB_ChiTableCheck=table(PB_Chifiltered$PB_Chi_Scaffold)
#View(PB_ChiTableCheck)

#rename
PB_Chifiltered$PB_Chi_Scaffold <- mapvalues(PB_Chifiltered$PB_Chi_Scaffold, 
                                              from=PB_ChiScaffoldstoMap, to=orderedChromeName)
#manual sorting
PB_Chifiltered$Group = factor(PB_Chifiltered$Group, levels = c(2, 13, 5, 12, 18, 25, 4, 14, 1, 3, 16, 8, 21,
                                                           15, 26, 9, 19, 22, 24, 11, 10, 20, 17, 7, 23,
                                                           6))
  
#plotting
ggplot(data = PB_Chifiltered) + 
  geom_point(mapping = aes(y = Position, x = PB_Chi_Position)) + 
  facet_grid(Group ~ PB_Chi_Scaffold, as.table=TRUE) + 
  theme(axis.text.x = element_blank(), axis.text.y = element_blank(),
        plot.title=element_text(size=18, face="bold", hjust=.5),
        axis.title=element_text( size=12, face="italic"),
        axis.ticks = element_blank()) + 
  ggtitle("PB+Chi Assembly") + ylab("Genetic Position (cM)") + xlab("Physical Position (bp)") +
  scale_y_continuous(sec.axis = sec_axis(~.*0, name = "Linkage Group"))+
  scale_x_continuous(sec.axis = sec_axis(~.*0, name = "Scaffold"))


