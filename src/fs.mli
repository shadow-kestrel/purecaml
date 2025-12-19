type +'a t

val return : 'a -> 'a t
val map : ('a -> 'b) -> 'a t -> 'b t
val join : 'a t t -> 'a t
val bind : 'a t -> ('a -> 'b t) -> 'b t
