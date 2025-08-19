# Makefile
#
# This Makefile is used to compile LaTeX documents into PDF and PNG formats.
#
# Date: 2025-08-19
# Author: Githubonline1396528 <yyg249942899@163.com>
# License: MIT License

# Defines LaTeX compiler and flags.
# The compiler is set to xelatex.
LATEX_COMPILER = latexmk
LATEX_FLAGS = -xelatex

# Defines the target name and example file name.
# The target name is the main LaTeX file to be compiled.
TARGET_NAME = main
EXAMPLE_FILE = example

.PHONY: clean

all: $(TARGET_NAME).pdf $(TARGET_NAME).png

pdf: $(TARGET_NAME).pdf

$(TARGET_NAME).pdf: $(TARGET_NAME).tex
	@echo "Compiling $(TARGET_NAME).tex to PDF..."
	@echo "Using compiler: $(LATEX_COMPILER)"
	@echo "Using flags: $(LATEX_FLAGS)"
	@$(LATEX_COMPILER) $(LATEX_FLAGS) $<

example: $(EXAMPLE_FILE).pdf $(EXAMPLE_FILE).png

$(EXAMPLE_FILE).png: $(EXAMPLE_FILE).pdf
	@python -u build_image.py --file=$(EXAMPLE_FILE).pdf

$(EXAMPLE_FILE).pdf: $(EXAMPLE_FILE).tex
	@echo "Compiling $(EXAMPLE_FILE).tex to PDF..."
	@echo "Using compiler: $(LATEX_COMPILER)"
	@echo "Using flags: $(LATEX_FLAGS)"
	@$(LATEX_COMPILER) $(LATEX_FLAGS) $<

png:

$(TARGET_NAME).png:
	@python -u build_image.py --file=$(TARGET_NAME).pdf

clean clear:
	@echo "Performing $@ operation..."
	@rm -f *.aux *.log *.out *.toc *.synctex.gz *.fdb_latexmk *.fls \
		*.pdfsync *.bbl *.bcf *.run.xml *.blg *.idx *.ilg *.ind *.lof \
		*.lot *.glo *.acn *.acr *.alg *.glg *.gls *.ist *.xdy *.xdv \
		*.dvi *.ps *.eps *.ppm
	@if [ "$@" = "clean" ]; then rm -f *.pdf *.png; fi
	@echo "$@ operation complete."

