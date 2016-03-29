.PHONY: clean veryclean

current: bylaws.pdf clean

amended: bylaws_amended.pdf clean

bylaws.pdf: bylaws.current musical_interlude.png
	if [ -e bylaws.pdf ] ; then \
		cp bylaws.pdf archives/bylaws.`date --rfc-3339='seconds' | sed 's/ /_/g'`.pdf ; \
	fi;
	./makebylaws.sh

bylaws_amended.pdf: bylaws.amended musical_interlude.png
	if [ -e bylaws_amended.pdf ] ; then \
		cp bylaws_amended.pdf archives/bylaws_amended.`date --rfc-3339='seconds' | sed 's/ /_/g'`.pdf ; \
	fi;
	if [ -e bylaws.current ] ; then \
		mv bylaws.current bylaws.current.temp ; \
	fi;
	if [ -e bylaws.pdf ] ; then \
		mv bylaws.pdf bylaws.pdf.temp ; \
	fi;
	cp bylaws.amended bylaws.current
	./makebylaws.sh
	mv bylaws.pdf bylaws_amended.pdf
	if [ -e bylaws.current.temp ] ; then \
		mv bylaws.current.temp bylaws.current ; \
	fi;
	if [ -e bylaws.pdf.temp ] ; then \
		mv bylaws.pdf.temp bylaws.pdf ; \
	fi;

deploy: current
	cp bylaws.pdf ..

clean:
	rm -f bylaws.{tex,aux,log}
	rm -f bylaws_amended.{tex,aux,log}

veryclean:
	rm -f bylaws.{tex,pdf,aux,log}
	rm -f bylaws_amended.{tex,pdf,aux,log}

