open List;
open Char;
open String;



(* Define the trie node *)
type TrieNode =
	Blank |
	Leaf of (key:string, value:string) |
	Root of (key:string, child:TrieNode) |
	Extension of (key:string, value:string) |
	Branch of (keys:TrieNode list, value:string)
;;



(* Data transformations *)
let nibble_terminator = 16;;

let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []
;;

let bin_to_nibbles (key:string) =
	let rec kth (kl:char list) =
		match kl with
			  [] -> []
			| e::kl' ->
				Char.code (e) mod 16 :: kth kl'
	in List.rev (kth (explode (key)))
;;

let with_terminator (nibble:int list) =
	let lst = List.hd (List.rev nibble) in
	if lst = nibble_terminator then nibble
	else nibble :: nibble_terminator
;;

let without_terminator (nibble:int list) = 
	let lst = List.hd (List.rev nibble) in
	if lst = nibble_terminator then List.rev (List.tl (List.rev nibble))
	else nibble
;;
		



(* Delete a node *)
let trie_delete (tree:TrieNode) (key:string) =
	tree
;;


(* Get a node *)
let trie_get (tree:TrieNode) (key:string) =
	tree
;;


(* Update a node *)
let trie_update (tree:TrieNode) (key:string, value:string) =
	let k = bin_to_nibbles key in
	tree
;;




(* Encode a node *)
let trie_encode_node (node:TrieNode) =
	""
;;



(* Decode a node *)
let trie_decode_node (node:string) =
	Blank
;;


(* Store trie on db *)
let trie_todb (tree:TrieNode) (dbfile:string) =
	()
;;


(* Load trie from db *)
let trie_fromdb (dbfile:string) =
	Blank
;;





(* Test *)
let root_hash =
	trie_update  
		(trie_update 
			(trie_update 
				(trie_update Blank Leaf ("dog", "puppy")) 
				Leaf ("horse", "stallion"))
			Leaf ("do", "verb"))
		Leaf ("doge", "coin"));
