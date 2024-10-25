(* module SUT = Lru.Make (String) *)
type sut = char Make.t

let init_sut = create 42
