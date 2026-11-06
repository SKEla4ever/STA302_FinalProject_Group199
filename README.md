# STA302 Project: Airbnb Prices in European Cities

This repository contains the original dataset and planning notes for the STA302H1 Fall 2026 project. All project documentation, code comments, figure labels, and report content must be written in English. Preserve original source files and author names as supplied.

## Current status

- Initialized a local Git repository on branch `main` on November 3, 2026.
- Downloaded all 20 CSV files and the authors' supplementary Python script from [Zenodo record 4446043](https://zenodo.org/records/4446043).
- Verified all 21 downloads against the file sizes and MD5 checksums in the Zenodo API record.
- Inspected the CSV headers, row counts, missing-value markers, and prices.
- Reviewed both course PDFs and recorded the Part 1 requirements.
- Selected the research direction: covariate-adjusted weekend-weekday offer-price differences by room type across ten sampled European cities. See the [working research plan](../research_plan.md).
- Verified a proposed two-room-type analytical sample of 51,341 offers and the proposed model's design rank. Full literature/novelty review, R Markdown analysis, and proposal remain to be completed. No regression has been fitted.

## Repository layout

```text
data/raw/                         Original, unmodified CSV files
docs/dataset_notes.md              Dataset inventory and modelling considerations
docs/part1_requirements.md         Requirements and submission checklist
../research_plan.md               Selected question and proposed analysis design (parent folder)
references/course/                Copies of the two course PDFs
references/upstream/               Original authors' supplementary Python script
references/download_manifest.csv   Source URLs, byte sizes, and verified checksums
references/zenodo_record.json      Original Zenodo API metadata
```

Keep raw data unchanged. Create future analytical datasets separately, and record every filtering or cleaning decision in the R Markdown analysis. The archived Python script is a source reference; the required submission analysis must be in R Markdown (`.Rmd`). It has not been executed.

## Dataset at a glance

There are 51,707 offer records across 10 cities and two day types: 25,500 weekday records and 26,207 weekend records. These counts are rows, not a verified count of unique properties. Each CSV has 19 named variables and an additional unnamed index column.

The response candidate `realSum` is the total accommodation price in EUR for two people and two nights. The dataset provides both categorical and numerical predictor candidates. Dataset size and variable availability meet the basic assignment requirements, subject to the final analytical subset and a suitable, novel research question.

Read the [research plan](../research_plan.md), [Part 1 requirements](docs/part1_requirements.md), and [dataset notes](docs/dataset_notes.md) before fitting a model.

## Source and attribution

Gyódi, K., & Nawaro, Ł. (2021). *Determinants of Airbnb prices in European cities: A spatial econometrics approach (Supplementary Material)* [Data set]. Zenodo. https://doi.org/10.5281/zenodo.4446043

The Zenodo metadata specifies the Creative Commons Attribution 4.0 International license (`CC-BY-4.0`). Retain attribution when reusing the source materials. This statement describes the Zenodo materials; the course PDFs are separate course materials.

Related article: Gyódi, K., & Nawaro, Ł. (2021). Determinants of Airbnb prices in European cities: A spatial econometrics approach. *Tourism Management, 86*, 104319. https://doi.org/10.1016/j.tourman.2021.104319
