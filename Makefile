# Makefile

# Defines LaTeX compiler and flags.
# The compiler is set to xelatex.
LATEX_COMPILER = latexmk
LATEX_FLAGS = -xelatex -pdf

# Defines the target name and example file name.
# The target name is the main LaTeX file to be compiled.
TARGET_NAME = main
EXAMPLE_FILE = example

.PHONY: clean

example: $(EXAMPLE_FILE).pdf $(EXAMPLE_FILE).png

$(EXAMPLE_FILE).png: $(EXAMPLE_FILE).pdf
	@python -u build_image.py --file=$(EXAMPLE_FILE).pdf

$(EXAMPLE_FILE).pdf: $(EXAMPLE_FILE).tex
	@$(LATEX_COMPILER) $(LATEX_FLAGS) $<

pdf: $(TARGET_NAME).pdf

$(TARGET_NAME).pdf: $(TARGET_NAME).tex
	@$(LATEX_COMPILER) $(LATEX_FLAGS) $<

clean clear:
	@echo "Performing $@ operation..."
	@rm -f *.aux *.log *.out *.toc *.synctex.gz *.fdb_latexmk *.fls *.pdfsync \
		   *.bbl *.bcf *.run.xml *.blg *.idx *.ilg *.ind *.lof *.lot *.glo \
		   *.acn *.acr *.alg *.glg *.gls *.ist *.xdy *.xdv *.dvi *.ps *.eps \
		   *.ppm
	@if [ "$@" = "clean" ]; then rm -f *.pdf *.png; fi
	@echo "$@ operation complete."

png:

$(TARGET_NAME).png:
	@python -u build_image.py --file=$(TARGET_NAME).pdf

all: $(TARGET_NAME).pdf $(TARGET_NAME).png
