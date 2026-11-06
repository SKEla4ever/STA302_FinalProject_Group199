# Two Key Insights for Our Airbnb Project

**Research question:** Across the sampled European cities, does the adjusted difference between weekend and weekday offer prices vary by room type?

- **Different significance results do not establish a significant difference between coefficients.**

  Suppose two groups have the following hypothetical estimates (these are illustrative, not findings from the paper):

  $$
  \hat\beta_A=0.20,\quad p_A=0.04;
  \qquad
  \hat\beta_B=0.18,\quad p_B=0.12.
  $$

  These p-values separately test $H_0:\beta_A=0$ and $H_0:\beta_B=0$. They do not test the hypothesis relevant to a comparison between groups:

  $$
  H_0:\beta_A-\beta_B=0.
  $$

  **Implication for our project:** A significant weekend coefficient for entire homes and a non-significant weekend coefficient for private rooms would not, by itself, establish that their adjusted weekend–weekday price differences differ. We should directly test the difference using an interaction coefficient, rather than compare the two p-values.

- **The `day_type × room_type` interaction directly represents our research question.**

  Voltes-Dorta and Sánchez-Medina (2020, Section 3.2 and Table 5) allow pricing associations to vary by property or room type through interaction terms. This provides methodological motivation for examining whether the weekend–weekday association varies by room type; their seasonal comparison does not directly establish a weekend effect.

  Let $P_i=\texttt{realSum}_i$ be the raw advertised offer price in EUR, $D_i=1$ for weekend and $0$ for weekday, and $R_i=1$ for private room and $0$ for entire home/apartment. Consider:

  $$
  E(P_i\mid D_i,R_i,C_i,\mathbf Z_i)
  =\alpha_{C_i}+\beta_DD_i+\beta_RR_i
  +\beta_{DR}D_iR_i+\boldsymbol\gamma^\top\mathbf Z_i,
  $$

  where $\alpha_{C_i}$ is a city-specific intercept and $\mathbf Z_i$ contains the adjustment variables. Holding city and these variables fixed, the adjusted weekend–weekday differences are

  $$
  \Delta_{\text{entire}}=\beta_D,
  \qquad
  \Delta_{\text{private}}=\beta_D+\beta_{DR}.
  $$

  Therefore,

  $$
  \boxed{\beta_{DR}=\Delta_{\text{private}}-\Delta_{\text{entire}}.}
  $$

  **Implication for our project:** Testing $H_0:\beta_{DR}=0$ against $H_A:\beta_{DR}\neq0$ directly evaluates whether the adjusted weekend–weekday price difference varies by room type. The coefficient is measured in EUR per offer: a negative value indicates a smaller difference for private rooms. This specification assumes a common interaction across cities and describes an adjusted association, not a causal effect.

## Reference

Voltes-Dorta, A., & Sánchez-Medina, A. (2020). Drivers of Airbnb prices according to property/room type, season and location: A regression approach. *Journal of Hospitality and Tourism Management, 45*, 266–275. [https://doi.org/10.1016/j.jhtm.2020.08.015](https://doi.org/10.1016/j.jhtm.2020.08.015).
