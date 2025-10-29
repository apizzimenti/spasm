build: build/Makefile
	$(MAKE) --no-print-directory -C build
	@sudo cp build/src/libspasm.dylib /usr/local/lib/libspasm.dylib
	@sudo mkdir -p /usr/local/include/spasm
	@sudo cp src/spasm.h /usr/local/include/spasm/spasm.h

build/Makefile:
	mkdir build ; cd build ; cmake .. ; cd ..

mrproper:
	rm -rf build

clean:
	$(MAKE) --no-print-directory -C build clean

check: build/Makefile
	$(MAKE) --no-print-directory -C build check

longtests: build/Makefile
	$(MAKE) --no-print-directory -C build longtests

.PHONY: build mrproper clean check longtests
