template `and`*(a, b: float32): float32 =
  cast[float32](cast[uint32](a) and cast[uint32](b))

template `and`*(a, b: float64): float64 =
  cast[float64](cast[uint64](a) and cast[uint64](b))

template `or`*(a, b: float32): float32 =
  cast[float32](cast[uint32](a) or cast[uint32](b))

template `or`*(a, b: float64): float64 =
  cast[float64](cast[uint64](a) or cast[uint64](b))

template `xor`*(a, b: float32): float32 =
  cast[float32](cast[uint32](a) xor cast[uint32](b))

template `xor`*(a, b: float64): float64 =
  cast[float64](cast[uint64](a) xor cast[uint64](b))

template `not`*(a: float32): float32 =
  cast[float32](cast[uint32](a) xor cast[uint32](b))

template `not`*(a: float64): float64 =
  cast[float64](not cast[uint64](a))

template `nand`*[T](a, b: T): T =
  not (a and b)

template `nor`*[T](a, b: T): T =
  not (a or b)

template `nxor`*[T](a, b: T): T =
  not (a xor b)

template `andnot`*[T](a, b: T): T =
  a and (not b)

template `ornot`*[T](a, b: T): T =
  a or (not b)

