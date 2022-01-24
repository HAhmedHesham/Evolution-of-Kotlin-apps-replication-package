rm(list=ls())
library(ggplot2)
library(effsize)
library(gridExtra)

# loading data
data = read.table("final_data.txt", header = TRUE, sep = ",", dec = ".")

data$site = as.factor(data$site)
data$crit = as.factor(data$crit)
data$browser = as.factor(data$browser)

# Data exploration

# Descriptive statistics
by(data[data$browser=="chrome", ], data[data$browser=="chrome", ]$crit, summary)

by(data[data$browser=="firefox", ], data[data$browser=="firefox", ]$crit, summary)

get_std <- function(data, browser, crit) {
  print(sd(data[which(data$browser == browser & data$crit==crit), ]$lt))
  print(sd(data[which(data$browser == browser & data$crit==crit), ]$fp))
  print(sd(data[which(data$browser == browser & data$crit==crit), ]$fcp))
  print(sd(data[which(data$browser == browser & data$crit==crit), ]$e))
}

get_std(data, "chrome", 0)
get_std(data, "firefox", 0)
get_std(data, "chrome", 1)
get_std(data, "firefox", 1)

# Box plots
p <- ggplot(data, aes(x = crit, y=lt, group=crit)) + 
  geom_boxplot() + xlab("Critical CSS") + ylab("Laoding time (ms)")
p1 = p + stat_summary(fun=mean, geom="point", shape=23, size=4) + theme(text = element_text(size = 20)) + scale_x_discrete(labels=c("Not applied", "Applied"))

p <- ggplot(data, aes(x = crit, y=fp, group=crit)) + 
  geom_boxplot() + xlab("Critical CSS") + ylab("First paint (ms)")
p2 = p + stat_summary(fun=mean, geom="point", shape=23, size=4) + theme(text = element_text(size = 20)) + scale_x_discrete(labels=c("Not applied", "Applied"))

p <- ggplot(data, aes(x = crit, y=fcp, group=crit)) + 
  geom_boxplot() + xlab("Critical CSS") + ylab("First contentful paint (ms)")
p3 = p + stat_summary(fun=mean, geom="point", shape=23, size=4) + theme(text = element_text(size = 20)) + scale_x_discrete(labels=c("Not applied", "Applied"))

p <- ggplot(data, aes(x = crit, y=e, group=crit)) + 
  geom_boxplot() + xlab("Critical CSS") + ylab("Energy (J)")
p4 = p + stat_summary(fun=mean, geom="point", shape=23, size=4) + theme(text = element_text(size = 20)) + scale_x_discrete(labels=c("Not applied", "Applied"))

grid.arrange(p1, p2, p3, p4, ncol=2)

# Density plots
#Chrome
par(mfrow=c(4,2))
plot(density(data[which(data$browser == "chrome" & data$crit==0), ]$lt), 
     xlab="Load time (ms)", ylim=c(0,0.0006), col="blue", 
     main="Density plot for load time in Chrome",
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5)
lines(density(data[which(data$browser == "chrome" & data$crit==1), ]$lt), col="red")
legend("topright",
       c("Critical CSS applied", "Critical CSS not applied"),
       fill=c("red","blue"),
       cex=1.5
)

plot(density(data[which(data$browser == "chrome" & data$crit==0), ]$fp), 
     xlab="First paint (ms)", ylim=c(0,0.0012), col="blue", 
     main="Density plot for first paint in Chrome",
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5)
lines(density(data[which(data$browser == "chrome" & data$crit==1), ]$fp), col="red")
legend("topright",
       c("Critical CSS applied", "Critical CSS not applied"),
       fill=c("red","blue"),
       cex=1.5
)

plot(density(data[which(data$browser == "chrome" & data$crit==0), ]$fcp), 
     xlab="First contentful paint (ms)", ylim=c(0,0.0012), col="blue", 
     main="Density plot for first contentful paint in Chrome",
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5)
lines(density(data[which(data$browser == "chrome" & data$crit==1), ]$fcp), col="red")
legend("topright",
       c("Critical CSS applied", "Critical CSS not applied"),
       fill=c("red","blue"),
       cex=1.5
)

plot(density(data[which(data$browser == "chrome" & data$crit==0), ]$e), 
     xlab="Energy (J)", ylim=c(0,0.11), col="blue", 
     main="Density plot for energy in Chrome",
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5)
lines(density(data[which(data$browser == "chrome" & data$crit==1), ]$e), col="red")
legend("topright",
       c("Critical CSS applied", "Critical CSS not applied"),
       fill=c("red","blue"),
       cex=1.5
)

# Firefox
plot(density(data[which(data$browser == "firefox" & data$crit==0), ]$lt), 
     xlab="Load time (ms)", ylim=c(0,0.0005), col="blue", 
     main="Density plot for load time in Firefox",
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5)
lines(density(data[which(data$browser == "firefox" & data$crit==1), ]$lt), col="red")
legend("topright",
       c("Critical CSS applied", "Critical CSS not applied"),
       fill=c("red","blue"),
       cex=1.5
)

plot(density(data[which(data$browser == "firefox" & data$crit==0), ]$fp), 
     xlab="First paint (ms)", ylim=c(0,0.001), col="blue", 
     main="Density plot for first paint in Firefox",
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5)
lines(density(data[which(data$browser == "firefox" & data$crit==1), ]$fp), col="red")
legend("topright",
       c("Critical CSS applied", "Critical CSS not applied"),
       fill=c("red","blue"),
       cex=1.5
)

plot(density(data[which(data$browser == "firefox" & data$crit==0), ]$fcp), 
     xlab="First contentful paint (ms)", ylim=c(0,0.0010), col="blue", 
     main="Density plot for first contentful paint in Firefox",
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5)
lines(density(data[which(data$browser == "firefox" & data$crit==1), ]$fcp), col="red")
legend("topright",
       c("Critical CSS applied", "Critical CSS not applied"),
       fill=c("red","blue"),
       cex=1.5
)

plot(density(data[which(data$browser == "firefox" & data$crit==0), ]$e), 
     xlab="Energy (J)", ylim=c(0,0.08), col="blue", 
     main="Density plot for energy in Firefox",
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5)
lines(density(data[which(data$browser == "firefox" & data$crit==1), ]$e), col="red")
legend("topright",
       c("Critical CSS applied", "Critical CSS not applied"),
       fill=c("red","blue"),
       cex=1.5
)

# Check normality
check_normality <- function(dataset_to_eval, x, title) {
  #plot(density(dataset_to_eval), xlab=x, main=paste("Density plot for", title, sep=" "))
  qqnorm(dataset_to_eval, main=paste("Normal Q-Q Plot for", title, sep=" "), cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5)
  print(shapiro.test(dataset_to_eval))
}
par(mfrow=c(6,3))
# Chrome, critical = 0
check_normality(data[which(data$browser == "chrome" & data$crit==0), ]$lt, "Loading time (ms)", "chrome, crit = 0, lt")
check_normality(data[which(data$browser == "chrome" & data$crit==0), ]$fp, "First paint (ms)", "chrome, crit = 0, fp")
check_normality(data[which(data$browser == "chrome" & data$crit==0), ]$fcp, "First contentful paint (ms)", "chrome, crit = 0, fcp")
check_normality(data[which(data$browser == "chrome" & data$crit==0), ]$e, "Energy usage (J)", "chrome, crit = 0, e")

# Chrome, critical = 1
check_normality(data[which(data$browser == "chrome" & data$crit==1), ]$lt, "Loading time (ms)", "chrome, crit = 1, lt")
check_normality(data[which(data$browser == "chrome" & data$crit==1), ]$fp, "First paint (ms)", "chrome, crit = 1, fp")
check_normality(data[which(data$browser == "chrome" & data$crit==1), ]$fcp, "First contentful paint (ms)", "chrome, crit = 1, fcp")
check_normality(data[which(data$browser == "chrome" & data$crit==1), ]$e, "Energy usage (J)", "chrome, crit = 1, e")

# Firefox, critical = 0
check_normality(data[which(data$browser == "firefox" & data$crit==0), ]$lt, "Loading time (ms)", "firefox, crit = 0, lt")
check_normality(data[which(data$browser == "firefox" & data$crit==0), ]$fp, "First paint (ms)", "firefox, crit = 0, fp")
check_normality(data[which(data$browser == "firefox" & data$crit==0), ]$fcp, "First contentful paint (ms)", "firefox, crit = 0, fcp")
check_normality(data[which(data$browser == "firefox" & data$crit==0), ]$e, "Energy usage (J)", "firefox, crit = 0, e")

# Firefox, critical = 1
check_normality(data[which(data$browser == "firefox" & data$crit==1), ]$lt, "Loading time (ms)", "firefox, crit = 1, lt")
check_normality(data[which(data$browser == "firefox" & data$crit==1), ]$fp, "First paint (ms)", "firefox, crit = 1, fp")
check_normality(data[which(data$browser == "firefox" & data$crit==1), ]$fcp, "First contentful paint (ms)", "firefox, crit = 1, fcp")
check_normality(data[which(data$browser == "firefox" & data$crit==1), ]$e, "Energy usage (J)", "firefox, crit = 1, e")


# Wilcoxon signed rank tests
wilcox.test(data[which(data$browser == "chrome" & data$crit==0), ]$lt, data[which(data$browser == "chrome" & data$crit==1), ]$lt, paired=TRUE)
wilcox.test(data[which(data$browser == "chrome" & data$crit==0), ]$fp, data[which(data$browser == "chrome" & data$crit==1), ]$fp, paired=TRUE)
wilcox.test(data[which(data$browser == "chrome" & data$crit==0), ]$fcp, data[which(data$browser == "chrome" & data$crit==1), ]$fcp, paired=TRUE)
wilcox.test(data[which(data$browser == "chrome" & data$crit==0), ]$e, data[which(data$browser == "chrome" & data$crit==1), ]$e, paired=TRUE)

wilcox.test(data[which(data$browser == "firefox" & data$crit==0), ]$lt, data[which(data$browser == "firefox" & data$crit==1), ]$lt, paired=TRUE)
wilcox.test(data[which(data$browser == "firefox" & data$crit==0), ]$fp, data[which(data$browser == "firefox" & data$crit==1), ]$fp, paired=TRUE)
wilcox.test(data[which(data$browser == "firefox" & data$crit==0), ]$fcp, data[which(data$browser == "firefox" & data$crit==1), ]$fcp, paired=TRUE)
wilcox.test(data[which(data$browser == "firefox" & data$crit==0), ]$e, data[which(data$browser == "firefox" & data$crit==1), ]$e, paired=TRUE)

# Cliff delta
cliff.delta(data[which(data$browser == "chrome" & data$crit==1), ]$lt, data[which(data$browser == "chrome" & data$crit==0), ]$lt)
cliff.delta(data[which(data$browser == "chrome" & data$crit==1), ]$fp, data[which(data$browser == "chrome" & data$crit==0), ]$fp)
cliff.delta(data[which(data$browser == "chrome" & data$crit==1), ]$fcp, data[which(data$browser == "chrome" & data$crit==0), ]$fcp)
cliff.delta(data[which(data$browser == "chrome" & data$crit==1), ]$e, data[which(data$browser == "chrome" & data$crit==0), ]$e)

cliff.delta(data[which(data$browser == "firefox" & data$crit==1), ]$lt, data[which(data$browser == "firefox" & data$crit==0), ]$lt)
cliff.delta(data[which(data$browser == "firefox" & data$crit==1), ]$fp, data[which(data$browser == "firefox" & data$crit==0), ]$fp)
cliff.delta(data[which(data$browser == "firefox" & data$crit==1), ]$fcp, data[which(data$browser == "firefox" & data$crit==0), ]$fcp)
cliff.delta(data[which(data$browser == "firefox" & data$crit==1), ]$e, data[which(data$browser == "firefox" & data$crit==0), ]$e)

