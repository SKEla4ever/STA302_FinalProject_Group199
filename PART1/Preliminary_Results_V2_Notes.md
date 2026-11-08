# Preliminary results V2: editing and submission notes

These notes are outside the submitted section. Use [Preliminary_Results_V2.md](Preliminary_Results_V2.md), including its coefficient table and full residual diagnostic grid, in the assembled proposal.

## Current revision

- Replaced the three-panel course figure with the existing six-panel [full residual diagnostic grid](../part1_regression/output/part1/figures/03_residual_diagnostics.png). It displays full-range residuals versus fitted values, a central zoom, a normal Q-Q plot, scale-location, residuals versus leverage, and Cook distances.
- Kept all 41 coefficient estimates and classical SEs unchanged. Each fitted coefficient appears exactly once. The first 14 rows contain the intercept, non-city coefficients, and central interaction; each of the nine city rows contains a city main effect and two interaction adjustments. Blank cells are inapplicable.
- Kept the central interaction CI, p-value, and insufficient-evidence conclusion. The point estimate remains visible in Table 2. The common entire-minus-private contrast is an adjusted association, not a causal or matched-property price change.
- Kept four separate assumption assessments. Linearity, variance, and normality refer to corresponding patterns in Figure 1. Independence is unverified because nearby offers and possibly repeated properties or hosts may be dependent; no stable identifiers are available. The figure's file-order influence panel is not a time-series test or an independence test.
- Restored visual evidence for outliers, leverage, and possible influence alongside the four assumptions. Screening flags do not establish data errors or justify deletion. No observations were deleted and no assumption corrections were applied.
- Shortened fit statistics, numerical screening summaries, and VIF reporting to make room for the extra plot labels. Details remain in the reproducible analysis companion. Some reference-coded indicator VIFs exceed 5; these are ordinary model-matrix-column VIFs, not generalized VIFs for whole factors.
- Omitted predictor pairs, adjusted-contrast graphics, and residual group boxplots from the submitted section because they add to information already addressed by the table and full diagnostic grid. These are not assumed exempt from the limit if added later. A spatial map can support discussion of observed patches, but the current independence statement does not claim such patches or a formal dependence test.
- [Preliminary_Results_V1.md](Preliminary_Results_V1.md) and all existing tracked files are unchanged.

## Word count

- Prose, heading, all table labels and numerical entries, and both captions: 274 words.
- Visible text and numerical labels in the full diagnostic grid: 115 words.
- Complete section: **389 words**.
- Splitting compound terms, dashes, slashes, ranges, and equals signs gives **398 words**.
- Markdown borders, formatting markers, and the image URL are not printed words. Image alternative text is not a second printed caption. These notes and the inventory below are outside the submitted section.
- Recheck after final report assembly, especially if captions, figure numbers, or image labels change. The count does not rely on the rubric's 15-word tolerance.

## Reading the model table

- Numerical slopes are conditional EUR differences per unit increase, holding other predictors fixed. Factor coefficients compare the displayed level with its stated reference. Main effects involved in interactions apply at the interacting factors' reference levels.
- The city interaction columns represent `city:day_typeweekends` and `city:room_typeEntire home/apt`. They are adjustments relative to Amsterdam, not complete city-specific contrasts. Those require coefficient sums and their covariance terms.
- The central interaction uses weekend and entire-home indicators, so its sign is entire minus private for the weekend minus weekday contrast, assumed common across cities.
- All classical SEs, CIs, and p-values remain provisional because mean misspecification, unequal variance, nonnormal tails, and possible dependence have not been repaired.
- Positive size and attraction slopes are compared directionally with Gyódi and Nawaro (2021a). Their city-specific spatial models use log price; this pooled OLS uses raw EUR. The draft does not equate coefficient magnitudes or claim a formal difference between studies.

## Reproducibility and checks

- Every one of the 41 coefficient estimates and SEs was checked against [coefficients.csv](../part1_regression/output/part1/tables/coefficients.csv); no terms are missing or duplicated. The table is unchanged from the previous V2.
- Figure 1 was visually inspected; its full-range panels retain all offers and extremes. The central panel only changes axis ranges, not the fit or sample.
- [part1_model.Rmd](../part1_regression/analysis/part1_model.Rmd) generates the included full grid. Its later course-diagnostics section also sources [course_diagnostics.R](../part1_regression/analysis/course_diagnostics.R), so that helper must accompany the Rmd if the current code structure is submitted.
- No model or data files were changed, and no regression was refitted for this revision.
- Keep Table 2 / Figure 1 numbering and the 2021a suffix consistent with the final report. Supporting source links remain in chat.
- The original supplementary diagnostics file still links to an old draft filename. It was left unchanged; its plots are analysis material, not part of the current submitted section.

## Visible figure text inventory (audit only)

Residuals vs fitted: all offers
Fitted price (EUR)
Residual (EUR)
0 500 1000 1500
0 5000 10000 15000

Central 99% axis ranges (zoom)
Fitted price (EUR)
Residual (EUR)
0 200 400 600 800
-200 0 200 400 600 800

Normal Q-Q: all offers
Theoretical Quantiles
Standardized residual
-4 -2 0 2 4
0 10 20 30 40 50 60

Scale-location
Fitted price (EUR)
sqrt(|standardized residual|)
0 500 1000 1500
0 2 4 6 8

Residuals vs leverage
Leverage
Standardized residual
0.002 0.004 0.006
0 10 20 30 40 50 60
24148

Influence: all offers
Analytical row (file order; not time)
Cook distance
0 10000 20000 30000 40000 50000
0.00 0.02 0.04 0.06 0.08 0.10
24148
