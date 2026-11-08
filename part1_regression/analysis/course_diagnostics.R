course_png <- function(path, width, height, draw) {
  png(path, width = width, height = height, units = "in", res = 180, type = "cairo")
  on.exit(dev.off())
  force(draw)
}

render_course_diagnostics <- function(fit, figure_dir) {
  dir.create(figure_dir, recursive = TRUE, showWarnings = FALSE)
  figure_names <- c(
    "06_course_residual_diagnostics.png",
    "07_residual_boxplots.png",
    "08_numeric_predictor_pairs.png"
  )
  figures <- file.path(figure_dir, figure_names)
  fitted_prices <- fitted(fit)
  eur_residuals <- residuals(fit)
  standardized <- rstandard(fit)
  scale_residuals <- sqrt(abs(standardized))
  model_data <- model.frame(fit)
  point_color <- adjustcolor("#256B82", alpha.f = 0.18)
  smooth_color <- "#B74226"

  # Each bin has about the same number of offers.
  bins <- cut(rank(fitted_prices, ties.method = "first"),
              breaks = seq(0, length(fitted_prices), length.out = 26),
              include.lowest = TRUE, labels = FALSE)
  fitted_means <- tapply(fitted_prices, bins, mean)
  central <- c(.005, .995)
  course_png(figures[1], 12, 3.85, {
    par(mfrow = c(1, 3), mar = c(4.0, 4.1, 2.4, 0.8), mgp = c(2.6, .7, 0), cex = .91)
    plot(fitted_prices, eur_residuals, pch = 16, cex = .27, col = point_color,
         xlab = "Fitted price (EUR)", ylab = "Residual (EUR)",
         xlim = quantile(fitted_prices, central), ylim = quantile(eur_residuals, central),
         xaxs = "i", yaxs = "i", main = "Residuals vs fitted (zoom)")
    abline(h = 0, lty = 2, col = "gray55")
    lines(fitted_means, tapply(eur_residuals, bins, mean), col = smooth_color, lwd = 2)

    qqnorm(standardized, pch = 16, cex = .32, col = point_color,
           main = "Normal Q-Q", xlab = "Theoretical quantile", ylab = "Standardized residual")
    qqline(standardized, col = smooth_color, lwd = 2)

    plot(fitted_prices, scale_residuals, pch = 16, cex = .27, col = point_color,
         main = "Scale-location", xlab = "Fitted price (EUR)",
         ylab = "sqrt(|standardized residual|)")
    lines(fitted_means, tapply(scale_residuals, bins, mean), col = smooth_color, lwd = 2)
  })

  groups <- list(
    City = model_data$city,
    Room = model_data$room_type,
    "Day by room" = interaction(model_data$day_type, model_data$room_type)
  )
  group_labels <- list(
    tools::toTitleCase(substr(levels(groups$City), 1, 3)),
    c("Private", "Entire"),
    c("Weekday", "Weekend", "Weekday", "Weekend")
  )
  course_png(figures[2], 12, 3.7, {
    par(mfrow = c(1, 3), mar = c(4.0, 4.1, 2.4, 0.8), mgp = c(2.6, .7, 0), cex = .91)
    for (i in seq_along(groups)) {
      positions <- seq_along(group_labels[[i]])
      boxplot(split(standardized, groups[[i]]), ylim = c(-1.6, 1.3), xaxt = "n",
              outline = FALSE, col = "#D5E9ED", border = "#22576A",
              ylab = "Standardized residual", main = names(groups)[i])
      abline(h = 0, lty = 2, col = "gray55")
      axis(1, at = positions, labels = FALSE)
      mtext(group_labels[[i]], side = 1, at = positions, line = 1, cex = .76)
    }
    mtext(c("Private", "Private", "Entire", "Entire"), side = 1, at = 1:4, line = 2.1, cex = .76)
  })

  predictors <- c("person_capacity", "bedrooms", "cleanliness_rating",
                  "guest_satisfaction_overall", "dist", "metro_dist", "attr_index_norm")
  predictor_labels <- c("Capacity", "Bedrooms", "Cleanliness", "Guest\nsatisfaction",
                        "Centre\ndistance", "Metro\ndistance", "Attraction\nindex")
  course_png(figures[3], 9.7, 9.7, {
    pairs(model_data[predictors], labels = predictor_labels, gap = .55,
          cex.labels = 1, font.labels = 2, cex.axis = .72,
          lower.panel = function(x, y, ...) {
            panel.smooth(x, y, pch = 16, cex = .22, col = point_color,
                         col.smooth = smooth_color, span = .5, iter = 0, lwd = 1.7)
          },
          upper.panel = function(x, y, ...) {
            old <- par(usr = c(0, 1, 0, 1))
            on.exit(par(old))
            r <- round(cor(x, y), 2) + 0
            text(.5, .5, sprintf("%.2f", r), col = "#22576A", cex = 1.1)
          })
  })

  fit_summary <- summary(fit)
  f <- unname(fit_summary$fstatistic)
  fit_statistics <- c(r_squared = fit_summary$r.squared, adjusted_r_squared = fit_summary$adj.r.squared,
                      residual_se_eur = fit_summary$sigma, rmse_eur = sqrt(mean(eur_residuals^2)),
                      F = f[1], numerator_df = f[2], denominator_df = f[3],
                      log_p = pf(f[1], f[2], f[3], lower.tail = FALSE, log.p = TRUE))
  # Ordinary VIFs apply to design columns, including reference-coded interactions.
  design <- model.matrix(fit)[, -1, drop = FALSE]
  centered <- sweep(design, 2, colMeans(design))
  vif <- diag(vcov(fit))[-1] * colSums(centered^2) / fit_summary$sigma^2
  group_spread <- do.call(rbind, lapply(names(groups), function(group) {
    by_level <- split(standardized, groups[[group]])
    data.frame(group = group, level = names(by_level),
               sd = vapply(by_level, sd, numeric(1)),
               iqr = vapply(by_level, IQR, numeric(1)), row.names = NULL)
  }))
  list(figures = figures, fit_statistics = fit_statistics, vif = vif, group_spread = group_spread)
}

# Run directly to regenerate figures from the saved preliminary fit.
if (sys.nframe() == 0L) {
  script <- sub("^--file=", "", grep("^--file=", commandArgs(FALSE), value = TRUE))
  part1_output <- file.path(dirname(dirname(normalizePath(script))), "output", "part1")
  preliminary_fit <- readRDS(file.path(part1_output, "preliminary_model.rds"))
  results <- render_course_diagnostics(preliminary_fit, file.path(part1_output, "figures"))
  print(results$fit_statistics)
  print(sort(results$vif, decreasing = TRUE))
  print(results$group_spread)
}
