# Overview

This R Shiny demo relies on R Shiny modules and the following packages for "Sassy" CSS styling:

* [bslib](https://rstudio.github.io/bslib/)
  * {bslib} introduces Sass variables to Shiny making the customization process more unified and easier than the traditional _custom.css_
  * The default Bootstrap version for {bslib} is version 5, however, this app was designed using Bootstrap 4
* [thematic](https://rstudio.github.io/thematic/)
  * {thematic} provides a centralized approach to styling R graphics, particularly grubs and ggplot2 visualizations


# Updating the {bslib} Theme for any Brand 

* Configuring color and font selections can be done on `helpers/custom_theme.R`
* To change the navigation bar's brand logo, hyperlink, etc., please refer to `helpers/navbar.R`
  * The brand logo image should be stored in the `www/` folder and the image source file name referenced on `helpers/navbar.R` (row 5) should be updated
* For more advanced styling, please reference `www/styles.scss` to inspect additional Sassy CSS styling elements