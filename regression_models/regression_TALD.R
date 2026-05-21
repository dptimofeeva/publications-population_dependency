library(tidyverse)
library(ggeffects)
library(car)
library(ggplot2)
library(ggrepel)

df <- read_csv("results_TALD.csv")

model <- lm(log_pub ~ log_census * branch, data = df)

summary(model)

# График
branch_colors <- c(
  "Lezgic" = "#008000",
  "Nakh" = "#4F311C",
  "Dargwic" = "#FF8200",
  "Avar-Andic" = "#0000FF",
  "Tsezic" = "#ed1d24",
  "Khinalug" = "#F2D4D7",
  "Lak" = "#ffc0cb"
)


pred_all <- ggpredict(model, terms = c("log_census", "branch"))
pred_df <- as.data.frame(pred_all)

pred_lines <- pred_df %>% filter(!group %in% c("Khinalug", "Lak"))

p_multi <- ggplot() +
  geom_line(data = pred_lines, aes(x = x, y = predicted, color = group), linewidth = 1) +
  geom_point(data = df, aes(x = log_census, y = log_pub, color = branch), 
             size = 3, alpha = 0.8) +
  geom_text_repel(data = df, 
                  aes(x = log_census, y = log_pub, label = lang, color = branch),
                  size = 4,
                  max.overlaps = 20,
                  box.padding = 0.2,
                  point.padding = 0.3,
                  force = 2,
                  seed = 123) +
  scale_color_manual(values = branch_colors, name = "Ветвь") +
  labs(
    x = "log_census", 
    y = "log_pub"
  ) +
  coord_cartesian(
    xlim = c(2, 6.5),
    ylim = c(0, 3)
  ) +
  theme_minimal() +
  theme(
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.title = element_text(size = 14),
    legend.text = element_text(size = 12),
  )


print(p_multi)