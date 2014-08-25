(* Network protocol specification *)


(* Protocol Version *)
type ProtoVersion = POC1 | POC2 | POC3 | POC4;;

let protoversion_to_code p = match p with
	  POC1 -> 0x00
	| POC2 -> 0x01
	| POC3 -> 0x07
	| POC4 -> 0x09
;;


(* Disconnect reason *)
let DisconnectReason =
	  Requested
	| TCPError
	| BadProtocol
	| UselessPeer
	| TooManyPeers
	| AlreadyConnected
	| WrongGenesis
	| IncompatibleProtocol
	| Quitting
;;

let disconnectreason_to_code dr =
	  Requested -> 0x00
	| TCPError -> 0x01
	| BadProtocol -> 0x02
	| UselessPeer -> 0x03
	| TooManyPeers -> 0x04
	| AlreadyConnected -> 0x05
	| WrongGenesis -> 0x06
	| IncompatibleProtocol -> 0x07
	| Quitting -> 0x08
;;


(* Node capabilities *)
type Capability =
	  PeerDiscovery
	| TransactionRelaying
	| BlockChainQuerying
;;

let capability_to_code cap = match cap with
	  PeerDiscovery -> 0x01
	| TransactionRelaying -> 0x02
	| BlockChainQuerying -> 0x04
;;


(* Commands *)
type Command =
	  Hello
	| Disconnect
	| Ping
	| Pong
	| GetPeers
	| Peers
	| Transactions
	| Blocks
	| GetChain
	| NotInChain
	| GetTransactions
;;

type HelloMessage 
{
	protocol 	: ProtocolVersion;
	network_id 	: int;
	client_id 	: string;
	capability 	: Capability;
	listen_port : int;
	node_id		: string;
};;

let command_to_string (cmd:Command) = match cmd with
	  Hello -> "hello"
	| Disconnect -> "disconnect"
	| Ping -> "ping"
	| Pong -> "pong"
	| GetPeers -> "getpeers"
	| Peers -> "peers"
	| Transactions -> "transactions"
	| Blocks -> "blocks"
	| GetChain -> "getchain"
	| NotInChain -> "notinchain"
	| GetTransactions -> "gettransactions"
;;

let command_to_code (cmd:Command) = match cmd with
	  Hello -> 0x00
	| Disconnect -> 0x01
	| Ping -> 0x02
	| Pong -> 0x03
	| GetPeers -> 0x10
	| Peers -> 0x11
	| Transactions -> 0x12
	| Blocks -> 0x13
	| GetChain -> 0x14
	| NotInChain -> 0x15
	| GetTransactions -> 0x16
;;


	