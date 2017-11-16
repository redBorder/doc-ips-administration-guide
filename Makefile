BASE=redborder-ips-administration-guide
OUTDIR=docs
MAIN=$(BASE).adoc
LANG=en-US
CHAPTERS=chapters

.PHONY: es-html
html: $(SOURCES) styles/$(CSS)
	asciidoctor $(LANG)_$(MAIN) -a i18n=$(LANG) -a img_path=images -a stylesheet=./styles/rubygems.css --attribute tabsize=4 -o $(OUTDIR)/$(LANG)/index.html
	cp -r images $(OUTDIR)/$(LANG)
.PHONY: es-pdf
pdf: $(SOURCES) styles/$(CSS)
	asciidoctor-pdf $(LANG)_$(MAIN) -a i18n=$(LANG) -a img_path=$(PWD)/assets/images --attribute tabsize=4 -o $(OUTDIR)/pdf/$(LANG)_$(BASE).pdf

.PHONY: clean
clean:
	-rm -rf $(OUTDIR)/*

print-%  : ; @echo $* = $($*)
