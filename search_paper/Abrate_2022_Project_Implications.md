# Abrate et al. (2022): Two Implications for Our Project

**Research question:** Across the sampled European cities, does the adjusted difference between weekend and weekday offer prices vary by room type?

## A. Consider `host_portfolio` as a Control

- **Literature support:** Abrate et al. (2022) report that hosts managing more listings generally exhibit greater price variability and better listing performance. This motivates considering host portfolio size as a measure of host professionalization in our analysis.
- **Application to our project:** If host portfolio composition differs across `day_type` or `room_type` groups and is associated with offer prices, an unadjusted comparison may partly reflect differences in host composition. Including `host_portfolio` helps account for these observed differences when estimating weekend–weekday price contrasts.
- **Interpretation limit:** The paper supports considering this control; it does not establish that its coefficient must be positive or statistically significant in our model. Relationships with price variability and performance do not automatically imply a relationship with offer-price level.

## B. Interpret Results as Adjusted Offer-Price Differences

- **Data limitation:** The paper uses longitudinal data to study time-varying pricing. Our unmatched weekday and weekend offer samples do not establish price changes for the same properties. Observed differences may reflect both temporal pricing patterns and differences in which properties or hosts appear in each sample.
- **Role of controls:** Adjusting for observed listing and host characteristics helps account for measured differences in sample composition. It does not automatically remove unobserved differences or identify a causal effect.
- **Appropriate interpretation:** The `day_type × room_type` interaction addresses the difference between room types in the adjusted weekend–weekday offer-price contrast. Interpret this contrast on the model's outcome scale: with `log(price)`, it is a log-price contrast. The interaction alone does not demonstrate that the same properties changed their prices or identify the causal effect of dynamic pricing.

## Reference

Abrate, G., Sainaghi, R., & Mauri, A. G. (2022). [Dynamic pricing in Airbnb: Individual versus professional hosts](https://doi.org/10.1016/j.jbusres.2021.12.012). *Journal of Business Research, 141*, 191–199.

[Author's university publication record and abstract](https://research.uniupo.it/en/publications/dynamic-pricing-in-airbnb-individual-versus-professional-hosts-2/).

*Source scope: The literature statements above are based on the public abstract and introduction. Applications to our project are methodological interpretations, not findings directly tested in the paper.*
