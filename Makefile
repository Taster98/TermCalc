CC = gcc

CFLAGS = -Wall

DEBUG = -DDEBUG

PERC = "PATH"

.PHONY: uninstall clean test exe

all: ./termCalc install

./termCalc: ./termCalc.c
	$(CC) $(CFLAGS) $@.c -o $@ -lm

install:
	@echo 'Installing TermCalc... \n';
	chmod +x setup.sh;
	./setup.sh;
	$(CC) $(CFLAGS) termCalc.c -o termCalc -lm
	>> ~/.bashrc echo "export PATH=$$$(PERC):$(CURDIR)";
	@echo '\nCOMPLETED\nTermCalc is installed. Write termCalc -h or termCalc --help to learn how to use it!';
	
clean:
	@echo 'Removing executable...';
	rm -f ./termCalc
	
uninstall:
	@echo 'Uninstalling TermCalc...\n'
	rm -f ./termCalc ./termCalc.c;
	rm -r ./errors
	rm -r ./src
	sed '/TermCalc/d' -i ~/.bashrc;
	@echo '\nCOMPLETED\nUninstall complete. You can now delete this folder.';
	
test:
	$(CC) $(CFLAGS) termCalc.c -o termCalc -lm
	
exe:
	./termCalc
