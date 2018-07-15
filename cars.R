## Import libraries
library(knitr)
library(readr)
library(dplyr)
library(ggplot2)
library(GGally)
library(cowplot)
library(ggfortify)

## Summary of the data
str(mtcars)

## Summarize the differences between means and sd for transmission types
mtcars %>% group_by(am) %>%
  summarise(Mean = mean(mpg, na.rm = TRUE),
            SD = sd(mpg, na.rm = TRUE),
            Count = n())

## Plot the differences in types of transmissions
ggplot(mtcars, aes(factor(am), mpg)) + 
  geom_boxplot(fill = "blue") +
  labs(x = "Transmission Type", y = "MPG") + 
  scale_x_discrete(labels = c("0" = "Automatic", "1" = "Manual"))
  
## Ensure automatic transmission type is distributed normally
aut <- filter(mtcars, am == "0")
qqnorm(aut$mpg)
qqline(aut$mpg, col = 2, lwd = 2, lty = 2)

## Ensure manual transmission type is distributed normally
man <- filter(mtcars, am == "1")
qqnorm(man$mpg)
qqline(man$mpg, col = 2, lwd = 2, lty = 2)

## Two sample t-test to compare variances of transmission types
t.test(mpg ~ am, data = mtcars)

## Fit a slr model
cars.lm <- lm(mpg ~ am, data = mtcars)

## Model summary
summary(cars.lm)

## Reformat variable classes
mtcars[,c(2,8:11)] <- lapply(mtcars[,c(2,8:11)], as.factor)
mtcars$am <- factor(mtcars$am, labels = c("Automatic","Manual"))

## Fit a glm
cars.mlm <- lm(mpg ~ ., data = mtcars)

## Model summary
summary(cars.mlm)

## ANOVA table
cars.lm <- lm(mpg ~ am + qsec + wt + hp + disp, data = mtcars)
anova(cars.lm)

## Plot of mpg at the different levels of am
g1 <- ggplot(mtcars, aes(am, mpg)) +
  geom_boxplot() + 
  labs(y = "mpg")

## Plot of qsec at the different levels of am
g2 <- ggplot(mtcars, aes(am, qsec)) +
  geom_boxplot() + 
  labs(y = "Quarter Mile Time")

## Plot of wt at the different levels of am
g3 <- ggplot(mtcars, aes(am, wt)) +
  geom_boxplot() + 
  labs(y = "Weight")

## Final plots
plot_grid(g1, g2, g3, ncol = 3, nrow = 1)

## Diagnostic plots
autoplot(cars.lm, data = mtcars, colour = 'am')