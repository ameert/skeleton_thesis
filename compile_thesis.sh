#!/bin/sh

latex thesis
latex thesis
bibtex thesis
latex thesis
latex thesis
makeindex thesis
latex thesis
latex thesis
makeindex thesis.nlo  -s nomencl.ist -o thesis.nls
latex thesis
latex thesis
dvips thesis
ps2pdf thesis.ps
