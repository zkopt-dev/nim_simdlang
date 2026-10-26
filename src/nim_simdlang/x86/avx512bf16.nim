import avx512f

## [Macro Original]
## #define _AVX512BF16INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512BF16__

# --- AVX-512 BFloat16 (BF16) Conversion & Dot Product ---

# operating : convert a scalar BF16 value to a 32-bit float
# lane unit : bf16 -> float32 (scalar)
func mm_cvtsbh_ss*(a: BF16): float32 {.importc: "_mm_cvtsbh_ss".}

# operating : convert two 512-bit FP32 vectors (a, b) into one 512-bit BF16 vector using nearest-even rounding
# lane unit : float32[16] + float32[16] -> bf16[32] / total : 512-bit
func mm512_cvtne2ps_pbh*(a: M512, b: M512): M512bh {.importc: "_mm512_cvtne2ps_pbh".}

# operating : conditionally convert two FP32 vectors to BF16 using a mask (merge with a)
# lane unit : float32 + float32 -> bf16 (masked) / total : 512-bit
func mm512_mask_cvtne2ps_pbh*(a: M512bh, b: MMask32, c: M512, d: M512): M512bh {.importc: "_mm512_mask_cvtne2ps_pbh".}

# operating : conditionally convert two FP32 vectors to BF16 using a mask (zero-initialized)
# lane unit : float32 + float32 -> bf16 (maskz) / total : 512-bit
func mm512_maskz_cvtne2ps_pbh*(a: MMask32, b: M512, c: M512): M512bh {.importc: "_mm512_maskz_cvtne2ps_pbh".}

# operating : convert a 512-bit FP32 vector to a 256-bit BF16 vector using nearest-even rounding
# lane unit : float32[16] -> bf16[16] / source : 512-bit -> dest : 256-bit
func mm512_cvtneps_pbh*(a: M512): M256bh {.importc: "_mm512_cvtneps_pbh".}

# operating : conditionally convert a 512-bit FP32 vector to 256-bit BF16 using a mask (merge with a)
# lane unit : float32 -> bf16 (masked) / dest : 256-bit
func mm512_mask_cvtneps_pbh*(a: M256bh, b: MMask16, c: M512): M256bh {.importc: "_mm512_mask_cvtneps_pbh".}

# operating : conditionally convert a 512-bit FP32 vector to 256-bit BF16 using a mask (zero-initialized)
# lane unit : float32 -> bf16 (maskz) / dest : 256-bit
func mm512_maskz_cvtneps_pbh*(a: MMask16, b: M512): M256bh {.importc: "_mm512_maskz_cvtneps_pbh".}

# operating : multiply BF16 pairs from b and c, add intermediate dot products to FP32 vector a
# lane unit : (bf16 * bf16) + float32 / total : 512-bit (16 lanes of FP32 results)
func mm512_dpbf16_ps*(a: M512, b: M512bh, c: M512bh): M512 {.importc: "_mm512_dpbf16_ps".}

# operating : conditionally perform BF16 dot product and accumulate to a using a mask
# lane unit : (bf16 * bf16) + float32 (masked) / total : 512-bit
func mm512_mask_dpbf16_ps*(a: M512, b: MMask16, c: M512bh, d: M512bh): M512 {.importc: "_mm512_mask_dpbf16_ps".}

# operating : conditionally perform BF16 dot product and accumulate to zero-initialized vector using a mask
# lane unit : (bf16 * bf16) + float32 (maskz) / total : 512-bit
func mm512_maskz_dpbf16_ps*(a: MMask16, b: M512, c: M512bh, d: M512bh): M512 {.importc: "_mm512_maskz_dpbf16_ps".}

# operating : convert a 256-bit BF16 vector to a 512-bit FP32 vector
# lane unit : bf16[16] -> float32[16] / source : 256-bit -> dest : 512-bit
func mm512_cvtpbh_ps*(a: M256bh): M512 {.importc: "_mm512_cvtpbh_ps".}

# operating : conditionally convert a 256-bit BF16 vector to 512-bit FP32 using a mask (zero-initialized)
# lane unit : bf16 -> float32 (maskz) / dest : 512-bit
func mm512_maskz_cvtpbh_ps*(u: MMask16, a: M256bh): M512 {.importc: "_mm512_maskz_cvtpbh_ps".}

# operating : conditionally convert a 256-bit BF16 vector to 512-bit FP32 using a mask (merge with s)
# lane unit : bf16 -> float32 (masked) / dest : 512-bit
func mm512_mask_cvtpbh_ps*(s: M512, u: MMask16, a: M256bh): M512 {.importc: "_mm512_mask_cvtpbh_ps".}