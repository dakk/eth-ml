TRGTS = src

all: $(TRGTS)

src:
	cd ./src ; make


clean:
	rm -f *.o *~
	cd ./src ; make clean
