open BitString;;

let bs_of_hello (m:HelloMessage) =
	BITSTRING 
	{
		command_to_code (Hello) : 
	}
;;