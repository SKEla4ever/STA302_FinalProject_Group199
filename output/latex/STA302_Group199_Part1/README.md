# STA302 Group 199 Part 1 LaTeX source

Open `main.tex` as the root document. The ZIP is self-contained: all section
files, the fixed bibliography, and the four used PNG images are included.

## Compilation

No LaTeX compilation was run and no PDF or build products are included.
When you choose to compile, use pdfLaTeX (for example, on Overleaf) and compile
twice so cross-references resolve. No BibTeX/Biber step is required.
All packages are standard TeX Live/Overleaf packages; no shell escape, custom
fonts, absolute paths, data files, or R installation are required.

## Manual completion

- Fill `sections/00_contributions.tex` with each member's name and actual work.
  The heading is present, but its body is deliberately blank at your request.
- The bibliography retains exactly the three references supplied in the Word
  file. The dataset DOI is an explicit hyperlink in the data description. The
  assignment asks for the data source to have a bibliography citation; the
  supplied bibliography has no separate Zenodo dataset entry. This has been
  flagged here rather than adding an entry against your instruction.
- The schedule and its stated December 3 deadline were supplied in the Word
  file; check the deadline against your current course materials.
- Submit the teamwork agreement, Rmd (with its required helper), and CSV data
  link separately as the assignment requires. This ZIP is the proposal source.

## Assembly notes

- Introduction and ethics come from `Sta302 project script.docx`; only citation
  markup, mathematical typography, a small grammar correction, and whitespace
  were normalized. The plan was shortened to allow for its embedded schedule's
  visible words; its statistical methods, dates, and named responsibilities
  remain. The schedule PNG was extracted without changing it.
- Data description comes from `PART1/Data_Description.md`. Editing notes are
  excluded. The Zenodo DOI is linked, and 2021a/2021b suffixes were reconciled
  with the single Gyodi and Nawaro entry in the supplied final bibliography.
- Preliminary results come from `PART1/Preliminary_Results_V2.md`. All 41
  estimates and SEs match `tables/coefficients.csv` to the displayed precision.
  All three specified diagnostic images are copied unchanged. No data, model,
  numerical result, or diagnostic image was recalculated or altered.
- Tables and figures use automatic numbering and LaTeX cross-references.
  Expected numbers are Tables 1–2 and Figures 1–4 (schedule is Figure 4).
- No source DOCX, Markdown, analysis, or image file was modified.

## Word-count review

These are source-based checks, not a compiled-PDF word-count guarantee.
Introduction: 397 supplied prose words, plus the heading. Ethics: 190 supplied
prose words, plus the two-word heading. Data description: the source notes
record 278 words including its table (294 with compound splitting); the linked
DOI adds no printed words. Preliminary results: its source audit records 388
chargeable words (400 with compound splitting), including figure text and
captions, excluding the 82 numerical coefficient/SE entries under the prior
instructor clarification recorded in the supplied notes. The transferred
wording and image content are retained. Revised plan: 231 whitespace-
separated words including heading, caption, figure number and all visible
schedule text (excluding the purely graphical vertical separator).

Numerical table entries follow the instructor clarification recorded in the
project's editing notes. Verify the course's counting convention after your
manual edits, particularly for the results section near its limit.

## Checks performed without compiling

TeX source lint, balanced environments/braces, resolved input/image paths,
defined cross-references and citations, unchanged image hashes, a match of all
41 displayed estimate/SE pairs against the saved coefficient table, and ZIP
integrity. Source checks cannot verify final pagination or typeset layout.
