# Base image from https://hub.docker.com/u/rocker/
FROM rocker/shiny:4.2.1

# Install focal (Ubuntu LTS) packages
### This Rocker stack builds on Ubuntu LTS for R versions >= 4.0.0.
### For R versions <= 3.6.3, Rocker images rely on stable Debian releases.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl-dev \
    libgdal-dev \ 
    gdal-bin \
    libgeos-dev \
    libproj-dev \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install R packages not already included in rocker/shiny image {pak}
### Full list of Ubuntu and R packages in rocker/shiny image can be found
### here: https://github.com/rocker-org/rocker-versioned2/wiki/shiny_3d52ff3c4f08
RUN R -e 'install.packages("pak")'
RUN R -e 'pak::pkg_install(c("dplyr", "purrr", "ggplot2", "showtext", "scales", "shinyWidgets", "thematic", "DT", "leaflet", "rsconnect"))'

# Make directories and copy files to the image
RUN mkdir {helpers,modules,www}
COPY ./helpers/* helpers/
COPY ./modules/* modules/
COPY ./www/* www/
COPY ./global.R /
COPY ./server.R /
COPY ./ui.R /

# Expose port (using default for Shiny server)
EXPOSE 3838

# Run app at container start
CMD ["R", "-e", "shiny::runApp(host = '0.0.0.0', port = 3838)"]