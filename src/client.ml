(* JSON RPC client *)
open Http_client.Convenience;;

(*
            { "method": "procedures", "params": null, "order": [], "returns": [] },
            { "method": "coinbase", "params": null, "order": [], "returns" : "" },
            { "method": "isListening", "params": null, "order": [], "returns" : false },
            { "method": "isMining", "params": null, "order": [], "returns" : false },
            { "method": "gasPrice", "params": null, "order": [], "returns" : "" },
            { "method": "key", "params": null, "order": [], "returns" : "" },
            { "method": "keys", "params": null, "order": [], "returns" : [] },
            { "method": "peerCount", "params": null, "order": [], "returns" : 0 },
            { "method": "balanceAt", "params": { "a": "" }, "order": ["a"], "returns" : "" },
            { "method": "storageAt", "params": { "a": "", "x": "" }, "order": ["a", "x"], "returns" : "" },
            { "method": "txCountAt", "params": { "a": "" },"order": ["a"], "returns" : "" },
            { "method": "isContractAt", "params": { "a": "" }, "order": ["a"], "returns" : false },
            { "method": "create", "params": { "sec": "", "xEndowment": "", "bCode": "", "xGas": "", "xGasPrice": "" }, "order": ["sec", "xEndowment", "bCode", "xGas", "xGasPrice"] , "returns": "" },
            { "method": "transact", "params": { "sec": "", "xValue": "", "aDest": "", "bData": "", "xGas": "", "xGasPrice": "" }, "order": ["sec", "xValue", "aDest", "bData", "xGas", "xGasPrice"], "returns": {} },
            { "method": "secretToAddress", "params": { "a": "" }, "order": ["a"], "returns" : "" },
            { "method": "lll", "params": { "s": "" }, "order": ["s"], "returns" : "" }
*)

(*
		var req = { "jsonrpc": "2.0", "method": m, "params": p, "id": m_reqId }
		m_reqId++
		var request = new XMLHttpRequest();	
        request.open("POST", "http://localhost:8080", true)
*)

let eth_keys () =
	()	



(* Make an rpc request with params = [("arg1", "val1")] *)
let rpc_request meth params =
	let jrpcparams = [("jsonrpc","2.0");("id","1");("method",meth)] in
	let rec data ps =
		match ps with
			  [] -> ""
			| p::ps' ->
				String.concat "&" [String.concat "=" [fst (p); snd (p)]; data ps']
	in
	let post_para = [("Content-Type", "application/json; charset=utf-8");
		     ("Cache-Control", "no-cache");
		     ("data", data (jrpcparams @ params))] 
	in
	try (http_post "http://localhost:8080" post_para) with
		Http_client.Http_error (id, msg) -> msg
;;


rpc_request "transact" [];;