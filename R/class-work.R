
## tbl summary with region, race/ethnicity, income, sleep_weekday, sleep
library(tidyverse)
library(gtsummary)

tbl_summary(
	nlsy,
	include = c(race_eth_cat,region_cat,
							income, starts_with("sleep")),

	label = list(
		race_eth_cat ~ "Race/ethnicity",
		region_cat ~ "Region",
		sleep_wkdy ~ "# of sleep in weekdays",
		sleep_wknd ~ "# of sleep in weekends",
		missing_text = "Missing"
	))

tbl_summary(
	nlsy,
	by = sex_cat,
	include = c(race_eth_cat,region_cat,
							income, starts_with("sleep")),

	label = list(
		race_eth_cat ~ "Race/ethnicity",
		region_cat ~ "Region",
		sleep_wkdy ~ "# of sleep in weekdays",
		sleep_wknd ~ "# of sleep in weekends"
	),
	missing_text = "Missing") |>
	add_p(test = list(all_continuous() ~ "t.test",
										all_categorical() ~ "chisq.test")) |>
		add_overall(col_label = "**Total**") |>
	bold_labels() |>
	modify_footnote(update = everything() ~ NA) |>
	modify_header(label = "**Variable**", p.value = "**P**")


	statistic = list(
	              income ~ "{p10}; {p90}",
	              starts_with(sleep) ~ {min}, {max}"
	),

digits = list(
	income =3,
	start_with("sleep") ~ 1

	))




