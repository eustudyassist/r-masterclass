# Set number of coin flips
n_flips <- 5e7 

message("Starting the coin flip simulation...")

# Get the number of Heads

results <- sample(c("Heads", "Tails"), 
                  size = n_flips, 
                  replace = TRUE)
results


heads_pct <- sum(results == "Heads") / n_flips

# 3. Save the result so we can access it later

saveRDS(heads_pct, "sim_result.rds")

message("Done! The probability of heads was: ", heads_pct)
