# Preliminary results V2: editing and submission notes

These notes are outside the submitted section. Use [Preliminary_Results_V2.md](Preliminary_Results_V2.md), with its full coefficient table and all three figures, in the assembled proposal.

## Word-count rule and current count

- The user's clarification is authoritative for this revision: **numbers in the table do not count toward the word limit**. The earlier counts included the numerical coefficient entries and were overly restrictive under this rule.
- Excluded: the 41 numerical estimates and 41 numerical SEs in Table 2, comprising 82 numerical entries. Their values remain visible and unchanged.
- Included: table headings and textual row labels, all prose, the section heading, all four captions, and all visible figure words and numbers. As a conservative choice, the portfolio-category labels containing `2–4` and `5+` are also still charged.
- Charged prose/table-label/caption words: **175**.
- Figure 1 visible words and numerical ticks: **52**.
- Figure 2 visible words, correlations, and numerical ticks: **112**.
- Figure 3 visible words and numerical ticks: **49**.
- Total chargeable words: **388**. Splitting compound terms, ranges, slashes, and equals signs gives **399**.
- Only table numerical entries are exempted. Figure numbers/ticks/correlation values and numerical values in the prose or captions are still counted; no broader numeric exemption is assumed.
- Markdown formatting, image URLs, and nonprinted image alternative text are not counted. These editing notes and the audit inventories below are not submitted prose. Recheck after final report assembly and any caption/label edits.

## Current figure selection

- Figure 1 is the requested [three course diagnostic panels](../part1_regression/output/part1/figures/06_course_residual_diagnostics.png): residuals versus fitted values, normal Q-Q, and scale-location. Only the first panel zooms axes; the Q-Q and scale-location panels retain full ranges.
- Figure 2 is the requested [predictor-pairs plot](../part1_regression/output/part1/figures/08_numeric_predictor_pairs.png). Lower panels show smoothers; upper panels show Pearson correlations for the seven numerical predictors.
- Figure 3 now includes the [group residual boxplots](../part1_regression/output/part1/figures/07_residual_boxplots.png). The table-number exemption makes room for this additional categorical variance evidence and for clearer explanations.
- The six-panel figure and leverage/Cook discussion remain excluded from the submitted draft, as requested. No figures or analysis code were modified.
- The boxplot figure omits individual outlier markers to show group spread; it does not exclude observations from the model. The caption makes the display choice explicit.

## Statistical interpretation

- Four usual assumptions are assessed: curved residual means suggest mean misspecification; scale-location and wider entire-home residual boxes suggest unequal variance; upper Q-Q tails depart from the normal reference; independence remains unverified because nearby or repeated offers may be dependent.
- The predictor-pairs plot concerns relationships among predictors. Predictors need not be mutually independent or pairwise linearly related. Curved predictor-predictor smoothers alone do not establish response mean misspecification or error dependence.
- For the additional MLR collinearity condition, the complete design has rank 41/41, ruling out exact linear dependence. This does not rule out strong multicollinearity. Cleanliness and guest satisfaction have r = 0.713 (displayed as 0.71). Numeric VIFs range from 1.61 to 3.27, the central interaction VIF is 4.61, and some reference-coded indicator VIFs exceed the course's screen of 5. The prose acknowledges concerns without claiming all predictors are independent or all collinearity is resolved.
- VIFs are ordinary model-matrix-column VIFs under reference coding, not generalized VIFs for whole factors. The figure cannot reveal all multivariable dependence, so the rank/VIF assessment accompanies it.
- All 41 fitted coefficient estimates and classical SEs remain unchanged, with each coefficient appearing once. The first 14 rows show the intercept, non-city coefficients, and central interaction; each of the nine city rows shows a main effect and two interaction adjustments. Blank cells are inapplicable.
- The primary interaction's CI has been restored in the prose: estimate EUR 3.88, SE 5.72, 95% CI [−7.33, 15.09], p = 0.497. It is the entire-minus-private difference in adjusted weekend-minus-weekday contrasts, assumed common across cities. Insufficient evidence does not establish equality or a causal effect.
- The response is total advertised EUR price for two guests and two nights. Numerical slopes are conditional EUR changes per unit; categorical coefficients compare with the stated references. Interacting main effects apply at the other factors' reference levels. City interaction columns are adjustments relative to Amsterdam, not complete city-specific contrasts.
- The comparison with Gyódi and Nawaro (2021a) is directional; their log-price spatial models and this pooled raw-price model do not support direct coefficient-magnitude comparisons.
- Classical inference remains provisional. No assumption repairs, model changes, or additional data exclusions were applied.

## Reproducibility and source preservation

- The coefficient table is identical to the preceding V2 and was previously checked against [coefficients.csv](../part1_regression/output/part1/tables/coefficients.csv), including all 41 terms. The restored CI and p-value were checked against [primary_interaction.csv](../part1_regression/output/part1/tables/primary_interaction.csv).
- The plot inventories below were checked against the actual figures. All 21 correlations in Figure 2 were previously checked against the exported correlation matrix, and the wider entire-home residual IQR was independently verified from the saved fit's model matrix.
- [Preliminary_Results_V1.md](Preliminary_Results_V1.md) remains unchanged. No data, model, Rmd, helper, or image files were edited or refitted.
- [part1_model.Rmd](../part1_regression/analysis/part1_model.Rmd) sources [course_diagnostics.R](../part1_regression/analysis/course_diagnostics.R), which generates the three selected figures. Include the helper at its expected location when submitting this code structure.
- Keep Table 2 / Figures 1–3 numbering and the 2021a suffix consistent with the final report. Preserve figure readability in the exported proposal.

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

City
Room
Day by room
Standardized residual
Standardized residual
Standardized residual
-1.5 -1.0 -0.5 0.0 0.5 1.0
-1.5 -1.0 -0.5 0.0 0.5 1.0
-1.5 -1.0 -0.5 0.0 0.5 1.0
Ams Ath Bar Ber Bud Lis Lon Par Rom Vie
Private Entire
Weekday Weekend Weekday Weekend
Private Private Entire Entire
