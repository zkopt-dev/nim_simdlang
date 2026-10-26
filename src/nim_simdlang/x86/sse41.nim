## SSE4.1 intrinsics

import sse
import sse2
import ssse3
export ssse3

const
  MM_FROUND_TO_NEAREST_INT*: int32 = 0x00
  MM_FROUND_TO_NEG_INF*: int32 = 0x01
  MM_FROUND_TO_POS_INF*: int32 = 0x02
  MM_FROUND_TO_ZERO*: int32 = 0x03
  MM_FROUND_CUR_DIRECTION*: int32 = 0x04
  MM_FROUND_RAISE_EXC*: int32 = 0x00
  MM_FROUND_NO_EXC*: int32 = 0x08
  MM_FROUND_NINT*: int32 = 0x00
  MM_FROUND_FLOOR*: int32 = MM_FROUND_RAISE_EXC or MM_FROUND_TO_NEG_INF
  MM_FROUND_CEIL*: int32 = MM_FROUND_RAISE_EXC or MM_FROUND_TO_POS_INF
  MM_FROUND_TRUNC*: int32 = MM_FROUND_RAISE_EXC or MM_FROUND_TO_ZERO
  MM_FROUND_RINT*: int32 = MM_FROUND_RAISE_EXC or MM_FROUND_CUR_DIRECTION
  MM_FROUND_NEARBYINT*: int32 = MM_FROUND_NO_EXC or MM_FROUND_CUR_DIRECTION

{.push header: "smmintrin.h".}
# operating : blend packed 16-bit integers from 'a' and 'b' using an immediate mask
# lane unit : int16 / lane numbers : 8
func mm_blend_epi16*(a, b: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_blend_epi16".}

# operating : blend packed double-precision floats from 'a' and 'b' using an immediate mask
# lane unit : float64 / lane numbers : 2
func mm_blend_pd*(a, b: M128d, imm8: int32 | uint32): M128d {.importc: "_mm_blend_pd".}

# operating : blend packed single-precision floats from 'a' and 'b' using an immediate mask
# lane unit : float32 / lane numbers : 4
func mm_blend_ps*(a, b: M128, imm8: int32 | uint32): M128 {.importc: "_mm_blend_ps".}

# operating : blend packed 8-bit integers from 'a' and 'b' using a variable mask
# lane unit : int8 / lane numbers : 16
func mm_blendv_epi8*(a, b, mask: M128i): M128i {.importc: "_mm_blendv_epi8".}

# operating : blend packed double-precision floats from 'a' and 'b' using a variable mask
# lane unit : float64 / lane numbers : 2
func mm_blendv_pd*(a, b, mask: M128d): M128d {.importc: "_mm_blendv_pd".}

# operating : blend packed single-precision floats from 'a' and 'b' using a variable mask
# lane unit : float32 / lane numbers : 4
func mm_blendv_ps*(a, b, mask: M128): M128 {.importc: "_mm_blendv_ps".}

# operating : round packed double-precision floats to the nearest integer with ceiling
# lane unit : float64 / lane numbers : 2
func mm_ceil_pd*(a: M128d): M128d {.importc: "_mm_ceil_pd".}

# operating : round packed single-precision floats to the nearest integer with ceiling
# lane unit : float32 / lane numbers : 4
func mm_ceil_ps*(a: M128): M128 {.importc: "_mm_ceil_ps".}

# operating : round the lowest double-precision float to the nearest integer with ceiling
# lane unit : float64 / lane numbers : 1
func mm_ceil_sd*(a, b: M128d): M128d {.importc: "_mm_ceil_sd".}

# operating : round the lowest single-precision float to the nearest integer with ceiling
# lane unit : float32 / lane numbers : 1
func mm_ceil_ss*(a, b: M128): M128 {.importc: "_mm_ceil_ss".}

# operating : compare packed 64-bit integers for equality
# lane unit : int64 / lane numbers : 2
func mm_cmpeq_epi64*(a, b: M128i): M128i {.importc: "_mm_cmpeq_epi64".}

# operating : sign-extend packed 16-bit integers to 32-bit integers
# lane unit : int16 -> int32 / lane numbers : 4
func mm_cvtepi16_epi32*(a: M128i): M128i {.importc: "_mm_cvtepi16_epi32".}

# operating : sign-extend packed 16-bit integers to 64-bit integers
# lane unit : int16 -> int64 / lane numbers : 2
func mm_cvtepi16_epi64*(a: M128i): M128i {.importc: "_mm_cvtepi16_epi64".}

# operating : sign-extend packed 32-bit integers to 64-bit integers
# lane unit : int32 -> int64 / lane numbers : 2
func mm_cvtepi32_epi64*(a: M128i): M128i {.importc: "_mm_cvtepi32_epi64".}

# operating : sign-extend packed 8-bit integers to 16-bit integers
# lane unit : int8 -> int16 / lane numbers : 8
func mm_cvtepi8_epi16*(a: M128i): M128i {.importc: "_mm_cvtepi8_epi16".}

# operating : sign-extend packed 8-bit integers to 32-bit integers
# lane unit : int8 -> int32 / lane numbers : 4
func mm_cvtepi8_epi32*(a: M128i): M128i {.importc: "_mm_cvtepi8_epi32".}

# operating : sign-extend packed 8-bit integers to 64-bit integers
# lane unit : int8 -> int64 / lane numbers : 2
func mm_cvtepi8_epi64*(a: M128i): M128i {.importc: "_mm_cvtepi8_epi64".}

# operating : zero-extend packed unsigned 16-bit integers to 32-bit integers
# lane unit : uint16 -> int32 / lane numbers : 4
func mm_cvtepu16_epi32*(a: M128i): M128i {.importc: "_mm_cvtepu16_epi32".}

# operating : zero-extend packed unsigned 16-bit integers to 64-bit integers
# lane unit : uint16 -> int64 / lane numbers : 2
func mm_cvtepu16_epi64*(a: M128i): M128i {.importc: "_mm_cvtepu16_epi64".}

# operating : zero-extend packed unsigned 32-bit integers to 64-bit integers
# lane unit : uint32 -> int64 / lane numbers : 2
func mm_cvtepu32_epi64*(a: M128i): M128i {.importc: "_mm_cvtepu32_epi64".}

# operating : zero-extend packed unsigned 8-bit integers to 16-bit integers
# lane unit : uint8 -> int16 / lane numbers : 8
func mm_cvtepu8_epi16*(a: M128i): M128i {.importc: "_mm_cvtepu8_epi16".}

# operating : zero-extend packed unsigned 8-bit integers to 32-bit integers
# lane unit : uint8 -> int32 / lane numbers : 4
func mm_cvtepu8_epi32*(a: M128i): M128i {.importc: "_mm_cvtepu8_epi32".}

# operating : zero-extend packed unsigned 8-bit integers to 64-bit integers
# lane unit : uint8 -> int64 / lane numbers : 2
func mm_cvtepu8_epi64*(a: M128i): M128i {.importc: "_mm_cvtepu8_epi64".}

# operating : compute dot product of packed double-precision floats
# lane unit : float64 / lane numbers : 2
func mm_dp_pd*(a, b: M128d, imm8: int32 | uint32): M128d {.importc: "_mm_dp_pd".}

# operating : compute dot product of packed single-precision floats
# lane unit : float32 / lane numbers : 4
func mm_dp_ps*(a, b: M128, imm8: int32 | uint32): M128 {.importc: "_mm_dp_ps".}

# operating : extract a 32-bit integer from 'a' at index 'imm8'
# lane unit : int32 / lane numbers : 1 (out of 4)
func mm_extract_epi32*(a: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_extract_epi32".}

# operating : extract a 64-bit integer from 'a' at index 'imm8'
# lane unit : uint64 / lane numbers : 1 (out of 2)
func mm_extract_epi64*(a: M128i, imm8: int32 | uint32): uint64 {.importc: "_mm_extract_epi64".}

# operating : extract an 8-bit integer from 'a' at index 'imm8'
# lane unit : int8 / lane numbers : 1 (out of 16)
func mm_extract_epi8*(a: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_extract_epi8".}

# operating : extract a 32-bit single-precision float from 'a' at index 'imm8' as integer
# lane unit : float32 -> int32 / lane numbers : 1 (out of 4)
func mm_extract_ps*(a: M128, imm8: int32 | uint32): int32 {.importc: "_mm_extract_ps".}

# operating : round packed double-precision floats to the nearest integer with floor
# lane unit : float64 / lane numbers : 2
func mm_floor_pd*(a: M128d): M128d {.importc: "_mm_floor_pd".}

# operating : round packed single-precision floats to the nearest integer with floor
# lane unit : float32 / lane numbers : 4
func mm_floor_ps*(a: M128): M128 {.importc: "_mm_floor_ps".}

# operating : round the lowest double-precision float to the nearest integer with floor
# lane unit : float64 / lane numbers : 1
func mm_floor_sd*(a, b: M128d): M128d {.importc: "_mm_floor_sd".}

# operating : round the lowest single-precision float to the nearest integer with floor
# lane unit : float32 / lane numbers : 1
func mm_floor_ss*(a, b: M128): M128 {.importc: "_mm_floor_ss".}

# operating : insert a 32-bit integer 'i' into 'a' at index 'imm8'
# lane unit : int32 / lane numbers : 1 (into 4)
func mm_insert_epi32*(a: M128i, i, imm8: int32 | uint32): M128i {.importc: "_mm_insert_epi32".}

# operating : insert a 64-bit integer 'i' into 'a' at index 'imm8'
# lane unit : int64 / lane numbers : 1 (into 2)
func mm_insert_epi64*(a: M128i, i: int64 | uint64, imm8: int32 | uint32): M128i {.importc: "_mm_insert_epi64".}

# operating : insert an 8-bit integer 'i' into 'a' at index 'imm8'
# lane unit : int8 / lane numbers : 1 (into 16)
func mm_insert_epi8*(a: M128i, i, imm8: int32 | uint32): M128i {.importc: "_mm_insert_epi8".}

# operating : insert a single-precision float from 'b' into 'a' at index specified by 'imm8'
# lane unit : float32 / lane numbers : 1 (into 4)
func mm_insert_ps*(a, b: M128, imm8: int32 | uint32): M128 {.importc: "_mm_insert_ps".}

# operating : find maximum of packed signed 32-bit integers
# lane unit : int32 / lane numbers : 4
func mm_max_epi32*(a, b: M128i): M128i {.importc: "_mm_max_epi32".}

# operating : find maximum of packed signed 8-bit integers
# lane unit : int8 / lane numbers : 16
func mm_max_epi8*(a, b: M128i): M128i {.importc: "_mm_max_epi8".}

# operating : find maximum of packed unsigned 16-bit integers
# lane unit : uint16 / lane numbers : 8
func mm_max_epu16*(a, b: M128i): M128i {.importc: "_mm_max_epu16".}

# operating : find maximum of packed unsigned 32-bit integers
# lane unit : uint32 / lane numbers : 4
func mm_max_epu32*(a, b: M128i): M128i {.importc: "_mm_max_epu32".}

# operating : find minimum of packed signed 32-bit integers
# lane unit : int32 / lane numbers : 4
func mm_min_epi32*(a, b: M128i): M128i {.importc: "_mm_min_epi32".}

# operating : find minimum of packed signed 8-bit integers
# lane unit : int8 / lane numbers : 16
func mm_min_epi8*(a, b: M128i): M128i {.importc: "_mm_min_epi8".}

# operating : find minimum of packed unsigned 16-bit integers
# lane unit : uint16 / lane numbers : 8
func mm_min_epu16*(a, b: M128i): M128i {.importc: "_mm_min_epu16".}

# operating : find minimum of packed unsigned 32-bit integers
# lane unit : uint32 / lane numbers : 4
func mm_min_epu32*(a, b: M128i): M128i {.importc: "_mm_min_epu32".}

# operating : find the minimum value among packed unsigned 16-bit integers and its index
# lane unit : uint16 / lane numbers : 8
func mm_minpos_epu16*(a: M128i): M128i {.importc: "_mm_minpos_epu16".}

# operating : compute multiple packed sum of absolute differences
# lane unit : uint8 / lane numbers : 16
func mm_mpsadbw_epu8*(a, b: M128i, imm8: int32 | uint32) {.importc: "_mm_mpsadbw_epu8".}

# operating : multiply packed signed 32-bit integers and return the low 64-bits of result
# lane unit : int32 -> int64 / lane numbers : 2
func mm_mul_epi32*(a, b: M128i): M128i {.importc: "_mm_mul_epi32".}

# operating : multiply packed signed 32-bit integers and return the low 32-bits of result
# lane unit : int32 / lane numbers : 4
func mm_mullo_epi32*(a, b: M128i): M128i {.importc: "_mm_mullo_epi32".}

# operating : pack signed 32-bit integers into unsigned 16-bit integers using saturation
# lane unit : int32 -> uint16 / lane numbers : 4 -> 8
func mm_packus_epi32*(a, b: M128i): M128i {.importc: "_mm_packus_epi32".}

# operating : round packed double-precision floats using a specific rounding mode
# lane unit : float64 / lane numbers : 2
func mm_round_pd*(a: M128d, rounding: int32 | uint32): M128d {.importc: "_mm_round_pd".}

# operating : round packed single-precision floats using a specific rounding mode
# lane unit : float32 / lane numbers : 4
func mm_round_ps*(a: M128, rounding: int32 | uint32): M128 {.importc: "_mm_round_ps".}

# operating : round the lowest double-precision float using a specific rounding mode
# lane unit : float64 / lane numbers : 1
func mm_round_sd*(a, b: M128d, rounding: int32 | uint32): M128d {.importc: "_mm_round_sd".}

# operating : round the lowest single-precision float using a specific rounding mode
# lane unit : float32 / lane numbers : 1
func mm_round_ss*(a, b: M128, rounding: int32 | uint32): M128 {.importc: "_mm_round_ss".}

# operating : load 128-bits of integer data from memory using non-temporal hint (streaming load)
# lane unit : N/A / lane numbers : N/A
func mm_stream_load_si128*(p: pointer): M128i {.importc: "_mm_stream_load_si128".}

# operating : check if all bits are 1 in 'a'
# lane unit : N/A / lane numbers : N/A
func mm_test_all_ones*(a: M128i): int32 {.importc: "_mm_test_all_ones".}

# operating : check if all bits in ('a' AND 'mask') are zero
# lane unit : N/A / lane numbers : N/A
func mm_test_all_zeros*(a, mask: M128i): int32 {.importc: "_mm_test_all_zeros".}

# operating : check if ('a' AND 'mask') has both zeros and ones
# lane unit : N/A / lane numbers : N/A
func mm_test_mix_ones_zeros*(a, mask: M128i): int32 {.importc: "_mm_test_mix_ones_zeros".}

# operating : check if (NOT 'a' AND 'b') is zero
# lane unit : N/A / lane numbers : N/A
func mm_testc_si128*(a, b: M128i): int32 {.importc: "_mm_testc_si128".}

# operating : check if ('a' AND 'b') is non-zero AND (NOT 'a' AND 'b') is non-zero
# lane unit : N/A / lane numbers : N/A
func mm_testnzc_si128*(a, b: M128i): int32 {.importc: "_mm_testnzc_si128".}

# operating : check if ('a' AND 'b') is zero
# lane unit : N/A / lane numbers : N/A
func mm_testz_si128*(a, b: M128i): int32 {.importc: "_mm_testz_si128".}

{.pop.}
