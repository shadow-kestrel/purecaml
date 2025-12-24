type +'a t
type open_flag = Stdlib.open_flag

val return : 'a -> 'a t
val map : ('a -> 'b) -> 'a t -> 'b t
val join : 'a t t -> 'a t
val bind : 'a t -> ('a -> 'b t) -> 'b t
val open_bin : string -> 'a t -> ('a, string) result
val open_text : string -> 'a t -> ('a, string) result
val open_gen : open_flag list -> int -> string -> 'a t -> ('a, string) result
val output_char : char -> unit t
val output_byte : int -> unit t
val output_string : string -> unit t
(* val output_bytes : unit Bytes.t t

val output : int -> int -> unit Bytes.t t
val output_substring : string -> int -> int -> unit t
val output_bigarray : int -> int -> (unit, 'a, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t t 
*)

val flush : unit t
val seek : int64 -> unit t
val pos : int64 t
val length : int64 t
val set_binary_mode : bool -> unit t
val is_binary_mode : bool t
val set_buffered : bool -> unit t
val is_buffered : bool t
val isatty : bool t

val to_lin : 'a t -> (out_channel, 'a) Lin.t
val of_lin : (out_channel, 'a) Lin.t -> 'a t
