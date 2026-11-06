# Key Insights from Gyódi & Nawaro (2021)

**Reference:** Gyódi, K., & Nawaro, Ł. (2021). [*Determinants of Airbnb prices in European cities: A spatial econometrics approach*](https://doi.org/10.1016/j.tourman.2021.104319). *Tourism Management, 86*, 104319.

## 1. Defining the Outcome Correctly

The dataset's `realSum` variable represents the **total advertised accommodation price in EUR for two guests staying two nights**, including reservation and cleaning fees. Thus, a €20 difference in `realSum` means a €20 difference in the *two-night offer price*—not in the nightly rate or the final transaction price. The dataset records advertised offers, not completed bookings.

The variable `person_capacity` refers to a property's **maximum guest capacity**, whereas the search is conducted for two guests. It can therefore serve as a predictor of accommodation size and configuration, but it should not be interpreted as the number of guests in the booking.

## 2. Why the `weekend × room_type` Interaction Matters

Our research question asks whether the **adjusted weekend–weekday offer-price difference varies by room type**. Simply testing the individual coefficients of `weekend` and `room_type` does not answer this question; we need their interaction.

For illustration, let $P_i = \texttt{realSum}_i$, let $W_i=1$ for a weekend offer (0 for weekday), and let $R_i=1$ for a private room (0 for an entire home/apartment). A simplified model is:

$$
E[P_i\mid W_i,R_i,Z_i,C_i]
=\alpha_{C_i}+\beta_W W_i+\beta_R R_i+\delta(W_iR_i)+\gamma^\top Z_i,
$$

where $Z_i$ contains adjustment variables and $\alpha_{C_i}$ represents a city-specific intercept. Holding city and adjustment variables constant:

$$
\Delta_{\mathrm{Entire}}=\beta_W,\qquad
\Delta_{\mathrm{Private}}=\beta_W+\delta.
$$

Consequently, **$\delta=\Delta_{\mathrm{Private}}-\Delta_{\mathrm{Entire}}$** directly measures how the adjusted weekend–weekday difference differs between the two room types. The main hypothesis is:

$$
H_0:\delta=0.
$$

This interaction-based comparison is the key analytical focus of **our project**, rather than a result established by the original paper.

**Data source:** [Authors' supplementary dataset (Zenodo)](https://zenodo.org/records/4446043).
