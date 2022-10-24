ENV = LANG=C max_print_line=1000 error_line=254 half_error_line=238
PDFLATEX := texfot pdflatex
MAKE_PDF := \
	$(ENV) latexmk \
		--pdflatex='$(PDFLATEX)' \
		--latexoption=--interaction=nonstopmode \
		--latexoption=--halt-on-error \
		--latexoption=--file-line-error \
		--pdf

.PHONY: all clean
all: $(OUTPUT).pdf
$(OUTPUT).pdf:
	$(MAKE_PDF) $<
clean:
	[ "$(OUTPUT)" ] || exit 1
	latexmk -c $(OUTPUT).tex
	rm -f $(OUTPUT).{bbl,lol,run.xml}
