deploy: bylaws.pdf
	cp bylaws.pdf ..

clean:
	rm bylaws.pdf

bylaws.pdf:
	cp bylaws/bylaws.pdf bylaws/bylaws.`date --rfc-3339='seconds' | sed 's/ /_/g'`.pdf
	bash -c "cd bylaws; ./makebylaws.sh"

