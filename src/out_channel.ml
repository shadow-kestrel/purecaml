type 'a t = out_channel -> 'a
type open_flag = Stdlib.open_flag

let return v _ = v
let map f m oc = f (m oc)
let join m oc = m oc oc
let bind m f oc = f (m oc) oc

let open_bin fname m =
  try Ok (Out_channel.with_open_bin fname m) with Sys_error e -> Error e

let open_text fname m =
  try Ok (Out_channel.with_open_text fname m) with Sys_error e -> Error e

let open_gen flags mode fname m =
  try Ok (Out_channel.with_open_gen flags mode fname m)
  with Sys_error e -> Error e

let output_char c oc = Out_channel.output_char oc c
let output_byte b oc = Out_channel.output_byte oc c
let output_string s oc = Out_channel.output_string oc c
(* val output_bytes : unit Bytes.t t

val output : int -> int -> unit Bytes.t t
val output_substring : string -> int -> int -> unit t
val output_bigarray : int -> int -> (unit, 'a, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t t 
*)

let flush = Out_channel.flush
let pos = Out_channel.pos
let length = Out_channel.length
let is_binary_mode = Out_channel.is_binary_mode
let is_buffered = Out_channel.is_buffered
let isatty = Out_channel.isatty
let seek p oc = Out_channel.seek oc p
let set_binary_mode m oc = Out_channel.set_binary_mode oc m
let set_buffered b oc = Out_channel.set_buffered oc b
