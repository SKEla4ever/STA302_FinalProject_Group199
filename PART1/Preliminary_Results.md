# Preliminary results

OLS fitted 12 predictors and three interaction pairs (n = 51,341; R² = 0.261), yielding 41 estimable coefficients.

Evidence for a common entire-minus-private difference in adjusted weekend–weekday contrasts is insufficient (95% CI −7.33 to 15.09; p = 0.497).

Table 2. All coefficients (SEs), EUR. References: Amsterdam, weekdays, private rooms, non-Superhosts, single offers. City rows include interaction adjustments.

| Term / city | Estimate (SE) | City × weekend (SE) | City × entire (SE) |
| --- | ---: | ---: | ---: |
| Intercept | −12.34 (18.89) | | |
| `day_type`: weekends | 26.00 (12.92) | | |
| `room_type`: entire home/apt | 285.87 (12.93) | | |
| `person_capacity` | 27.80 (1.40) | | |
| `bedrooms` | 81.00 (2.51) | | |
| `cleanliness_rating` | 5.76 (1.90) | | |
| `guest_satisfaction_overall` | 0.93 (0.21) | | |
| `host_is_superhost`: Superhost | 4.96 (3.06) | | |
| `dist` | −0.36 (0.94) | | |
| `metro_dist` | −4.95 (1.88) | | |
| `attr_index_norm` | 6.58 (0.20) | | |
| `host_portfolio`: 2–4 offers | 8.47 (3.23) | | |
| `host_portfolio`: 5+ offers | 25.09 (3.28) | | |
| `day_type × room_type` | 3.88 (5.72) | | |
| Athens | −216.28 (18.34) | −34.45 (14.91) | −302.27 (19.46) |
| Barcelona | −192.49 (13.23) | 19.09 (16.67) | 0.29 (18.67) |
| Berlin | −207.25 (14.25) | −10.78 (17.06) | −170.74 (17.43) |
| Budapest | −250.31 (17.98) | −7.86 (15.52) | −279.88 (19.35) |
| Lisbon | −180.26 (13.32) | −20.68 (14.62) | −238.46 (15.05) |
| London | −175.93 (12.03) | −28.83 (13.78) | −50.85 (13.92) |
| Paris | −88.02 (13.44) | −46.35 (14.40) | −182.06 (15.13) |
| Rome | −198.85 (12.07) | −23.31 (13.88) | −280.35 (14.10) |
| Vienna | −142.72 (15.53) | −28.09 (15.80) | −277.50 (17.15) |

Positive bedroom and attraction slopes agree directionally with Gyódi and Nawaro (2021a); the centre-distance interval spans zero.

Linearity is doubtful: the central residual–fitted panel shows curvature. Constant variance is doubtful: scale-location increases with fitted values. Error normality is poor: Q-Q tails depart from the reference line. Independence is unverified: spatial proximity and possible repeated properties/hosts permit dependence. Leverage/Cook plots flag possible influence. Classical inference is provisional; no repairs were applied.

![Residual diagnostic grid](../part1_regression/output/part1/figures/03_residual_diagnostics.png)

Figure 1. Residual diagnostics. Central panel zooms axes; orange curves summarize bins. Dashed lines are screening thresholds.

## Editing notes (exclude from the submitted section)

- Full section: 389 words including the heading, prose, coefficient table, both captions, and 115 visible words/numbers in the diagnostic figure (including axis ticks and the two offer-row labels). Text/table/captions alone: 274 words. Splitting compound terms, ranges, slashes, and equals signs gives 399 words in total. The Markdown image description is accessibility text, not an additional printed caption.
- The plot word inventory below records every visible label and tick for checking the count. It is not part of the submitted section. Recheck after assembly, renumbering, or resizing/exporting with different labels.
- Table 2 now displays every one of the 41 estimated coefficients, each exactly once, with its classical standard error. The first 14 rows show the intercept, non-city main coefficients, and central interaction. The remaining nine city rows show a city main coefficient and its two interaction coefficients. Blank cells are inapplicable. The reference city, Amsterdam, has no separately estimated city adjustment.
- The original variable names are retained for non-city terms. The city interaction columns mean `city:day_typeweekends` and `city:room_typeEntire home/apt`. Values are adjustments relative to Amsterdam, not complete city-specific price differences; these would require combining coefficients and their covariances.
- SEs rather than CIs are used throughout the table to keep the complete section within 400 words. The primary interaction CI and p-value remain in the prose. The assignment accepts SEs and/or CIs. Numerical slopes are conditional EUR differences per unit increase; factor coefficients are conditional EUR differences relative to the stated reference levels. Main effects involved in interactions apply at the other factors’ reference levels.
- Interaction coding: weekend versus weekday; entire home/apartment versus private room. Thus the displayed interaction is the entire-minus-private difference between weekend-minus-weekday contrasts. City interactions allow different baseline contrasts while the central interaction remains common.
- All 41 displayed coefficient estimates and SEs were checked against the saved coefficient table, including verifying that every fitted term appears exactly once; the primary CI and p-value were checked previously against the saved output. Classical uncertainty is retained for Part 1, explicitly qualified by the diagnostics. No new model was fitted and no assumption repair was applied.
- In the leverage and Cook thresholds, n = 51,341 observations and p = 41 fitted coefficients (including the intercept). These are screening rules, not automatic exclusions.
- Four separate conclusions now assess linearity, constant variance, error normality, and independence. The first three cite specific patterns in the corresponding Figure 1 panels. Independence is unverified and substantively questionable, not declared proven or formally rejected; no property/host identifiers are available. Outlier/leverage/influence diagnostics are additional conditions, not a substitute for any of the four assumptions.
- Only the existing residual grid is included to preserve space. The adjusted interaction graphic is optional and omitted. Independence is assessed from the sampling design and possible spatial/repeated-offer dependence; the file-order influence plot is not a time-series or independence test.
- Literature comparison: Gyódi and Nawaro (2021a), results on size and location. Their log-price, city-specific spatial models differ from this pooled raw-price OLS model; compare directions and uncertainty without equating scales or claiming a formal between-study difference. Source link is supplied in chat, outside the draft.
- Keep Table 2 / Figure 1 numbering and the 2021a bibliography suffix consistent with the assembled report.

### Visible plot text inventory (editing only)

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
