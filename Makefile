
all:
	@echo "Have a look at the other targets :) or use 'make show ; make watch'"

compile:
	bash -i -c "pandoc --standalone -f markdown -t beamer -V theme:default --highlight-style=tango -o presentation.pdf --include-in-header preamble.tex presentation.md"

show:
	evince presentation.pdf

watch:
	while true; do \
		inotifywait -e modify *.md preamble.tex ; \
		make compile ; \
	done 
