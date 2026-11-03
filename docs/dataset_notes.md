# Dataset Inventory and Initial Suitability Notes

Inspection date: November 3, 2026. Raw files are unchanged. These are preliminary checks, not the variable summaries or residual analysis required for the proposal.

## Download verification

Source: [Zenodo record 4446043](https://zenodo.org/records/4446043), DOI [10.5281/zenodo.4446043](https://doi.org/10.5281/zenodo.4446043).

All 20 CSVs and `models_robust.py` were downloaded: 21 files, 10,767,517 bytes in total. Each size and MD5 checksum matches the archived Zenodo API record. See [the manifest](../references/download_manifest.csv) and [source metadata](../references/zenodo_record.json). The metadata specifies `CC-BY-4.0`.

## Observed row counts

| City | Weekdays | Weekends |
| --- | ---: | ---: |
| Amsterdam | 1,103 | 977 |
| Athens | 2,653 | 2,627 |
| Barcelona | 1,555 | 1,278 |
| Berlin | 1,284 | 1,200 |
| Budapest | 2,074 | 1,948 |
| Lisbon | 2,857 | 2,906 |
| London | 4,614 | 5,379 |
| Paris | 3,130 | 3,558 |
| Rome | 4,492 | 4,535 |
| Vienna | 1,738 | 1,799 |
| **Total** | **25,500** | **26,207** |

There are 51,707 rows overall. A row is an offer record; the number of unique properties across files has not been established. Amsterdam weekends alone fails the 1,000-observation minimum. Recheck sample size after any filtering or complete-case selection.

## Observed schema and basic checks

All 20 files have the same 20 columns: an unnamed index column plus 19 named variables:

```text
realSum, room_type, room_shared, room_private, person_capacity,
host_is_superhost, multi, biz, cleanliness_rating,
guest_satisfaction_overall, bedrooms, dist, metro_dist,
attr_index, attr_index_norm, rest_index, rest_index_norm, lng, lat
```

- No empty strings or common missing-value markers (`NA`, `NaN`, `null`, `none`, `N/A`, case-insensitive) were found. This check does not establish that all values are valid or that no undocumented missing-value codes exist.
- Within each file, no exact duplicate rows were found after excluding the unnamed index. This does not establish that properties or hosts are unique within or across files.
- Observed room types are `Entire home/apt`, `Private room`, and `Shared room`. Across all files their counts are 32,648, 18,693, and 366, respectively. Shared rooms are a small group, so check the selected subset before specifying interactions.
- All observed `realSum` values are positive. Across the archive, the minimum is EUR 34.78, the median is EUR 211.34, the mean is EUR 279.88, and the maximum is EUR 18,545.45. These pooled descriptive values do not replace subset-specific summaries or regression diagnostics.

## Original collection and purpose

The [original article](https://doi.org/10.1016/j.tourman.2021.104319), Section 3.1, describes automated Selenium searches of Airbnb for two-person, two-night stays, four to six weeks ahead. Prices include reservation and cleaning fees. Weekday and weekend offers were collected separately. City boundaries and capacity limits were used to filter offers, with London restricted to Inner London. The study investigated price determinants and spatial dependence, using weekdays for its main analysis and weekends for robustness checks. Its abstract reports spatial dependence. Consult Appendix A for collection dates and further sampling details; do not treat the 2021 publication year as the observation year.

The collection details above were verified from the publisher's indexed article text. The full article/appendix has not been archived or fully reviewed here. Verify and cite the relevant methods and appendix when writing the proposal.

## Implications for this project

1. **Correct response definition.** The Zenodo description defines `realSum` as the full accommodation price in EUR for two people and two nights. Explain its unit clearly. It is an offer price, not observed revenue, an occupancy measure, or a verified transaction price.
2. **Enough predictor candidates.** For example, `room_type`, `host_is_superhost`, `person_capacity`, `bedrooms`, `cleanliness_rating`, `guest_satisfaction_overall`, `dist`, `metro_dist`, `attr_index_norm`, and `rest_index_norm` supply ten distinct candidates with categorical and numerical variables. This is an availability check, not a chosen model. Choose predictors and an interaction using the question and literature.
3. **Avoid redundant encodings.** Do not include a full `room_type` factor together with `room_shared` and `room_private` in an intercept model. Avoid using both raw and normalized versions of the same location index by default. Examine collinearity among capacity, bedrooms, ratings, and location measures.
4. **Index handling.** The leading unnamed column appears to be an exported row index. Exclude it from predictor candidates; do not assume it is a persistent property or host identifier.
5. **Analytical scope.** A single city's weekday sample is a manageable starting point and all such files have at least 1,000 rows before filtering. This is a planning suggestion, not a finalized subset. If pooling cities or day types, retain their identities and justify the pooled specification.
6. **Independence needs attention.** Similar locations, multiple offers from a host, and possible recurrence across day types can create dependence. Property and host identifiers are not provided in the schema, limiting direct matching. Do not claim independence merely because rows differ. The original study's spatial focus makes this an especially important issue to discuss.
7. **Novelty is unresolved.** The assignment requires a research question different from the original use. A focused interaction question might be a starting point, but its novelty must be checked against the original paper and additional literature before adopting it.
8. **Diagnose before remedies.** The observed price range motivates checking skewness, heteroskedasticity, nonlinearity, and influence. Extreme values alone do not prove errors or justify deletion. For Part 1, document violations and reserve corrective model changes for the next stage, as instructed.
9. **Ethics requires evidence.** Public availability and a reuse license do not establish consent, representativeness, or ethical collection. Consider web-scraping provenance, selection of available offers, ratings and platform biases, location privacy, and appropriate aggregate reporting, using the course ethics module.

## Information still needed

- A specific research question, literature-supported interaction, and confirmed novelty.
- Verified collection dates and finer sampling/filtering details from the article appendix.
- Course ethics terminology and materials.
- A final analytical subset, all selected-variable summaries, preprocessing decisions, and the preliminary R model with complete diagnostics.
