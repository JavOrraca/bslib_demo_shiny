# Base image from https://hub.docker.com/r/rstudio/r-base
FROM rstudio/r-base:4.2.2-focal

# Install Ubuntu Focal packages, run updates, clean 
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    zlib1g-dev \
    libpng-dev \
    libgdal-dev \
    gdal-bin \
    libgeos-dev \
    libproj-dev \
    libsqlite3-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get upgrade -y && apt-get clean

## Copy renv lockfile to root
COPY renv.lock /

# Install specific package versions from renv lockfile (renv.lock)
RUN Rscript -e 'install.packages(c("renv", "remotes", "pak"), repos = c(RSPM = "https://packagemanager.rstudio.com/cran/latest", CRAN = "https://cloud.r-project.org"))'
RUN Rscript -e 'options(renv.config.pak.enabled = TRUE)'
RUN Rscript -e 'renv::consent(provided = TRUE)'
RUN Rscript -e 'renv::restore(repos = c(RSPM = "https://packagemanager.rstudio.com/cran/latest", CRAN = "https://cloud.r-project.org"))'

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