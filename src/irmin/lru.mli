(*
   Copyright (c) 2016 David Kaloper Meršinjak

   Permission to use, copy, modify, and/or distribute this software for any
   purpose with or without fee is hereby granted, provided that the above
   copyright notice and this permission notice appear in all copies.

   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
   MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
   ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE. *)

(* Extracted from https://github.com/pqwy/lru *)

module Make (H : Hashtbl.HashedType) : sig
  type 'a t
  (*@ mutable model size : integer *)

  type h_t = H.t

  val create : int -> 'a t
  (*@ t = create i
      ensures t.size = 0 *)

  val add : 'a t -> h_t -> 'a -> unit
  (*@ add t h a
      modifies t.size
      ensures t.size = (old t.size) + 1 *)

  val find : 'a t -> h_t -> 'a
  val mem : 'a t -> h_t -> bool
  val clear : 'a t -> unit
  (*@ clear t
      modifies t.size
      ensures t.size = 0 *)

  val iter : 'a t -> (h_t -> 'a -> unit) -> unit
  val drop : 'a t -> 'a option
  (*@ o = drop t
      modifies t.size
      ensures t.size = if (old t.size = 0) then 0 else (old t.size) - 1
      ensures if (old t.size) = 0 then o = None else true *)
end
