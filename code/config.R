#!/usr/bin/env Rscript
system("set -ex")
 
## Passing Args
args <- commandArgs(trailingOnly=TRUE)
 
if (length(args) == 0 || (nchar(args[1])==0)) {
    HOST <- "jsnedecor-mysql.cm7kuqeedvj0.us-east-1.rds.amazonaws.com"
} else {
    HOST <- args[1]
}

if (length(args) == 0 || (nchar(args[2])==0)) {
    DATABASE <- "sakila"
} else {
    DATABASE <- args[2]
}

# Database credentials. These must be set in "secrets" in the environment
DATABASE_USERNAME <- Sys.getenv(c("DATABASE_USERNAME"))
DATABASE_PASSWORD <- Sys.getenv(c("DATABASE_PASSWORD"))