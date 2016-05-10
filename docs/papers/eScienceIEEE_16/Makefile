REFSIZE='\\small'

all: escience.pdf

escience.pdf: escience.tex *.tex
	pdflatex $<
	bibtex  escience
	perl -i -p -e 's|^(\\begin{thebibliography}{.*})$$|$$1\n\n'$(REFSIZE)'|' escience.bbl
	pdflatex $<
	pdflatex $<
	#pdflatex $<
	#dvipdf escience
	rm escience.aux escience.log 
	rm escience.blg escience.bbl 

ieee: escience.tex *.tex
	latex $<
	bibtex  escience
	latex $<
	latex $<
	dvips -Ppdf -G0 -tletter escience.dvi -o escience.ps
	#dvips -Ppdf escience.dvi -o escience.ps
	ps2pdf -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress escience.ps escience.pdf
	#ps2pdf escience.ps escience.pdf
	rm escience.dvi escience.ps
	rm escience.aux escience.log 
	rm escience.blg escience.bbl 

clean:
	rm escience.aux escience.log escience.blg escience.bbl 
	rm escience.pdf 
	rm escience.ps escience.dvi 
