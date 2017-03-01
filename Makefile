all: dynamics.zip

dynamics.sty: dynamics.ins dynamics.dtx
	latex dynamics.ins
	rm *.log

install: uninstall dynamics.sty dynamics.pdf
	sudo mkdir -p /usr/local/share/texmf/tex/latex/dynamics
	sudo install -m555 dynamics.dtx /usr/local/share/texmf/tex/latex/dynamics/dynamics.dtx
	sudo install -m555 dynamics.ins /usr/local/share/texmf/tex/latex/dynamics/dynamics.ins
	sudo install -m555 dynamics.sty /usr/local/share/texmf/tex/latex/dynamics/dynamics.sty
	sudo install -m555 dynamics.pdf /usr/local/share/texmf/tex/latex/dynamics/dynamics.pdf
	cd /usr/local/share/texmf && sudo mktexlsr

uninstall:
	sudo rm -rf /usr/local/share/texmf/tex/latex/dynamics

dynamics.pdf: dynamics.sty
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


.PHONY: clean all install uninstall
