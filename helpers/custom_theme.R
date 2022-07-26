fn_custom_theme <- function(){
  bslib::bs_theme(
    version = "4",
    base_font = font_google("Open Sans"),
    bg = "#fff",
    fg = "#1d2d42",
    primary = "#f3d436", 
    secondary = "#1d2d42",
    success = "#1d2d42") %>% 
    bs_add_variables("border-bottom-width" = "6px",
                     "border-color" = "$primary",
                     .where = "declarations") %>% 
    bs_add_rules(sass::sass_file("www/styles.scss"))
}