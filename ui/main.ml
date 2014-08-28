(* ethereum graphical ui *)
open QmlContext;;

let main () =
  print_endline "Startup initialization"

let () =
    run_with_QQmlApplicationEngine Sys.argv main "qml/main.qml"