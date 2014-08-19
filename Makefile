# this is a simple makefile that compiles the tex file

all: .latexfile .dvipsfile .pspdffile cleanhidden

batch: .batchmode .dvipsfile .pspdffile cleanhidden

cleanhidden:
	rm -f .latexfile;\
	rm -f .dvipsfile;

clean: cleanhidden
	rm -f *.aux;\
	rm -f *.bbl;\
	rm -f *.blg;\
	rm -f *.brf;\
	rm -f *.idx;\
	rm -f *.ilg;\
	rm -f *.ind;\
	rm -f *.lof;\
	rm -f *.lot;\
	rm -f *.log;\
	rm -f *.nlo;\
	rm -f *.nls;\
	rm -f *.out;\
	rm -f *~;\
	rm -f *.backup;\
	rm -f *.toc;

clobber: clean
	rm -f *.dvi;\
	rm -f *.ps;\
	rm -f *.pdf;

.batchmode: intmode = -interaction=batchmode .latexfile
.batchmode: .latexfile

# latex
.latexfile:
	latex $(intmode) thesis;\
	latex $(intmode) thesis;\
	bibtex thesis;\
	latex $(intmode) thesis;\
	latex $(intmode) thesis;\
	makeindex thesis;\
	latex $(intmode) thesis;\
	latex $(intmode) thesis;\
	makeindex thesis.nlo  -s nomencl.ist -o thesis.nls;\
	latex $(intmode) thesis;\
	latex $(intmode) thesis;
	touch .latexfile

#dvi to ps
.dvipsfile: .latexfile
	echo "Converting to ps";\
	dvips thesis;
	touch .dvipsfile

#ps to pdf
.pspdffile: .dvipsfile
	echo "Converting to pdf";\
	ps2pdf thesis.ps;\

