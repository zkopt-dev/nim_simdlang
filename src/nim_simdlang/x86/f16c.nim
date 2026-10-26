import ./[sse2, avx]
export sse2, avx

{.push header: "immintrin.h".}

const
  MM_FROUND_TO_NEAREST_INT*: int32 = 0 ## round to nearest
  MM_FROUND_TO_NEG_INF*: int32 = 1      ## round down
  MM_FROUND_TO_POS_INF*: int32 = 2      ## round up
  MM_FROUND_TO_ZERO*: int32 = 3         ## truncate
  MM_FROUND_CUR_DIRECTION*: int32 = 4   ## use MXCSR.RC; see _MM_SET_ROUNDING_MODE

# operating : convert four 16-bit half-precision floats to 32-bit single-precision floats
# lane unit : float16 -> float32 / lane numbers : 4 (128-bit)
func mm_cvtph_ps*(a: M128i): M128 {.importc: "_mm_cvtph_ps".}

# operating : convert four 32-bit single-precision floats to 16-bit half-precision floats using imm8 rounding
# lane unit : float32 -> float16 / lane numbers : 4 (128-bit)
func mm_cvtps_ph*(a: M128, imm8: int32): M128i {.importc: "_mm_cvtps_ph".}

# operating : convert eight 16-bit half-precision floats to 32-bit single-precision floats
# lane unit : float16 -> float32 / lane numbers : 8 (256-bit)
func mm256_cvtph_ps*(a: M128i): M256 {.importc: "_mm256_cvtph_ps".}

# operating : convert eight 32-bit single-precision floats to 16-bit half-precision floats using imm8 rounding
# lane unit : float32 -> float16 / lane numbers : 8 (results in 128-bit)
func mm256_cvtps_ph*(a: M256, imm8: int32): M128i {.importc: "_mm256_cvtps_ph".}

{.pop.}
