type 'a t = 'a
(** 'dummy' monad indicating a function's ability to do filesystem operations, even without being
    passed explicit in/out channels or file descriptors *)

let return v = v
let map f v = f v
let join v = v
let bind v f = f v
