library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)

df <- read_excel('publications_metadata.csv')

all_years <- 1810:2024

pub_counts <- table(factor(df$date, levels = all_years))
pub_counts_cumsum <- cumsum(as.numeric(pub_counts))

df_all_pub <- data.frame(
  date = all_years,
  count = pub_counts_cumsum
)

p <- ggplot(df_all_pub, aes(x = date, y = count)) +
  geom_line(linewidth = 1.5, alpha = 0.9, color = "black") +
  labs(x = "Год",
       y = "Количество публикаций") +
  theme_minimal() +
  theme(
    axis.title.x = element_text(size = 16),
    axis.title.y = element_text(size = 16),
    
    axis.text.x = element_text(size = 16),
    axis.text.y = element_text(size = 16),
  ) +
  scale_x_continuous(breaks = seq(1810, 2024, by = 20))

ggsave("pub_by_year.png", plot = p, width = 16, height = 10, dpi = 300)

print(p)