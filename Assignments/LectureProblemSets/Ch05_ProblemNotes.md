---
layout: assignment
title: "Chapter 5 Problem Notes"
---

# Chapter 5 Problem Notes

5.1 `runiff()` draws from a uniform distribution with the arguments being `n = ` for the number of values, `min = ` being the munimum possible value, and `max = ` being the maximum possible value. Plot the coordinates using `plot(x = , y = )` (always explicitly state the arguments as a best practice). Create the sampling grid using `segments()` remember the arbuments are `x0`, `x1`, `y0`, and `y1`. This creates a line from $(x_0, y_0)$ to $(x_1, y_1)$. Also, importantly, since you are randomly drawing values, be sure to set a seed (reference Lab Report 1) so your random data will be repeatable.

5.2 None.

5.3 None.

5.4 I've created an object `counts` as a vector with 16 elements, one for each 100 x 100 subplot for the random numbers generated in 5.1. `counts_bass` are the counts for the American basswood and `counts_beech` are the counts for the American beech. Plug your vectors in to the code below.

```{r}
r.hist_1 <- hist(x = counts, breaks = seq(from = 0, to = 21, by = 1), plot = F)
r.hist_3 <- hist(x = counts, breaks = seq(from = 0, to = 21, by = 3), plot = F)
bass.hist_1 <- hist(x = counts_bass, breaks = seq(from = 0, to = 21, by = 1), plot = F)
bass.hist_3 <- hist(x = counts_bass, breaks = seq(from = 0, to = 21, by = 3), plot = F)
beech.hist_1 <- hist(x = counts_beech, breaks = seq(from = 0, to = 21, by = 1), plot = F)
beech.hist_3 <- hist(x = counts_beech, breaks = seq(from = 0, to = 21, by = 3), plot = F)

# mfrow in par() allows you to have rows x columns of plots (here, I make a 1-row, 2-column plot)
par(mfrow = c(1, 2), mar = c(4.5, 4.5, 0.1, 0.1))
plot(x = r.hist_1$mids, y = r.hist_1$density, xlab = "Trees per plot", ylab = "Proportion of trees", type = "l", las = 1, ylim = c(0, 0.6), lwd = 2)
  lines(x = bass.hist_1$mids, y = bass.hist_1$density, lwd = 2, col = "blue")
  lines(x = beech.hist_1$mids, y = beech.hist_1$density, lwd = 2, col = "red")

plot(x = r.hist_3$mids, y = r.hist_3$density, xlab = "Trees per plot", ylab = "Proportion of trees", type = "l", las = 1, ylim = c(0, 0.3), lwd = 2)
  lines(x = bass.hist_3$mids, y = bass.hist_3$density, lwd = 2, col = "blue")
  lines(x = beech.hist_3$mids, y = beech.hist_3$density, lwd = 2, col = "red")
```
5.5 Add two points in a different color on the same plot from 5.2 (but re-plot for this question). The coordinates are way off, use: (194, 215) and (296, 114).

5.6 Add the point (189, 321) instead of what's given in the book. Use a different color rather than symbol, again.

5.7 There's a factorial function in R: `factoral()`. Plot 3 or more lines on your plot, one for each value of $\lambda$ you use.

Also, there's a mistake in the symbol for this problem. $p^r$ should be $P_r$.

5.8 Find the average from 5.2, plot that using the Poisson equation, and plot the distribution of the observed values simmilar to how I presented 5.4. 

5.9 None, same as 5.8 but with different data.

5.17  Begin with $m = 1$, then add lines to your plot for additional values of $m$, say, by decreasing it by 0.1 intervals until $m = 0.1$.

5.18 The "classic equation" is the Levins metapopulation model.