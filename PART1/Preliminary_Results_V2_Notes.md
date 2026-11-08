# Preliminary results V2: editing and submission notes

These notes are outside the submitted section. Use [Preliminary_Results_V2.md](Preliminary_Results_V2.md), with all 41 coefficients and Figures 1–3, in the proposal.

## Confirmed course conditions

The user confirmed the additional diagnostic conditions as **conditional mean response** and **conditional mean predictors**. These are now discussed separately from multicollinearity.

- **Conditional mean response:** The course condition concerns whether the full conditional mean can be expressed as a function of one linear combination of the predictors. The new response-versus-fitted plot shows an overall increasing binned relationship, with local fluctuations, but cannot establish that the fitted index captures all information in X. The draft explicitly leaves dependence on one linear combination unverified. It does not claim that a nonlinear response trend alone violates a condition allowing a general function g.
- **Conditional mean predictors:** The numerical predictor-pairs plot shows curved attraction-accessibility versus centre/metro-distance relationships. These suggest departures from linear conditional predictor relationships and complicate assigning particular residual patterns to particular violations. This plot covers the seven numerical predictors; it does not verify the condition for all categorical or interaction columns.
- **Multicollinearity:** Retained as a separate assessment. The full design has rank 41/41, excluding exact collinearity; some reference-coded indicator VIFs exceed the course screen of 5. Numerical VIFs are 1.61–3.27 and the focal interaction VIF is 4.61. The largest numerical pairwise correlation is cleanliness versus guest satisfaction (r = 0.713). Pairwise correlations, VIFs, and conditional-mean linearity check different properties.
- The earlier generic statement that predictor linearity is not required by OLS did not address the course's extra conditions for interpreting residual plots. The revised text distinguishes estimation assumptions from diagnostic-interpretation conditions and does not call those two conditions multicollinearity.
- The original four assumption discussions remain. Residual patterns suggest mean misspecification, unequal variance, and nonnormal tails; possible spatial/repeated-offer dependence leaves independence unverified. Because the predictor conditional-mean condition is questionable, specific diagnostic attribution remains tentative. Classical inference is provisional; no repairs were applied.

## Current figures

- Figure 1: [06_course_residual_diagnostics.png](../part1_regression/output/part1/figures/06_course_residual_diagnostics.png), unchanged. Residual versus fitted, normal Q-Q, and scale-location. Only the first panel zooms axes.
- Figure 2: [08_numeric_predictor_pairs.png](../part1_regression/output/part1/figures/08_numeric_predictor_pairs.png), unchanged. Predictor relationships for the conditional mean predictors condition; Pearson correlations remain visible.
- Figure 3: [09_conditional_mean_response.png](../part1_regression/output/part1/figures/09_conditional_mean_response.png), newly added. Response versus fitted prices; orange line joins response means in 25 equal-count fitted-value bins. Both axes show empirical central 99% ranges. All offers and full prices contribute to the bins and the original fit.
- Optional [07_residual_boxplots.png](../part1_regression/output/part1/figures/07_residual_boxplots.png) is left out of this version to make room for the conditional-response check. Unequal variance remains assessed using Figure 1. The file itself is unchanged.
- The six-panel figure and leverage/Cook discussion remain excluded as requested.

## Table and inference

- Every one of the 41 coefficient estimates and classical SEs is retained unchanged, each exactly once. The first 14 rows contain the intercept, non-city coefficients, and central interaction; nine city rows each contain three coefficients. City interaction entries adjust Amsterdam's contrasts. Blank cells are inapplicable.
- The focal interaction is EUR 3.88 (SE 5.72), 95% CI [−7.33, 15.09], p = 0.497. It is the entire-minus-private difference between adjusted weekend-minus-weekday contrasts, assumed common across cities. Insufficient evidence is not proof of equality or a causal effect.
- The response unit is total advertised EUR price for two guests and two nights. Numerical coefficients are conditional per-unit EUR differences; factor coefficients compare with the caption's references. Main effects involved in interactions apply at the other factors' reference levels.
- Comparison with Gyódi and Nawaro (2021a) is directional. Their log-price spatial models do not support direct magnitude comparisons with this pooled raw-EUR model.

## Word count

- Numerical table entries do not count, as clarified by the user. Excluded: the 41 estimates and 41 SEs, **82 numerical entries**. Textual table labels, headings, and captions are counted; the numerical portfolio-category labels are conservatively still charged.
- Prose, heading, textual table content, and all four captions: **204** words.
- Figure 1 text and ticks: **52**; Figure 2 text, correlations, and ticks: **112**; Figure 3 text and ticks: **17**.
- Complete chargeable section: **385 words**. Splitting compounds, ranges, slashes, and equals signs gives **396 words**.
- All figure numbers and values are counted; the table-only exemption is not extended to figures or prose. Markdown formatting, image paths, and nonprinted alternative text are not additional printed words. These notes and the inventories below are not part of the submitted section.
- Recheck after report assembly, resizing that changes labels, or caption/numbering edits. Both counts are within 400 without relying on the 15-word tolerance.

## Reproducibility and checks

- The coefficient table is byte-for-byte unchanged from the preceding V2. [Preliminary_Results_V1.md](Preliminary_Results_V1.md) is unchanged; no existing model, data, or figure files were modified.
- The new graph was generated from the existing [cleaned data](../part1_regression/data/processed/part1_offers.csv) and saved full-precision coefficient table by reconstructing the same design matrix. Its in-sample RMSE was checked against the saved fit statistics. No regression was refitted.
- An R chunk named `conditional-response-figure` was added to [part1_model.Rmd](../part1_regression/analysis/part1_model.Rmd) to regenerate the matching response-versus-fitted diagnostic directly from `fit`, using the same axis limits, ticks, 25 bins, and all observations. The current PNG was generated with temporary Python plotting dependencies because Rscript is unavailable in this environment. The new R chunk has not been executed here; knit the Rmd in the project's R environment before submission. R and Matplotlib may differ in typography while displaying the same fitted values and bins.
- The Rmd still sources [course_diagnostics.R](../part1_regression/analysis/course_diagnostics.R). Include that helper at the expected location with the Rmd. Supporting source links remain in chat, outside the submitted section.
- Keep Table 2 / Figures 1–3 and the 2021a bibliography suffix consistent with the assembled report. No existing figures were edited or trimmed to change the count.

## Figure 1 visible text inventory (audit only)

Residuals vs fitted (zoom)
Fitted price (EUR)
Residual (EUR)
200 400 600 800
-200 0 200 400 600 800

Normal Q-Q
Theoretical quantile
Standardized residual
-4 -2 0 2 4
0 10 20 30 40 50 60

Scale-location
Fitted price (EUR)
sqrt(|standardized residual|)
0 500 1000 1500
0 2 4 6 8

## Figure 2 visible text inventory (audit only)

Capacity
Bedrooms
Cleanliness
Guest satisfaction
Centre distance
Metro distance
Attraction index

0.56 0.01 0.01 -0.13 -0.04 -0.05
0.03 0.05 -0.01 0.04 -0.06
0.71 -0.03 0.01 -0.08
0.00 0.03 -0.08
0.56 -0.24
-0.22

0 2 4 6 8 10
20 40 60 80 100
0 2 4 6 8 10 14

2 3 4 5 6
2 4 6 8 10
0 5 10 15 20 25
0 20 40 60 80 100

0 2 4 6 8 10
20 40 60 80 100
0 2 4 6 8 10 14

2 3 4 5 6
2 4 6 8 10
0 5 10 15 20 25
0 20 40 60 80 100

## Figure 3 visible text inventory (audit only)

Response vs fitted (zoom)
Fitted price (EUR)
Offer price (EUR)
200 400 600 800
500 1000 1500
