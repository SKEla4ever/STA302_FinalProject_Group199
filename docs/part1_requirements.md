# Part 1: Research Proposal Requirements

Reviewed on November 3, 2026. This is a planning checklist, not the completed proposal. The course assignment and rubric are authoritative.

## Sources

- [Assignment and rubric](../references/course/assignment_part1.pdf), 11 pages. Requirements: pages 1-5; rubric: pages 7-11.
- [Research proposal handout](../references/course/research_proposal_handout.pdf), 6 pages. Research question: page 2; literature: pages 3-5; data and ethics: page 6.

## Required stage of completion

Part 1 requires a completed preliminary multiple linear regression analysis and a research proposal grounded in literature. By submission, the group must have selected and prepared its data, fitted a preliminary model, assessed its assumptions, interpreted its results, and planned the next stage.

Identify and explain assumption violations, but do not correct them yet. The assignment reserves those corrections for the next part. The Plan section describes future model development; its proposed work does not need to be implemented for Part 1.

## Deadlines

- Original deadline: Thursday, November 5, 2026, 11:59 p.m.
- No Questions Asked (NQA) extension: Sunday, November 8, 2026, 11:59 p.m., using the separate Quercus dropbox.
- If using the NQA extension, the assignment says not to submit any documents before the original deadline. If both dropboxes receive submissions, the latest submission before the original deadline will be graded.
- No additional extensions are offered, including for corrupted submissions.

## Data and question requirements

- [ ] Use open-source data and cite the download website.
- [ ] Have at least 1,000 observations in the dataset used for analysis; verify the retained sample after filtering.
- [ ] Define one response suitable for linear regression and at least nine distinct predictor variables, including at least one categorical and one numerical predictor.
- [ ] Count a categorical variable as one predictor, regardless of how many indicator coefficients it produces.
- [ ] Include an interaction between a categorical predictor and another predictor, in addition to the required predictor set.
- [ ] If a numerical variable is categorized, justify the variable and category boundaries. Existing categorical variables are available here.
- [ ] Use a specific research question that names the predictors or meaningful predictor groups, and explain which model quantities answer it.
- [ ] Explain why linear regression is appropriate and preferable to a simpler statistical technique.
- [ ] Ensure the question is novel and different from the original usage of a repository dataset. Repeating a general study of Airbnb price determinants is not sufficient evidence of novelty.
- [ ] Document how and why the original curators collected the data. The assignment says to change datasets if this information cannot be located.
- [ ] Do not use textbook/educational datasets, Boston Housing, or Red Wine Quality.

## Proposal sections

| Section | Maximum words | Required content |
| --- | ---: | --- |
| Contributions | Excluded | List every member and describe their actual contributions. |
| Introduction | 400 | State the question; justify linear regression; identify relevant model quantities; synthesize three relevant peer-reviewed papers; explain beneficiaries and practical value. |
| Data description | 300 | Explain original data source, purpose, and collection; summarize the response and justify suitability; summarize every selected predictor in one figure/table; justify the interaction and any categorization. |
| Ethics discussion | 200 | Discuss trustworthiness, ethical collection, and appropriate reuse using the course ethics module's concepts and the dataset's ownership and provenance. |
| Preliminary results | 400, including figure/table captions | Fit the required model; present estimates with standard errors and/or confidence intervals; conduct and explain a complete residual analysis; compare results with the literature. |
| Plan | 300 | Explain future predictor inclusion/exclusion, use of context/literature, repeated assumption checks, possible transformations tied to diagnostics, and the team schedule. |
| Bibliography | Excluded | Cite all used sources in APA style, with consistent in-text citations. |

The five limited sections total at most 1,600 words; their individual limits still apply. The rubric mentions a 15-word tolerance, but plan to meet the stated limits.

## Analysis and presentation checklist

- [ ] Find three legitimate peer-reviewed academic papers and connect their findings to the response, predictors, interaction, or research gap.
- [ ] Organize the literature around ideas, findings, and limitations. The handout advises against one disconnected summary paragraph per article.
- [ ] Produce a numerical summary table covering the response and all preliminary-model predictors, with an informative caption. For categorical variables, use counts/proportions; for numerical variables, choose appropriate numerical summaries.
- [ ] Identify relevant skewness, spread, missingness, unusual values, and possible outliers. Verify actual characteristics of the chosen subset.
- [ ] Fit the preliminary multiple linear model in R with at least nine predictors and the required interaction.
- [ ] Display model estimates in a readable table or figure with standard errors and/or confidence intervals.
- [ ] Conduct a complete residual analysis, state a conclusion for each assumption/condition, and link each conclusion to evidence.
- [ ] Arrange residual plots in a grid, with two or three plots horizontally, using readable labels and axes.
- [ ] Discuss unexpected coefficient directions, magnitudes, or significance relative to the literature.
- [ ] Describe future remedies without applying them to repair the preliminary model.
- [ ] Give concrete dates and responsibilities for the later analysis, poster, and recorded presentation. Confirm final-project dates from the relevant later instructions; they are not supplied in these PDFs.
- [ ] Keep R code and raw console output out of the written proposal. Use formatted model tables/figures instead.

Implementation guidance, rather than an explicit list of plots prescribed by the assignment: consider residuals versus fitted values, a normal Q-Q plot, a scale-location plot, and leverage/influence diagnostics; assess independence using the sampling design and relevant spatial/repeated-offer information. Four default `plot(lm(...))` panels alone do not establish independence. Follow the diagnostic coverage taught in the course.

## Submission checklist

Only one group member submits all components.

- [ ] Completed Group Teamwork Agreement as PDF.
- [ ] Completed proposal as PDF.
- [ ] Reproducible R Markdown (`.Rmd`) containing all subsetting, cleaning, model fitting, summaries, figures, and residual diagnostics used in the proposal.
- [ ] Original and cleaned datasets, where appropriate, as CSVs on UofT OneDrive.
- [ ] OneDrive sharing set to "anyone in UofT with the link can access".
- [ ] Shareable OneDrive link included as a Quercus submission comment.
- [ ] Re-run the R Markdown with the supplied data and verify that the reported results and figures are reproduced.

Missing or incorrectly formatted components and inaccessible links can incur a one-mark deduction when files are accessible, or a zero for components the graders cannot access.

## Status after repository setup

Completed: source download, checksum verification, initial data inventory, and review of the assignment and handout.

Still required: finalized research question and subset, novelty check, three-paper literature synthesis, documented preprocessing, model and diagnostics in R Markdown, proposal, actual contribution statements, team agreement, and submission preparation.

The course ethics module, team agreement form, group membership, and later final-project schedule are not present in the supplied project folder. Use the actual course materials and group decisions when completing those parts.
