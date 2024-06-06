# Main LaTeX file without the extension
MAIN = main

# Compiler and options
LATEXMK = latexmk
LATEXMKOPTS = -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make

.PHONY: pdf clean draft roboto

# Default target to create the final document
pdf:
	$(LATEXMK) $(LATEXMKOPTS) $(MAIN)

# Draft compilation with draft document class option
draft:
	$(LATEXMK) $(LATEXMKOPTS) -pdflatex="pdflatex -interaction=nonstopmode -shell-escape -jobname=$(MAIN) '\def\IsDraft{}\input{$(MAIN)}'" $(MAIN)

roboto:
	$(LATEXMK) $(LATEXMKOPTS) -pdflatex="pdflatex -interaction=nonstopmode -shell-escape -jobname=$(MAIN) '\def\IsRoboto{}\input{$(MAIN)}'" $(MAIN)

# Clean up auxiliary files
clean:
	$(LATEXMK) -C
	rm -f $(MAIN).bbl $(MAIN).blg $(MAIN).bcf $(MAIN).run.xml $(MAIN)-blx.bib $(MAIN).aux.lock

