build:
	latex dynamics.ins
	pdflatex dynamics.dtx

package: build
	rm -rf dynamics
	mkdir -p dynamics
	cp dynamics.ins dynamics
	cp dynamics.dtx dynamics
	zip -r dynamics.zip dynamics
