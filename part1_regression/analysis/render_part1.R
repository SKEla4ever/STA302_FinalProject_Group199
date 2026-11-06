# Run from any working directory: Rscript /path/to/analysis/render_part1.R
script_arg <- grep("^--file=", commandArgs(FALSE), value = TRUE)
if (length(script_arg) != 1L) stop("Run this file with Rscript.")
script <- normalizePath(sub("^--file=", "", script_arg))
project_root <- dirname(dirname(script))
required <- c("rmarkdown", "knitr")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) stop("Install R packages: ", paste(missing, collapse = ", "))
if (!rmarkdown::pandoc_available()) {
  # Conda environments can contain Pandoc even when their bin is not on PATH.
  env_bin <- file.path(dirname(dirname(R.home())), "bin")
  rmarkdown::find_pandoc(cache = FALSE, dir = env_bin)
}
if (!rmarkdown::pandoc_available()) stop("Install Pandoc or render from RStudio.")
out <- file.path(project_root, "output", "part1")
dir.create(out, recursive = TRUE, showWarnings = FALSE)
rmarkdown::render(
  file.path(project_root, "analysis", "part1_model.Rmd"),
  output_dir = out, envir = new.env(parent = globalenv()), quiet = FALSE
)
