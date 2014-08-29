type OpCode =
	Add of OpCode * OpCode

	Seq of OpCode * OpCode
;;


let rec opcode_to_hexlist ops = 
	match ops with
		  Add (a,b) -> [0x01]
		| Seq (a,b) -> (opcode_to_hex a) @ (opcode_to_hex b)
;;


let rec hexlist_to_string hl =
	match hl with
		  [] -> ""
		| h::hl' -> 
;;