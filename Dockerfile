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

## Update system libraries
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Install specific package versions not already on the rocker/shiny image
### Full list of Ubuntu and R packages in rocker/shiny image can be found
### here: https://github.com/rocker-org/rocker-versioned2/wiki/shiny_3d52ff3c4f08
RUN Rscript -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("shiny", version = "1.7.3")'
RUN Rscript -e 'remotes::install_version("dplyr", version = "1.0.10")'
RUN Rscript -e 'remotes::install_version("purrr", version = "0.3.5")'
RUN Rscript -e 'remotes::install_version("ggplot2", version = "3.3.6")'
RUN Rscript -e 'remotes::install_version("showtext", version = "0.9-5")'
RUN Rscript -e 'remotes::install_version("scales", version = "1.2.1")'
RUN Rscript -e 'remotes::install_version("shinyWidgets", version = "0.7.4")'
RUN Rscript -e 'remotes::install_version("thematic", version = "0.1.2.1")'
RUN Rscript -e 'remotes::install_version("DT", version = "0.26")'
RUN Rscript -e 'remotes::install_version("leaflet", version = "2.1.1")'
RUN Rscript -e 'remotes::install_version("rsconnect", version = "0.8.28")'

# Make directories and copy files to the image
RUN mkdir {helpers,modules,www}
COPY helpers/* helpers/
COPY modules/* modules/
COPY www/* www/
COPY global.R /
COPY server.R /
COPY ui.R /

# Expose port (using default for Shiny server)
EXPOSE 3838

# Run app at container start
CMD ["R", "-e", "shiny::runApp(host = '0.0.0.0', port = 3838)"]