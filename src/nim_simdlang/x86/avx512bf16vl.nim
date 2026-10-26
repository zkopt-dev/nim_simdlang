import avx512f
import avx
import sse
import sse2

## [Macro Original]
## #define _AVX512BF16VLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512BF16VL__

# --- AVX-512 Cast, Shift and Sign-Extension ---

# operating : cast 128-bit integer vector to 128-bit float vector (no bit change)
# lane unit : bitwise cast (m128i -> m128)
func mm_avx512_castsi128_ps*(a: M128i): M128 {.importc: "_mm_avx512_castsi128_ps".}

# operating : cast 256-bit integer vector to 256-bit float vector (no bit change)
# lane unit : bitwise cast (m256i -> m256)
func mm256_avx512_castsi256_ps*(a: M256i): M256 {.importc: "_mm256_avx512_castsi256_ps".}

# operating : shift left 32-bit integers in a 128-bit vector by immediate count b
# lane unit : i32 << b / total : 128-bit (4 lanes)
func mm_avx512_slli_epi32*(a: M128i, b: int32): M128i {.importc: "_mm_avx512_slli_epi32".}

# operating : shift left 32-bit integers in a 256-bit vector by immediate count b
# lane unit : i32 << b / total : 256-bit (8 lanes)
func mm256_avx512_slli_epi32*(a: M256i, b: int32): M256i {.importc: "_mm256_avx512_slli_epi32".}

# operating : sign-extend 16-bit integers from x to 32-bit integers in a 128-bit vector
# lane unit : i16 -> i32 (sign-extend) / source : 64-bit of x -> dest : 128-bit
func mm_avx512_cvtepi16_epi32*(x: M128i): M128i {.importc: "_mm_avx512_cvtepi16_epi32".}

# operating : sign-extend 16-bit integers from x to 32-bit integers in a 256-bit vector
# lane unit : i16 -> i32 (sign-extend) / source : 128-bit of x -> dest : 256-bit
func mm256_avx512_cvtepi16_epi32*(x: M128i): M256i {.importc: "_mm256_avx512_cvtepi16_epi32".}

## [Macro Original]
## #define _mm256_cvtneps_pbh(A) \
## (__m128bh) __builtin_ia32_cvtneps2bf16_v8sf (A)

## [Macro Original]
## #define _mm_cvtneps_pbh(A) \
## (__m128bh) __builtin_ia32_cvtneps2bf16_v4sf (A)

# --- AVX-128/256 BFloat16 (BF16) Conversion & Dot Product ---

# operating : convert two 256-bit FP32 vectors (a, b) into one 256-bit BF16 vector using nearest-even rounding
# lane unit : float32[8] + float32[8] -> bf16[16] / total : 256-bit
func mm256_cvtne2ps_pbh*(a: M256, b: M256): M256bh {.importc: "_mm256_cvtne2ps_pbh".}

# operating : conditionally convert 두 256-bit FP32 vectors to BF16 using a mask (merge with a)
# lane unit : float32 + float32 -> bf16 (masked) / total : 256-bit
func mm256_mask_cvtne2ps_pbh*(a: M256bh, b: MMask16, c: M256, d: M256): M256bh {.importc: "_mm256_mask_cvtne2ps_pbh".}

# operating : conditionally convert 두 256-bit FP32 vectors to BF16 using a mask (zero-initialized)
# lane unit : float32 + float32 -> bf16 (maskz) / total : 256-bit
func mm256_maskz_cvtne2ps_pbh*(a: MMask16, b: M256, c: M256): M256bh {.importc: "_mm256_maskz_cvtne2ps_pbh".}

# operating : convert 두 128-bit FP32 vectors (a, b) into one 128-bit BF16 vector using nearest-even rounding
# lane unit : float32[4] + float32[4] -> bf16[8] / total : 128-bit
func mm_cvtne2ps_pbh*(a: M128, b: M128): M128bh {.importc: "_mm_cvtne2ps_pbh".}

# operating : conditionally convert 두 128-bit FP32 vectors to BF16 using a mask (merge with a)
# lane unit : float32 + float32 -> bf16 (masked) / total : 128-bit
func mm_mask_cvtne2ps_pbh*(a: M128bh, b: MMask8, c: M128, d: M128): M128bh {.importc: "_mm_mask_cvtne2ps_pbh".}

# operating : conditionally convert 두 128-bit FP32 vectors to BF16 using a mask (zero-initialized)
# lane unit : float32 + float32 -> bf16 (maskz) / total : 128-bit
func mm_maskz_cvtne2ps_pbh*(a: MMask8, b: M128, c: M128): M128bh {.importc: "_mm_maskz_cvtne2ps_pbh".}

# operating : conditionally convert a 256-bit FP32 vector to 128-bit BF16 using a mask (merge with a)
# lane unit : float32[8] -> bf16[8] / source : 256-bit -> dest : 128-bit
func mm256_mask_cvtneps_pbh*(a: M128bh, b: MMask8, c: M256): M128bh {.importc: "_mm256_mask_cvtneps_pbh".}

# operating : conditionally convert a 256-bit FP32 vector to 128-bit BF16 using a mask (zero-initialized)
# lane unit : float32[8] -> bf16[8] / source : 256-bit -> dest : 128-bit
func mm256_maskz_cvtneps_pbh*(a: MMask8, b: M256): M128bh {.importc: "_mm256_maskz_cvtneps_pbh".}

# operating : conditionally convert a 128-bit FP32 vector to 128-bit BF16 using a mask (merge with a)
# lane unit : float32[4] -> bf16[4] / source/dest : 128-bit
func mm_mask_cvtneps_pbh*(a: M128bh, b: MMask8, c: M128): M128bh {.importc: "_mm_mask_cvtneps_pbh".}

# operating : conditionally convert a 128-bit FP32 vector to 128-bit BF16 using a mask (zero-initialized)
# lane unit : float32[4] -> bf16[4] / source/dest : 128-bit
func mm_maskz_cvtneps_pbh*(a: MMask8, b: M128): M128bh {.importc: "_mm_maskz_cvtneps_pbh".}

# operating : multiply BF16 pairs from b and c, add intermediate dot products to FP32 vector a
# lane unit : (bf16 * bf16) + float32 / total : 256-bit (8 lanes of FP32 results)
func mm256_dpbf16_ps*(a: M256, b: M256bh, c: M256bh): M256 {.importc: "_mm256_dpbf16_ps".}

# operating : conditionally perform BF16 dot product and accumulate to a using a mask
# lane unit : (bf16 * bf16) + float32 (masked) / total : 256-bit
func mm256_mask_dpbf16_ps*(a: M256, b: MMask8, c: M256bh, d: M256bh): M256 {.importc: "_mm256_mask_dpbf16_ps".}

# operating : conditionally perform BF16 dot product and accumulate to zero-initialized vector using a mask
# lane unit : (bf16 * bf16) + float32 (maskz) / total : 256-bit
func mm256_maskz_dpbf16_ps*(a: MMask8, b: M256, c: M256bh, d: M256bh): M256 {.importc: "_mm256_maskz_dpbf16_ps".}

# operating : multiply BF16 pairs from b and c, add intermediate dot products to FP32 vector a
# lane unit : (bf16 * bf16) + float32 / total : 128-bit (4 lanes of FP32 results)
func mm_dpbf16_ps*(a: M128, b: M128bh, c: M128bh): M128 {.importc: "_mm_dpbf16_ps".}

# operating : conditionally perform BF16 dot product and accumulate to a using a mask
# lane unit : (bf16 * bf16) + float32 (masked) / total : 128-bit
func mm_mask_dpbf16_ps*(a: M128, b: MMask8, c: M128bh, d: M128bh): M128 {.importc: "_mm_mask_dpbf16_ps".}

# operating : conditionally perform BF16 dot product and accumulate to zero-initialized vector using a mask
# lane unit : (bf16 * bf16) + float32 (maskz) / total : 128-bit
func mm_maskz_dpbf16_ps*(a: MMask8, b: M128, c: M128bh, d: M128bh): M128 {.importc: "_mm_maskz_dpbf16_ps".}

# operating : convert a scalar 32-bit float to a BF16 value using nearest-even rounding
# lane unit : float32 -> bf16 (scalar)
func mm_cvtness_sbh*(a: float32): BF16 {.importc: "_mm_cvtness_sbh".}

# operating : convert a 128-bit BF16 vector to a 128-bit FP32 vector (first 4 elements)
# lane unit : bf16 -> float32 / total : 128-bit
func mm_cvtpbh_ps*(a: M128bh): M128 {.importc: "_mm_cvtpbh_ps".}

# operating : convert a 128-bit BF16 vector to a 256-bit FP32 vector (8 elements)
# lane unit : bf16[8] -> float32[8] / source : 128-bit -> dest : 256-bit
func mm256_cvtpbh_ps*(a: M128bh): M256 {.importc: "_mm256_cvtpbh_ps".}

# operating : conditionally convert a 128-bit BF16 vector to 128-bit FP32 using a mask (zero-initialized)
# lane unit : bf16 -> float32 (maskz) / total : 128-bit
func mm_maskz_cvtpbh_ps*(u: MMask8, a: M128bh): M128 {.importc: "_mm_maskz_cvtpbh_ps".}

# operating : conditionally convert a 128-bit BF16 vector to 256-bit FP32 using a mask (zero-initialized)
# lane unit : bf16 -> float32 (maskz) / total : 256-bit
func mm256_maskz_cvtpbh_ps*(u: MMask8, a: M128bh): M256 {.importc: "_mm256_maskz_cvtpbh_ps".}

# operating : conditionally convert a 128-bit BF16 vector to 128-bit FP32 using a mask (merge with s)
# lane unit : bf16 -> float32 (masked) / total : 128-bit
func mm_mask_cvtpbh_ps*(s: M128, u: MMask8, a: M128bh): M128 {.importc: "_mm_mask_cvtpbh_ps".}

# operating : conditionally convert a 128-bit BF16 vector to 256-bit FP32 using a mask (merge with s)
# lane unit : bf16 -> float32 (masked) / total : 256-bit
func mm256_mask_cvtpbh_ps*(s: M256, u: MMask8, a: M128bh): M256 {.importc: "_mm256_mask_cvtpbh_ps".}