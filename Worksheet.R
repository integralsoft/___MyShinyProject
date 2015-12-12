sData <- Salaries
head(sData)

colnames(sData) <- c("Rank", "Discipline", "YearsSincePhd", "YearsService", "Gender", "Salary")

plot(sData[1,], sData[6,])
plot(sData$Rank, sData$Salary)
plot(sData$YearsSincePhd, sData$Salary)

simpreg <- lm(sData$Salary ~ sData$YearsService, data=sData)
simpreg$coefficients
simpreg$terms

multreg <- lm(sData$Salary ~ sData$Gender * sData$YearsService + sData$Discipline * sData$Gender)
mysumm <- summary(multreg)
multreg$coefficients
print(mysumm)

simpreg <- lm(sData[,6] ~ sData[,5], data=sData)
summary(simpreg)

summary(lm(sData$Salary ~ sData$YearsService, data=sData))

plot(log(sData$YearsService), log(sData$Salary))
plot(sData$YearsService, log(sData$Salary))
plot(log(sData$YearsService), sData$Salary)
plot(sData$YearsService, sData$Salary)

head(sData)

summary(simpR_Rank <- lm(sData$Salary ~ sData$Rank))
summary(simpR_Discipline <- lm(sData$Salary ~ sData$Discipline))
summary(simpR_YearsPhd <- lm(sData$Salary ~ sData$YearsPhd))
summary(simpR_YearsService <- lm(sData$Salary ~ sData$YearsService))
summary(simpR_Gender <- lm(sData$Salary ~ sData$Gender))

multreg <- lm(sData$Salary ~ sData$Gender * sData$YearsService + sData$Discipline * sData$Gender)
multreg <- lm(sData$Salary ~ sData$Gender * sData$YearsService + sData$Discipline * sData$Gender)
multreg <- lm(sData$Salary ~ sData$Gender * sData$YearsService + sData$Discipline * sData$Gender)
multreg <- lm(sData$Salary ~ sData$Gender * sData$YearsService + sData$Discipline * sData$Gender)
multreg <- lm(sData$Salary ~ sData$Gender * sData$YearsService + sData$Discipline * sData$Gender)



