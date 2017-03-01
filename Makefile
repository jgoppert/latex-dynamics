all: dynamics.zip

dynamics.sty: dynamics.ins dynamics.dtx
	latex dynamics.ins
	rm *.log

dynamics.pdf: dynamics.sty dynamics.dtx
	pdflatex dynamics.dtx
	rm -f *.aux *.glo *.idx *.log

dynamics.zip: dynamics.pdf dynamics.sty
	rm -rf dynamics
	mkdir -p dynamics
	cp dynamics.ins dynamics
	cp dynamics.dtx dynamics
	cp dynamics.pdf dynamics
	zip -r dynamics.zip dynamics

clean:
	git clean -dxf	


.PHONY: clean all
