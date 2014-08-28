open Char;;
open String;;



(* Integer pow *)
let rec pow a = function
  | 0 -> 1
  | 1 -> a
  | n -> 
    let b = pow a (n / 2) in
    b * b * (if n mod 2 = 0 then 1 else a)
;;


(* From integer to binary *)
let rec to_bin x = 
	if (x = 0) then ""
	else
		String.concat "" [to_bin (x / 256); String.make 1 (Char.chr(x mod 256))]
;;


(* Encode length *)
let rlp_encode_length (l: int) (offset: int) =
	if (l<56) then
        String.make 1 (Char.chr (l + offset))
    else 
		if (l < (pow 256 8)) then
	        let bl = to_bin l in
         	String.concat "" [String.make 1 (Char.chr ((String.length bl) + offset + 55)); bl]
	    else
	        failwith "too long input";
;;


(* Encode a string *)
let rlp_encode (input: string) = 
	if (String.length input) = 1 && Char.code (String.get input 0) < 128 then
		input
	else
		String.concat "" [rlp_encode_length (String.length input) 128; input]
;;


(* Encode a list of string *)
let rlp_encode_list (input: string list) = 
	let rec rlp_el cinput data =
		match cinput with
			  [] -> String.concat "" [rlp_encode_length (String.length data) 192; data] 
			| e::cin ->
				rlp_el cin (String.concat "" [data; rlp_encode e])
	in rlp_ea input ""
;;
	

