## SSE4.2 intrinsics

import sse
import sse2
import sse41
export sse41

const
  SIDD_UBYTE_OPS*: int32 = 0b0000_0000
  SIDD_UWORD_OPS*: int32 = 0b0000_0001
  SIDDSBYTE_OPS*: int32 = 0b0000_0010
  SIDDSWORD_OPS*: int32 = 0b0000_0011
  SIDD_CMP_EQUAL_ANY*: int32 = 0b0000_0000
  SIDD_CMP_RANGES*: int32 = 0b0000_0100
  SIDD_CMP_EQUAL_EACH*: int32 = 0b0000_1000
  SIDD_CMP_EQUAL_ORDERED*: int32 = 0b0000_1100
  SIDD_POSITIVE_POLARITY*: int32 = 0b0000_0000
  SIDD_NEGATIVE_POLARITY*: int32 = 0b0001_0000
  SIDD_MASKED_POSITIVE_POLARITY*: int32 = 0b0010_0000
  SIDD_MASKED_NEGATIVE_POLARITY*: int32 = 0b0011_0000
  SIDD_LEASTSIGNIFICANT*: int32 = 0b0000_0000
  SIDD_MOSTSIGNIFICANT*: int32 = 0b0100_0000
  SIDD_BIT_MASK*: int32 = 0b0000_0000
  SIDD_UNIT_MASK*: int32 = 0b0100_0000

{.push header: "nmmintrin.h".}
# operating : compare explicit-length strings 'a' and 'b', return 1 if any character in 'a' is not found in 'b'
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpestra*(a: M128i, la: int32 | uint32, b: M128i, lb: int32 | uint32, imm8: int32 | uint32): int32 {.importc: "_mm_cmpestra".}

# operating : compare explicit-length strings, return the Carry Flag (CF) result
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpestrc*(a: M128i, la: int32 | uint32, b: M128i, lb: int32 | uint32, imm8: int32 | uint32): int32 {.importc: "_mm_cmpestrc".}

# operating : compare explicit-length strings and return the index of the first character match/mismatch
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpestri*(a: M128i, la: int32 | uint32, b: M128i, lb: int32 | uint32, imm8: int32 | uint32): int32 {.importc: "_mm_cmpestri".}

# operating : compare explicit-length strings and return a mask of the results
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpestrm*(a: M128i, la: int32 | uint32, b: M128i, lb: int32 | uint32, imm8: int32 | uint32): M128i {.importc: "_mm_cmpestrm".}

# operating : compare explicit-length strings, return the Overflow Flag (OF) result
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpestro*(a: M128i, la: int32 | uint32, b: M128i, lb: int32 | uint32, imm8: int32 | uint32): int32 {.importc: "_mm_cmpestro".}

# operating : compare explicit-length strings, return the Sign Flag (SF) result (indicates if 'a' has null terminator)
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpestrs*(a: M128i, la: int32 | uint32, b: M128i, lb: int32 | uint32, imm8: int32 | uint32): int32 {.importc: "_mm_cmpestrs".}

# operating : compare explicit-length strings, return the Zero Flag (ZF) result (indicates if 'b' has null terminator)
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpestrz*(a: M128i, la: int32 | uint32, b: M128i, lb: int32 | uint32, imm8: int32 | uint32): int32 {.importc: "_mm_cmpestrz".}

# operating : compare packed signed 64-bit integers for greater than
# lane unit : int64 / lane numbers : 2
func mm_cmpgt_epi64*(a, b: M128i): M128i {.importc: "_mm_cmpgt_epi64".}

# operating : compare implicit-length (null-terminated) strings, return 1 if any character match is found
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpistra*(a, b: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_cmpistra".}

# operating : compare implicit-length strings, return the Carry Flag (CF) result
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpistrc*(a, b: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_cmpistrc".}

# operating : compare implicit-length strings and return the index of the first character match/mismatch
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpistri*(a, b: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_cmpistri".}

# operating : compare implicit-length strings and return a mask of the results
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpistrm*(a, b: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_cmpistrm".}

# operating : compare implicit-length strings, return the Overflow Flag (OF) result
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpistro*(a, b: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_cmpistro".}

# operating : compare implicit-length strings, return the Sign Flag (SF) result
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpistrs*(a, b: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_cmpistrs".}

# operating : compare implicit-length strings, return the Zero Flag (ZF) result
# lane unit : int8 or int16 / lane numbers : 16 or 8
func mm_cmpistrz*(a, b: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_cmpistrz".}

# operating : compute 16-bit CRC32 value from a 16-bit integer
# lane unit : uint16 / lane numbers : 1
func mm_crc32_u16*(crc: uint32, v: uint16): uint32 {.importc: "_mm_crc32_u16".}

# operating : compute 32-bit CRC32 value from a 32-bit integer
# lane unit : uint32 / lane numbers : 1
func mm_crc32_u32*(crc: uint32, v: uint32): uint32 {.importc: "_mm_crc32_u32".}

# operating : compute 64-bit CRC32 value from a 64-bit integer
# lane unit : uint64 / lane numbers : 1
func mm_crc32_u64*(crc: uint64, v: uint64): uint64 {.importc: "_mm_crc32_u64".}

# operating : compute 8-bit CRC32 value from an 8-bit integer
# lane unit : uint8 / lane numbers : 1
func mm_crc32_u8*(crc: uint32, v: uint8): uint32 {.importc: "_mm_crc32_u8".}

{.pop.}
