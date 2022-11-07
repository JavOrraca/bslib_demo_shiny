# Overarching bslib theme
fn_custom_theme <- function() {
  bslib::bs_theme(
    version = "4",
    base_font = sass::font_google("Open Sans"),
    bg = "#ffffff",
    fg = "#1d2d42",
    primary = "#f3d436", 
    secondary = "#1d2d42",
    success = "#1d2d42") |> 
    bs_add_variables("border-bottom-width" = "6px",
                     "border-color" = "$primary",
                     .where = "declarations") |> 
    bs_add_rules(sass::sass_file("www/styles.scss"))
}

# Thematic theme for ggplot2 outputs
fn_thematic_theme <- function() {
  thematic::thematic_theme(
    bg = "#ffffff",
    fg = "#1d2d42",
    accent = "#f3d436",
    font = font_spec(sass::font_google("Open Sans"), scale = 1.75)
  )
}