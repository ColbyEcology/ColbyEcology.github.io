# Load numerical solver
	library(package = "deSolve")

# Write SIR function
	SIR_risk <- function(time, init, parms) {
		with(as.list(c(init, parms)), {
			dSl <- -beta_ll*Sl*Il + -beta_lh*Sl*Ih 
			dSh <- -beta_hl*Sh*Il + -beta_hh*Sh*Ih
			dIl <- beta_ll*Sl*Il + beta_lh*Sl*Ih - gamma*Il
			dIh <- beta_hl*Sh*Il + beta_hh*Sh*Ih - gamma*Ih
			dR <- gamma*Il + gamma*Ih
			return(list(c(dSl, dSh, dIl, dIh, dR)))
		})
	}

# Create parameter values
	risk_parms <- c(	beta_ll = 0.15,
				beta_lh = 0.25,
				beta_hl = 0.25,
				beta_hh = 0.75,
				gamma = 0.1)

# Create the time over which we want to simulate
	max_time <- 125
	risk_time <- seq(from = 0, to = max_time, by = 0.01)

# Initial densities (make sure them sum to 1 to keep it proportional)
	Il_init <- 0.001
	Ih_init <- 0.001
	remain_init <- 1 - Il_init - Ih_init
	sum_init <- Il_init + Ih_init

# Loop parameters
	# Number of initial densities of initial Sl or Sh to run
	n_init_prop <- 20
	# Sequence of initial Sl or Sh
	init_prop <- seq(from = sum_init, to = remain_init, length.out = n_init_prop)
	# Color scale
	cols <- colorRampPalette(colors = c("red", "blue"))(n_init_prop)

# Create an example plot with ~50:50 high- and low-risk
	col_50 <- cols[median(1:length(cols))]
	half <- (1 - 0.002)/2
	risk_init_50 <- c(Sl = half, Sh = half, Il = 0.001, Ih = 0.001, R = 0)
	risk_out_50 <- ode(y = risk_init_50, times = risk_time, func = SIR_risk, parms = risk_parms)
	plot(x = NA, type = "n", xlab = "Time", xlim = c(0, max_time), ylim = c(0, 0.6), ylab = "Proportion of infectious population", las = 1)
	segments(x0 = -1e3, x1 = 1e5, y0 = 0, y1 = 0)
		lines(x = risk_out_50[,"time"], y = risk_out_50[,"Il"], col = col_50)
		lines(x = risk_out_50[,"time"], y = risk_out_50[,"Ih"], lty = 3, col = col_50)
		total_I_50 <- risk_out_50[,"Il"] + risk_out_50[,"Ih"]
		lines(x = risk_out_50[,"time"], y = total_I_50, lwd = 3, col = col_50)
	legend(x = "topright", lwd = c(3, 1, 1), lty = c(1, 1, 2), bty = "n", legend = c("Total infectious", "Low-risk infectious", "High-risk infectious"), col = col_50, cex = 0.75)


# Create a blank plot
	plot(x = NA, type = "n", xlab = "Time", xlim = c(0, max_time), ylim = c(0, 0.6), ylab = "Proportion of infectious population", las = 1)
	segments(x0 = -1e3, x1 = 1e5, y0 = 0, y1 = 0)

# Loop over initial proportional densities of Sl or Sh
	for (i in 1:n_init_prop) {
		risk_init_var <- c(Sl = init_prop[i], Il = 0.001, Ih = 0.001, R = 0)
		risk_init_var <- c(risk_init_var, Sh = (1 - sum(risk_init_var)))[c(1,5,2,3,4)]
	
		risk_out_var <- ode(y = risk_init_var, times = risk_time, func = SIR_risk, parms = risk_parms)
	
		lines(x = risk_out_var[,"time"], y = risk_out_var[,"Il"], col = cols[i])
		lines(x = risk_out_var[,"time"], y = risk_out_var[,"Ih"], lty = 3, col = cols[i])
		total_I <- risk_out_var[,"Il"] + risk_out_var[,"Ih"]
		lines(x = risk_out_var[,"time"], y = total_I, lwd = 3, col = cols[i])
	}
	legend(x = "topright", lwd = c(3, 1, 1, 1, 1), lty = c(1, 1, 2, 1, 1), bty = "n", legend = c("Total infectious", "Low-risk infectious", "High-risk infectious", "High proportion of\nrisk taking behaviors", "Low proportion of\nrisk taking behaviors"), col = c("black", "black", "black", "red", "blue"), cex = 0.75)
	
segments(x0 = -1e2, y0 = 0.2, x1 = 1e4, y1 = 0.2, lwd = 2)