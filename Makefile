default: pdf
SRC = perrinet_curriculum-vitae
pdf: $(SRC).pdf

LATEXMK = latexmk -pdf -pdflatex=lualatex
BIBTEX = bibtex -terse

$(SRC).pdf: $(SRC).tex
	$(LATEXMK) $(SRC).tex

# macros
%.pdf: %.tex
	$(LATEXMK) $<

%.pdf: %.svg
	$(INKSCAPE) --without-gui $< --export-pdf=$@

%.png: %.svg
	$(INKSCAPE) --without-gui $< --export-png=$@ -d 450

# cleaning macro
clean:
	rm -f *.dvi *.fls *.ilg *.ind *idx *.bcf *.run.xml *.dvi *.ps *.out *.log *.aux *.bbl *.blg  *.fdb_latexmk *.snm *.nav *.toc *.info *.synctex.gz* $(SRC).pdf  *-nup.pdf

touch:
	touch *.tex

.PHONY: clean

