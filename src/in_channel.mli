type +'a t
(** instead of passing around channels (stateful objects, ew) we declaratively
    build an object that consumes a channel's data, then give the channel
    control (a la CPS). Note this is internally [Stdlib.in_channel -> 'a] but
    kept abstract to hide stateful behaviour *)

type open_flag = Stdlib.open_flag

val return : 'a -> 'a t
val map : ('a -> 'b) -> 'a t -> 'b t
val join : 'a t t -> 'a t
val bind : 'a t -> ('a -> 'b t) -> 'b t

val open_bin : string -> 'a t -> ('a, string) result Fs.t
val open_text : string -> 'a t -> ('a, string) result Fs.t
val open_gen : open_flag list -> int -> string -> 'a t -> ('a, string) result Fs.t

(** note the above are strengthened versions of the classic with_open functions -
    close is unneeded *)

(** we blindly assume no sys_error will happen while we are reading *)

val input_char : char option t
val input_byte : int option t
val input_line : string option t
val really_input_string : int -> string option t
val input_all : string t
val input_lines : string list t

(* TODO input to bytes/bigarray *)

val fold_lines : ('acc -> string -> 'acc) -> 'acc -> 'acc t
val seek : int64 -> unit t
val pos : int64 t
val length : int64 t
val set_binary_mode : bool -> unit t
val is_binary_mode : bool t
val isatty : bool t

val to_lin : 'a t -> (in_channel, 'a) Lin.t
val of_lin : (in_channel, 'a) Lin.t -> 'a t
