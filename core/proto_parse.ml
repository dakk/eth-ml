open BitString;;

let hello_of_bs bits =
	bitmatch bits with
	| { value : bytesize*8 : littleendian; rest : -1 : bitstring } -> 
			(Some value, rest)
;;