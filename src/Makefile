OBJS = client.o config.o main.o proto.o proto_gen.o proto_parse.o rlp.o server.o trie.o
SRC = client.ml config.ml main.ml proto.ml proto_gen.ml proto_parse.ml rlp.ml server.ml trie.ml
CONF = -package bitstring,leveldb,netcamlbox,netclient -thread
PROG = eth-ml
TRGTS = ui

all: $(TRGTS)
	ocamlfind ocamlc -g $(CONF) -o $(PROG) $(SRC)

ui:
	cd ./ui ; make

clean:
	rm -r *.cmi *.cmo