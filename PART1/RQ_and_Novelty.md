# Research Question and Novelty

Date: November 3, 2026  
Scope: confirm the research question, its target contrast, and its distinction from the original use of the data. No regression has been fitted for this step.

## 1. Decision

**Retain this question as a focused extension of the original study, with a clearly specified estimand.** The proposed contribution is a direct estimate and test of whether the adjusted weekend-weekday offer-price difference differs between two room types. Novelty is incremental and relative to the original analytical purpose; it is not a claim of being the first study of weekend pricing or room-type differences.

The question is defined below. Whether the adjusted differences actually vary by room type remains an empirical question for the later regression analysis.

## 2. Confirmed research question

> Across the ten sampled European cities, does the covariate-adjusted difference between weekend and weekday offer prices differ between entire homes/apartments and private rooms, after accounting for city, listing size, guest ratings, Superhost status, location, and host portfolio size?

Working title: **Adjusted Weekend-Weekday Offer-Price Differences by Room Type in Ten European Cities**.

| Component | Operational definition |
| --- | --- |
| Response | `realSum`: total accommodation offer price in EUR for two people and two nights; not a nightly rate or observed transaction price. See the [authors' data documentation](https://zenodo.org/records/4446043). |
| Main comparison | Weekend minus weekday price, calculated separately for `Entire home/apt` and `Private room`. |
| Central question | Whether those two adjusted differences are equal. |
| Day type | Derived from the original filenames. The searches refer to Tuesday-Thursday stays and Friday-Sunday stays, respectively (Gyódi & Nawaro, 2021, Section 3.1). |
| Geographic scope | Amsterdam, Athens, Barcelona, Berlin, Budapest, Lisbon, London, Paris, Rome, and Vienna. |
| Time scope | The sampled 2019 stay dates, not the article's 2021 publication year or the current market (Gyódi & Nawaro, 2021, Appendix A, Table A.1). |
| Observation | An available-offer record; the files do not establish a matched panel of unique properties. |

These definitions make the question narrower than either “Are weekends more expensive?” or “Are entire homes more expensive than private rooms?” It asks whether the association between day type and price varies by room type, conditional on the specified covariates.

### Analytical sample

Use the two room types selected in the [existing research plan](research_plan.md). Exclude `Shared room` offers to define this two-type target before examining regression results. This is a scope restriction, not removal of inconvenient observations.

The following counts were rechecked directly from all 20 local CSVs on November 3, 2026:

| Day type | Entire home/apt | Private room | Total |
| --- | ---: | ---: | ---: |
| Weekdays | 15,994 | 9,326 | 25,320 |
| Weekends | 16,654 | 9,367 | 26,021 |
| **Total** | **32,648** | **18,693** | **51,341** |

The restriction excludes 366 shared-room records from 51,707 original rows. All 40 city-by-day-type-by-room-type cells are populated; the smallest has 180 offers. These counts establish basic comparison feasibility, not covariate overlap or independent observations.

## 3. What “adjusted difference” means

Let `W = 1` denote weekend and `W = 0` weekday; let `R = 1` denote `Entire home/apt` and `R = 0` denote `Private room`. Let `c` identify city and `X` contain the adjustment covariates. Define:

\[
\mu(c,w,r,x)=E[\text{realSum}\mid c,W=w,R=r,X=x].
\]

At the same city and covariate values, the room-specific contrasts are:

\[
\Delta_{\mathrm{private},c}(x)=\mu(c,1,0,x)-\mu(c,0,0,x),
\]

\[
\Delta_{\mathrm{entire},c}(x)=\mu(c,1,1,x)-\mu(c,0,1,x).
\]

The target is their difference:

\[
\delta=\Delta_{\mathrm{entire},c}(x)-\Delta_{\mathrm{private},c}(x).
\]

Under the preliminary model below, this contrast is constrained to be common across cities and covariate values. Its unit is **EUR per two-person, two-night stay**, not a percentage.

- `delta > 0`: the weekend-weekday contrast is more positive for entire homes/apartments.
- `delta < 0`: it is more positive for private rooms.
- `delta = 0`: the two room types have equal adjusted contrasts under the model.

A positive `delta` does not imply that both room types have higher weekend prices. Also, comparing whether two separate coefficients are individually significant does not test whether they differ.

### Model quantities that answer the question

Preserve the preliminary specification in the existing research plan:

```r
realSum ~
  city * day_type +
  city * room_type +
  day_type * room_type +
  person_capacity + bedrooms +
  cleanliness_rating + guest_satisfaction_overall +
  host_is_superhost + dist + metro_dist +
  attr_index_norm + host_portfolio
```

Here, `host_portfolio` is the planned three-level factor derived from `multi` and `biz`: single offer, 2-4 offers, and 5+ offers. It measures reported portfolio size, not verified business registration. The specification has twelve distinct main predictors, including categorical and numerical predictors, plus the required interaction. Redundant room-type indicators and portfolio flags should not also enter this model.

With weekdays and private rooms as reference levels, this is:

\[
\mu(c,W,R,X)=\alpha_c+\tau_cW+\rho_cR+\delta WR+\beta^\top X.
\]

Thus the private-room contrast is `tau_c`, the entire-home contrast is `tau_c + delta`, and the `day_type:room_type` coefficient is the central contrast `delta`. Test the two-sided hypothesis `H0: delta = 0` against `H1: delta != 0`; report the estimate and its 95% confidence interval, together with the room-specific contrasts. Interpret their magnitude as well as statistical evidence.

“Across cities” means a pooled analysis allowing city-specific day-type and room-type baselines. It does not ask whether the interaction itself differs among cities: that would require a three-way interaction and a different target hypothesis. Other covariate slopes are also pooled.

Multiple linear regression addresses adjustment and the interaction simultaneously. An unadjusted comparison of means or separate two-sample tests would not estimate the specified conditional contrast. Suitability of the preliminary raw-price model still requires diagnostics; changing to log price later would change the estimand and require revised interpretation.

## 4. Evidence on the original use and the distinction

The original article is Gyódi and Nawaro (2021), [*Determinants of Airbnb prices in European cities: A spatial econometrics approach*](https://doi.org/10.1016/j.tourman.2021.104319).

| Evidence checked | What it establishes |
| --- | --- |
| Article hypotheses and conclusions | The central purpose concerns location-related price determinants and spatial dependence. |
| Section 3.1 and Table 1 | Weekdays supply the main analysis; weekends supply robustness data. Room type is already a predictor, and the response is log price. |
| Section 4.3, referring to Fig. B1 | Selected coefficients are compared between weekday and weekend samples. Temporal coefficient comparisons therefore already appear in the study. |
| [Archived supplementary code](STA302_FinalProject_Group199-1/references/upstream/models_robust.py), `total_results()` | The function loops over cities and day types, reads a separate CSV for each combination, and defaults to `log_realSum`. Its supplied specification contains room-type indicators but no pooled `day_type:room_type` term. |

**Our distinction is the primary estimand:** a pooled, directly tested difference between the two adjusted weekend-weekday contrasts in absolute EUR. That is a focused extension, not merely reuse of the weekend files. A change from Python to R or from separate files to one combined table would not itself establish novelty.

There is substantive overlap: a change in the entire-private price gap across day types and a difference in the room-specific weekend-weekday contrasts are algebraically related on the same outcome scale. Accordingly, the interaction must not be presented as a wholly unrelated idea or an untouched topic. A different outcome scale and a direct inferential target sharpen the contribution but do not establish literature-wide priority.

**Evidence boundary:** article claims were checked against the publisher's indexed text, including Sections 3.1 and 4.3 and Table A.1. The Fig. B1 image was not independently inspected. The supplied code was read, not executed. This review supports a different analytical objective from the original main study; it does not prove that no related contrast occurs anywhere in its appendices or the broader literature.

## 5. Novelty statement for the proposal

> We extend the original spatial-pricing analysis by treating the room-type difference in adjusted weekend-weekday offer-price contrasts as the primary estimand. Using entire-home/apartment and private-room offers from ten sampled European cities, we will estimate this interaction in EUR while allowing city-specific day-type and room-type baselines and adjusting for listing, host, rating, and location characteristics. The contribution is a focused comparison with uncertainty, rather than a claim that weekend or room-type pricing has not previously been studied.

## 6. Interpretation limits and checklist status

The target is an adjusted association in the sampled offers. There are no reliable property or host identifiers for matching or clustering. Different availability, unmeasured listing characteristics, possible repeated properties/hosts, spatial dependence, and the limited search dates constrain interpretation. City adjustment does not resolve all of these issues. This is not a causal weekend effect, a within-property price-change analysis, or a causal difference-in-differences design.

The comparison may help describe whether the sampled weekend-weekday budget difference varies by accommodation type. It cannot establish a current booking-saving rule, optimal host prices, revenue effects, or results for all European cities.

- [x] Specify the response, price unit, two room types, and sampled scope.
- [x] Define the adjusted contrast and the interaction that answers the question.
- [x] Confirm basic sample support for the two-type comparison.
- [x] Document the original purpose, existing weekend robustness comparisons, and the limited extension proposed here.
- [x] State the city-pooling assumption and avoid causal or first-ever claims.
- [ ] Complete the separate three-paper literature synthesis required for the proposal; this document does not replace it.
- [ ] Fit the preliminary model and assess assumptions before answering the empirical question.

This completes the research-question definition and the bounded comparison with the original use. It does not mark the full proposal, literature review, or statistical analysis as complete.

## References and project context

Gyódi, K., & Nawaro, Ł. (2021). Determinants of Airbnb prices in European cities: A spatial econometrics approach. *Tourism Management, 86*, 104319. [https://doi.org/10.1016/j.tourman.2021.104319](https://doi.org/10.1016/j.tourman.2021.104319). Relevant locations: Section 3.1, Table 1, Section 4.3, and Appendix A, Table A.1.

Gyódi, K., & Nawaro, Ł. (2021). *Determinants of Airbnb prices in European cities: A spatial econometrics approach (Supplementary Material)* [Data set and code]. Zenodo. [https://doi.org/10.5281/zenodo.4446043](https://doi.org/10.5281/zenodo.4446043).

Project context: [Part 1 checklist](STA302_FinalProject_Group199-1/docs/part1_requirements.md), [existing research plan](research_plan.md), and [dataset notes](STA302_FinalProject_Group199-1/docs/dataset_notes.md). This document records the current question and novelty assessment; the older notes describe novelty as outstanding. The course assignment's repository-data novelty requirement appears on page 3, with the research-question and literature criteria on page 7 of the [assignment PDF](STA302_FinalProject_Group199-1/references/course/assignment_part1.pdf).

