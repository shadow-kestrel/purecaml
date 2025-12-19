type 'a t = in_channel -> 'a

let return v _ = v
let map f m ic = f (m ic)
let join m ic = m ic ic
let bind m f ic = f (m ic) ic
let prod a b ic = (a ic, b ic)

type open_flag = Stdlib.open_flag

let open_bin fname proc =
  Fs.return
  @@ try Ok (In_channel.with_open_bin fname proc) with Sys_error e -> Error e

let open_text fname proc =
  Fs.return
  @@ try Ok (In_channel.with_open_text fname proc) with Sys_error e -> Error e

let open_gen flags mode fname proc =
  Fs.return
  @@
    try Ok (In_channel.with_open_gen flags mode fname proc)
    with Sys_error e -> Error e

(** we blindly assume no sys_error will happen while we are reading *)

let input_char = In_channel.input_char
let input_byte = In_channel.input_byte
let input_line = In_channel.input_line
let input_all = In_channel.input_all
let input_lines = In_channel.input_lines
let really_input_string len ic = In_channel.really_input_string ic len

(* TODO input et al *)

let fold_lines = In_channel.fold_lines
let seek n ic = In_channel.seek ic n
let set_binary_mode yn ic = In_channel.set_binary_mode ic yn
let pos = In_channel.pos
let length = In_channel.length
let is_binary_mode = In_channel.is_binary_mode
let isatty = In_channel.isatty
