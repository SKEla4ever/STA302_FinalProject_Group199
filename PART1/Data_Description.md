# Data description

Gyódi and Nawaro’s (2021a, 2021b) open Zenodo dataset was collected to study Airbnb price determinants, especially location and spatial dependence. Selenium searches captured offers for two guests and two nights, four to six weeks before selected 2019 stays. Separate samples covered Tuesday–Thursday and Friday–Sunday.

Excluding 366 shared-room offers from 51,707 records leaves 51,341 observations. The response, `realSum`, is advertised accommodation price, including reservation and cleaning fees. Its continuity supports modelling mean EUR differences, although spatial dependence and possible repeated properties/hosts challenge independence; identifiers are unavailable. Mean price exceeds the €212.23 median, indicating right skew.

Accommodation types may attract different weekday and weekend travellers, motivating `day_type × room_type` to test whether their adjusted price contrasts differ. City-by-day-type and city-by-room-type interactions allow geographical variation. `city` and `day_type` follow filenames. `host_portfolio` combines `multi` and `biz`, preserving their categories.

Table 1. Numerical summaries: mean (SD); minimum to maximum. 
Categories: percentages. No missing values; ratings approach their ceilings. High prices and ten bedrooms warrant checking.

| Variable | Summary |
| --- | --- |
| `realSum` (EUR; response) | 280.85 (328.84); 34.78 to 18,545.45 |
| `person_capacity` (maximum guests) | 3.16 (1.30); 2 to 6 |
| `bedrooms` (0 denotes studios) | 1.16 (0.63); 0 to 10 |
| `cleanliness_rating` (0–10) | 9.39 (0.95); 2 to 10 |
| `guest_satisfaction_overall` (0–100) | 92.65 (8.93); 20 to 100 |
| `dist` (city centre; km) | 3.19 (2.39); 0.02 to 25.28 |
| `metro_dist` (nearest metro; km) | 0.68 (0.86); <0.01 to 14.27 |
| `attr_index_norm` (within-city attraction accessibility; 0–100) | 13.43 (9.81); 0.93 to 100 |
| `city` | Amsterdam 4.03%; Athens 10.26%; Barcelona 5.49%; Berlin 4.70%; Budapest 7.81%; Lisbon 11.08%; London 19.37%; Paris 12.84%; Rome 17.56%; Vienna 6.86% |
| `day_type` | weekdays 49.32%; weekends 50.68% |
| `room_type` | Private room 36.41%; Entire home/apt 63.59% |
| `host_is_superhost` | Yes 25.69%; no 74.31% |
| `host_portfolio` (offers) | Single offer 35.96%; 2–4 29.20%; 5+ 34.84% |

## Editing notes (exclude from the submitted section)

- The instructor clarification supplied in chat confirms that tables and figures count toward the section limit.
- Complete submitted section: 278 words, including the heading, prose, caption, table headings, labels, categories, and numerical entries, counting rendered whitespace-separated words. Splitting hyphenated terms, slashes, and ranges gives 294 words; both counts remain below 300. Markdown table borders and separator rows are formatting, not words.
- Check the final count after transferring the section into the group report; exclude these editing notes.
- All 12 predictors and the response remain summarized in one table. Numerical entries report mean, SD, minimum, and maximum; categorical entries report every level's percentage. The price median is supplied in the prose. Percentages may differ slightly from 100 because of rounding.
- The normalized attraction index is relative within each city. The metro minimum is positive and below 0.01 km; it is not zero.
- Collection protocol: original article, Section 3.1; 2019 dates and original filtering: Appendix A, Tables A.1–A.2. Supporting source links remain in chat, outside the draft. Keep the 2021a/2021b bibliography suffixes consistent with the full report.
- Variable labels use the actual model column names. `city` and `day_type` are derived from filenames; `host_portfolio` is derived from the original `multi` and `biz` indicators.
- The interaction rationale is a substantive hypothesis about differing traveller demand, not an observed demand finding. No extra graph is required by the instructor clarification supplied in chat.
- No data or model changes were made
