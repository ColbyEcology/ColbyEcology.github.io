---
layout: assignment
title: "Chapter 7 Problem Notes"
---

# Chapter 7 Problem Notes
*Due 10 April, and I encourage you all to work together on Slack*

## 7.1
Individuals of the small crustacean *Daphnia pulicaria* float passively in the ocean. A fungal pathogen, *Polycaryum laeve*, regularly attacks them. At any time some individuals in the *Daphnia* population contain the pathogen (are infected), but sometimes they are free of the pathogen (but still susceptible to it). The only way the pathogen can get from one *Daphnia* to another is when the *Daphnia* come in contact with one another. If 25% of the individuals in a particular *Daphnia* population contain the pathogen, what is the probability that a *Daphnia* without the pathogen (an uninfected, or susceptible, individual) will contract them? (Think of the contact process: what are the probabilities of different types of encounters, and what needs to happen for an uninfected Daphnia to become infected?)


## 7.2
Repeat exercise 7.1 but with the additional assumption that every time one *Daphnia* encounters another, there is a 50% chance that a pathogen (if present) will move to the uninfected *Daphnia*.

---
For *fun*, write a loop to simulate, in discrete time, how the proportion of the population that is infectious chances at each time step. The shape of the curve should be familiar.

## 7.3
Let the fraction of *Daphnia* that are infected be equal to *p* and the probability of transferring the pathogen between two *Daphnia* in contact be *m*. If the rate of change of the fraction of *Daphnia* infected with the pathogen is taken to be equal to the probability of a transfer upon contact, write the general equation for that rate of change.

---
No need to work through this problem. They wanted you arrive at:
$$\frac{\mathrm{d}p}{\mathrm{d}t} = mp(1 - p)$$

### 7.4
The proportion of *Daphnia* infected duing a period of 15 days is, in sequence, 0.01, 0.03, 0.03, 0.1, 0.14, 0.3, 0.3, 0.58, 0.7, 0.7, 0.92, 0.92, 0.96, 0.97, 099, 0.99. Plot the time series.

---
Here, copy this:   
`infected <- c(0.01, 0.03, 0.03, 0.1, 0.14, 0.3, 0.3, 0.58, 0.7, 0.7, 0.92, 0.92, 0.96, 0.97, 099, 0.99)`   
Make sure when you `plot()` that you write an `x = ` argument that corresponds to a vector of time (i.e., days).

## 7.5 and 7.6
7.5 The integrated form of equation 1 is
$$I_t = \frac{I_0}{I_0 + (1 - I_0)\exp(-\beta t)}$$
Solve this equation for $\beta$, and estimate the value of $\beta$ for the time series of exercise 7.4.

7.6 Using the value of $\beta$ you estimated in exercise 7.5, calculate the expected values using the integrated form of equation 1, and plot them along with the time series of exercise 7.4.

---
For the first part of this problem do some algebra.

For the second part, plot the timeseries from 7.4 and use `lines()` to add lines over the data. You know $I_0$, which is the initial population size (in this case, the proportion of the population that is infectious). $t$ would be the time vector that you used in 7.4. Just change $\beta$ until your eyeballs think you have a good fit.

## 7.7
Equation 1 is a perfectly fine representation of the accumualtion of infected individuals in the population. What equation would describe the rate of change in the number of susceptibles in the population? What would be the integrated form of that equation (think about 7.5 and single spiecies models)?

---
Hint: look at the solution for $I$.


## 7.8
Begin with a very small infection ($I_0 = 0.001$) and use the integrated form of the mass action equation (the equation in exercise 7.5) to compute the time course for the susceptible population, with $\beta = 1$, then with $\beta = 0.1$. Plot the time series.

---
Remember that we are dealing with proportion of the population, so $S + I = 1$. Using R, for example, `1 - c(0.1, 0.25, 0.5, 0.9)` will give you `c(0.9, 0.75, 0.5 , 0.1)`. Plot both $S$ and $I$ for both $\beta$s on the same graph using (`lines()` will do this for you after your intial plot). Make each $I$ curve red, and the two curves with the larger $\beta$ have a different line type (e.g., in `lines()` or `plot()` use the argument `lty = "44"`).



## 7.9
Recall that $I+S=1.0$, and plot $I$ and $S$ on the same graph for $\beta = 0.9$, then with $\beta = 0.1$.

---
Make two graphs here.

## 7.10
Although it is generally not correct to simply use the discrete approximation of differential equations, sometimes the underlying processes involved in a model can be represented conveniently by doing so. In the case of equation set 4, such is the case (for a limited set of parameter values). For equation set 4 use the discrete approximation of the derivatives (e.g., the first equation would read $S_{t+1} = S_t – \beta S_tI_t$) to compute time series for all three variables (time $0-25$) for values of $b\beta = 0.8$ and $\nu = 0.3$. (Caution: Because of the discrete approximation, some values may go above $1.0$ or below $0$. Do not worry about that; it is a mathematical artifact. Just look at the overall pattern that emerges, and think about the biology.)

---
**Updated 09 April**: For 7.10, use the SIR models 4a–4c. You can choose to:

1. Use `ode()` and treat it as continuous time OR
2. Use `ode()` and treat it as discrete (i.e., use `method = "iteration"` in `ode()` and change equations 4 to be discrete time) as they do in the problem.

Please use $I_0 = 0.1$ as the initial value of $I$, and $R$ could be set to $0$.

## 7.11
Repeat exercise 7.10 for values of $\beta = 0.6$ and $\nu = 0.4$.

## 7.12
Calculate the values of
$$\frac{\mathrm{d}\log (I)}{\mathrm{d}t}$$
for values of $S$ ranging from $0$ to $1$, with $\beta = 0.5$ and $\nu = 0.3$, and graph them against $S$. At what value of $S$ will the disease begin to decline?

---

**Updated 09 April**: Please skip 7.12.

Use equaiton 4b to plug in the parameter values. You are then plotting $S$ on the horizontal axis and $\frac{\mathrm{d}\log (I)}{\mathrm{d}t}$ on the vertical axis. For $I$ to be declining $\frac{\mathrm{d}\log (I)}{\mathrm{d}t}$ would be $\leq 0$.

## 7.13
Use equation 5 or 4b to determine the critical value of $S$ at which the disease will begin to decline. How does that value relate to $R_0$?

---
If you set the derivative to 0 the rate of change of $I$ is $0$. If the right-hand side is negative, the population is srinking, and growing if the right-hand side is positive.

## 7.14
At the onset of an infection, public health officials can intervene to attempt to encourage changes in behavior patterns that will decrease host-to-host contact. Mathematically, how will this affect the critical $S$ for which the disease starts declining?

## 7.15
Suppose that individuals can be switched directly from susceptible to resistant without having to become infected. How would that affect equations 4a and 4c?

---
Write down what the right-hand side of the equations:
$$\frac{\mathrm{d}(S)}{\mathrm{d}t} = \\ \frac{\mathrm{d}(R)}{\mathrm{d}t} = $$

## 7.16
Some microparasites have increased their transmission rate by evolving the inclusion of another organism to increase the chances of infection. Suppose that a disease organism has an original direct infection rate of $\beta$ and the chance that two individuals will encounter one another is $p$. Now suppose that the chance of encounter is increased to $p + \varepsilon$ when an intermediate vector is involved, but the infection rate between vector and human is $\alpha$. When will it be advantageous for the disease to use the vector?

---
Optional.

## 7.17
Suppose that the vector is a mosquito and its rate of biting is $b$. If the probability that a biting mosquito itself becomes infected is $v$, $X$ is the relative number of mosquitoes infected, and $Y$ is the relative number of humans with the disease, write the equation for the accumulation of infected mosquitoes.

---
Optional.