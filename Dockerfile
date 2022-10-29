# Base image from https://hub.docker.com/u/rocker/
FROM rocker/shiny:4.2.1

# Install focal (Ubuntu LTS) packages
### This Rocker stack builds on Ubuntu LTS for R versions >= 4.0.0.
### For R versions <= 3.6.3, Rocker images rely on stable Debian releases.
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

# Install renv, remotes, pak, and use pak for faster package restore
RUN Rscript -e 'install.packages(c("renv", "remotes", "pak"))'
RUN Rscript -e 'options(renv.config.pak.enabled = TRUE)'
RUN Rscript -e 'renv::consent(provided = TRUE)'
RUN Rscript -e 'renv::restore()'

# Expose port
EXPOSE 4141

# run app on container start
CMD ["Rscript", "-e", "shiny::runApp('/bslib_demo_shiny', host = '0.0.0.0', port = 4141)"]