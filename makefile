rm=/bin/rm -f
mv=/bin/mv -f
targets=node

all: $(targets)

$(targets): node.l node.y
	@echo "compiling yacc and lex file:" 
	bison -d node.y
	flex node.l
	gcc -o node lex.yy.c node.tab.c


clean:
	$(rm) $(targets)
	$(rm) *.tab.h *.tab.c *lex.yy.c
