## SSSE3 intrinsics

import sse
import sse2
import sse3
export sse3

{.push header: "tmmintrin.h".}

# operating : compute the absolute value of packed signed 16-bit integers
# lane unit : int16 / lane numbers : 8
func mm_abs_epi16*(a: M128i): M128i {.importc: "_mm_abs_epi16".}

# operating : compute the absolute value of packed signed 32-bit integers
# lane unit : int32 / lane numbers : 4
func mm_abs_epi32*(a: M128i): M128i {.importc: "_mm_abs_epi32".}

# operating : compute the absolute value of packed signed 8-bit integers
# lane unit : int8 / lane numbers : 16
func mm_abs_epi8*(a: M128i): M128i {.importc: "_mm_abs_epi8".}

# operating : concatenate 'a' and 'b', then extract a 128-bit shifted window by byte offset 'imm8'
# lane unit : int8 / lane numbers : 16
func mm_alignr_epi8*(a, b: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_alignr_epi8".}

# operating : horizontally add adjacent pairs of signed 16-bit integers from 'a' and 'b'
# lane unit : int16 / lane numbers : 8
func mm_hadd_epi16*(a, b: M128i): M128i {.importc: "_mm_hadd_epi16".}

# operating : horizontally add adjacent pairs of signed 32-bit integers from 'a' and 'b'
# lane unit : int32 / lane numbers : 4
func mm_hadd_epi32*(a, b: M128i): M128i {.importc: "_mm_hadd_epi32".}

# operating : horizontally add adjacent pairs of signed 16-bit integers with saturation
# lane unit : int16 / lane numbers : 8
func mm_hadds_epi16*(a, b: M128i): M128i {.importc: "_mm_hadds_epi16".}

# operating : horizontally subtract adjacent pairs of signed 16-bit integers from 'a' and 'b'
# lane unit : int16 / lane numbers : 8
func mm_hsub_epi16*(a, b: M128i): M128i {.importc: "_mm_hsub_epi16".}

# operating : horizontally subtract adjacent pairs of signed 32-bit integers from 'a' and 'b'
# lane unit : int32 / lane numbers : 4
func mm_hsub_epi32*(a, b: M128i): M128i {.importc: "_mm_hsub_epi32".}

# operating : horizontally subtract adjacent pairs of signed 16-bit integers with saturation
# lane unit : int16 / lane numbers : 8
func mm_hsubs_epi16*(a, b: M128i): M128i {.importc: "_mm_hsubs_epi16".}

# operating : multiply unsigned 8-bit integers from 'a' with signed 8-bit integers from 'b', then add adjacent pairs with saturation
# lane unit : int8 -> int16 / lane numbers : 16 -> 8
func mm_maddubs_epi16*(a, b: M128i): M128i {.importc: "_mm_maddubs_epi16".}

# operating : multiply signed 16-bit integers, scale/round the result, and return the high 16-bits
# lane unit : int16 / lane numbers : 8
func mm_mulhrs_epi16*(a, b: M128i): M128i {.importc: "_mm_mulhrs_epi16".}

# operating : shuffle bytes in 'a' according to the mask in 'b' (PSHUFB)
# lane unit : int8 / lane numbers : 16
func mm_shuffle_epi8*(a, b: M128i): M128i {.importc: "_mm_shuffle_epi8".}

# operating : negate, zero, or preserve elements in 'a' based on the signs of elements in 'b'
# lane unit : int16 / lane numbers : 8
func mm_sign_epi16*(a, b: M128i): M128i {.importc: "_mm_sign_epi16".}

# operating : negate, zero, or preserve elements in 'a' based on the signs of elements in 'b'
# lane unit : int32 / lane numbers : 4
func mm_sign_epi32*(a, b: M128i): M128i {.importc: "_mm_sign_epi32".}

# operating : negate, zero, or preserve elements in 'a' based on the signs of elements in 'b'
# lane unit : int8 / lane numbers : 16
func mm_sign_epi8*(a, b: M128i): M128i {.importc: "_mm_sign_epi8".}

func mm_hadd_pi16*(x: M64, y: M64): M64 {.importc: "_mm_hadd_pi16".}

func mm_hadd_pi32*(x: M64, y: M64): M64 {.importc: "_mm_hadd_pi32".}

func mm_hadds_pi16*(x: M64, y: M64): M64 {.importc: "_mm_hadds_pi16".}

func mm_hsub_pi16*(x: M64, y: M64): M64 {.importc: "_mm_hsub_pi16".}

func mm_hsub_pi32*(x: M64, y: M64): M64 {.importc: "_mm_hsub_pi32".}

func mm_hsubs_pi16*(x: M64, y: M64): M64 {.importc: "_mm_hsubs_pi16".}

func mm_maddubs_pi16*(x: M64, y: M64): M64 {.importc: "_mm_maddubs_pi16".}

func mm_mulhrs_pi16*(x: M64, y: M64): M64 {.importc: "_mm_mulhrs_pi16".}

func mm_shuffle_pi8*(x: M64, y: M64): M64 {.importc: "_mm_shuffle_pi8".}

func mm_sign_pi8*(x: M64, y: M64): M64 {.importc: "_mm_sign_pi8".}

func mm_sign_pi16*(x: M64, y: M64): M64 {.importc: "_mm_sign_pi16".}

func mm_sign_pi32*(x: M64, y: M64): M64 {.importc: "_mm_sign_pi32".}

func mm_alignr_pi8*(x: M64, y: M64, n: int32): M64 {.importc: "_mm_alignr_pi8".}

func mm_abs_pi8*(x: M64): M64 {.importc: "_mm_abs_pi8".}

func mm_abs_pi16*(x: M64): M64 {.importc: "_mm_abs_pi16".}

func mm_abs_pi32*(x: M64): M64 {.importc: "_mm_abs_pi32".}

{.pop.}
