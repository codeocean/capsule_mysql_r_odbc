# hash:sha256:858a233fbf16c4fdac2151711dd7597c3ede960a2624d45dcc1905d152b128b9
FROM registry.apps.codeocean.com/codeocean/py-r:python3.10-R4.2.2-IRkernel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20230311ubuntu0.22.04.1 \
        unixodbc=2.3.9-5 \
        unixodbc-dev=2.3.9-5 \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'options(repos = c(CRAN = "http://cran.us.r-project.org"), download.file.method = "libcurl")' >> $(Rscript -e 'cat(R.home())')/etc/Rprofile.site
RUN Rscript -e 'remotes::install_version("DBI", "1.1.3")' \
    && Rscript -e 'remotes::install_version("markdown", "1.7")' \
    && Rscript -e 'remotes::install_version("odbc", "1.3.4")'

COPY postInstall /
RUN /postInstall
