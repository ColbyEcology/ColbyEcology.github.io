################          HOW TO MAKE A PHASE PLANE IN R        ################
# 1. Load packages                                                             #
# 2. Write deSolve-compatible function                                         #
# 3. Set up paramters and initial conditions                                   #
# 4. Create vector field of deterministic skeleton using `flowField()`         #
# 5. Create nullclines using `nullcines()`                                     #
# 6. Pat yourself on the back                                                  #
################################################################################

# 1. Load pacakges
  library(package = "deSolve")
  library(package = "phaseR")

# 2. Write deSolve-compatible function
  comp <- function(t, y, parms) {
    with(as.list(c(y, parms)), {
      dN1 <- r1*N1*((K1 - N1 - alpha12*N2)/K1)
      dN2 <- r2*N2*((K2 - N2 - alpha21*N1)/K2)
      return(list(c(dN1, dN2)))
    })
  }

# 3. Set up paramters and initial conditions
  parms.vec <- c(r1 = 1, r2 = 1, K1 = 10, K2 = 10,
                 alpha12 = 0.5, alpha21 = 0.5)
  init <- c(N1 = 0.1, N2 = 0.2)
  time.vec <- seq(from = 0, to = 10, by = 0.1)

  # 3.1 Run `ode()` first to make sure the code works, although not necessary
    out <- ode(y = init, times = time.vec, parms = parms.vec,
               func = comp)
    plot(x = out[,1], y = out[,2], type = "l", ylim = c(0, 10))
      lines(x = out[,1], y = out[,3], col = "red")

# 4. Create vector field of deterministic skeleton using `flowField`
  # 4.1. Create objects to more easily pass to phaseR functions
    y.names <- c("N1", "N2")
    axis.lims <- c(0, 12)
  
  # 4.2. Create vector field
    # Note that add = F, meaning that it will create a new plot
    flowField(deriv = comp, parameters = parms.vec, xlim = axis.lims,
              ylim = axis.lims, state.names = y.names, add = F)

# 5. Create nullclines using `nullcines()`
    # Note that add = T, meaning that it will add nullclines on the current plot
    nullclines(deriv = comp, parameters = parms.vec, xlim = axis.lims,
               ylim = axis.lims, state.names = y.names, add = T)

    # Note that you can also add a trajectory line, if you wish
    trajectory(deriv = comp, y0 = init, tlim = c(0, 100), parameters = parms.vec,
               state.names = y.names)
    # The trajectory starts where ther circle is. Note from the arguments that
    # you set `tlim`, which is the beginning and end of a time sequence, just
    # like you'd ordinarily pass to `ode()`. There's a default argument,
    # `tstep = 0.01` that you can change if you want larger/smaller time steps.

  # 5.3 Notice that there is a lot of output coincident with running
  #     `fieldFlow()`` `and nullclines()`. To avoid that, just save it. E.g.,
    trash <- flowField(deriv = comp, parameters = parms.vec, xlim = axis.lims,
              ylim = axis.lims, state.names = y.names, add = F, col = "grey66",
              las = 1, xlab = expression(N[1]), ylab = expression(N[2]))
    trash <- nullclines(deriv = comp, parameters = parms.vec, xlim = axis.lims,
           ylim = axis.lims, state.names = y.names, add = T, add.legend = F,
           col = c("red", "blue"), lwd = 2)

# 6. Pat yourself on the back
	# Do it, really.