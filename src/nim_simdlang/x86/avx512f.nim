import avx2
import sse
import sse2

export avx2

type
  M512* {.importc: "__m512", header: "immintrin.h", bycopy.} = object
  M512i* {.importc: "__m512i", header: "immintrin.h", bycopy.} = object
  M512d* {.importc: "__m512d", header: "immintrin.h", bycopy.} = object
  M512bh* {.importc: "__m512bh", header: "immintrin.h", bycopy.} = object
  M256bh* {.importc: "__m256bh", header: "immintrin.h", bycopy.} = object
  M128bh* {.importc: "__m128bh", header: "immintrin.h", bycopy.} = object
  M512h* {.importc: "__m512h", header: "immintrin.h", bycopy.} = object
  M256h* {.importc: "__m256h", header: "immintrin.h", bycopy.} = object
  M128h* {.importc: "__m128h", header: "immintrin.h", bycopy.} = object

  MMask8* {.importc: "__mmask8", header: "immintrin.h".} = uint8
  MMask16* {.importc: "__mmask16", header: "immintrin.h".} = uint16
  MMask32* {.importc: "__mmask32", header: "immintrin.h".} = uint32
  MMask64* {.importc: "__mmask64", header: "immintrin.h".} = uint64

  V16hi_u* {.importc: "__v16hi_u", header: "immintrin.h", bycopy.} = object
    data: array[16, int16]

  V8hi_u* {.importc: "__v8hi_u", header: "immintrin.h", bycopy.} = object
    data: array[8, int16]

  V32qi_u* {.importc: "__v32qi_u", header: "immintrin.h", bycopy.} = object
    data: array[32, int8]

  V16qi_u* {.importc: "__v16qi_u", header: "immintrin.h", bycopy.} = object
    data: array[16, int8]

  V4si_u* {.importc: "__v4si_u", header: "immintrin.h", bycopy.} = object
    data: array[4, int32]

  V8si_u* {.importc: "__v8si_u", header: "immintrin.h", bycopy.} = object
    data: array[8, int32]

  V2di_u* {.importc: "__v2di_u", header: "immintrin.h", bycopy.} = object
    data: array[2, int64]

  V4di_u* {.importc: "__v4di_u", header: "immintrin.h", bycopy.} = object
    data: array[4, int64]

  BF16* {.importc: "__bf16", header: "immintrin.h".} = distinct uint16

  Float16* {.importc: "_Float16", header: "immintrin.h".} = distinct uint16

  MM_MANTISSA_NORM_ENUM* {.importc: "_MM_MANTISSA_NORM_ENUM", header: "avx512fintrin.h", bycopy.} = enum
    MM_MANT_NORM_1_2,
    MM_MANT_NORM_p5_2,
    MM_MANT_NORM_p5_1,
    MM_MANT_NORM_p75_1p5

  MM_MANTISSA_SIGN_ENUM* {.importc: "_MM_MANTISSA_SIGN_ENUM", header: "avx512fintrin.h", bycopy.} = enum
    MM_MANT_SIGN_src,
    MM_MANT_SIGN_zero,
    MM_MANT_SIGN_nan

  MM_PERM_ENUM* {.exportc: "_MM_PERM_ENUM", header: "avx512fintrin.h", bycopy.} = enum
    AAAA = 0x00, AAAB = 0x01, AAAC = 0x02, AAAD = 0x03,  
    AABA = 0x04, AABB = 0x05, AABC = 0x06, AABD = 0x07, 
    AACA = 0x08, AACB = 0x09, AACC = 0x0A, AACD = 0x0B, 
    AADA = 0x0C, AADB = 0x0D, AADC = 0x0E, AADD = 0x0F, 
    ABAA = 0x10, ABAB = 0x11, ABAC = 0x12, ABAD = 0x13, 
    ABBA = 0x14, ABBB = 0x15, ABBC = 0x16, ABBD = 0x17, 
    ABCA = 0x18, ABCB = 0x19, ABCC = 0x1A, ABCD = 0x1B, 
    ABDA = 0x1C, ABDB = 0x1D, ABDC = 0x1E, ABDD = 0x1F, 
    ACAA = 0x20, ACAB = 0x21, ACAC = 0x22, ACAD = 0x23, 
    ACBA = 0x24, ACBB = 0x25, ACBC = 0x26, ACBD = 0x27, 
    ACCA = 0x28, ACCB = 0x29, ACCC = 0x2A, ACCD = 0x2B, 
    ACDA = 0x2C, ACDB = 0x2D, ACDC = 0x2E, ACDD = 0x2F, 
    ADAA = 0x30, ADAB = 0x31, ADAC = 0x32, ADAD = 0x33, 
    ADBA = 0x34, ADBB = 0x35, ADBC = 0x36, ADBD = 0x37, 
    ADCA = 0x38, ADCB = 0x39, ADCC = 0x3A, ADCD = 0x3B, 
    ADDA = 0x3C, ADDB = 0x3D, ADDC = 0x3E, ADDD = 0x3F, 
    BAAA = 0x40, BAAB = 0x41, BAAC = 0x42, BAAD = 0x43, 
    BABA = 0x44, BABB = 0x45, BABC = 0x46, BABD = 0x47, 
    BACA = 0x48, BACB = 0x49, BACC = 0x4A, BACD = 0x4B, 
    BADA = 0x4C, BADB = 0x4D, BADC = 0x4E, BADD = 0x4F, 
    BBAA = 0x50, BBAB = 0x51, BBAC = 0x52, BBAD = 0x53, 
    BBBA = 0x54, BBBB = 0x55, BBBC = 0x56, BBBD = 0x57, 
    BBCA = 0x58, BBCB = 0x59, BBCC = 0x5A, BBCD = 0x5B, 
    BBDA = 0x5C, BBDB = 0x5D, BBDC = 0x5E, BBDD = 0x5F, 
    BCAA = 0x60, BCAB = 0x61, BCAC = 0x62, BCAD = 0x63, 
    BCBA = 0x64, BCBB = 0x65, BCBC = 0x66, BCBD = 0x67, 
    BCCA = 0x68, BCCB = 0x69, BCCC = 0x6A, BCCD = 0x6B, 
    BCDA = 0x6C, BCDB = 0x6D, BCDC = 0x6E, BCDD = 0x6F, 
    BDAA = 0x70, BDAB = 0x71, BDAC = 0x72, BDAD = 0x73, 
    BDBA = 0x74, BDBB = 0x75, BDBC = 0x76, BDBD = 0x77, 
    BDCA = 0x78, BDCB = 0x79, BDCC = 0x7A, BDCD = 0x7B, 
    BDDA = 0x7C, BDDB = 0x7D, BDDC = 0x7E, BDDD = 0x7F, 
    CAAA = 0x80, CAAB = 0x81, CAAC = 0x82, CAAD = 0x83, 
    CABA = 0x84, CABB = 0x85, CABC = 0x86, CABD = 0x87, 
    CACA = 0x88, CACB = 0x89, CACC = 0x8A, CACD = 0x8B, 
    CADA = 0x8C, CADB = 0x8D, CADC = 0x8E, CADD = 0x8F, 
    CBAA = 0x90, CBAB = 0x91, CBAC = 0x92, CBAD = 0x93, 
    CBBA = 0x94, CBBB = 0x95, CBBC = 0x96, CBBD = 0x97, 
    CBCA = 0x98, CBCB = 0x99, CBCC = 0x9A, CBCD = 0x9B, 
    CBDA = 0x9C, CBDB = 0x9D, CBDC = 0x9E, CBDD = 0x9F, 
    CCAA = 0xA0, CCAB = 0xA1, CCAC = 0xA2, CCAD = 0xA3, 
    CCBA = 0xA4, CCBB = 0xA5, CCBC = 0xA6, CCBD = 0xA7, 
    CCCA = 0xA8, CCCB = 0xA9, CCCC = 0xAA, CCCD = 0xAB, 
    CCDA = 0xAC, CCDB = 0xAD, CCDC = 0xAE, CCDD = 0xAF, 
    CDAA = 0xB0, CDAB = 0xB1, CDAC = 0xB2, CDAD = 0xB3, 
    CDBA = 0xB4, CDBB = 0xB5, CDBC = 0xB6, CDBD = 0xB7, 
    CDCA = 0xB8, CDCB = 0xB9, CDCC = 0xBA, CDCD = 0xBB, 
    CDDA = 0xBC, CDDB = 0xBD, CDDC = 0xBE, CDDD = 0xBF, 
    DAAA = 0xC0, DAAB = 0xC1, DAAC = 0xC2, DAAD = 0xC3, 
    DABA = 0xC4, DABB = 0xC5, DABC = 0xC6, DABD = 0xC7, 
    DACA = 0xC8, DACB = 0xC9, DACC = 0xCA, DACD = 0xCB, 
    DADA = 0xCC, DADB = 0xCD, DADC = 0xCE, DADD = 0xCF, 
    DBAA = 0xD0, DBAB = 0xD1, DBAC = 0xD2, DBAD = 0xD3, 
    DBBA = 0xD4, DBBB = 0xD5, DBBC = 0xD6, DBBD = 0xD7, 
    DBCA = 0xD8, DBCB = 0xD9, DBCC = 0xDA, DBCD = 0xDB, 
    DBDA = 0xDC, DBDB = 0xDD, DBDC = 0xDE, DBDD = 0xDF, 
    DCAA = 0xE0, DCAB = 0xE1, DCAC = 0xE2, DCAD = 0xE3, 
    DCBA = 0xE4, DCBB = 0xE5, DCBC = 0xE6, DCBD = 0xE7, 
    DCCA = 0xE8, DCCB = 0xE9, DCCC = 0xEA, DCCD = 0xEB, 
    DCDA = 0xEC, DCDB = 0xED, DCDC = 0xEE, DCDD = 0xEF, 
    DDAA = 0xF0, DDAB = 0xF1, DDAC = 0xF2, DDAD = 0xF3, 
    DDBA = 0xF4, DDBB = 0xF5, DDBC = 0xF6, DDBD = 0xF7, 
    DDCA = 0xF8, DDCB = 0xF9, DDCC = 0xFA, DDCD = 0xFB, 
    DDDA = 0xFC, DDDB = 0xFD, DDDC = 0xFE, DDDD = 0xFF

{.push header: "immintrin.h".}

## [Macro Original]
## #define _AVX512FINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512F__

func mm_avx512_undefined_ps*(): M128 {.importc: "_mm_avx512_undefined_ps".}

func mm_avx512_undefined_pd*(): M128d {.importc: "_mm_avx512_undefined_pd".}

func mm_avx512_setzero_ps*(): M128 {.importc: "_mm_avx512_setzero_ps".}

func mm_avx512_setzero_pd*(): M128d {.importc: "_mm_avx512_setzero_pd".}

func mm_add_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_add_round_sd".}

func mm_mask_add_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_add_round_sd".}

func mm_maskz_add_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_add_round_sd".}

func mm_add_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_add_round_ss".}

func mm_mask_add_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_add_round_ss".}

func mm_maskz_add_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_add_round_ss".}

func mm_sub_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_sub_round_sd".}

func mm_mask_sub_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_sub_round_sd".}

func mm_maskz_sub_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_sub_round_sd".}

func mm_sub_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_sub_round_ss".}

func mm_mask_sub_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_sub_round_ss".}

func mm_maskz_sub_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_sub_round_ss".}

## [Macro Original]
## #define _mm_add_round_sd(A, B, C)            \
## (__m128d)__builtin_ia32_addsd_round(A, B, C)

## [Macro Original]
## #define _mm_mask_add_round_sd(W, U, A, B, C) \
## (__m128d)__builtin_ia32_addsd_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_add_round_sd(U, A, B, C)   \
## (__m128d)__builtin_ia32_addsd_mask_round(A, B, (__v2df)_mm_avx512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm_add_round_ss(A, B, C)            \
## (__m128)__builtin_ia32_addss_round(A, B, C)

## [Macro Original]
## #define _mm_mask_add_round_ss(W, U, A, B, C) \
## (__m128)__builtin_ia32_addss_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_add_round_ss(U, A, B, C)   \
## (__m128)__builtin_ia32_addss_mask_round(A, B, (__v4sf)_mm_avx512_setzero_ps(), U, C)

## [Macro Original]
## #define _mm_sub_round_sd(A, B, C)            \
## (__m128d)__builtin_ia32_subsd_round(A, B, C)

## [Macro Original]
## #define _mm_mask_sub_round_sd(W, U, A, B, C) \
## (__m128d)__builtin_ia32_subsd_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_sub_round_sd(U, A, B, C)   \
## (__m128d)__builtin_ia32_subsd_mask_round(A, B, (__v2df)_mm_avx512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm_sub_round_ss(A, B, C)            \
## (__m128)__builtin_ia32_subss_round(A, B, C)

## [Macro Original]
## #define _mm_mask_sub_round_ss(W, U, A, B, C) \
## (__m128)__builtin_ia32_subss_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_sub_round_ss(U, A, B, C)   \
## (__m128)__builtin_ia32_subss_mask_round(A, B, (__v4sf)_mm_avx512_setzero_ps(), U, C)

func mm_rcp14_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_rcp14_sd".}

func mm_mask_rcp14_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_rcp14_sd".}

func mm_maskz_rcp14_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_rcp14_sd".}

func mm_rcp14_ss*(a: M128, b: M128): M128 {.importc: "_mm_rcp14_ss".}

func mm_mask_rcp14_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_rcp14_ss".}

func mm_maskz_rcp14_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_rcp14_ss".}

func mm_rsqrt14_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_rsqrt14_sd".}

func mm_mask_rsqrt14_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_rsqrt14_sd".}

func mm_maskz_rsqrt14_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_rsqrt14_sd".}

func mm_rsqrt14_ss*(a: M128, b: M128): M128 {.importc: "_mm_rsqrt14_ss".}

func mm_mask_rsqrt14_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_rsqrt14_ss".}

func mm_maskz_rsqrt14_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_rsqrt14_ss".}

func mm_sqrt_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_sqrt_round_sd".}

func mm_mask_sqrt_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_sqrt_round_sd".}

func mm_maskz_sqrt_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_sqrt_round_sd".}

func mm_sqrt_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_sqrt_round_ss".}

func mm_mask_sqrt_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_sqrt_round_ss".}

func mm_maskz_sqrt_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_sqrt_round_ss".}

func mm_mul_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mul_round_sd".}

func mm_mask_mul_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_mul_round_sd".}

func mm_maskz_mul_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_mul_round_sd".}

func mm_mul_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_mul_round_ss".}

func mm_mask_mul_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_mul_round_ss".}

func mm_maskz_mul_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_mul_round_ss".}

func mm_div_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_div_round_sd".}

func mm_mask_div_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_div_round_sd".}

func mm_maskz_div_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_div_round_sd".}

func mm_div_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_div_round_ss".}

func mm_mask_div_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_div_round_ss".}

func mm_maskz_div_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_div_round_ss".}

func mm_scalef_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_scalef_round_sd".}

func mm_mask_scalef_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_scalef_round_sd".}

func mm_maskz_scalef_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_scalef_round_sd".}

func mm_scalef_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_scalef_round_ss".}

func mm_mask_scalef_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_scalef_round_ss".}

func mm_maskz_scalef_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_scalef_round_ss".}

## [Macro Original]
## #define _mm_sqrt_round_sd(A, B, C)	      \
## (__m128d)__builtin_ia32_sqrtsd_mask_round (B, A, \
## (__v2df) _mm_avx512_setzero_pd (), -1, C)

## [Macro Original]
## #define _mm_mask_sqrt_round_sd(W, U, A, B, C) \
## (__m128d)__builtin_ia32_sqrtsd_mask_round (B, A, W, U, C)

## [Macro Original]
## #define _mm_maskz_sqrt_round_sd(U, A, B, C)   \
## (__m128d)__builtin_ia32_sqrtsd_mask_round (B, A, \
## (__v2df) _mm_avx512_setzero_pd (), U, C)

## [Macro Original]
## #define _mm_sqrt_round_ss(A, B, C)	      \
## (__m128)__builtin_ia32_sqrtss_mask_round (B, A, \
## (__v4sf) _mm_avx512_setzero_ps (), -1, C)

## [Macro Original]
## #define _mm_mask_sqrt_round_ss(W, U, A, B, C) \
## (__m128)__builtin_ia32_sqrtss_mask_round (B, A, W, U, C)

## [Macro Original]
## #define _mm_maskz_sqrt_round_ss(U, A, B, C)   \
## (__m128)__builtin_ia32_sqrtss_mask_round (B, A, \
## (__v4sf) _mm_avx512_setzero_ps (), U, C)

## [Macro Original]
## #define _mm_mul_round_sd(A, B, C)            \
## (__m128d)__builtin_ia32_mulsd_round(A, B, C)

## [Macro Original]
## #define _mm_mask_mul_round_sd(W, U, A, B, C) \
## (__m128d)__builtin_ia32_mulsd_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_mul_round_sd(U, A, B, C)   \
## (__m128d)__builtin_ia32_mulsd_mask_round(A, B, (__v2df)_mm_avx512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm_mul_round_ss(A, B, C)            \
## (__m128)__builtin_ia32_mulss_round(A, B, C)

## [Macro Original]
## #define _mm_mask_mul_round_ss(W, U, A, B, C) \
## (__m128)__builtin_ia32_mulss_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_mul_round_ss(U, A, B, C)   \
## (__m128)__builtin_ia32_mulss_mask_round(A, B, (__v4sf)_mm_avx512_setzero_ps(), U, C)

## [Macro Original]
## #define _mm_div_round_sd(A, B, C)            \
## (__m128d)__builtin_ia32_divsd_round(A, B, C)

## [Macro Original]
## #define _mm_mask_div_round_sd(W, U, A, B, C) \
## (__m128d)__builtin_ia32_divsd_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_div_round_sd(U, A, B, C)   \
## (__m128d)__builtin_ia32_divsd_mask_round(A, B, (__v2df)_mm_avx512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm_div_round_ss(A, B, C)            \
## (__m128)__builtin_ia32_divss_round(A, B, C)

## [Macro Original]
## #define _mm_mask_div_round_ss(W, U, A, B, C) \
## (__m128)__builtin_ia32_divss_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_div_round_ss(U, A, B, C)   \
## (__m128)__builtin_ia32_divss_mask_round(A, B, (__v4sf)_mm_avx512_setzero_ps(), U, C)

## [Macro Original]
## #define _mm_scalef_round_sd(A, B, C)					\
## ((__m128d)								\
## __builtin_ia32_scalefsd_mask_round ((A), (B),			\
## (__v2df) _mm_avx512_undefined_pd (),	\
## -1, (C)))

## [Macro Original]
## #define _mm_scalef_round_ss(A, B, C)					\
## ((__m128)								\
## __builtin_ia32_scalefss_mask_round ((A), (B),			\
## (__v4sf) _mm_avx512_undefined_ps (),	\
## -1, (C)))

## [Macro Original]
## #define _mm_mask_scalef_round_sd(W, U, A, B, C)				\
## ((__m128d)								\
## __builtin_ia32_scalefsd_mask_round ((A), (B), (W), (U), (C)))

## [Macro Original]
## #define _mm_mask_scalef_round_ss(W, U, A, B, C)				\
## ((__m128)								\
## __builtin_ia32_scalefss_mask_round ((A), (B), (W), (U), (C)))

## [Macro Original]
## #define _mm_maskz_scalef_round_sd(U, A, B, C)				\
## ((__m128d)								\
## __builtin_ia32_scalefsd_mask_round ((A), (B),			\
## (__v2df) _mm_avx512_setzero_pd (),	\
## (U), (C)))

## [Macro Original]
## #define _mm_maskz_scalef_round_ss(U, A, B, C)				\
## ((__m128)								\
## __builtin_ia32_scalefss_mask_round ((A), (B),			\
## (__v4sf) _mm_avx512_setzero_ps (),	\
## (U), (C)))

## [Macro Original]
## #define _mm_mask_sqrt_sd(W, U, A, B) \
## _mm_mask_sqrt_round_sd ((W), (U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_maskz_sqrt_sd(U, A, B) \
## _mm_maskz_sqrt_round_sd ((U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_mask_sqrt_ss(W, U, A, B) \
## _mm_mask_sqrt_round_ss ((W), (U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_maskz_sqrt_ss(U, A, B) \
## _mm_maskz_sqrt_round_ss ((U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_mask_scalef_sd(W, U, A, B) \
## _mm_mask_scalef_round_sd ((W), (U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_maskz_scalef_sd(U, A, B) \
## _mm_maskz_scalef_round_sd ((U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_mask_scalef_ss(W, U, A, B) \
## _mm_mask_scalef_round_ss ((W), (U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_maskz_scalef_ss(U, A, B) \
## _mm_maskz_scalef_round_ss ((U), (A), (B), _MM_FROUND_CUR_DIRECTION)

func mm_cvtu32_sd*(a: M128d, b: uint32): M128d {.importc: "_mm_cvtu32_sd".}

func mm_cvt_roundu64_sd*(a: M128d, b: uint64, r: int32): M128d {.importc: "_mm_cvt_roundu64_sd".}

func mm_cvt_roundi64_sd*(a: M128d, b: int64, r: int32): M128d {.importc: "_mm_cvt_roundi64_sd".}

func mm_cvt_roundsi64_sd*(a: M128d, b: int64, r: int32): M128d {.importc: "_mm_cvt_roundsi64_sd".}

## [Macro Original]
## #define _mm_cvt_roundu64_sd(A, B, C)   \
## (__m128d)__builtin_ia32_cvtusi2sd64(A, B, C)

## [Macro Original]
## #define _mm_cvt_roundi64_sd(A, B, C)   \
## (__m128d)__builtin_ia32_cvtsi2sd64(A, B, C)

## [Macro Original]
## #define _mm_cvt_roundsi64_sd(A, B, C)   \
## (__m128d)__builtin_ia32_cvtsi2sd64(A, B, C)

func mm_cvt_roundu32_ss*(a: M128, b: uint32, r: int32): M128 {.importc: "_mm_cvt_roundu32_ss".}

func mm_cvt_roundsi32_ss*(a: M128, b: int32, r: int32): M128 {.importc: "_mm_cvt_roundsi32_ss".}

func mm_cvt_roundi32_ss*(a: M128, b: int32, r: int32): M128 {.importc: "_mm_cvt_roundi32_ss".}

## [Macro Original]
## #define _mm_cvt_roundu32_ss(A, B, C)   \
## (__m128)__builtin_ia32_cvtusi2ss32(A, B, C)

## [Macro Original]
## #define _mm_cvt_roundi32_ss(A, B, C)   \
## (__m128)__builtin_ia32_cvtsi2ss32(A, B, C)

## [Macro Original]
## #define _mm_cvt_roundsi32_ss(A, B, C)   \
## (__m128)__builtin_ia32_cvtsi2ss32(A, B, C)

func mm_cvt_roundu64_ss*(a: M128, b: uint64, r: int32): M128 {.importc: "_mm_cvt_roundu64_ss".}

func mm_cvt_roundsi64_ss*(a: M128, b: int64, r: int32): M128 {.importc: "_mm_cvt_roundsi64_ss".}

func mm_cvt_roundi64_ss*(a: M128, b: int64, r: int32): M128 {.importc: "_mm_cvt_roundi64_ss".}

## [Macro Original]
## #define _mm_cvt_roundu64_ss(A, B, C)   \
## (__m128)__builtin_ia32_cvtusi2ss64(A, B, C)

## [Macro Original]
## #define _mm_cvt_roundi64_ss(A, B, C)   \
## (__m128)__builtin_ia32_cvtsi2ss64(A, B, C)

## [Macro Original]
## #define _mm_cvt_roundsi64_ss(A, B, C)   \
## (__m128)__builtin_ia32_cvtsi2ss64(A, B, C)

func mm_mask_load_ss*(w: M128, u: MMask8, p: ptr float32): M128 {.importc: "_mm_mask_load_ss".}

func mm_maskz_load_ss*(u: MMask8, p: ptr float32): M128 {.importc: "_mm_maskz_load_ss".}

func mm_mask_load_sd*(w: M128d, u: MMask8, p: ptr float64): M128d {.importc: "_mm_mask_load_sd".}

func mm_maskz_load_sd*(u: MMask8, p: ptr float64): M128d {.importc: "_mm_maskz_load_sd".}

func mm_mask_move_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_move_ss".}

func mm_maskz_move_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_move_ss".}

func mm_mask_move_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_move_sd".}

func mm_maskz_move_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_move_sd".}

func mm_mask_store_ss*(p: ptr float32, u: MMask8, a: M128): void {.importc: "_mm_mask_store_ss".}

func mm_mask_store_sd*(p: ptr float64, u: MMask8, a: M128d): void {.importc: "_mm_mask_store_sd".}

func mm_fixupimm_round_sd*(a: M128d, b: M128d, c: M128i, imm: int32, r: int32): M128d {.importc: "_mm_fixupimm_round_sd".}

func mm_mask_fixupimm_round_sd*(a: M128d, u: MMask8, b: M128d, c: M128i, imm: int32, r: int32): M128d {.importc: "_mm_mask_fixupimm_round_sd".}

func mm_maskz_fixupimm_round_sd*(u: MMask8, a: M128d, b: M128d, c: M128i, imm: int32, r: int32): M128d {.importc: "_mm_maskz_fixupimm_round_sd".}

func mm_fixupimm_round_ss*(a: M128, b: M128, c: M128i, imm: int32, r: int32): M128 {.importc: "_mm_fixupimm_round_ss".}

func mm_mask_fixupimm_round_ss*(a: M128, u: MMask8, b: M128, c: M128i, imm: int32, r: int32): M128 {.importc: "_mm_mask_fixupimm_round_ss".}

func mm_maskz_fixupimm_round_ss*(u: MMask8, a: M128, b: M128, c: M128i, imm: int32, r: int32): M128 {.importc: "_mm_maskz_fixupimm_round_ss".}

## [Macro Original]
## #define _mm_fixupimm_round_sd(X, Y, Z, C, R)					\
## ((__m128d)__builtin_ia32_fixupimmsd_mask ((__v2df)(__m128d)(X),	\
## (__v2df)(__m128d)(Y), (__v2di)(__m128i)(Z), (int)(C),		\
## (__mmask8)(-1), (R)))

## [Macro Original]
## #define _mm_mask_fixupimm_round_sd(X, U, Y, Z, C, R)				\
## ((__m128d)__builtin_ia32_fixupimmsd_mask ((__v2df)(__m128d)(X),	\
## (__v2df)(__m128d)(Y), (__v2di)(__m128i)(Z), (int)(C),		\
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm_maskz_fixupimm_round_sd(U, X, Y, Z, C, R)				\
## ((__m128d)__builtin_ia32_fixupimmsd_maskz ((__v2df)(__m128d)(X),	\
## (__v2df)(__m128d)(Y), (__v2di)(__m128i)(Z), (int)(C),		\
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm_fixupimm_round_ss(X, Y, Z, C, R)					\
## ((__m128)__builtin_ia32_fixupimmss_mask ((__v4sf)(__m128)(X),	\
## (__v4sf)(__m128)(Y), (__v4si)(__m128i)(Z), (int)(C),		\
## (__mmask8)(-1), (R)))

## [Macro Original]
## #define _mm_mask_fixupimm_round_ss(X, U, Y, Z, C, R)				\
## ((__m128)__builtin_ia32_fixupimmss_mask ((__v4sf)(__m128)(X),	\
## (__v4sf)(__m128)(Y), (__v4si)(__m128i)(Z), (int)(C),		\
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm_maskz_fixupimm_round_ss(U, X, Y, Z, C, R)				\
## ((__m128)__builtin_ia32_fixupimmss_maskz ((__v4sf)(__m128)(X),	\
## (__v4sf)(__m128)(Y), (__v4si)(__m128i)(Z), (int)(C),		\
## (__mmask8)(U), (R)))

func mm_cvt_roundss_u64*(a: M128, r: int32): uint64 {.importc: "_mm_cvt_roundss_u64".}

func mm_cvt_roundss_si64*(a: M128, r: int32): int64 {.importc: "_mm_cvt_roundss_si64".}

func mm_cvt_roundss_i64*(a: M128, r: int32): int64 {.importc: "_mm_cvt_roundss_i64".}

func mm_cvtt_roundss_u64*(a: M128, r: int32): uint64 {.importc: "_mm_cvtt_roundss_u64".}

func mm_cvtt_roundss_i64*(a: M128, r: int32): int64 {.importc: "_mm_cvtt_roundss_i64".}

func mm_cvtt_roundss_si64*(a: M128, r: int32): int64 {.importc: "_mm_cvtt_roundss_si64".}

## [Macro Original]
## #define _mm_cvt_roundss_u64(A, B)   \
## ((unsigned long long)__builtin_ia32_vcvtss2usi64(A, B))

## [Macro Original]
## #define _mm_cvt_roundss_si64(A, B)   \
## ((long long)__builtin_ia32_vcvtss2si64(A, B))

## [Macro Original]
## #define _mm_cvt_roundss_i64(A, B)   \
## ((long long)__builtin_ia32_vcvtss2si64(A, B))

## [Macro Original]
## #define _mm_cvtt_roundss_u64(A, B)  \
## ((unsigned long long)__builtin_ia32_vcvttss2usi64(A, B))

## [Macro Original]
## #define _mm_cvtt_roundss_i64(A, B)  \
## ((long long)__builtin_ia32_vcvttss2si64(A, B))

## [Macro Original]
## #define _mm_cvtt_roundss_si64(A, B)  \
## ((long long)__builtin_ia32_vcvttss2si64(A, B))

func mm_cvt_roundss_u32*(a: M128, r: int32): uint32 {.importc: "_mm_cvt_roundss_u32".}

func mm_cvt_roundss_si32*(a: M128, r: int32): int32 {.importc: "_mm_cvt_roundss_si32".}

func mm_cvt_roundss_i32*(a: M128, r: int32): int32 {.importc: "_mm_cvt_roundss_i32".}

func mm_cvtt_roundss_u32*(a: M128, r: int32): uint32 {.importc: "_mm_cvtt_roundss_u32".}

func mm_cvtt_roundss_i32*(a: M128, r: int32): int32 {.importc: "_mm_cvtt_roundss_i32".}

func mm_cvtt_roundss_si32*(a: M128, r: int32): int32 {.importc: "_mm_cvtt_roundss_si32".}

## [Macro Original]
## #define _mm_cvt_roundss_u32(A, B)   \
## ((unsigned)__builtin_ia32_vcvtss2usi32(A, B))

## [Macro Original]
## #define _mm_cvt_roundss_si32(A, B)   \
## ((int)__builtin_ia32_vcvtss2si32(A, B))

## [Macro Original]
## #define _mm_cvt_roundss_i32(A, B)   \
## ((int)__builtin_ia32_vcvtss2si32(A, B))

## [Macro Original]
## #define _mm_cvtt_roundss_u32(A, B)  \
## ((unsigned)__builtin_ia32_vcvttss2usi32(A, B))

## [Macro Original]
## #define _mm_cvtt_roundss_si32(A, B)  \
## ((int)__builtin_ia32_vcvttss2si32(A, B))

## [Macro Original]
## #define _mm_cvtt_roundss_i32(A, B)  \
## ((int)__builtin_ia32_vcvttss2si32(A, B))

func mm_cvt_roundsd_u64*(a: M128d, r: int32): uint64 {.importc: "_mm_cvt_roundsd_u64".}

func mm_cvt_roundsd_si64*(a: M128d, r: int32): int64 {.importc: "_mm_cvt_roundsd_si64".}

func mm_cvt_roundsd_i64*(a: M128d, r: int32): int64 {.importc: "_mm_cvt_roundsd_i64".}

func mm_cvtt_roundsd_u64*(a: M128d, r: int32): uint64 {.importc: "_mm_cvtt_roundsd_u64".}

func mm_cvtt_roundsd_si64*(a: M128d, r: int32): int64 {.importc: "_mm_cvtt_roundsd_si64".}

func mm_cvtt_roundsd_i64*(a: M128d, r: int32): int64 {.importc: "_mm_cvtt_roundsd_i64".}

## [Macro Original]
## #define _mm_cvt_roundsd_u64(A, B)   \
## ((unsigned long long)__builtin_ia32_vcvtsd2usi64(A, B))

## [Macro Original]
## #define _mm_cvt_roundsd_si64(A, B)   \
## ((long long)__builtin_ia32_vcvtsd2si64(A, B))

## [Macro Original]
## #define _mm_cvt_roundsd_i64(A, B)   \
## ((long long)__builtin_ia32_vcvtsd2si64(A, B))

## [Macro Original]
## #define _mm_cvtt_roundsd_u64(A, B)   \
## ((unsigned long long)__builtin_ia32_vcvttsd2usi64(A, B))

## [Macro Original]
## #define _mm_cvtt_roundsd_si64(A, B)   \
## ((long long)__builtin_ia32_vcvttsd2si64(A, B))

## [Macro Original]
## #define _mm_cvtt_roundsd_i64(A, B)   \
## ((long long)__builtin_ia32_vcvttsd2si64(A, B))

func mm_cvt_roundsd_u32*(a: M128d, r: int32): uint32 {.importc: "_mm_cvt_roundsd_u32".}

func mm_cvt_roundsd_si32*(a: M128d, r: int32): int32 {.importc: "_mm_cvt_roundsd_si32".}

func mm_cvt_roundsd_i32*(a: M128d, r: int32): int32 {.importc: "_mm_cvt_roundsd_i32".}

func mm_cvtt_roundsd_u32*(a: M128d, r: int32): uint32 {.importc: "_mm_cvtt_roundsd_u32".}

func mm_cvtt_roundsd_i32*(a: M128d, r: int32): int32 {.importc: "_mm_cvtt_roundsd_i32".}

func mm_cvtt_roundsd_si32*(a: M128d, r: int32): int32 {.importc: "_mm_cvtt_roundsd_si32".}

func mm_cvt_roundsd_ss*(a: M128, b: M128d, r: int32): M128 {.importc: "_mm_cvt_roundsd_ss".}

func mm_mask_cvt_roundsd_ss*(w: M128, u: MMask8, a: M128, b: M128d, r: int32): M128 {.importc: "_mm_mask_cvt_roundsd_ss".}

func mm_maskz_cvt_roundsd_ss*(u: MMask8, a: M128, b: M128d, r: int32): M128 {.importc: "_mm_maskz_cvt_roundsd_ss".}

func mm_cvt_roundss_sd*(a: M128d, b: M128, r: int32): M128d {.importc: "_mm_cvt_roundss_sd".}

func mm_mask_cvt_roundss_sd*(w: M128d, u: MMask8, a: M128d, b: M128, r: int32): M128d {.importc: "_mm_mask_cvt_roundss_sd".}

func mm_maskz_cvt_roundss_sd*(u: MMask8, a: M128d, b: M128, r: int32): M128d {.importc: "_mm_maskz_cvt_roundss_sd".}

func mm_getexp_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_getexp_round_ss".}

func mm_mask_getexp_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_getexp_round_ss".}

func mm_maskz_getexp_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_getexp_round_ss".}

func mm_getexp_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_getexp_round_sd".}

func mm_mask_getexp_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_getexp_round_sd".}

func mm_maskz_getexp_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_getexp_round_sd".}

func mm_getmant_round_sd*(a: M128d, b: M128d, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128d {.importc: "_mm_getmant_round_sd".}

func mm_mask_getmant_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128d {.importc: "_mm_mask_getmant_round_sd".}

func mm_maskz_getmant_round_sd*(u: MMask8, a: M128d, b: M128d, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128d {.importc: "_mm_maskz_getmant_round_sd".}

func mm_getmant_round_ss*(a: M128, b: M128, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128 {.importc: "_mm_getmant_round_ss".}

func mm_mask_getmant_round_ss*(w: M128, u: MMask8, a: M128, b: M128, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128 {.importc: "_mm_mask_getmant_round_ss".}

func mm_maskz_getmant_round_ss*(u: MMask8, a: M128, b: M128, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128 {.importc: "_mm_maskz_getmant_round_ss".}

func mm_roundscale_round_ss*(a: M128, b: M128, imm: int32, r: int32): M128 {.importc: "_mm_roundscale_round_ss".}

func mm_mask_roundscale_round_ss*(a: M128, b: MMask8, c: M128, d: M128, imm: int32, r: int32): M128 {.importc: "_mm_mask_roundscale_round_ss".}

func mm_maskz_roundscale_round_ss*(a: MMask8, b: M128, c: M128, imm: int32, r: int32): M128 {.importc: "_mm_maskz_roundscale_round_ss".}

func mm_roundscale_round_sd*(a: M128d, b: M128d, imm: int32, r: int32): M128d {.importc: "_mm_roundscale_round_sd".}

func mm_mask_roundscale_round_sd*(a: M128d, b: MMask8, c: M128d, d: M128d, imm: int32, r: int32): M128d {.importc: "_mm_mask_roundscale_round_sd".}

func mm_maskz_roundscale_round_sd*(a: MMask8, b: M128d, c: M128d, imm: int32, r: int32): M128d {.importc: "_mm_maskz_roundscale_round_sd".}

## [Macro Original]
## #define _mm_cvt_roundsd_u32(A, B)   \
## ((unsigned)__builtin_ia32_vcvtsd2usi32(A, B))

## [Macro Original]
## #define _mm_cvt_roundsd_si32(A, B)   \
## ((int)__builtin_ia32_vcvtsd2si32(A, B))

## [Macro Original]
## #define _mm_cvt_roundsd_i32(A, B)   \
## ((int)__builtin_ia32_vcvtsd2si32(A, B))

## [Macro Original]
## #define _mm_cvtt_roundsd_u32(A, B)   \
## ((unsigned)__builtin_ia32_vcvttsd2usi32(A, B))

## [Macro Original]
## #define _mm_cvtt_roundsd_si32(A, B)   \
## ((int)__builtin_ia32_vcvttsd2si32(A, B))

## [Macro Original]
## #define _mm_cvtt_roundsd_i32(A, B)   \
## ((int)__builtin_ia32_vcvttsd2si32(A, B))

## [Macro Original]
## #define _mm_cvt_roundsd_ss(A, B, C)		 \
## (__m128)__builtin_ia32_cvtsd2ss_round(A, B, C)

## [Macro Original]
## #define _mm_mask_cvt_roundsd_ss(W, U, A, B, C)	\
## (__m128)__builtin_ia32_cvtsd2ss_mask_round ((A), (B), (W), (U), (C))

## [Macro Original]
## #define _mm_maskz_cvt_roundsd_ss(U, A, B, C)	\
## (__m128)__builtin_ia32_cvtsd2ss_mask_round ((A), (B), _mm_avx512_setzero_ps (), \
## (U), (C))

## [Macro Original]
## #define _mm_cvt_roundss_sd(A, B, C)		 \
## (__m128d)__builtin_ia32_cvtss2sd_round(A, B, C)

## [Macro Original]
## #define _mm_mask_cvt_roundss_sd(W, U, A, B, C)	\
## (__m128d)__builtin_ia32_cvtss2sd_mask_round ((A), (B), (W), (U), (C))

## [Macro Original]
## #define _mm_maskz_cvt_roundss_sd(U, A, B, C)	\
## (__m128d)__builtin_ia32_cvtss2sd_mask_round ((A), (B), _mm_avx512_setzero_pd (), \
## (U), (C))

## [Macro Original]
## #define _mm_getmant_round_sd(X, Y, C, D, R)                                                  \
## ((__m128d)__builtin_ia32_getmantsd_round ((__v2df)(__m128d)(X),                    \
## (__v2df)(__m128d)(Y),	\
## (int)(((D)<<2) | (C)),	\
## (R)))

## [Macro Original]
## #define _mm_mask_getmant_round_sd(W, U, X, Y, C, D, R)                                       \
## ((__m128d)__builtin_ia32_getmantsd_mask_round ((__v2df)(__m128d)(X),                  \
## (__v2df)(__m128d)(Y),                  \
## (int)(((D)<<2) | (C)),                 \
## (__v2df)(__m128d)(W),                   \
## (__mmask8)(U),\
## (R)))

## [Macro Original]
## #define _mm_maskz_getmant_round_sd(U, X, Y, C, D, R)                                         \
## ((__m128d)__builtin_ia32_getmantsd_mask_round ((__v2df)(__m128d)(X),                  \
## (__v2df)(__m128d)(Y),                  \
## (int)(((D)<<2) | (C)),              \
## (__v2df)(__m128d)_mm_avx512_setzero_pd(),  \
## (__mmask8)(U),\
## (R)))

## [Macro Original]
## #define _mm_getmant_round_ss(X, Y, C, D, R)                                                  \
## ((__m128)__builtin_ia32_getmantss_round ((__v4sf)(__m128)(X),                      \
## (__v4sf)(__m128)(Y),		\
## (int)(((D)<<2) | (C)),	\
## (R)))

## [Macro Original]
## #define _mm_mask_getmant_round_ss(W, U, X, Y, C, D, R)                                       \
## ((__m128)__builtin_ia32_getmantss_mask_round ((__v4sf)(__m128)(X),                  \
## (__v4sf)(__m128)(Y),                  \
## (int)(((D)<<2) | (C)),                 \
## (__v4sf)(__m128)(W),                   \
## (__mmask8)(U),\
## (R)))

## [Macro Original]
## #define _mm_maskz_getmant_round_ss(U, X, Y, C, D, R)                                         \
## ((__m128)__builtin_ia32_getmantss_mask_round ((__v4sf)(__m128)(X),                  \
## (__v4sf)(__m128)(Y),                  \
## (int)(((D)<<2) | (C)),              \
## (__v4sf)(__m128)_mm_avx512_setzero_ps(),  \
## (__mmask8)(U),\
## (R)))

## [Macro Original]
## #define _mm_getexp_round_ss(A, B, R)						      \
## ((__m128)__builtin_ia32_getexpss128_round((__v4sf)(__m128)(A), (__v4sf)(__m128)(B), R))

## [Macro Original]
## #define _mm_mask_getexp_round_ss(W, U, A, B, C) \
## (__m128)__builtin_ia32_getexpss_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_getexp_round_ss(U, A, B, C)   \
## (__m128)__builtin_ia32_getexpss_mask_round(A, B, (__v4sf)_mm_avx512_setzero_ps(), U, C)

## [Macro Original]
## #define _mm_getexp_round_sd(A, B, R)						       \
## ((__m128d)__builtin_ia32_getexpsd128_round((__v2df)(__m128d)(A), (__v2df)(__m128d)(B), R))

## [Macro Original]
## #define _mm_mask_getexp_round_sd(W, U, A, B, C) \
## (__m128d)__builtin_ia32_getexpsd_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_getexp_round_sd(U, A, B, C)   \
## (__m128d)__builtin_ia32_getexpsd_mask_round(A, B, (__v2df)_mm_avx512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm_roundscale_round_ss(A, B, I, R)				\
## ((__m128)								\
## __builtin_ia32_rndscaless_mask_round ((__v4sf) (__m128) (A),		\
## (__v4sf) (__m128) (B),		\
## (int) (I),			\
## (__v4sf) _mm_avx512_setzero_ps (),	\
## (__mmask8) (-1),		\
## (int) (R)))

## [Macro Original]
## #define _mm_mask_roundscale_round_ss(A, U, B, C, I, R)		\
## ((__m128)							\
## __builtin_ia32_rndscaless_mask_round ((__v4sf) (__m128) (B),	\
## (__v4sf) (__m128) (C),	\
## (int) (I),		\
## (__v4sf) (__m128) (A),	\
## (__mmask8) (U),	\
## (int) (R)))

## [Macro Original]
## #define _mm_maskz_roundscale_round_ss(U, A, B, I, R)			\
## ((__m128)								\
## __builtin_ia32_rndscaless_mask_round ((__v4sf) (__m128) (A),		\
## (__v4sf) (__m128) (B),		\
## (int) (I),			\
## (__v4sf) _mm_avx512_setzero_ps (),	\
## (__mmask8) (U),		\
## (int) (R)))

## [Macro Original]
## #define _mm_roundscale_round_sd(A, B, I, R)				\
## ((__m128d)								\
## __builtin_ia32_rndscalesd_mask_round ((__v2df) (__m128d) (A),	\
## (__v2df) (__m128d) (B),	\
## (int) (I),			\
## (__v2df) _mm_avx512_setzero_pd (),	\
## (__mmask8) (-1),		\
## (int) (R)))

## [Macro Original]
## #define _mm_mask_roundscale_round_sd(A, U, B, C, I, R)			\
## ((__m128d)								\
## __builtin_ia32_rndscalesd_mask_round ((__v2df) (__m128d) (B),	\
## (__v2df) (__m128d) (C),	\
## (int) (I),			\
## (__v2df) (__m128d) (A),	\
## (__mmask8) (U),		\
## (int) (R)))

## [Macro Original]
## #define _mm_maskz_roundscale_round_sd(U, A, B, I, R)			\
## ((__m128d)								\
## __builtin_ia32_rndscalesd_mask_round ((__v2df) (__m128d) (A),	\
## (__v2df) (__m128d) (B),	\
## (int) (I),			\
## (__v2df) _mm_avx512_setzero_pd (),	\
## (__mmask8) (U),		\
## (int) (R)))

## [Macro Original]
## #define _mm_mask_cvtss_sd(W, U, A, B) \
## _mm_mask_cvt_roundss_sd ((W), (U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_maskz_cvtss_sd(U, A, B) \
## _mm_maskz_cvt_roundss_sd ((U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_mask_cvtsd_ss(W, U, A, B) \
## _mm_mask_cvt_roundsd_ss ((W), (U), (A), (B), _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_maskz_cvtsd_ss(U, A, B) \
## _mm_maskz_cvt_roundsd_ss ((U), (A), (B), _MM_FROUND_CUR_DIRECTION)

func mm_cmp_round_sd_mask*(x: M128d, y: M128d, p: int32, r: int32): MMask8 {.importc: "_mm_cmp_round_sd_mask".}

func mm_mask_cmp_round_sd_mask*(m: MMask8, x: M128d, y: M128d, p: int32, r: int32): MMask8 {.importc: "_mm_mask_cmp_round_sd_mask".}

func mm_cmp_round_ss_mask*(x: M128, y: M128, p: int32, r: int32): MMask8 {.importc: "_mm_cmp_round_ss_mask".}

func mm_mask_cmp_round_ss_mask*(m: MMask8, x: M128, y: M128, p: int32, r: int32): MMask8 {.importc: "_mm_mask_cmp_round_ss_mask".}

## [Macro Original]
## #define _kshiftli_mask16(X, Y)						\
## ((__mmask16) __builtin_ia32_kshiftlihi ((__mmask16)(X), (__mmask8)(Y)))

## [Macro Original]
## #define _kshiftri_mask16(X, Y)						\
## ((__mmask16) __builtin_ia32_kshiftrihi ((__mmask16)(X), (__mmask8)(Y)))

## [Macro Original]
## #define _mm_cmp_round_sd_mask(X, Y, P, R)				\
## ((__mmask8) __builtin_ia32_cmpsd_mask ((__v2df)(__m128d)(X),		\
## (__v2df)(__m128d)(Y), (int)(P),\
## (__mmask8)-1, R))

## [Macro Original]
## #define _mm_mask_cmp_round_sd_mask(M, X, Y, P, R)			\
## ((__mmask8) __builtin_ia32_cmpsd_mask ((__v2df)(__m128d)(X),		\
## (__v2df)(__m128d)(Y), (int)(P),\
## (M), R))

## [Macro Original]
## #define _mm_cmp_round_ss_mask(X, Y, P, R)				\
## ((__mmask8) __builtin_ia32_cmpss_mask ((__v4sf)(__m128)(X),		\
## (__v4sf)(__m128)(Y), (int)(P), \
## (__mmask8)-1, R))

## [Macro Original]
## #define _mm_mask_cmp_round_ss_mask(M, X, Y, P, R)			\
## ((__mmask8) __builtin_ia32_cmpss_mask ((__v4sf)(__m128)(X),		\
## (__v4sf)(__m128)(Y), (int)(P), \
## (M), R))

func mm_max_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_max_round_sd".}

func mm_mask_max_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_max_round_sd".}

func mm_maskz_max_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_max_round_sd".}

func mm_max_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_max_round_ss".}

func mm_mask_max_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_max_round_ss".}

func mm_maskz_max_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_max_round_ss".}

func mm_min_round_sd*(a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_min_round_sd".}

func mm_mask_min_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_min_round_sd".}

func mm_maskz_min_round_sd*(u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_min_round_sd".}

func mm_min_round_ss*(a: M128, b: M128, r: int32): M128 {.importc: "_mm_min_round_ss".}

func mm_mask_min_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_min_round_ss".}

func mm_maskz_min_round_ss*(u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_min_round_ss".}

## [Macro Original]
## #define _mm_max_round_sd(A, B, C)            \
## (__m128d)__builtin_ia32_maxsd_round(A, B, C)

## [Macro Original]
## #define _mm_mask_max_round_sd(W, U, A, B, C) \
## (__m128d)__builtin_ia32_maxsd_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_max_round_sd(U, A, B, C)   \
## (__m128d)__builtin_ia32_maxsd_mask_round(A, B, (__v2df)_mm_avx512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm_max_round_ss(A, B, C)            \
## (__m128)__builtin_ia32_maxss_round(A, B, C)

## [Macro Original]
## #define _mm_mask_max_round_ss(W, U, A, B, C) \
## (__m128)__builtin_ia32_maxss_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_max_round_ss(U, A, B, C)   \
## (__m128)__builtin_ia32_maxss_mask_round(A, B, (__v4sf)_mm_avx512_setzero_ps(), U, C)

## [Macro Original]
## #define _mm_min_round_sd(A, B, C)            \
## (__m128d)__builtin_ia32_minsd_round(A, B, C)

## [Macro Original]
## #define _mm_mask_min_round_sd(W, U, A, B, C) \
## (__m128d)__builtin_ia32_minsd_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_min_round_sd(U, A, B, C)   \
## (__m128d)__builtin_ia32_minsd_mask_round(A, B, (__v2df)_mm_avx512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm_min_round_ss(A, B, C)            \
## (__m128)__builtin_ia32_minss_round(A, B, C)

## [Macro Original]
## #define _mm_mask_min_round_ss(W, U, A, B, C) \
## (__m128)__builtin_ia32_minss_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_min_round_ss(U, A, B, C)   \
## (__m128)__builtin_ia32_minss_mask_round(A, B, (__v4sf)_mm_avx512_setzero_ps(), U, C)

func mm_fmadd_round_sd*(w: M128d, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_fmadd_round_sd".}

func mm_fmadd_round_ss*(w: M128, a: M128, b: M128, r: int32): M128 {.importc: "_mm_fmadd_round_ss".}

func mm_fmsub_round_sd*(w: M128d, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_fmsub_round_sd".}

func mm_fmsub_round_ss*(w: M128, a: M128, b: M128, r: int32): M128 {.importc: "_mm_fmsub_round_ss".}

func mm_fnmadd_round_sd*(w: M128d, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_fnmadd_round_sd".}

func mm_fnmadd_round_ss*(w: M128, a: M128, b: M128, r: int32): M128 {.importc: "_mm_fnmadd_round_ss".}

func mm_fnmsub_round_sd*(w: M128d, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_fnmsub_round_sd".}

func mm_fnmsub_round_ss*(w: M128, a: M128, b: M128, r: int32): M128 {.importc: "_mm_fnmsub_round_ss".}

## [Macro Original]
## #define _mm_fmadd_round_sd(A, B, C, R)            \
## (__m128d)__builtin_ia32_vfmaddsd3_round(A, B, C, R)

## [Macro Original]
## #define _mm_fmadd_round_ss(A, B, C, R)            \
## (__m128)__builtin_ia32_vfmaddss3_round(A, B, C, R)

## [Macro Original]
## #define _mm_fmsub_round_sd(A, B, C, R)            \
## (__m128d)__builtin_ia32_vfmaddsd3_round(A, B, -(C), R)

## [Macro Original]
## #define _mm_fmsub_round_ss(A, B, C, R)            \
## (__m128)__builtin_ia32_vfmaddss3_round(A, B, -(C), R)

## [Macro Original]
## #define _mm_fnmadd_round_sd(A, B, C, R)            \
## (__m128d)__builtin_ia32_vfmaddsd3_round(A, -(B), C, R)

## [Macro Original]
## #define _mm_fnmadd_round_ss(A, B, C, R)            \
## (__m128)__builtin_ia32_vfmaddss3_round(A, -(B), C, R)

## [Macro Original]
## #define _mm_fnmsub_round_sd(A, B, C, R)            \
## (__m128d)__builtin_ia32_vfmaddsd3_round(A, -(B), -(C), R)

## [Macro Original]
## #define _mm_fnmsub_round_ss(A, B, C, R)            \
## (__m128)__builtin_ia32_vfmaddss3_round(A, -(B), -(C), R)

func mm_mask_fmadd_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_fmadd_sd".}

func mm_mask_fmadd_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_fmadd_ss".}

func mm_mask3_fmadd_sd*(w: M128d, a: M128d, b: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fmadd_sd".}

func mm_mask3_fmadd_ss*(w: M128, a: M128, b: M128, u: MMask8): M128 {.importc: "_mm_mask3_fmadd_ss".}

func mm_maskz_fmadd_sd*(u: MMask8, w: M128d, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_fmadd_sd".}

func mm_maskz_fmadd_ss*(u: MMask8, w: M128, a: M128, b: M128): M128 {.importc: "_mm_maskz_fmadd_ss".}

func mm_mask_fmsub_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_fmsub_sd".}

func mm_mask_fmsub_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_fmsub_ss".}

func mm_mask3_fmsub_sd*(w: M128d, a: M128d, b: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fmsub_sd".}

func mm_mask3_fmsub_ss*(w: M128, a: M128, b: M128, u: MMask8): M128 {.importc: "_mm_mask3_fmsub_ss".}

func mm_maskz_fmsub_sd*(u: MMask8, w: M128d, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_fmsub_sd".}

func mm_maskz_fmsub_ss*(u: MMask8, w: M128, a: M128, b: M128): M128 {.importc: "_mm_maskz_fmsub_ss".}

func mm_mask_fnmadd_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_fnmadd_sd".}

func mm_mask_fnmadd_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_fnmadd_ss".}

func mm_mask3_fnmadd_sd*(w: M128d, a: M128d, b: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fnmadd_sd".}

func mm_mask3_fnmadd_ss*(w: M128, a: M128, b: M128, u: MMask8): M128 {.importc: "_mm_mask3_fnmadd_ss".}

func mm_maskz_fnmadd_sd*(u: MMask8, w: M128d, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_fnmadd_sd".}

func mm_maskz_fnmadd_ss*(u: MMask8, w: M128, a: M128, b: M128): M128 {.importc: "_mm_maskz_fnmadd_ss".}

func mm_mask_fnmsub_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_fnmsub_sd".}

func mm_mask_fnmsub_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_fnmsub_ss".}

func mm_mask3_fnmsub_sd*(w: M128d, a: M128d, b: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fnmsub_sd".}

func mm_mask3_fnmsub_ss*(w: M128, a: M128, b: M128, u: MMask8): M128 {.importc: "_mm_mask3_fnmsub_ss".}

func mm_maskz_fnmsub_sd*(u: MMask8, w: M128d, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_fnmsub_sd".}

func mm_maskz_fnmsub_ss*(u: MMask8, w: M128, a: M128, b: M128): M128 {.importc: "_mm_maskz_fnmsub_ss".}

func mm_mask_fmadd_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_fmadd_round_sd".}

func mm_mask_fmadd_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_fmadd_round_ss".}

func mm_mask3_fmadd_round_sd*(w: M128d, a: M128d, b: M128d, u: MMask8, r: int32): M128d {.importc: "_mm_mask3_fmadd_round_sd".}

func mm_mask3_fmadd_round_ss*(w: M128, a: M128, b: M128, u: MMask8, r: int32): M128 {.importc: "_mm_mask3_fmadd_round_ss".}

func mm_maskz_fmadd_round_sd*(u: MMask8, w: M128d, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_fmadd_round_sd".}

func mm_maskz_fmadd_round_ss*(u: MMask8, w: M128, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_fmadd_round_ss".}

func mm_mask_fmsub_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_fmsub_round_sd".}

func mm_mask_fmsub_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_fmsub_round_ss".}

func mm_mask3_fmsub_round_sd*(w: M128d, a: M128d, b: M128d, u: MMask8, r: int32): M128d {.importc: "_mm_mask3_fmsub_round_sd".}

func mm_mask3_fmsub_round_ss*(w: M128, a: M128, b: M128, u: MMask8, r: int32): M128 {.importc: "_mm_mask3_fmsub_round_ss".}

func mm_maskz_fmsub_round_sd*(u: MMask8, w: M128d, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_fmsub_round_sd".}

func mm_maskz_fmsub_round_ss*(u: MMask8, w: M128, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_fmsub_round_ss".}

func mm_mask_fnmadd_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_fnmadd_round_sd".}

func mm_mask_fnmadd_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_fnmadd_round_ss".}

func mm_mask3_fnmadd_round_sd*(w: M128d, a: M128d, b: M128d, u: MMask8, r: int32): M128d {.importc: "_mm_mask3_fnmadd_round_sd".}

func mm_mask3_fnmadd_round_ss*(w: M128, a: M128, b: M128, u: MMask8, r: int32): M128 {.importc: "_mm_mask3_fnmadd_round_ss".}

func mm_maskz_fnmadd_round_sd*(u: MMask8, w: M128d, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_fnmadd_round_sd".}

func mm_maskz_fnmadd_round_ss*(u: MMask8, w: M128, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_fnmadd_round_ss".}

func mm_mask_fnmsub_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_mask_fnmsub_round_sd".}

func mm_mask_fnmsub_round_ss*(w: M128, u: MMask8, a: M128, b: M128, r: int32): M128 {.importc: "_mm_mask_fnmsub_round_ss".}

func mm_mask3_fnmsub_round_sd*(w: M128d, a: M128d, b: M128d, u: MMask8, r: int32): M128d {.importc: "_mm_mask3_fnmsub_round_sd".}

func mm_mask3_fnmsub_round_ss*(w: M128, a: M128, b: M128, u: MMask8, r: int32): M128 {.importc: "_mm_mask3_fnmsub_round_ss".}

func mm_maskz_fnmsub_round_sd*(u: MMask8, w: M128d, a: M128d, b: M128d, r: int32): M128d {.importc: "_mm_maskz_fnmsub_round_sd".}

func mm_maskz_fnmsub_round_ss*(u: MMask8, w: M128, a: M128, b: M128, r: int32): M128 {.importc: "_mm_maskz_fnmsub_round_ss".}

## [Macro Original]
## #define _mm_mask_fmadd_round_sd(A, U, B, C, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_mask (A, B, C, U, R)

## [Macro Original]
## #define _mm_mask_fmadd_round_ss(A, U, B, C, R)            \
## (__m128) __builtin_ia32_vfmaddss3_mask (A, B, C, U, R)

## [Macro Original]
## #define _mm_mask3_fmadd_round_sd(A, B, C, U, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_mask3 (A, B, C, U, R)

## [Macro Original]
## #define _mm_mask3_fmadd_round_ss(A, B, C, U, R)            \
## (__m128) __builtin_ia32_vfmaddss3_mask3 (A, B, C, U, R)

## [Macro Original]
## #define _mm_maskz_fmadd_round_sd(U, A, B, C, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_maskz (A, B, C, U, R)

## [Macro Original]
## #define _mm_maskz_fmadd_round_ss(U, A, B, C, R)            \
## (__m128) __builtin_ia32_vfmaddss3_maskz (A, B, C, U, R)

## [Macro Original]
## #define _mm_mask_fmsub_round_sd(A, U, B, C, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_mask (A, B, -(C), U, R)

## [Macro Original]
## #define _mm_mask_fmsub_round_ss(A, U, B, C, R)            \
## (__m128) __builtin_ia32_vfmaddss3_mask (A, B, -(C), U, R)

## [Macro Original]
## #define _mm_mask3_fmsub_round_sd(A, B, C, U, R)            \
## (__m128d) __builtin_ia32_vfmsubsd3_mask3 (A, B, C, U, R)

## [Macro Original]
## #define _mm_mask3_fmsub_round_ss(A, B, C, U, R)            \
## (__m128) __builtin_ia32_vfmsubss3_mask3 (A, B, C, U, R)

## [Macro Original]
## #define _mm_maskz_fmsub_round_sd(U, A, B, C, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_maskz (A, B, -(C), U, R)

## [Macro Original]
## #define _mm_maskz_fmsub_round_ss(U, A, B, C, R)            \
## (__m128) __builtin_ia32_vfmaddss3_maskz (A, B, -(C), U, R)

## [Macro Original]
## #define _mm_mask_fnmadd_round_sd(A, U, B, C, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_mask (A, -(B), C, U, R)

## [Macro Original]
## #define _mm_mask_fnmadd_round_ss(A, U, B, C, R)            \
## (__m128) __builtin_ia32_vfmaddss3_mask (A, -(B), C, U, R)

## [Macro Original]
## #define _mm_mask3_fnmadd_round_sd(A, B, C, U, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_mask3 (A, -(B), C, U, R)

## [Macro Original]
## #define _mm_mask3_fnmadd_round_ss(A, B, C, U, R)            \
## (__m128) __builtin_ia32_vfmaddss3_mask3 (A, -(B), C, U, R)

## [Macro Original]
## #define _mm_maskz_fnmadd_round_sd(U, A, B, C, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_maskz (A, -(B), C, U, R)

## [Macro Original]
## #define _mm_maskz_fnmadd_round_ss(U, A, B, C, R)            \
## (__m128) __builtin_ia32_vfmaddss3_maskz (A, -(B), C, U, R)

## [Macro Original]
## #define _mm_mask_fnmsub_round_sd(A, U, B, C, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_mask (A, -(B), -(C), U, R)

## [Macro Original]
## #define _mm_mask_fnmsub_round_ss(A, U, B, C, R)            \
## (__m128) __builtin_ia32_vfmaddss3_mask (A, -(B), -(C), U, R)

## [Macro Original]
## #define _mm_mask3_fnmsub_round_sd(A, B, C, U, R)            \
## (__m128d) __builtin_ia32_vfmsubsd3_mask3 (A, -(B), C, U, R)

## [Macro Original]
## #define _mm_mask3_fnmsub_round_ss(A, B, C, U, R)            \
## (__m128) __builtin_ia32_vfmsubss3_mask3 (A, -(B), C, U, R)

## [Macro Original]
## #define _mm_maskz_fnmsub_round_sd(U, A, B, C, R)            \
## (__m128d) __builtin_ia32_vfmaddsd3_maskz (A, -(B), -(C), U, R)

## [Macro Original]
## #define _mm_maskz_fnmsub_round_ss(U, A, B, C, R)            \
## (__m128) __builtin_ia32_vfmaddss3_maskz (A, -(B), -(C), U, R)

func mm_comi_round_ss*(a: M128, b: M128, p: int32, r: int32): int32 {.importc: "_mm_comi_round_ss".}

func mm_comi_round_sd*(a: M128d, b: M128d, p: int32, r: int32): int32 {.importc: "_mm_comi_round_sd".}

## [Macro Original]
## #define _mm_comi_round_ss(A, B, C, D)\
## __builtin_ia32_vcomiss(A, B, C, D)

## [Macro Original]
## #define _mm_comi_round_sd(A, B, C, D)\
## __builtin_ia32_vcomisd(A, B, C, D)

func mm_mask_add_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_add_sd".}

func mm_maskz_add_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_add_sd".}

func mm_mask_add_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_add_ss".}

func mm_maskz_add_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_add_ss".}

func mm_mask_sub_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_sub_sd".}

func mm_maskz_sub_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_sub_sd".}

func mm_mask_sub_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_sub_ss".}

func mm_maskz_sub_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_sub_ss".}

func mm_mask_mul_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_mul_sd".}

func mm_maskz_mul_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_mul_sd".}

func mm_mask_mul_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_mul_ss".}

func mm_maskz_mul_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_mul_ss".}

func mm_mask_div_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_div_sd".}

func mm_maskz_div_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_div_sd".}

func mm_mask_div_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_div_ss".}

func mm_maskz_div_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_div_ss".}

func mm_mask_max_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_max_sd".}

func mm_maskz_max_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_max_sd".}

func mm_mask_max_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_max_ss".}

func mm_maskz_max_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_max_ss".}

func mm_mask_min_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_min_sd".}

func mm_maskz_min_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_min_sd".}

func mm_mask_min_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_min_ss".}

func mm_maskz_min_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_min_ss".}

func mm_scalef_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_scalef_sd".}

func mm_scalef_ss*(a: M128, b: M128): M128 {.importc: "_mm_scalef_ss".}

func mm_cvtu64_ss*(a: M128, b: uint64): M128 {.importc: "_mm_cvtu64_ss".}

func mm_cvtu64_sd*(a: M128d, b: uint64): M128d {.importc: "_mm_cvtu64_sd".}

func mm_cvtu32_ss*(a: M128, b: uint32): M128 {.importc: "_mm_cvtu32_ss".}

func mm_fixupimm_sd*(a: M128d, b: M128d, c: M128i, imm: int32): M128d {.importc: "_mm_fixupimm_sd".}

func mm_mask_fixupimm_sd*(a: M128d, u: MMask8, b: M128d, c: M128i, imm: int32): M128d {.importc: "_mm_mask_fixupimm_sd".}

func mm_maskz_fixupimm_sd*(u: MMask8, a: M128d, b: M128d, c: M128i, imm: int32): M128d {.importc: "_mm_maskz_fixupimm_sd".}

func mm_fixupimm_ss*(a: M128, b: M128, c: M128i, imm: int32): M128 {.importc: "_mm_fixupimm_ss".}

func mm_mask_fixupimm_ss*(a: M128, u: MMask8, b: M128, c: M128i, imm: int32): M128 {.importc: "_mm_mask_fixupimm_ss".}

func mm_maskz_fixupimm_ss*(u: MMask8, a: M128, b: M128, c: M128i, imm: int32): M128 {.importc: "_mm_maskz_fixupimm_ss".}

## [Macro Original]
## #define _mm_fixupimm_sd(X, Y, Z, C)					\
## ((__m128d)__builtin_ia32_fixupimmsd_mask ((__v2df)(__m128d)(X),	\
## (__v2df)(__m128d)(Y), (__v2di)(__m128i)(Z), (int)(C),		\
## (__mmask8)(-1), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_fixupimm_sd(X, U, Y, Z, C)				\
## ((__m128d)__builtin_ia32_fixupimmsd_mask ((__v2df)(__m128d)(X),	\
## (__v2df)(__m128d)(Y), (__v2di)(__m128i)(Z), (int)(C),		\
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_fixupimm_sd(U, X, Y, Z, C)				\
## ((__m128d)__builtin_ia32_fixupimmsd_maskz ((__v2df)(__m128d)(X),	\
## (__v2df)(__m128d)(Y), (__v2di)(__m128i)(Z), (int)(C),		\
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_fixupimm_ss(X, Y, Z, C)					\
## ((__m128)__builtin_ia32_fixupimmss_mask ((__v4sf)(__m128)(X),	\
## (__v4sf)(__m128)(Y), (__v4si)(__m128i)(Z), (int)(C),		\
## (__mmask8)(-1), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_fixupimm_ss(X, U, Y, Z, C)				\
## ((__m128)__builtin_ia32_fixupimmss_mask ((__v4sf)(__m128)(X),	\
## (__v4sf)(__m128)(Y), (__v4si)(__m128i)(Z), (int)(C),		\
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_fixupimm_ss(U, X, Y, Z, C)				\
## ((__m128)__builtin_ia32_fixupimmss_maskz ((__v4sf)(__m128)(X),	\
## (__v4sf)(__m128)(Y), (__v4si)(__m128i)(Z), (int)(C),		\
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

func mm_cvtss_u64*(a: M128): uint64 {.importc: "_mm_cvtss_u64".}

func mm_cvttss_u64*(a: M128): uint64 {.importc: "_mm_cvttss_u64".}

func mm_cvttss_i64*(a: M128): int64 {.importc: "_mm_cvttss_i64".}

func mm_cvtss_u32*(a: M128): uint32 {.importc: "_mm_cvtss_u32".}

func mm_cvttss_u32*(a: M128): uint32 {.importc: "_mm_cvttss_u32".}

func mm_cvttss_i32*(a: M128): int32 {.importc: "_mm_cvttss_i32".}

func mm_cvtsd_i32*(a: M128d): int32 {.importc: "_mm_cvtsd_i32".}

func mm_cvtss_i32*(a: M128): int32 {.importc: "_mm_cvtss_i32".}

func mm_cvti32_sd*(a: M128d, b: int32): M128d {.importc: "_mm_cvti32_sd".}

func mm_cvti32_ss*(a: M128, b: int32): M128 {.importc: "_mm_cvti32_ss".}

func mm_cvtsd_u64*(a: M128d): uint64 {.importc: "_mm_cvtsd_u64".}

func mm_cvttsd_u64*(a: M128d): uint64 {.importc: "_mm_cvttsd_u64".}

func mm_cvttsd_i64*(a: M128d): int64 {.importc: "_mm_cvttsd_i64".}

func mm_cvtsd_i64*(a: M128d): int64 {.importc: "_mm_cvtsd_i64".}

func mm_cvtss_i64*(a: M128): int64 {.importc: "_mm_cvtss_i64".}

func mm_cvti64_sd*(a: M128d, b: int64): M128d {.importc: "_mm_cvti64_sd".}

func mm_cvti64_ss*(a: M128, b: int64): M128 {.importc: "_mm_cvti64_ss".}

func mm_cvtsd_u32*(a: M128d): uint32 {.importc: "_mm_cvtsd_u32".}

func mm_cvttsd_u32*(a: M128d): uint32 {.importc: "_mm_cvttsd_u32".}

func mm_cvttsd_i32*(a: M128d): int32 {.importc: "_mm_cvttsd_i32".}

func mm_getexp_ss*(a: M128, b: M128): M128 {.importc: "_mm_getexp_ss".}

func mm_mask_getexp_ss*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_getexp_ss".}

func mm_maskz_getexp_ss*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_getexp_ss".}

func mm_getexp_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_getexp_sd".}

func mm_mask_getexp_sd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_getexp_sd".}

func mm_maskz_getexp_sd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_getexp_sd".}

func mm_getmant_sd*(a: M128d, b: M128d, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128d {.importc: "_mm_getmant_sd".}

func mm_mask_getmant_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128d {.importc: "_mm_mask_getmant_sd".}

func mm_maskz_getmant_sd*(u: MMask8, a: M128d, b: M128d, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128d {.importc: "_mm_maskz_getmant_sd".}

func mm_getmant_ss*(a: M128, b: M128, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128 {.importc: "_mm_getmant_ss".}

func mm_mask_getmant_ss*(w: M128, u: MMask8, a: M128, b: M128, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128 {.importc: "_mm_mask_getmant_ss".}

func mm_maskz_getmant_ss*(u: MMask8, a: M128, b: M128, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128 {.importc: "_mm_maskz_getmant_ss".}

func mm_roundscale_ss*(a: M128, b: M128, imm: int32): M128 {.importc: "_mm_roundscale_ss".}

func mm_mask_roundscale_ss*(a: M128, b: MMask8, c: M128, d: M128, imm: int32): M128 {.importc: "_mm_mask_roundscale_ss".}

func mm_maskz_roundscale_ss*(a: MMask8, b: M128, c: M128, imm: int32): M128 {.importc: "_mm_maskz_roundscale_ss".}

func mm_roundscale_sd*(a: M128d, b: M128d, imm: int32): M128d {.importc: "_mm_roundscale_sd".}

func mm_mask_roundscale_sd*(a: M128d, b: MMask8, c: M128d, d: M128d, imm: int32): M128d {.importc: "_mm_mask_roundscale_sd".}

func mm_maskz_roundscale_sd*(a: MMask8, b: M128d, c: M128d, imm: int32): M128d {.importc: "_mm_maskz_roundscale_sd".}

func mm_cmp_sd_mask*(x: M128d, y: M128d, p: int32): MMask8 {.importc: "_mm_cmp_sd_mask".}

func mm_mask_cmp_sd_mask*(m: MMask8, x: M128d, y: M128d, p: int32): MMask8 {.importc: "_mm_mask_cmp_sd_mask".}

func mm_cmp_ss_mask*(x: M128, y: M128, p: int32): MMask8 {.importc: "_mm_cmp_ss_mask".}

func mm_mask_cmp_ss_mask*(m: MMask8, x: M128, y: M128, p: int32): MMask8 {.importc: "_mm_mask_cmp_ss_mask".}

## [Macro Original]
## #define _mm_getmant_sd(X, Y, C, D)                                                  \
## ((__m128d)__builtin_ia32_getmantsd_round ((__v2df)(__m128d)(X),                    \
## (__v2df)(__m128d)(Y),                    \
## (int)(((D)<<2) | (C)),                   \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_getmant_sd(W, U, X, Y, C, D)                                       \
## ((__m128d)__builtin_ia32_getmantsd_mask_round ((__v2df)(__m128d)(X),                 \
## (__v2df)(__m128d)(Y),                 \
## (int)(((D)<<2) | (C)),                \
## (__v2df)(__m128d)(W),                 \
## (__mmask8)(U),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_getmant_sd(U, X, Y, C, D)                                         \
## ((__m128d)__builtin_ia32_getmantsd_mask_round ((__v2df)(__m128d)(X),                 \
## (__v2df)(__m128d)(Y),                     \
## (int)(((D)<<2) | (C)),                \
## (__v2df)_mm_avx512_setzero_pd(),             \
## (__mmask8)(U),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_getmant_ss(X, Y, C, D)                                                  \
## ((__m128)__builtin_ia32_getmantss_round ((__v4sf)(__m128)(X),                      \
## (__v4sf)(__m128)(Y),                      \
## (int)(((D)<<2) | (C)),                    \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_getmant_ss(W, U, X, Y, C, D)                                       \
## ((__m128)__builtin_ia32_getmantss_mask_round ((__v4sf)(__m128)(X),                 \
## (__v4sf)(__m128)(Y),                 \
## (int)(((D)<<2) | (C)),                \
## (__v4sf)(__m128)(W),                 \
## (__mmask8)(U),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_getmant_ss(U, X, Y, C, D)                                         \
## ((__m128)__builtin_ia32_getmantss_mask_round ((__v4sf)(__m128)(X),                 \
## (__v4sf)(__m128)(Y),                     \
## (int)(((D)<<2) | (C)),                \
## (__v4sf)_mm_avx512_setzero_ps(),             \
## (__mmask8)(U),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_getexp_ss(A, B)						      \
## ((__m128)__builtin_ia32_getexpss128_round((__v4sf)(__m128)(A), (__v4sf)(__m128)(B),  \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_getexp_ss(W, U, A, B) \
## (__m128)__builtin_ia32_getexpss_mask_round(A, B, W, U,\
## _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_maskz_getexp_ss(U, A, B)   \
## (__m128)__builtin_ia32_getexpss_mask_round(A, B, (__v4sf)_mm_avx512_setzero_ps(), U,\
## _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_getexp_sd(A, B)						       \
## ((__m128d)__builtin_ia32_getexpsd128_round((__v2df)(__m128d)(A), (__v2df)(__m128d)(B),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_getexp_sd(W, U, A, B) \
## (__m128d)__builtin_ia32_getexpsd_mask_round(A, B, W, U,\
## _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_maskz_getexp_sd(U, A, B)   \
## (__m128d)__builtin_ia32_getexpsd_mask_round(A, B, (__v2df)_mm_avx512_setzero_pd(), U,\
## _MM_FROUND_CUR_DIRECTION)

## [Macro Original]
## #define _mm_roundscale_ss(A, B, I)					\
## ((__m128)								\
## __builtin_ia32_rndscaless_mask_round ((__v4sf) (__m128) (A),		\
## (__v4sf) (__m128) (B),		\
## (int) (I),			\
## (__v4sf) _mm_avx512_setzero_ps (),	\
## (__mmask8) (-1),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_roundscale_ss(A, U, B, C, I)				\
## ((__m128)								\
## __builtin_ia32_rndscaless_mask_round ((__v4sf) (__m128) (B),		\
## (__v4sf) (__m128) (C),		\
## (int) (I),			\
## (__v4sf) (__m128) (A),		\
## (__mmask8) (U),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_roundscale_ss(U, A, B, I)				\
## ((__m128)								\
## __builtin_ia32_rndscaless_mask_round ((__v4sf) (__m128) (A),		\
## (__v4sf) (__m128) (B),		\
## (int) (I),			\
## (__v4sf) _mm_avx512_setzero_ps (),	\
## (__mmask8) (U),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_roundscale_sd(A, B, I)					\
## ((__m128d)								\
## __builtin_ia32_rndscalesd_mask_round ((__v2df) (__m128d) (A),	\
## (__v2df) (__m128d) (B),	\
## (int) (I),			\
## (__v2df) _mm_avx512_setzero_pd (),	\
## (__mmask8) (-1),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_roundscale_sd(A, U, B, C, I)				\
## ((__m128d)								\
## __builtin_ia32_rndscalesd_mask_round ((__v2df) (__m128d) (B),	\
## (__v2df) (__m128d) (C),	\
## (int) (I),			\
## (__v2df) (__m128d) (A),	\
## (__mmask8) (U),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_roundscale_sd(U, A, B, I)				\
## ((__m128d)								\
## __builtin_ia32_rndscalesd_mask_round ((__v2df) (__m128d) (A),	\
## (__v2df) (__m128d) (B),	\
## (int) (I),			\
## (__v2df) _mm_avx512_setzero_pd (),	\
## (__mmask8) (U),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_cmp_sd_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpsd_mask ((__v2df)(__m128d)(X),		\
## (__v2df)(__m128d)(Y), (int)(P),\
## (__mmask8)-1,_MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_cmp_sd_mask(M, X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpsd_mask ((__v2df)(__m128d)(X),		\
## (__v2df)(__m128d)(Y), (int)(P),\
## M,_MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_cmp_ss_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpss_mask ((__v4sf)(__m128)(X),		\
## (__v4sf)(__m128)(Y), (int)(P), \
## (__mmask8)-1,_MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_cmp_ss_mask(M, X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpss_mask ((__v4sf)(__m128)(X),		\
## (__v4sf)(__m128)(Y), (int)(P), \
## M,_MM_FROUND_CUR_DIRECTION))

func mm512_int2mask*(m: int32): MMask16 {.importc: "_mm512_int2mask".}

func mm512_mask2int*(m: MMask16): int32 {.importc: "_mm512_mask2int".}

func mm512_set_epi64*(a: int64, b: int64, c: int64, d: int64, e: int64, f: int64, g: int64, h: int64): M512i {.importc: "_mm512_set_epi64".}

func mm512_set_epi32*(a: int32, b: int32, c: int32, d: int32, e: int32, f: int32, g: int32, h: int32, i: int32, j: int32, k: int32, l: int32, m: int32, n: int32, o: int32, p: int32): M512i {.importc: "_mm512_set_epi32".}

func mm512_set_epi16*(q31: int16, q30: int16, q29: int16, q28: int16, q27: int16, q26: int16, q25: int16, q24: int16, q23: int16, q22: int16, q21: int16, q20: int16, q19: int16, q18: int16, q17: int16, q16: int16, q15: int16, q14: int16, q13: int16, q12: int16, q11: int16, q10: int16, q09: int16, q08: int16, q07: int16, q06: int16, q05: int16, q04: int16, q03: int16, q02: int16, q01: int16, q00: int16): M512i {.importc: "_mm512_set_epi16".}

func mm512_set_epi8*(q63: int8, q62: int8, q61: int8, q60: int8, q59: int8, q58: int8, q57: int8, q56: int8, q55: int8, q54: int8, q53: int8, q52: int8, q51: int8, q50: int8, q49: int8, q48: int8, q47: int8, q46: int8, q45: int8, q44: int8, q43: int8, q42: int8, q41: int8, q40: int8, q39: int8, q38: int8, q37: int8, q36: int8, q35: int8, q34: int8, q33: int8, q32: int8, q31: int8, q30: int8, q29: int8, q28: int8, q27: int8, q26: int8, q25: int8, q24: int8, q23: int8, q22: int8, q21: int8, q20: int8, q19: int8, q18: int8, q17: int8, q16: int8, q15: int8, q14: int8, q13: int8, q12: int8, q11: int8, q10: int8, q09: int8, q08: int8, q07: int8, q06: int8, q05: int8, q04: int8, q03: int8, q02: int8, q01: int8, q00: int8): M512i {.importc: "_mm512_set_epi8".}

func mm512_set_pd*(a: float64, b: float64, c: float64, d: float64, e: float64, f: float64, g: float64, h: float64): M512d {.importc: "_mm512_set_pd".}

func mm512_set_ps*(a: float32, b: float32, c: float32, d: float32, e: float32, f: float32, g: float32, h: float32, i: float32, j: float32, k: float32, l: float32, m: float32, n: float32, o: float32, p: float32): M512 {.importc: "_mm512_set_ps".}

## [Macro Original]
## #define _mm512_setr_epi64(e0,e1,e2,e3,e4,e5,e6,e7)			      \
## _mm512_set_epi64(e7,e6,e5,e4,e3,e2,e1,e0)

## [Macro Original]
## #define _mm512_setr_epi32(e0,e1,e2,e3,e4,e5,e6,e7,			      \
## e8,e9,e10,e11,e12,e13,e14,e15)		      \
## _mm512_set_epi32(e15,e14,e13,e12,e11,e10,e9,e8,e7,e6,e5,e4,e3,e2,e1,e0)

## [Macro Original]
## #define _mm512_setr_pd(e0,e1,e2,e3,e4,e5,e6,e7)				      \
## _mm512_set_pd(e7,e6,e5,e4,e3,e2,e1,e0)

## [Macro Original]
## #define _mm512_setr_ps(e0,e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15) \
## _mm512_set_ps(e15,e14,e13,e12,e11,e10,e9,e8,e7,e6,e5,e4,e3,e2,e1,e0)

func mm512_undefined_ps*(): M512 {.importc: "_mm512_undefined_ps".}

## [Macro Original]
## #define _mm512_undefined _mm512_undefined_ps

func mm512_undefined_pd*(): M512d {.importc: "_mm512_undefined_pd".}

func mm512_undefined_epi32*(): M512i {.importc: "_mm512_undefined_epi32".}

## [Macro Original]
## #define _mm512_undefined_si512 _mm512_undefined_epi32

func mm512_set1_epi8*(a: int8): M512i {.importc: "_mm512_set1_epi8".}

func mm512_set1_epi16*(a: int16): M512i {.importc: "_mm512_set1_epi16".}

func mm512_set1_pd*(a: float64): M512d {.importc: "_mm512_set1_pd".}

func mm512_set1_ps*(a: float32): M512 {.importc: "_mm512_set1_ps".}

func mm512_set4_epi32*(a: int32, b: int32, c: int32, d: int32): M512i {.importc: "_mm512_set4_epi32".}

func mm512_set4_epi64*(a: int64, b: int64, c: int64, d: int64): M512i {.importc: "_mm512_set4_epi64".}

func mm512_set4_pd*(a: float64, b: float64, c: float64, d: float64): M512d {.importc: "_mm512_set4_pd".}

func mm512_set4_ps*(a: float32, b: float32, c: float32, d: float32): M512 {.importc: "_mm512_set4_ps".}

## [Macro Original]
## #define _mm512_setr4_epi64(e0,e1,e2,e3)					      \
## _mm512_set4_epi64(e3,e2,e1,e0)

## [Macro Original]
## #define _mm512_setr4_epi32(e0,e1,e2,e3)					      \
## _mm512_set4_epi32(e3,e2,e1,e0)

## [Macro Original]
## #define _mm512_setr4_pd(e0,e1,e2,e3)					      \
## _mm512_set4_pd(e3,e2,e1,e0)

## [Macro Original]
## #define _mm512_setr4_ps(e0,e1,e2,e3)					      \
## _mm512_set4_ps(e3,e2,e1,e0)

func mm512_setzero_ps*(): M512 {.importc: "_mm512_setzero_ps".}

func mm512_setzero*(): M512 {.importc: "_mm512_setzero".}

func mm512_setzero_pd*(): M512d {.importc: "_mm512_setzero_pd".}

func mm512_setzero_epi32*(): M512i {.importc: "_mm512_setzero_epi32".}

func mm512_setzero_si512*(): M512i {.importc: "_mm512_setzero_si512".}

func mm512_mask_mov_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_mov_pd".}

func mm512_maskz_mov_pd*(u: MMask8, a: M512d): M512d {.importc: "_mm512_maskz_mov_pd".}

func mm512_mask_mov_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_mov_ps".}

func mm512_maskz_mov_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_mov_ps".}

func mm512_load_pd*(p: pointer): M512d {.importc: "_mm512_load_pd".}

func mm512_mask_load_pd*(w: M512d, u: MMask8, p: pointer): M512d {.importc: "_mm512_mask_load_pd".}

func mm512_maskz_load_pd*(u: MMask8, p: pointer): M512d {.importc: "_mm512_maskz_load_pd".}

func mm512_store_pd*(p: pointer, a: M512d): void {.importc: "_mm512_store_pd".}

func mm512_mask_store_pd*(p: pointer, u: MMask8, a: M512d): void {.importc: "_mm512_mask_store_pd".}

func mm512_load_ps*(p: pointer): M512 {.importc: "_mm512_load_ps".}

func mm512_mask_load_ps*(w: M512, u: MMask16, p: pointer): M512 {.importc: "_mm512_mask_load_ps".}

func mm512_maskz_load_ps*(u: MMask16, p: pointer): M512 {.importc: "_mm512_maskz_load_ps".}

func mm512_store_ps*(p: pointer, a: M512): void {.importc: "_mm512_store_ps".}

func mm512_mask_store_ps*(p: pointer, u: MMask16, a: M512): void {.importc: "_mm512_mask_store_ps".}

func mm512_mask_mov_epi64*(w: M512i, u: MMask8, a: M512i): M512i {.importc: "_mm512_mask_mov_epi64".}

func mm512_maskz_mov_epi64*(u: MMask8, a: M512i): M512i {.importc: "_mm512_maskz_mov_epi64".}

func mm512_load_epi64*(p: pointer): M512i {.importc: "_mm512_load_epi64".}

func mm512_mask_load_epi64*(w: M512i, u: MMask8, p: pointer): M512i {.importc: "_mm512_mask_load_epi64".}

func mm512_maskz_load_epi64*(u: MMask8, p: pointer): M512i {.importc: "_mm512_maskz_load_epi64".}

func mm512_store_epi64*(p: pointer, a: M512i): void {.importc: "_mm512_store_epi64".}

func mm512_mask_store_epi64*(p: pointer, u: MMask8, a: M512i): void {.importc: "_mm512_mask_store_epi64".}

func mm512_mask_mov_epi32*(w: M512i, u: MMask16, a: M512i): M512i {.importc: "_mm512_mask_mov_epi32".}

func mm512_maskz_mov_epi32*(u: MMask16, a: M512i): M512i {.importc: "_mm512_maskz_mov_epi32".}

func mm512_load_si512*(p: pointer): M512i {.importc: "_mm512_load_si512".}

func mm512_load_epi32*(p: pointer): M512i {.importc: "_mm512_load_epi32".}

func mm512_mask_load_epi32*(w: M512i, u: MMask16, p: pointer): M512i {.importc: "_mm512_mask_load_epi32".}

func mm512_maskz_load_epi32*(u: MMask16, p: pointer): M512i {.importc: "_mm512_maskz_load_epi32".}

func mm512_store_si512*(p: pointer, a: M512i): void {.importc: "_mm512_store_si512".}

func mm512_store_epi32*(p: pointer, a: M512i): void {.importc: "_mm512_store_epi32".}

func mm512_mask_store_epi32*(p: pointer, u: MMask16, a: M512i): void {.importc: "_mm512_mask_store_epi32".}

func mm512_mullo_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_mullo_epi32".}

func mm512_maskz_mullo_epi32*(m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_mullo_epi32".}

func mm512_mask_mullo_epi32*(w: M512i, m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_mullo_epi32".}

func mm512_mullox_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_mullox_epi64".}

func mm512_mask_mullox_epi64*(w: M512i, m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_mullox_epi64".}

func mm512_sllv_epi32*(x: M512i, y: M512i): M512i {.importc: "_mm512_sllv_epi32".}

func mm512_mask_sllv_epi32*(w: M512i, u: MMask16, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_sllv_epi32".}

func mm512_maskz_sllv_epi32*(u: MMask16, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_sllv_epi32".}

func mm512_srav_epi32*(x: M512i, y: M512i): M512i {.importc: "_mm512_srav_epi32".}

func mm512_mask_srav_epi32*(w: M512i, u: MMask16, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_srav_epi32".}

func mm512_maskz_srav_epi32*(u: MMask16, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_srav_epi32".}

func mm512_srlv_epi32*(x: M512i, y: M512i): M512i {.importc: "_mm512_srlv_epi32".}

func mm512_mask_srlv_epi32*(w: M512i, u: MMask16, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_srlv_epi32".}

func mm512_maskz_srlv_epi32*(u: MMask16, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_srlv_epi32".}

func mm512_add_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_add_epi64".}

func mm512_mask_add_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_add_epi64".}

func mm512_maskz_add_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_add_epi64".}

func mm512_sub_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_sub_epi64".}

func mm512_mask_sub_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_sub_epi64".}

func mm512_maskz_sub_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_sub_epi64".}

func mm512_sllv_epi64*(x: M512i, y: M512i): M512i {.importc: "_mm512_sllv_epi64".}

func mm512_mask_sllv_epi64*(w: M512i, u: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_sllv_epi64".}

func mm512_maskz_sllv_epi64*(u: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_sllv_epi64".}

func mm512_srav_epi64*(x: M512i, y: M512i): M512i {.importc: "_mm512_srav_epi64".}

func mm512_mask_srav_epi64*(w: M512i, u: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_srav_epi64".}

func mm512_maskz_srav_epi64*(u: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_srav_epi64".}

func mm512_srlv_epi64*(x: M512i, y: M512i): M512i {.importc: "_mm512_srlv_epi64".}

func mm512_mask_srlv_epi64*(w: M512i, u: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_srlv_epi64".}

func mm512_maskz_srlv_epi64*(u: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_srlv_epi64".}

func mm512_add_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_add_epi32".}

func mm512_mask_add_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_add_epi32".}

func mm512_maskz_add_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_add_epi32".}

func mm512_mul_epi32*(x: M512i, y: M512i): M512i {.importc: "_mm512_mul_epi32".}

func mm512_mask_mul_epi32*(w: M512i, m: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_mul_epi32".}

func mm512_maskz_mul_epi32*(m: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_mul_epi32".}

func mm512_sub_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_sub_epi32".}

func mm512_mask_sub_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_sub_epi32".}

func mm512_maskz_sub_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_sub_epi32".}

func mm512_mul_epu32*(x: M512i, y: M512i): M512i {.importc: "_mm512_mul_epu32".}

func mm512_mask_mul_epu32*(w: M512i, m: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_mul_epu32".}

func mm512_maskz_mul_epu32*(m: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_mul_epu32".}

func mm512_slli_epi64*(a: M512i, b: uint32): M512i {.importc: "_mm512_slli_epi64".}

func mm512_mask_slli_epi64*(w: M512i, u: MMask8, a: M512i, b: uint32): M512i {.importc: "_mm512_mask_slli_epi64".}

func mm512_maskz_slli_epi64*(u: MMask8, a: M512i, b: uint32): M512i {.importc: "_mm512_maskz_slli_epi64".}

## [Macro Original]
## #define _mm512_slli_epi64(X, C)						\
## ((__m512i) __builtin_ia32_psllqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)_mm512_undefined_epi32 (),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_slli_epi64(W, U, X, C)				\
## ((__m512i) __builtin_ia32_psllqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_slli_epi64(U, X, C)				\
## ((__m512i) __builtin_ia32_psllqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)_mm512_setzero_si512 (),				\
## (__mmask8)(U)))

func mm512_sll_epi64*(a: M512i, b: M128i): M512i {.importc: "_mm512_sll_epi64".}

func mm512_mask_sll_epi64*(w: M512i, u: MMask8, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_sll_epi64".}

func mm512_maskz_sll_epi64*(u: MMask8, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_sll_epi64".}

func mm512_srli_epi64*(a: M512i, b: uint32): M512i {.importc: "_mm512_srli_epi64".}

func mm512_mask_srli_epi64*(w: M512i, u: MMask8, a: M512i, b: uint32): M512i {.importc: "_mm512_mask_srli_epi64".}

func mm512_maskz_srli_epi64*(u: MMask8, a: M512i, b: uint32): M512i {.importc: "_mm512_maskz_srli_epi64".}

## [Macro Original]
## #define _mm512_srli_epi64(X, C)						\
## ((__m512i) __builtin_ia32_psrlqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)_mm512_undefined_epi32 (),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_srli_epi64(W, U, X, C)				\
## ((__m512i) __builtin_ia32_psrlqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_srli_epi64(U, X, C)				\
## ((__m512i) __builtin_ia32_psrlqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)_mm512_setzero_si512 (),				\
## (__mmask8)(U)))

func mm512_srl_epi64*(a: M512i, b: M128i): M512i {.importc: "_mm512_srl_epi64".}

func mm512_mask_srl_epi64*(w: M512i, u: MMask8, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_srl_epi64".}

func mm512_maskz_srl_epi64*(u: MMask8, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_srl_epi64".}

func mm512_srai_epi64*(a: M512i, b: uint32): M512i {.importc: "_mm512_srai_epi64".}

func mm512_mask_srai_epi64*(w: M512i, u: MMask8, a: M512i, b: uint32): M512i {.importc: "_mm512_mask_srai_epi64".}

func mm512_maskz_srai_epi64*(u: MMask8, a: M512i, b: uint32): M512i {.importc: "_mm512_maskz_srai_epi64".}

## [Macro Original]
## #define _mm512_srai_epi64(X, C)						\
## ((__m512i) __builtin_ia32_psraqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)_mm512_undefined_epi32 (),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_srai_epi64(W, U, X, C)				\
## ((__m512i) __builtin_ia32_psraqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_srai_epi64(U, X, C)				\
## ((__m512i) __builtin_ia32_psraqi512_mask ((__v8di)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v8di)(__m512i)_mm512_setzero_si512 (),				\
## (__mmask8)(U)))

func mm512_sra_epi64*(a: M512i, b: M128i): M512i {.importc: "_mm512_sra_epi64".}

func mm512_mask_sra_epi64*(w: M512i, u: MMask8, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_sra_epi64".}

func mm512_maskz_sra_epi64*(u: MMask8, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_sra_epi64".}

func mm512_slli_epi32*(a: M512i, b: uint32): M512i {.importc: "_mm512_slli_epi32".}

func mm512_mask_slli_epi32*(w: M512i, u: MMask16, a: M512i, b: uint32): M512i {.importc: "_mm512_mask_slli_epi32".}

func mm512_maskz_slli_epi32*(u: MMask16, a: M512i, b: uint32): M512i {.importc: "_mm512_maskz_slli_epi32".}

## [Macro Original]
## #define _mm512_slli_epi32(X, C)						\
## ((__m512i) __builtin_ia32_pslldi512_mask ((__v16si)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v16si)(__m512i)_mm512_undefined_epi32 (),			\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_slli_epi32(W, U, X, C)				\
## ((__m512i) __builtin_ia32_pslldi512_mask ((__v16si)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v16si)(__m512i)(W),						\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_slli_epi32(U, X, C)				\
## ((__m512i) __builtin_ia32_pslldi512_mask ((__v16si)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v16si)(__m512i)_mm512_setzero_si512 (),				\
## (__mmask16)(U)))

func mm512_sll_epi32*(a: M512i, b: M128i): M512i {.importc: "_mm512_sll_epi32".}

func mm512_mask_sll_epi32*(w: M512i, u: MMask16, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_sll_epi32".}

func mm512_maskz_sll_epi32*(u: MMask16, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_sll_epi32".}

func mm512_srli_epi32*(a: M512i, b: uint32): M512i {.importc: "_mm512_srli_epi32".}

func mm512_mask_srli_epi32*(w: M512i, u: MMask16, a: M512i, b: uint32): M512i {.importc: "_mm512_mask_srli_epi32".}

func mm512_maskz_srli_epi32*(u: MMask16, a: M512i, b: uint32): M512i {.importc: "_mm512_maskz_srli_epi32".}

## [Macro Original]
## #define _mm512_srli_epi32(X, C)						  \
## ((__m512i) __builtin_ia32_psrldi512_mask ((__v16si)(__m512i)(X),	  \
## (unsigned int)(C),							  \
## (__v16si)(__m512i)_mm512_undefined_epi32 (),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_srli_epi32(W, U, X, C)				  \
## ((__m512i) __builtin_ia32_psrldi512_mask ((__v16si)(__m512i)(X),	  \
## (unsigned int)(C),							  \
## (__v16si)(__m512i)(W),						  \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_srli_epi32(U, X, C)				  \
## ((__m512i) __builtin_ia32_psrldi512_mask ((__v16si)(__m512i)(X),	  \
## (unsigned int)(C),							  \
## (__v16si)(__m512i)_mm512_setzero_si512 (),				  \
## (__mmask16)(U)))

func mm512_srl_epi32*(a: M512i, b: M128i): M512i {.importc: "_mm512_srl_epi32".}

func mm512_mask_srl_epi32*(w: M512i, u: MMask16, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_srl_epi32".}

func mm512_maskz_srl_epi32*(u: MMask16, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_srl_epi32".}

func mm512_srai_epi32*(a: M512i, b: uint32): M512i {.importc: "_mm512_srai_epi32".}

func mm512_mask_srai_epi32*(w: M512i, u: MMask16, a: M512i, b: uint32): M512i {.importc: "_mm512_mask_srai_epi32".}

func mm512_maskz_srai_epi32*(u: MMask16, a: M512i, b: uint32): M512i {.importc: "_mm512_maskz_srai_epi32".}

## [Macro Original]
## #define _mm512_srai_epi32(X, C)						\
## ((__m512i) __builtin_ia32_psradi512_mask ((__v16si)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v16si)(__m512i)_mm512_undefined_epi32 (),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_srai_epi32(W, U, X, C)				\
## ((__m512i) __builtin_ia32_psradi512_mask ((__v16si)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v16si)(__m512i)(W),						\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_srai_epi32(U, X, C)				\
## ((__m512i) __builtin_ia32_psradi512_mask ((__v16si)(__m512i)(X),	\
## (unsigned int)(C),							\
## (__v16si)(__m512i)_mm512_setzero_si512 (),				\
## (__mmask16)(U)))

func mm512_sra_epi32*(a: M512i, b: M128i): M512i {.importc: "_mm512_sra_epi32".}

func mm512_mask_sra_epi32*(w: M512i, u: MMask16, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_sra_epi32".}

func mm512_maskz_sra_epi32*(u: MMask16, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_sra_epi32".}

func mm512_ternarylogic_epi64*(a: M512i, b: M512i, c: M512i, imm: int32): M512i {.importc: "_mm512_ternarylogic_epi64".}

func mm512_mask_ternarylogic_epi64*(a: M512i, u: MMask8, b: M512i, c: M512i, imm: int32): M512i {.importc: "_mm512_mask_ternarylogic_epi64".}

func mm512_maskz_ternarylogic_epi64*(u: MMask8, a: M512i, b: M512i, c: M512i, imm: int32): M512i {.importc: "_mm512_maskz_ternarylogic_epi64".}

func mm512_ternarylogic_epi32*(a: M512i, b: M512i, c: M512i, imm: int32): M512i {.importc: "_mm512_ternarylogic_epi32".}

func mm512_mask_ternarylogic_epi32*(a: M512i, u: MMask16, b: M512i, c: M512i, imm: int32): M512i {.importc: "_mm512_mask_ternarylogic_epi32".}

func mm512_maskz_ternarylogic_epi32*(u: MMask16, a: M512i, b: M512i, c: M512i, imm: int32): M512i {.importc: "_mm512_maskz_ternarylogic_epi32".}

## [Macro Original]
## #define _mm512_ternarylogic_epi64(A, B, C, I)			\
## ((__m512i)							\
## __builtin_ia32_pternlogq512_mask ((__v8di) (__m512i) (A),	\
## (__v8di) (__m512i) (B),	\
## (__v8di) (__m512i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) -1))

## [Macro Original]
## #define _mm512_mask_ternarylogic_epi64(A, U, B, C, I)		\
## ((__m512i)							\
## __builtin_ia32_pternlogq512_mask ((__v8di) (__m512i) (A),	\
## (__v8di) (__m512i) (B),	\
## (__v8di) (__m512i) (C),	\
## (unsigned char)(I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm512_maskz_ternarylogic_epi64(U, A, B, C, I)		\
## ((__m512i)							\
## __builtin_ia32_pternlogq512_maskz ((__v8di) (__m512i) (A),	\
## (__v8di) (__m512i) (B),	\
## (__v8di) (__m512i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm512_ternarylogic_epi32(A, B, C, I)			\
## ((__m512i)							\
## __builtin_ia32_pternlogd512_mask ((__v16si) (__m512i) (A),	\
## (__v16si) (__m512i) (B),	\
## (__v16si) (__m512i) (C),	\
## (unsigned char) (I),	\
## (__mmask16) -1))

## [Macro Original]
## #define _mm512_mask_ternarylogic_epi32(A, U, B, C, I)		\
## ((__m512i)							\
## __builtin_ia32_pternlogd512_mask ((__v16si) (__m512i) (A),	\
## (__v16si) (__m512i) (B),	\
## (__v16si) (__m512i) (C),	\
## (unsigned char) (I),	\
## (__mmask16) (U)))

## [Macro Original]
## #define _mm512_maskz_ternarylogic_epi32(U, A, B, C, I)		\
## ((__m512i)							\
## __builtin_ia32_pternlogd512_maskz ((__v16si) (__m512i) (A),	\
## (__v16si) (__m512i) (B),	\
## (__v16si) (__m512i) (C),	\
## (unsigned char) (I),	\
## (__mmask16) (U)))

func mm512_rcp14_pd*(a: M512d): M512d {.importc: "_mm512_rcp14_pd".}

func mm512_mask_rcp14_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_rcp14_pd".}

func mm512_maskz_rcp14_pd*(u: MMask8, a: M512d): M512d {.importc: "_mm512_maskz_rcp14_pd".}

func mm512_rcp14_ps*(a: M512): M512 {.importc: "_mm512_rcp14_ps".}

func mm512_mask_rcp14_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_rcp14_ps".}

func mm512_maskz_rcp14_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_rcp14_ps".}

func mm512_rsqrt14_pd*(a: M512d): M512d {.importc: "_mm512_rsqrt14_pd".}

func mm512_mask_rsqrt14_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_rsqrt14_pd".}

func mm512_maskz_rsqrt14_pd*(u: MMask8, a: M512d): M512d {.importc: "_mm512_maskz_rsqrt14_pd".}

func mm512_rsqrt14_ps*(a: M512): M512 {.importc: "_mm512_rsqrt14_ps".}

func mm512_mask_rsqrt14_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_rsqrt14_ps".}

func mm512_maskz_rsqrt14_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_rsqrt14_ps".}

func mm512_sqrt_round_pd*(a: M512d, r: int32): M512d {.importc: "_mm512_sqrt_round_pd".}

func mm512_mask_sqrt_round_pd*(w: M512d, u: MMask8, a: M512d, r: int32): M512d {.importc: "_mm512_mask_sqrt_round_pd".}

func mm512_maskz_sqrt_round_pd*(u: MMask8, a: M512d, r: int32): M512d {.importc: "_mm512_maskz_sqrt_round_pd".}

func mm512_sqrt_round_ps*(a: M512, r: int32): M512 {.importc: "_mm512_sqrt_round_ps".}

func mm512_mask_sqrt_round_ps*(w: M512, u: MMask16, a: M512, r: int32): M512 {.importc: "_mm512_mask_sqrt_round_ps".}

func mm512_maskz_sqrt_round_ps*(u: MMask16, a: M512, r: int32): M512 {.importc: "_mm512_maskz_sqrt_round_ps".}

## [Macro Original]
## #define _mm512_sqrt_round_pd(A, C)            \
## (__m512d)__builtin_ia32_sqrtpd512_mask(A, (__v8df)_mm512_undefined_pd(), -1, C)

## [Macro Original]
## #define _mm512_mask_sqrt_round_pd(W, U, A, C) \
## (__m512d)__builtin_ia32_sqrtpd512_mask(A, W, U, C)

## [Macro Original]
## #define _mm512_maskz_sqrt_round_pd(U, A, C)   \
## (__m512d)__builtin_ia32_sqrtpd512_mask(A, (__v8df)_mm512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm512_sqrt_round_ps(A, C)            \
## (__m512)__builtin_ia32_sqrtps512_mask(A, (__v16sf)_mm512_undefined_ps(), -1, C)

## [Macro Original]
## #define _mm512_mask_sqrt_round_ps(W, U, A, C) \
## (__m512)__builtin_ia32_sqrtps512_mask(A, W, U, C)

## [Macro Original]
## #define _mm512_maskz_sqrt_round_ps(U, A, C)   \
## (__m512)__builtin_ia32_sqrtps512_mask(A, (__v16sf)_mm512_setzero_ps(), U, C)

func mm512_cvtepi8_epi32*(a: M128i): M512i {.importc: "_mm512_cvtepi8_epi32".}

func mm512_mask_cvtepi8_epi32*(w: M512i, u: MMask16, a: M128i): M512i {.importc: "_mm512_mask_cvtepi8_epi32".}

func mm512_maskz_cvtepi8_epi32*(u: MMask16, a: M128i): M512i {.importc: "_mm512_maskz_cvtepi8_epi32".}

func mm512_cvtepi8_epi64*(a: M128i): M512i {.importc: "_mm512_cvtepi8_epi64".}

func mm512_mask_cvtepi8_epi64*(w: M512i, u: MMask8, a: M128i): M512i {.importc: "_mm512_mask_cvtepi8_epi64".}

func mm512_maskz_cvtepi8_epi64*(u: MMask8, a: M128i): M512i {.importc: "_mm512_maskz_cvtepi8_epi64".}

func mm512_cvtepi16_epi32*(a: M256i): M512i {.importc: "_mm512_cvtepi16_epi32".}

func mm512_mask_cvtepi16_epi32*(w: M512i, u: MMask16, a: M256i): M512i {.importc: "_mm512_mask_cvtepi16_epi32".}

func mm512_maskz_cvtepi16_epi32*(u: MMask16, a: M256i): M512i {.importc: "_mm512_maskz_cvtepi16_epi32".}

func mm512_cvtepi16_epi64*(a: M128i): M512i {.importc: "_mm512_cvtepi16_epi64".}

func mm512_mask_cvtepi16_epi64*(w: M512i, u: MMask8, a: M128i): M512i {.importc: "_mm512_mask_cvtepi16_epi64".}

func mm512_maskz_cvtepi16_epi64*(u: MMask8, a: M128i): M512i {.importc: "_mm512_maskz_cvtepi16_epi64".}

func mm512_cvtepi32_epi64*(x: M256i): M512i {.importc: "_mm512_cvtepi32_epi64".}

func mm512_mask_cvtepi32_epi64*(w: M512i, u: MMask8, x: M256i): M512i {.importc: "_mm512_mask_cvtepi32_epi64".}

func mm512_maskz_cvtepi32_epi64*(u: MMask8, x: M256i): M512i {.importc: "_mm512_maskz_cvtepi32_epi64".}

func mm512_cvtepu8_epi32*(a: M128i): M512i {.importc: "_mm512_cvtepu8_epi32".}

func mm512_mask_cvtepu8_epi32*(w: M512i, u: MMask16, a: M128i): M512i {.importc: "_mm512_mask_cvtepu8_epi32".}

func mm512_maskz_cvtepu8_epi32*(u: MMask16, a: M128i): M512i {.importc: "_mm512_maskz_cvtepu8_epi32".}

func mm512_cvtepu8_epi64*(a: M128i): M512i {.importc: "_mm512_cvtepu8_epi64".}

func mm512_mask_cvtepu8_epi64*(w: M512i, u: MMask8, a: M128i): M512i {.importc: "_mm512_mask_cvtepu8_epi64".}

func mm512_maskz_cvtepu8_epi64*(u: MMask8, a: M128i): M512i {.importc: "_mm512_maskz_cvtepu8_epi64".}

func mm512_cvtepu16_epi32*(a: M256i): M512i {.importc: "_mm512_cvtepu16_epi32".}

func mm512_mask_cvtepu16_epi32*(w: M512i, u: MMask16, a: M256i): M512i {.importc: "_mm512_mask_cvtepu16_epi32".}

func mm512_maskz_cvtepu16_epi32*(u: MMask16, a: M256i): M512i {.importc: "_mm512_maskz_cvtepu16_epi32".}

func mm512_cvtepu16_epi64*(a: M128i): M512i {.importc: "_mm512_cvtepu16_epi64".}

func mm512_mask_cvtepu16_epi64*(w: M512i, u: MMask8, a: M128i): M512i {.importc: "_mm512_mask_cvtepu16_epi64".}

func mm512_maskz_cvtepu16_epi64*(u: MMask8, a: M128i): M512i {.importc: "_mm512_maskz_cvtepu16_epi64".}

func mm512_cvtepu32_epi64*(x: M256i): M512i {.importc: "_mm512_cvtepu32_epi64".}

func mm512_mask_cvtepu32_epi64*(w: M512i, u: MMask8, x: M256i): M512i {.importc: "_mm512_mask_cvtepu32_epi64".}

func mm512_maskz_cvtepu32_epi64*(u: MMask8, x: M256i): M512i {.importc: "_mm512_maskz_cvtepu32_epi64".}

func mm512_add_round_pd*(a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_add_round_pd".}

func mm512_mask_add_round_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_mask_add_round_pd".}

func mm512_maskz_add_round_pd*(u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_maskz_add_round_pd".}

func mm512_add_round_ps*(a: M512, b: M512, r: int32): M512 {.importc: "_mm512_add_round_ps".}

func mm512_mask_add_round_ps*(w: M512, u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_mask_add_round_ps".}

func mm512_maskz_add_round_ps*(u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_maskz_add_round_ps".}

func mm512_sub_round_pd*(a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_sub_round_pd".}

func mm512_mask_sub_round_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_mask_sub_round_pd".}

func mm512_maskz_sub_round_pd*(u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_maskz_sub_round_pd".}

func mm512_sub_round_ps*(a: M512, b: M512, r: int32): M512 {.importc: "_mm512_sub_round_ps".}

func mm512_mask_sub_round_ps*(w: M512, u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_mask_sub_round_ps".}

func mm512_maskz_sub_round_ps*(u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_maskz_sub_round_ps".}

## [Macro Original]
## #define _mm512_add_round_pd(A, B, C)            \
## (__m512d)__builtin_ia32_addpd512_mask(A, B, (__v8df)_mm512_undefined_pd(), -1, C)

## [Macro Original]
## #define _mm512_mask_add_round_pd(W, U, A, B, C) \
## (__m512d)__builtin_ia32_addpd512_mask(A, B, W, U, C)

## [Macro Original]
## #define _mm512_maskz_add_round_pd(U, A, B, C)   \
## (__m512d)__builtin_ia32_addpd512_mask(A, B, (__v8df)_mm512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm512_add_round_ps(A, B, C)            \
## (__m512)__builtin_ia32_addps512_mask(A, B, (__v16sf)_mm512_undefined_ps(), -1, C)

## [Macro Original]
## #define _mm512_mask_add_round_ps(W, U, A, B, C) \
## (__m512)__builtin_ia32_addps512_mask(A, B, W, U, C)

## [Macro Original]
## #define _mm512_maskz_add_round_ps(U, A, B, C)   \
## (__m512)__builtin_ia32_addps512_mask(A, B, (__v16sf)_mm512_setzero_ps(), U, C)

## [Macro Original]
## #define _mm512_sub_round_pd(A, B, C)            \
## (__m512d)__builtin_ia32_subpd512_mask(A, B, (__v8df)_mm512_undefined_pd(), -1, C)

## [Macro Original]
## #define _mm512_mask_sub_round_pd(W, U, A, B, C) \
## (__m512d)__builtin_ia32_subpd512_mask(A, B, W, U, C)

## [Macro Original]
## #define _mm512_maskz_sub_round_pd(U, A, B, C)   \
## (__m512d)__builtin_ia32_subpd512_mask(A, B, (__v8df)_mm512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm512_sub_round_ps(A, B, C)            \
## (__m512)__builtin_ia32_subps512_mask(A, B, (__v16sf)_mm512_undefined_ps(), -1, C)

## [Macro Original]
## #define _mm512_mask_sub_round_ps(W, U, A, B, C) \
## (__m512)__builtin_ia32_subps512_mask(A, B, W, U, C)

## [Macro Original]
## #define _mm512_maskz_sub_round_ps(U, A, B, C)   \
## (__m512)__builtin_ia32_subps512_mask(A, B, (__v16sf)_mm512_setzero_ps(), U, C)

func mm512_mul_round_pd*(a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_mul_round_pd".}

func mm512_mask_mul_round_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_mask_mul_round_pd".}

func mm512_maskz_mul_round_pd*(u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_maskz_mul_round_pd".}

func mm512_mul_round_ps*(a: M512, b: M512, r: int32): M512 {.importc: "_mm512_mul_round_ps".}

func mm512_mask_mul_round_ps*(w: M512, u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_mask_mul_round_ps".}

func mm512_maskz_mul_round_ps*(u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_maskz_mul_round_ps".}

func mm512_div_round_pd*(m: M512d, v: M512d, r: int32): M512d {.importc: "_mm512_div_round_pd".}

func mm512_mask_div_round_pd*(w: M512d, u: MMask8, m: M512d, v: M512d, r: int32): M512d {.importc: "_mm512_mask_div_round_pd".}

func mm512_maskz_div_round_pd*(u: MMask8, m: M512d, v: M512d, r: int32): M512d {.importc: "_mm512_maskz_div_round_pd".}

func mm512_div_round_ps*(a: M512, b: M512, r: int32): M512 {.importc: "_mm512_div_round_ps".}

func mm512_mask_div_round_ps*(w: M512, u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_mask_div_round_ps".}

func mm512_maskz_div_round_ps*(u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_maskz_div_round_ps".}

## [Macro Original]
## #define _mm512_mul_round_pd(A, B, C)            \
## (__m512d)__builtin_ia32_mulpd512_mask(A, B, (__v8df)_mm512_undefined_pd(), -1, C)

## [Macro Original]
## #define _mm512_mask_mul_round_pd(W, U, A, B, C) \
## (__m512d)__builtin_ia32_mulpd512_mask(A, B, W, U, C)

## [Macro Original]
## #define _mm512_maskz_mul_round_pd(U, A, B, C)   \
## (__m512d)__builtin_ia32_mulpd512_mask(A, B, (__v8df)_mm512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm512_mul_round_ps(A, B, C)            \
## (__m512)__builtin_ia32_mulps512_mask(A, B, (__v16sf)_mm512_undefined_ps(), -1, C)

## [Macro Original]
## #define _mm512_mask_mul_round_ps(W, U, A, B, C) \
## (__m512)__builtin_ia32_mulps512_mask(A, B, W, U, C)

## [Macro Original]
## #define _mm512_maskz_mul_round_ps(U, A, B, C)   \
## (__m512)__builtin_ia32_mulps512_mask(A, B, (__v16sf)_mm512_setzero_ps(), U, C)

## [Macro Original]
## #define _mm512_div_round_pd(A, B, C)            \
## (__m512d)__builtin_ia32_divpd512_mask(A, B, (__v8df)_mm512_undefined_pd(), -1, C)

## [Macro Original]
## #define _mm512_mask_div_round_pd(W, U, A, B, C) \
## (__m512d)__builtin_ia32_divpd512_mask(A, B, W, U, C)

## [Macro Original]
## #define _mm512_maskz_div_round_pd(U, A, B, C)   \
## (__m512d)__builtin_ia32_divpd512_mask(A, B, (__v8df)_mm512_setzero_pd(), U, C)

## [Macro Original]
## #define _mm512_div_round_ps(A, B, C)            \
## (__m512)__builtin_ia32_divps512_mask(A, B, (__v16sf)_mm512_undefined_ps(), -1, C)

## [Macro Original]
## #define _mm512_mask_div_round_ps(W, U, A, B, C) \
## (__m512)__builtin_ia32_divps512_mask(A, B, W, U, C)

## [Macro Original]
## #define _mm512_maskz_div_round_ps(U, A, B, C)   \
## (__m512)__builtin_ia32_divps512_mask(A, B, (__v16sf)_mm512_setzero_ps(), U, C)

func mm512_max_round_pd*(a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_max_round_pd".}

func mm512_mask_max_round_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_mask_max_round_pd".}

func mm512_maskz_max_round_pd*(u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_maskz_max_round_pd".}

func mm512_max_round_ps*(a: M512, b: M512, r: int32): M512 {.importc: "_mm512_max_round_ps".}

func mm512_mask_max_round_ps*(w: M512, u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_mask_max_round_ps".}

func mm512_maskz_max_round_ps*(u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_maskz_max_round_ps".}

func mm512_min_round_pd*(a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_min_round_pd".}

func mm512_mask_min_round_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_mask_min_round_pd".}

func mm512_maskz_min_round_pd*(u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_maskz_min_round_pd".}

func mm512_min_round_ps*(a: M512, b: M512, r: int32): M512 {.importc: "_mm512_min_round_ps".}

func mm512_mask_min_round_ps*(w: M512, u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_mask_min_round_ps".}

func mm512_maskz_min_round_ps*(u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_maskz_min_round_ps".}

## [Macro Original]
## #define _mm512_max_round_pd(A, B,  R) \
## (__m512d)__builtin_ia32_maxpd512_mask(A, B, (__v8df)_mm512_undefined_pd(), -1, R)

## [Macro Original]
## #define _mm512_mask_max_round_pd(W, U,  A, B, R) \
## (__m512d)__builtin_ia32_maxpd512_mask(A, B, W, U, R)

## [Macro Original]
## #define _mm512_maskz_max_round_pd(U, A,  B, R) \
## (__m512d)__builtin_ia32_maxpd512_mask(A, B, (__v8df)_mm512_setzero_pd(), U, R)

## [Macro Original]
## #define _mm512_max_round_ps(A, B,  R) \
## (__m512)__builtin_ia32_maxps512_mask(A, B, (__v16sf)_mm512_undefined_pd(), -1, R)

## [Macro Original]
## #define _mm512_mask_max_round_ps(W, U,  A, B, R) \
## (__m512)__builtin_ia32_maxps512_mask(A, B, W, U, R)

## [Macro Original]
## #define _mm512_maskz_max_round_ps(U, A,  B, R) \
## (__m512)__builtin_ia32_maxps512_mask(A, B, (__v16sf)_mm512_setzero_ps(), U, R)

## [Macro Original]
## #define _mm512_min_round_pd(A, B,  R) \
## (__m512d)__builtin_ia32_minpd512_mask(A, B, (__v8df)_mm512_undefined_pd(), -1, R)

## [Macro Original]
## #define _mm512_mask_min_round_pd(W, U,  A, B, R) \
## (__m512d)__builtin_ia32_minpd512_mask(A, B, W, U, R)

## [Macro Original]
## #define _mm512_maskz_min_round_pd(U, A,  B, R) \
## (__m512d)__builtin_ia32_minpd512_mask(A, B, (__v8df)_mm512_setzero_pd(), U, R)

## [Macro Original]
## #define _mm512_min_round_ps(A, B, R) \
## (__m512)__builtin_ia32_minps512_mask(A, B, (__v16sf)_mm512_undefined_ps(), -1, R)

## [Macro Original]
## #define _mm512_mask_min_round_ps(W, U,  A, B, R) \
## (__m512)__builtin_ia32_minps512_mask(A, B, W, U, R)

## [Macro Original]
## #define _mm512_maskz_min_round_ps(U, A,  B, R) \
## (__m512)__builtin_ia32_minps512_mask(A, B, (__v16sf)_mm512_setzero_ps(), U, R)

func mm512_scalef_round_pd*(a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_scalef_round_pd".}

func mm512_mask_scalef_round_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_mask_scalef_round_pd".}

func mm512_maskz_scalef_round_pd*(u: MMask8, a: M512d, b: M512d, r: int32): M512d {.importc: "_mm512_maskz_scalef_round_pd".}

func mm512_scalef_round_ps*(a: M512, b: M512, r: int32): M512 {.importc: "_mm512_scalef_round_ps".}

func mm512_mask_scalef_round_ps*(w: M512, u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_mask_scalef_round_ps".}

func mm512_maskz_scalef_round_ps*(u: MMask16, a: M512, b: M512, r: int32): M512 {.importc: "_mm512_maskz_scalef_round_ps".}

## [Macro Original]
## #define _mm512_scalef_round_pd(A, B, C)					\
## ((__m512d)								\
## __builtin_ia32_scalefpd512_mask((A), (B),				\
## (__v8df) _mm512_undefined_pd(),	\
## -1, (C)))

## [Macro Original]
## #define _mm512_mask_scalef_round_pd(W, U, A, B, C)			\
## ((__m512d) __builtin_ia32_scalefpd512_mask((A), (B), (W), (U), (C)))

## [Macro Original]
## #define _mm512_maskz_scalef_round_pd(U, A, B, C)			\
## ((__m512d)								\
## __builtin_ia32_scalefpd512_mask((A), (B),				\
## (__v8df) _mm512_setzero_pd(),	\
## (U), (C)))

## [Macro Original]
## #define _mm512_scalef_round_ps(A, B, C)					\
## ((__m512)								\
## __builtin_ia32_scalefps512_mask((A), (B),				\
## (__v16sf) _mm512_undefined_ps(),	\
## -1, (C)))

## [Macro Original]
## #define _mm512_mask_scalef_round_ps(W, U, A, B, C)			\
## ((__m512) __builtin_ia32_scalefps512_mask((A), (B), (W), (U), (C)))

## [Macro Original]
## #define _mm512_maskz_scalef_round_ps(U, A, B, C)			\
## ((__m512)								\
## __builtin_ia32_scalefps512_mask((A), (B),				\
## (__v16sf) _mm512_setzero_ps(),	\
## (U), (C)))

func mm512_fmadd_round_pd*(a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_fmadd_round_pd".}

func mm512_mask_fmadd_round_pd*(a: M512d, u: MMask8, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_mask_fmadd_round_pd".}

func mm512_mask3_fmadd_round_pd*(a: M512d, b: M512d, c: M512d, u: MMask8, r: int32): M512d {.importc: "_mm512_mask3_fmadd_round_pd".}

func mm512_maskz_fmadd_round_pd*(u: MMask8, a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_maskz_fmadd_round_pd".}

func mm512_fmadd_round_ps*(a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_fmadd_round_ps".}

func mm512_mask_fmadd_round_ps*(a: M512, u: MMask16, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_mask_fmadd_round_ps".}

func mm512_mask3_fmadd_round_ps*(a: M512, b: M512, c: M512, u: MMask16, r: int32): M512 {.importc: "_mm512_mask3_fmadd_round_ps".}

func mm512_maskz_fmadd_round_ps*(u: MMask16, a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_maskz_fmadd_round_ps".}

func mm512_fmsub_round_pd*(a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_fmsub_round_pd".}

func mm512_mask_fmsub_round_pd*(a: M512d, u: MMask8, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_mask_fmsub_round_pd".}

func mm512_mask3_fmsub_round_pd*(a: M512d, b: M512d, c: M512d, u: MMask8, r: int32): M512d {.importc: "_mm512_mask3_fmsub_round_pd".}

func mm512_maskz_fmsub_round_pd*(u: MMask8, a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_maskz_fmsub_round_pd".}

func mm512_fmsub_round_ps*(a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_fmsub_round_ps".}

func mm512_mask_fmsub_round_ps*(a: M512, u: MMask16, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_mask_fmsub_round_ps".}

func mm512_mask3_fmsub_round_ps*(a: M512, b: M512, c: M512, u: MMask16, r: int32): M512 {.importc: "_mm512_mask3_fmsub_round_ps".}

func mm512_maskz_fmsub_round_ps*(u: MMask16, a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_maskz_fmsub_round_ps".}

func mm512_fmaddsub_round_pd*(a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_fmaddsub_round_pd".}

func mm512_mask_fmaddsub_round_pd*(a: M512d, u: MMask8, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_mask_fmaddsub_round_pd".}

func mm512_mask3_fmaddsub_round_pd*(a: M512d, b: M512d, c: M512d, u: MMask8, r: int32): M512d {.importc: "_mm512_mask3_fmaddsub_round_pd".}

func mm512_maskz_fmaddsub_round_pd*(u: MMask8, a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_maskz_fmaddsub_round_pd".}

func mm512_fmaddsub_round_ps*(a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_fmaddsub_round_ps".}

func mm512_mask_fmaddsub_round_ps*(a: M512, u: MMask16, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_mask_fmaddsub_round_ps".}

func mm512_mask3_fmaddsub_round_ps*(a: M512, b: M512, c: M512, u: MMask16, r: int32): M512 {.importc: "_mm512_mask3_fmaddsub_round_ps".}

func mm512_maskz_fmaddsub_round_ps*(u: MMask16, a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_maskz_fmaddsub_round_ps".}

func mm512_fmsubadd_round_pd*(a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_fmsubadd_round_pd".}

func mm512_mask_fmsubadd_round_pd*(a: M512d, u: MMask8, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_mask_fmsubadd_round_pd".}

func mm512_mask3_fmsubadd_round_pd*(a: M512d, b: M512d, c: M512d, u: MMask8, r: int32): M512d {.importc: "_mm512_mask3_fmsubadd_round_pd".}

func mm512_maskz_fmsubadd_round_pd*(u: MMask8, a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_maskz_fmsubadd_round_pd".}

func mm512_fmsubadd_round_ps*(a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_fmsubadd_round_ps".}

func mm512_mask_fmsubadd_round_ps*(a: M512, u: MMask16, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_mask_fmsubadd_round_ps".}

func mm512_mask3_fmsubadd_round_ps*(a: M512, b: M512, c: M512, u: MMask16, r: int32): M512 {.importc: "_mm512_mask3_fmsubadd_round_ps".}

func mm512_maskz_fmsubadd_round_ps*(u: MMask16, a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_maskz_fmsubadd_round_ps".}

func mm512_fnmadd_round_pd*(a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_fnmadd_round_pd".}

func mm512_mask_fnmadd_round_pd*(a: M512d, u: MMask8, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_mask_fnmadd_round_pd".}

func mm512_mask3_fnmadd_round_pd*(a: M512d, b: M512d, c: M512d, u: MMask8, r: int32): M512d {.importc: "_mm512_mask3_fnmadd_round_pd".}

func mm512_maskz_fnmadd_round_pd*(u: MMask8, a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_maskz_fnmadd_round_pd".}

func mm512_fnmadd_round_ps*(a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_fnmadd_round_ps".}

func mm512_mask_fnmadd_round_ps*(a: M512, u: MMask16, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_mask_fnmadd_round_ps".}

func mm512_mask3_fnmadd_round_ps*(a: M512, b: M512, c: M512, u: MMask16, r: int32): M512 {.importc: "_mm512_mask3_fnmadd_round_ps".}

func mm512_maskz_fnmadd_round_ps*(u: MMask16, a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_maskz_fnmadd_round_ps".}

func mm512_fnmsub_round_pd*(a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_fnmsub_round_pd".}

func mm512_mask_fnmsub_round_pd*(a: M512d, u: MMask8, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_mask_fnmsub_round_pd".}

func mm512_mask3_fnmsub_round_pd*(a: M512d, b: M512d, c: M512d, u: MMask8, r: int32): M512d {.importc: "_mm512_mask3_fnmsub_round_pd".}

func mm512_maskz_fnmsub_round_pd*(u: MMask8, a: M512d, b: M512d, c: M512d, r: int32): M512d {.importc: "_mm512_maskz_fnmsub_round_pd".}

func mm512_fnmsub_round_ps*(a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_fnmsub_round_ps".}

func mm512_mask_fnmsub_round_ps*(a: M512, u: MMask16, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_mask_fnmsub_round_ps".}

func mm512_mask3_fnmsub_round_ps*(a: M512, b: M512, c: M512, u: MMask16, r: int32): M512 {.importc: "_mm512_mask3_fnmsub_round_ps".}

func mm512_maskz_fnmsub_round_ps*(u: MMask16, a: M512, b: M512, c: M512, r: int32): M512 {.importc: "_mm512_maskz_fnmsub_round_ps".}

## [Macro Original]
## #define _mm512_fmadd_round_pd(A, B, C, R)            \
## (__m512d)__builtin_ia32_vfmaddpd512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fmadd_round_pd(A, U, B, C, R)    \
## (__m512d)__builtin_ia32_vfmaddpd512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fmadd_round_pd(A, B, C, U, R)   \
## (__m512d)__builtin_ia32_vfmaddpd512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fmadd_round_pd(U, A, B, C, R)   \
## (__m512d)__builtin_ia32_vfmaddpd512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fmadd_round_ps(A, B, C, R)            \
## (__m512)__builtin_ia32_vfmaddps512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fmadd_round_ps(A, U, B, C, R)    \
## (__m512)__builtin_ia32_vfmaddps512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fmadd_round_ps(A, B, C, U, R)   \
## (__m512)__builtin_ia32_vfmaddps512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fmadd_round_ps(U, A, B, C, R)   \
## (__m512)__builtin_ia32_vfmaddps512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fmsub_round_pd(A, B, C, R)            \
## (__m512d)__builtin_ia32_vfmsubpd512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fmsub_round_pd(A, U, B, C, R)    \
## (__m512d)__builtin_ia32_vfmsubpd512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fmsub_round_pd(A, B, C, U, R)   \
## (__m512d)__builtin_ia32_vfmsubpd512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fmsub_round_pd(U, A, B, C, R)   \
## (__m512d)__builtin_ia32_vfmsubpd512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fmsub_round_ps(A, B, C, R)            \
## (__m512)__builtin_ia32_vfmsubps512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fmsub_round_ps(A, U, B, C, R)    \
## (__m512)__builtin_ia32_vfmsubps512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fmsub_round_ps(A, B, C, U, R)   \
## (__m512)__builtin_ia32_vfmsubps512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fmsub_round_ps(U, A, B, C, R)   \
## (__m512)__builtin_ia32_vfmsubps512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fmaddsub_round_pd(A, B, C, R)            \
## (__m512d)__builtin_ia32_vfmaddsubpd512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fmaddsub_round_pd(A, U, B, C, R)    \
## (__m512d)__builtin_ia32_vfmaddsubpd512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fmaddsub_round_pd(A, B, C, U, R)   \
## (__m512d)__builtin_ia32_vfmaddsubpd512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fmaddsub_round_pd(U, A, B, C, R)   \
## (__m512d)__builtin_ia32_vfmaddsubpd512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fmaddsub_round_ps(A, B, C, R)            \
## (__m512)__builtin_ia32_vfmaddsubps512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fmaddsub_round_ps(A, U, B, C, R)    \
## (__m512)__builtin_ia32_vfmaddsubps512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fmaddsub_round_ps(A, B, C, U, R)   \
## (__m512)__builtin_ia32_vfmaddsubps512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fmaddsub_round_ps(U, A, B, C, R)   \
## (__m512)__builtin_ia32_vfmaddsubps512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fmsubadd_round_pd(A, B, C, R)            \
## (__m512d)__builtin_ia32_vfmaddsubpd512_mask(A, B, -(C), -1, R)

## [Macro Original]
## #define _mm512_mask_fmsubadd_round_pd(A, U, B, C, R)    \
## (__m512d)__builtin_ia32_vfmaddsubpd512_mask(A, B, -(C), U, R)

## [Macro Original]
## #define _mm512_mask3_fmsubadd_round_pd(A, B, C, U, R)   \
## (__m512d)__builtin_ia32_vfmsubaddpd512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fmsubadd_round_pd(U, A, B, C, R)   \
## (__m512d)__builtin_ia32_vfmaddsubpd512_maskz(A, B, -(C), U, R)

## [Macro Original]
## #define _mm512_fmsubadd_round_ps(A, B, C, R)            \
## (__m512)__builtin_ia32_vfmaddsubps512_mask(A, B, -(C), -1, R)

## [Macro Original]
## #define _mm512_mask_fmsubadd_round_ps(A, U, B, C, R)    \
## (__m512)__builtin_ia32_vfmaddsubps512_mask(A, B, -(C), U, R)

## [Macro Original]
## #define _mm512_mask3_fmsubadd_round_ps(A, B, C, U, R)   \
## (__m512)__builtin_ia32_vfmsubaddps512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fmsubadd_round_ps(U, A, B, C, R)   \
## (__m512)__builtin_ia32_vfmaddsubps512_maskz(A, B, -(C), U, R)

## [Macro Original]
## #define _mm512_fnmadd_round_pd(A, B, C, R)            \
## (__m512d)__builtin_ia32_vfnmaddpd512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fnmadd_round_pd(A, U, B, C, R)    \
## (__m512d)__builtin_ia32_vfnmaddpd512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fnmadd_round_pd(A, B, C, U, R)   \
## (__m512d)__builtin_ia32_vfnmaddpd512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fnmadd_round_pd(U, A, B, C, R)   \
## (__m512d)__builtin_ia32_vfnmaddpd512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fnmadd_round_ps(A, B, C, R)            \
## (__m512)__builtin_ia32_vfnmaddps512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fnmadd_round_ps(A, U, B, C, R)    \
## (__m512)__builtin_ia32_vfnmaddps512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fnmadd_round_ps(A, B, C, U, R)   \
## (__m512)__builtin_ia32_vfnmaddps512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fnmadd_round_ps(U, A, B, C, R)   \
## (__m512)__builtin_ia32_vfnmaddps512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fnmsub_round_pd(A, B, C, R)            \
## (__m512d)__builtin_ia32_vfnmsubpd512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fnmsub_round_pd(A, U, B, C, R)    \
## (__m512d)__builtin_ia32_vfnmsubpd512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fnmsub_round_pd(A, B, C, U, R)   \
## (__m512d)__builtin_ia32_vfnmsubpd512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fnmsub_round_pd(U, A, B, C, R)   \
## (__m512d)__builtin_ia32_vfnmsubpd512_maskz(A, B, C, U, R)

## [Macro Original]
## #define _mm512_fnmsub_round_ps(A, B, C, R)            \
## (__m512)__builtin_ia32_vfnmsubps512_mask(A, B, C, -1, R)

## [Macro Original]
## #define _mm512_mask_fnmsub_round_ps(A, U, B, C, R)    \
## (__m512)__builtin_ia32_vfnmsubps512_mask(A, B, C, U, R)

## [Macro Original]
## #define _mm512_mask3_fnmsub_round_ps(A, B, C, U, R)   \
## (__m512)__builtin_ia32_vfnmsubps512_mask3(A, B, C, U, R)

## [Macro Original]
## #define _mm512_maskz_fnmsub_round_ps(U, A, B, C, R)   \
## (__m512)__builtin_ia32_vfnmsubps512_maskz(A, B, C, U, R)

func mm512_abs_epi64*(a: M512i): M512i {.importc: "_mm512_abs_epi64".}

func mm512_mask_abs_epi64*(w: M512i, u: MMask8, a: M512i): M512i {.importc: "_mm512_mask_abs_epi64".}

func mm512_maskz_abs_epi64*(u: MMask8, a: M512i): M512i {.importc: "_mm512_maskz_abs_epi64".}

func mm512_abs_epi32*(a: M512i): M512i {.importc: "_mm512_abs_epi32".}

func mm512_mask_abs_epi32*(w: M512i, u: MMask16, a: M512i): M512i {.importc: "_mm512_mask_abs_epi32".}

func mm512_maskz_abs_epi32*(u: MMask16, a: M512i): M512i {.importc: "_mm512_maskz_abs_epi32".}

func mm512_broadcastss_ps*(a: M128): M512 {.importc: "_mm512_broadcastss_ps".}

func mm512_mask_broadcastss_ps*(o: M512, m: MMask16, a: M128): M512 {.importc: "_mm512_mask_broadcastss_ps".}

func mm512_maskz_broadcastss_ps*(m: MMask16, a: M128): M512 {.importc: "_mm512_maskz_broadcastss_ps".}

func mm512_broadcastsd_pd*(a: M128d): M512d {.importc: "_mm512_broadcastsd_pd".}

func mm512_mask_broadcastsd_pd*(o: M512d, m: MMask8, a: M128d): M512d {.importc: "_mm512_mask_broadcastsd_pd".}

func mm512_maskz_broadcastsd_pd*(m: MMask8, a: M128d): M512d {.importc: "_mm512_maskz_broadcastsd_pd".}

func mm512_broadcastd_epi32*(a: M128i): M512i {.importc: "_mm512_broadcastd_epi32".}

func mm512_mask_broadcastd_epi32*(o: M512i, m: MMask16, a: M128i): M512i {.importc: "_mm512_mask_broadcastd_epi32".}

func mm512_maskz_broadcastd_epi32*(m: MMask16, a: M128i): M512i {.importc: "_mm512_maskz_broadcastd_epi32".}

func mm512_set1_epi32*(a: int32): M512i {.importc: "_mm512_set1_epi32".}

func mm512_mask_set1_epi32*(o: M512i, m: MMask16, a: int32): M512i {.importc: "_mm512_mask_set1_epi32".}

func mm512_maskz_set1_epi32*(m: MMask16, a: int32): M512i {.importc: "_mm512_maskz_set1_epi32".}

func mm512_broadcastq_epi64*(a: M128i): M512i {.importc: "_mm512_broadcastq_epi64".}

func mm512_mask_broadcastq_epi64*(o: M512i, m: MMask8, a: M128i): M512i {.importc: "_mm512_mask_broadcastq_epi64".}

func mm512_maskz_broadcastq_epi64*(m: MMask8, a: M128i): M512i {.importc: "_mm512_maskz_broadcastq_epi64".}

func mm512_set1_epi64*(a: int64): M512i {.importc: "_mm512_set1_epi64".}

func mm512_mask_set1_epi64*(o: M512i, m: MMask8, a: int64): M512i {.importc: "_mm512_mask_set1_epi64".}

func mm512_maskz_set1_epi64*(m: MMask8, a: int64): M512i {.importc: "_mm512_maskz_set1_epi64".}

func mm512_broadcast_f32x4*(a: M128): M512 {.importc: "_mm512_broadcast_f32x4".}

func mm512_mask_broadcast_f32x4*(o: M512, m: MMask16, a: M128): M512 {.importc: "_mm512_mask_broadcast_f32x4".}

func mm512_maskz_broadcast_f32x4*(m: MMask16, a: M128): M512 {.importc: "_mm512_maskz_broadcast_f32x4".}

func mm512_broadcast_i32x4*(a: M128i): M512i {.importc: "_mm512_broadcast_i32x4".}

func mm512_mask_broadcast_i32x4*(o: M512i, m: MMask16, a: M128i): M512i {.importc: "_mm512_mask_broadcast_i32x4".}

func mm512_maskz_broadcast_i32x4*(m: MMask16, a: M128i): M512i {.importc: "_mm512_maskz_broadcast_i32x4".}

func mm512_broadcast_f64x4*(a: M256d): M512d {.importc: "_mm512_broadcast_f64x4".}

func mm512_mask_broadcast_f64x4*(o: M512d, m: MMask8, a: M256d): M512d {.importc: "_mm512_mask_broadcast_f64x4".}

func mm512_maskz_broadcast_f64x4*(m: MMask8, a: M256d): M512d {.importc: "_mm512_maskz_broadcast_f64x4".}

func mm512_broadcast_i64x4*(a: M256i): M512i {.importc: "_mm512_broadcast_i64x4".}

func mm512_mask_broadcast_i64x4*(o: M512i, m: MMask8, a: M256i): M512i {.importc: "_mm512_mask_broadcast_i64x4".}

func mm512_maskz_broadcast_i64x4*(m: MMask8, a: M256i): M512i {.importc: "_mm512_maskz_broadcast_i64x4".}

func mm512_shuffle_epi32*(a: M512i, mask: MM_PERM_ENUM): M512i {.importc: "_mm512_shuffle_epi32".}

func mm512_mask_shuffle_epi32*(w: M512i, u: MMask16, a: M512i, mask: MM_PERM_ENUM): M512i {.importc: "_mm512_mask_shuffle_epi32".}

func mm512_maskz_shuffle_epi32*(u: MMask16, a: M512i, mask: MM_PERM_ENUM): M512i {.importc: "_mm512_maskz_shuffle_epi32".}

func mm512_shuffle_i64x2*(a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_shuffle_i64x2".}

func mm512_mask_shuffle_i64x2*(w: M512i, u: MMask8, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_mask_shuffle_i64x2".}

func mm512_maskz_shuffle_i64x2*(u: MMask8, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_maskz_shuffle_i64x2".}

func mm512_shuffle_i32x4*(a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_shuffle_i32x4".}

func mm512_mask_shuffle_i32x4*(w: M512i, u: MMask16, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_mask_shuffle_i32x4".}

func mm512_maskz_shuffle_i32x4*(u: MMask16, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_maskz_shuffle_i32x4".}

func mm512_shuffle_f64x2*(a: M512d, b: M512d, imm: int32): M512d {.importc: "_mm512_shuffle_f64x2".}

func mm512_mask_shuffle_f64x2*(w: M512d, u: MMask8, a: M512d, b: M512d, imm: int32): M512d {.importc: "_mm512_mask_shuffle_f64x2".}

func mm512_maskz_shuffle_f64x2*(u: MMask8, a: M512d, b: M512d, imm: int32): M512d {.importc: "_mm512_maskz_shuffle_f64x2".}

func mm512_shuffle_f32x4*(a: M512, b: M512, imm: int32): M512 {.importc: "_mm512_shuffle_f32x4".}

func mm512_mask_shuffle_f32x4*(w: M512, u: MMask16, a: M512, b: M512, imm: int32): M512 {.importc: "_mm512_mask_shuffle_f32x4".}

func mm512_maskz_shuffle_f32x4*(u: MMask16, a: M512, b: M512, imm: int32): M512 {.importc: "_mm512_maskz_shuffle_f32x4".}

## [Macro Original]
## #define _mm512_shuffle_epi32(X, C)                                      \
## ((__m512i)  __builtin_ia32_pshufd512_mask ((__v16si)(__m512i)(X), (int)(C),\
## (__v16si)(__m512i)_mm512_undefined_epi32 (),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_shuffle_epi32(W, U, X, C)                           \
## ((__m512i)  __builtin_ia32_pshufd512_mask ((__v16si)(__m512i)(X), (int)(C),\
## (__v16si)(__m512i)(W),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_shuffle_epi32(U, X, C)                             \
## ((__m512i)  __builtin_ia32_pshufd512_mask ((__v16si)(__m512i)(X), (int)(C),\
## (__v16si)(__m512i)_mm512_setzero_si512 (),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_shuffle_i64x2(X, Y, C)                                   \
## ((__m512i)  __builtin_ia32_shuf_i64x2_mask ((__v8di)(__m512i)(X),     \
## (__v8di)(__m512i)(Y), (int)(C),\
## (__v8di)(__m512i)_mm512_undefined_epi32 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_shuffle_i64x2(W, U, X, Y, C)                        \
## ((__m512i)  __builtin_ia32_shuf_i64x2_mask ((__v8di)(__m512i)(X),     \
## (__v8di)(__m512i)(Y), (int)(C),\
## (__v8di)(__m512i)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_shuffle_i64x2(U, X, Y, C)                          \
## ((__m512i)  __builtin_ia32_shuf_i64x2_mask ((__v8di)(__m512i)(X),     \
## (__v8di)(__m512i)(Y), (int)(C),\
## (__v8di)(__m512i)_mm512_setzero_si512 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_shuffle_i32x4(X, Y, C)                                   \
## ((__m512i)  __builtin_ia32_shuf_i32x4_mask ((__v16si)(__m512i)(X),    \
## (__v16si)(__m512i)(Y), (int)(C),\
## (__v16si)(__m512i)_mm512_undefined_epi32 (),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_shuffle_i32x4(W, U, X, Y, C)                        \
## ((__m512i)  __builtin_ia32_shuf_i32x4_mask ((__v16si)(__m512i)(X),    \
## (__v16si)(__m512i)(Y), (int)(C),\
## (__v16si)(__m512i)(W),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_shuffle_i32x4(U, X, Y, C)                          \
## ((__m512i)  __builtin_ia32_shuf_i32x4_mask ((__v16si)(__m512i)(X),    \
## (__v16si)(__m512i)(Y), (int)(C),\
## (__v16si)(__m512i)_mm512_setzero_si512 (),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_shuffle_f64x2(X, Y, C)                                   \
## ((__m512d)  __builtin_ia32_shuf_f64x2_mask ((__v8df)(__m512d)(X),     \
## (__v8df)(__m512d)(Y), (int)(C),\
## (__v8df)(__m512d)_mm512_undefined_pd(),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_shuffle_f64x2(W, U, X, Y, C)                        \
## ((__m512d)  __builtin_ia32_shuf_f64x2_mask ((__v8df)(__m512d)(X),     \
## (__v8df)(__m512d)(Y), (int)(C),\
## (__v8df)(__m512d)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_shuffle_f64x2(U, X, Y, C)                         \
## ((__m512d)  __builtin_ia32_shuf_f64x2_mask ((__v8df)(__m512d)(X),    \
## (__v8df)(__m512d)(Y), (int)(C),\
## (__v8df)(__m512d)_mm512_setzero_pd(),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_shuffle_f32x4(X, Y, C)                                  \
## ((__m512)  __builtin_ia32_shuf_f32x4_mask ((__v16sf)(__m512)(X),     \
## (__v16sf)(__m512)(Y), (int)(C),\
## (__v16sf)(__m512)_mm512_undefined_ps(),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_shuffle_f32x4(W, U, X, Y, C)                       \
## ((__m512)  __builtin_ia32_shuf_f32x4_mask ((__v16sf)(__m512)(X),     \
## (__v16sf)(__m512)(Y), (int)(C),\
## (__v16sf)(__m512)(W),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_shuffle_f32x4(U, X, Y, C)                         \
## ((__m512)  __builtin_ia32_shuf_f32x4_mask ((__v16sf)(__m512)(X),     \
## (__v16sf)(__m512)(Y), (int)(C),\
## (__v16sf)(__m512)_mm512_setzero_ps(),\
## (__mmask16)(U)))

func mm512_rolv_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_rolv_epi32".}

func mm512_mask_rolv_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_rolv_epi32".}

func mm512_maskz_rolv_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_rolv_epi32".}

func mm512_rorv_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_rorv_epi32".}

func mm512_mask_rorv_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_rorv_epi32".}

func mm512_maskz_rorv_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_rorv_epi32".}

func mm512_rolv_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_rolv_epi64".}

func mm512_mask_rolv_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_rolv_epi64".}

func mm512_maskz_rolv_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_rolv_epi64".}

func mm512_rorv_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_rorv_epi64".}

func mm512_mask_rorv_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_rorv_epi64".}

func mm512_maskz_rorv_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_rorv_epi64".}

func mm512_cvtt_roundpd_epi32*(a: M512d, r: int32): M256i {.importc: "_mm512_cvtt_roundpd_epi32".}

func mm512_mask_cvtt_roundpd_epi32*(w: M256i, u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_mask_cvtt_roundpd_epi32".}

func mm512_maskz_cvtt_roundpd_epi32*(u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_maskz_cvtt_roundpd_epi32".}

func mm512_cvtt_roundpd_epu32*(a: M512d, r: int32): M256i {.importc: "_mm512_cvtt_roundpd_epu32".}

func mm512_mask_cvtt_roundpd_epu32*(w: M256i, u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_mask_cvtt_roundpd_epu32".}

func mm512_maskz_cvtt_roundpd_epu32*(u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_maskz_cvtt_roundpd_epu32".}

## [Macro Original]
## #define _mm512_cvtt_roundpd_epi32(A, B)		     \
## ((__m256i)__builtin_ia32_cvttpd2dq512_mask(A, (__v8si)_mm256_undefined_si256(), -1, B))

## [Macro Original]
## #define _mm512_mask_cvtt_roundpd_epi32(W, U, A, B)   \
## ((__m256i)__builtin_ia32_cvttpd2dq512_mask(A, (__v8si)(W), U, B))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundpd_epi32(U, A, B)     \
## ((__m256i)__builtin_ia32_cvttpd2dq512_mask(A, (__v8si)_mm256_setzero_si256(), U, B))

## [Macro Original]
## #define _mm512_cvtt_roundpd_epu32(A, B)		     \
## ((__m256i)__builtin_ia32_cvttpd2udq512_mask(A, (__v8si)_mm256_undefined_si256(), -1, B))

## [Macro Original]
## #define _mm512_mask_cvtt_roundpd_epu32(W, U, A, B)   \
## ((__m256i)__builtin_ia32_cvttpd2udq512_mask(A, (__v8si)(W), U, B))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundpd_epu32(U, A, B)     \
## ((__m256i)__builtin_ia32_cvttpd2udq512_mask(A, (__v8si)_mm256_setzero_si256(), U, B))

func mm512_cvt_roundpd_epi32*(a: M512d, r: int32): M256i {.importc: "_mm512_cvt_roundpd_epi32".}

func mm512_mask_cvt_roundpd_epi32*(w: M256i, u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_mask_cvt_roundpd_epi32".}

func mm512_maskz_cvt_roundpd_epi32*(u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_maskz_cvt_roundpd_epi32".}

func mm512_cvt_roundpd_epu32*(a: M512d, r: int32): M256i {.importc: "_mm512_cvt_roundpd_epu32".}

func mm512_mask_cvt_roundpd_epu32*(w: M256i, u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_mask_cvt_roundpd_epu32".}

func mm512_maskz_cvt_roundpd_epu32*(u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_maskz_cvt_roundpd_epu32".}

## [Macro Original]
## #define _mm512_cvt_roundpd_epi32(A, B)		    \
## ((__m256i)__builtin_ia32_cvtpd2dq512_mask(A, (__v8si)_mm256_undefined_si256(), -1, B))

## [Macro Original]
## #define _mm512_mask_cvt_roundpd_epi32(W, U, A, B)   \
## ((__m256i)__builtin_ia32_cvtpd2dq512_mask(A, (__v8si)(W), U, B))

## [Macro Original]
## #define _mm512_maskz_cvt_roundpd_epi32(U, A, B)     \
## ((__m256i)__builtin_ia32_cvtpd2dq512_mask(A, (__v8si)_mm256_setzero_si256(), U, B))

## [Macro Original]
## #define _mm512_cvt_roundpd_epu32(A, B)		    \
## ((__m256i)__builtin_ia32_cvtpd2udq512_mask(A, (__v8si)_mm256_undefined_si256(), -1, B))

## [Macro Original]
## #define _mm512_mask_cvt_roundpd_epu32(W, U, A, B)   \
## ((__m256i)__builtin_ia32_cvtpd2udq512_mask(A, (__v8si)(W), U, B))

## [Macro Original]
## #define _mm512_maskz_cvt_roundpd_epu32(U, A, B)     \
## ((__m256i)__builtin_ia32_cvtpd2udq512_mask(A, (__v8si)_mm256_setzero_si256(), U, B))

func mm512_cvtt_roundps_epi32*(a: M512, r: int32): M512i {.importc: "_mm512_cvtt_roundps_epi32".}

func mm512_mask_cvtt_roundps_epi32*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_cvtt_roundps_epi32".}

func mm512_maskz_cvtt_roundps_epi32*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_cvtt_roundps_epi32".}

func mm512_cvtt_roundps_epu32*(a: M512, r: int32): M512i {.importc: "_mm512_cvtt_roundps_epu32".}

func mm512_mask_cvtt_roundps_epu32*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_cvtt_roundps_epu32".}

func mm512_maskz_cvtt_roundps_epu32*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_cvtt_roundps_epu32".}

## [Macro Original]
## #define _mm512_cvtt_roundps_epi32(A, B)		     \
## ((__m512i)__builtin_ia32_cvttps2dq512_mask(A, (__v16si)_mm512_undefined_epi32 (), -1, B))

## [Macro Original]
## #define _mm512_mask_cvtt_roundps_epi32(W, U, A, B)   \
## ((__m512i)__builtin_ia32_cvttps2dq512_mask(A, (__v16si)(W), U, B))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundps_epi32(U, A, B)     \
## ((__m512i)__builtin_ia32_cvttps2dq512_mask(A, (__v16si)_mm512_setzero_si512 (), U, B))

## [Macro Original]
## #define _mm512_cvtt_roundps_epu32(A, B)		     \
## ((__m512i)__builtin_ia32_cvttps2udq512_mask(A, (__v16si)_mm512_undefined_epi32 (), -1, B))

## [Macro Original]
## #define _mm512_mask_cvtt_roundps_epu32(W, U, A, B)   \
## ((__m512i)__builtin_ia32_cvttps2udq512_mask(A, (__v16si)(W), U, B))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundps_epu32(U, A, B)     \
## ((__m512i)__builtin_ia32_cvttps2udq512_mask(A, (__v16si)_mm512_setzero_si512 (), U, B))

func mm512_cvt_roundps_epi32*(a: M512, r: int32): M512i {.importc: "_mm512_cvt_roundps_epi32".}

func mm512_mask_cvt_roundps_epi32*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_cvt_roundps_epi32".}

func mm512_maskz_cvt_roundps_epi32*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_cvt_roundps_epi32".}

func mm512_cvt_roundps_epu32*(a: M512, r: int32): M512i {.importc: "_mm512_cvt_roundps_epu32".}

func mm512_mask_cvt_roundps_epu32*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_cvt_roundps_epu32".}

func mm512_maskz_cvt_roundps_epu32*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_cvt_roundps_epu32".}

## [Macro Original]
## #define _mm512_cvt_roundps_epi32(A, B)		    \
## ((__m512i)__builtin_ia32_cvtps2dq512_mask(A, (__v16si)_mm512_undefined_epi32 (), -1, B))

## [Macro Original]
## #define _mm512_mask_cvt_roundps_epi32(W, U, A, B)   \
## ((__m512i)__builtin_ia32_cvtps2dq512_mask(A, (__v16si)(W), U, B))

## [Macro Original]
## #define _mm512_maskz_cvt_roundps_epi32(U, A, B)     \
## ((__m512i)__builtin_ia32_cvtps2dq512_mask(A, (__v16si)_mm512_setzero_si512 (), U, B))

## [Macro Original]
## #define _mm512_cvt_roundps_epu32(A, B)		    \
## ((__m512i)__builtin_ia32_cvtps2udq512_mask(A, (__v16si)_mm512_undefined_epi32 (), -1, B))

## [Macro Original]
## #define _mm512_mask_cvt_roundps_epu32(W, U, A, B)   \
## ((__m512i)__builtin_ia32_cvtps2udq512_mask(A, (__v16si)(W), U, B))

## [Macro Original]
## #define _mm512_maskz_cvt_roundps_epu32(U, A, B)     \
## ((__m512i)__builtin_ia32_cvtps2udq512_mask(A, (__v16si)_mm512_setzero_si512 (), U, B))

func mm512_cvtepi32_epi8*(a: M512i): M128i {.importc: "_mm512_cvtepi32_epi8".}

func mm512_mask_cvtepi32_storeu_epi8*(p: pointer, m: MMask16, a: M512i): void {.importc: "_mm512_mask_cvtepi32_storeu_epi8".}

func mm512_mask_cvtepi32_epi8*(o: M128i, m: MMask16, a: M512i): M128i {.importc: "_mm512_mask_cvtepi32_epi8".}

func mm512_maskz_cvtepi32_epi8*(m: MMask16, a: M512i): M128i {.importc: "_mm512_maskz_cvtepi32_epi8".}

func mm512_cvtsepi32_epi8*(a: M512i): M128i {.importc: "_mm512_cvtsepi32_epi8".}

func mm512_mask_cvtsepi32_storeu_epi8*(p: pointer, m: MMask16, a: M512i): void {.importc: "_mm512_mask_cvtsepi32_storeu_epi8".}

func mm512_mask_cvtsepi32_epi8*(o: M128i, m: MMask16, a: M512i): M128i {.importc: "_mm512_mask_cvtsepi32_epi8".}

func mm512_maskz_cvtsepi32_epi8*(m: MMask16, a: M512i): M128i {.importc: "_mm512_maskz_cvtsepi32_epi8".}

func mm512_cvtusepi32_epi8*(a: M512i): M128i {.importc: "_mm512_cvtusepi32_epi8".}

func mm512_mask_cvtusepi32_storeu_epi8*(p: pointer, m: MMask16, a: M512i): void {.importc: "_mm512_mask_cvtusepi32_storeu_epi8".}

func mm512_mask_cvtusepi32_epi8*(o: M128i, m: MMask16, a: M512i): M128i {.importc: "_mm512_mask_cvtusepi32_epi8".}

func mm512_maskz_cvtusepi32_epi8*(m: MMask16, a: M512i): M128i {.importc: "_mm512_maskz_cvtusepi32_epi8".}

func mm512_cvtepi32_epi16*(a: M512i): M256i {.importc: "_mm512_cvtepi32_epi16".}

func mm512_mask_cvtepi32_storeu_epi16*(p: pointer, m: MMask16, a: M512i): void {.importc: "_mm512_mask_cvtepi32_storeu_epi16".}

func mm512_mask_cvtepi32_epi16*(o: M256i, m: MMask16, a: M512i): M256i {.importc: "_mm512_mask_cvtepi32_epi16".}

func mm512_maskz_cvtepi32_epi16*(m: MMask16, a: M512i): M256i {.importc: "_mm512_maskz_cvtepi32_epi16".}

func mm512_cvtsepi32_epi16*(a: M512i): M256i {.importc: "_mm512_cvtsepi32_epi16".}

func mm512_mask_cvtsepi32_storeu_epi16*(p: pointer, m: MMask16, a: M512i): void {.importc: "_mm512_mask_cvtsepi32_storeu_epi16".}

func mm512_mask_cvtsepi32_epi16*(o: M256i, m: MMask16, a: M512i): M256i {.importc: "_mm512_mask_cvtsepi32_epi16".}

func mm512_maskz_cvtsepi32_epi16*(m: MMask16, a: M512i): M256i {.importc: "_mm512_maskz_cvtsepi32_epi16".}

func mm512_cvtusepi32_epi16*(a: M512i): M256i {.importc: "_mm512_cvtusepi32_epi16".}

func mm512_mask_cvtusepi32_storeu_epi16*(p: pointer, m: MMask16, a: M512i): void {.importc: "_mm512_mask_cvtusepi32_storeu_epi16".}

func mm512_mask_cvtusepi32_epi16*(o: M256i, m: MMask16, a: M512i): M256i {.importc: "_mm512_mask_cvtusepi32_epi16".}

func mm512_maskz_cvtusepi32_epi16*(m: MMask16, a: M512i): M256i {.importc: "_mm512_maskz_cvtusepi32_epi16".}

func mm512_cvtepi64_epi32*(a: M512i): M256i {.importc: "_mm512_cvtepi64_epi32".}

func mm512_mask_cvtepi64_storeu_epi32*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtepi64_storeu_epi32".}

func mm512_mask_cvtepi64_epi32*(o: M256i, m: MMask8, a: M512i): M256i {.importc: "_mm512_mask_cvtepi64_epi32".}

func mm512_maskz_cvtepi64_epi32*(m: MMask8, a: M512i): M256i {.importc: "_mm512_maskz_cvtepi64_epi32".}

func mm512_cvtsepi64_epi32*(a: M512i): M256i {.importc: "_mm512_cvtsepi64_epi32".}

func mm512_mask_cvtsepi64_storeu_epi32*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtsepi64_storeu_epi32".}

func mm512_mask_cvtsepi64_epi32*(o: M256i, m: MMask8, a: M512i): M256i {.importc: "_mm512_mask_cvtsepi64_epi32".}

func mm512_maskz_cvtsepi64_epi32*(m: MMask8, a: M512i): M256i {.importc: "_mm512_maskz_cvtsepi64_epi32".}

func mm512_cvtusepi64_epi32*(a: M512i): M256i {.importc: "_mm512_cvtusepi64_epi32".}

func mm512_mask_cvtusepi64_storeu_epi32*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtusepi64_storeu_epi32".}

func mm512_mask_cvtusepi64_epi32*(o: M256i, m: MMask8, a: M512i): M256i {.importc: "_mm512_mask_cvtusepi64_epi32".}

func mm512_maskz_cvtusepi64_epi32*(m: MMask8, a: M512i): M256i {.importc: "_mm512_maskz_cvtusepi64_epi32".}

func mm512_cvtepi64_epi16*(a: M512i): M128i {.importc: "_mm512_cvtepi64_epi16".}

func mm512_mask_cvtepi64_storeu_epi16*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtepi64_storeu_epi16".}

func mm512_mask_cvtepi64_epi16*(o: M128i, m: MMask8, a: M512i): M128i {.importc: "_mm512_mask_cvtepi64_epi16".}

func mm512_maskz_cvtepi64_epi16*(m: MMask8, a: M512i): M128i {.importc: "_mm512_maskz_cvtepi64_epi16".}

func mm512_cvtsepi64_epi16*(a: M512i): M128i {.importc: "_mm512_cvtsepi64_epi16".}

func mm512_mask_cvtsepi64_storeu_epi16*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtsepi64_storeu_epi16".}

func mm512_mask_cvtsepi64_epi16*(o: M128i, m: MMask8, a: M512i): M128i {.importc: "_mm512_mask_cvtsepi64_epi16".}

func mm512_maskz_cvtsepi64_epi16*(m: MMask8, a: M512i): M128i {.importc: "_mm512_maskz_cvtsepi64_epi16".}

func mm512_cvtusepi64_epi16*(a: M512i): M128i {.importc: "_mm512_cvtusepi64_epi16".}

func mm512_mask_cvtusepi64_storeu_epi16*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtusepi64_storeu_epi16".}

func mm512_mask_cvtusepi64_epi16*(o: M128i, m: MMask8, a: M512i): M128i {.importc: "_mm512_mask_cvtusepi64_epi16".}

func mm512_maskz_cvtusepi64_epi16*(m: MMask8, a: M512i): M128i {.importc: "_mm512_maskz_cvtusepi64_epi16".}

func mm512_cvtepi64_epi8*(a: M512i): M128i {.importc: "_mm512_cvtepi64_epi8".}

func mm512_mask_cvtepi64_storeu_epi8*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtepi64_storeu_epi8".}

func mm512_mask_cvtepi64_epi8*(o: M128i, m: MMask8, a: M512i): M128i {.importc: "_mm512_mask_cvtepi64_epi8".}

func mm512_maskz_cvtepi64_epi8*(m: MMask8, a: M512i): M128i {.importc: "_mm512_maskz_cvtepi64_epi8".}

func mm512_cvtsepi64_epi8*(a: M512i): M128i {.importc: "_mm512_cvtsepi64_epi8".}

func mm512_mask_cvtsepi64_storeu_epi8*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtsepi64_storeu_epi8".}

func mm512_mask_cvtsepi64_epi8*(o: M128i, m: MMask8, a: M512i): M128i {.importc: "_mm512_mask_cvtsepi64_epi8".}

func mm512_maskz_cvtsepi64_epi8*(m: MMask8, a: M512i): M128i {.importc: "_mm512_maskz_cvtsepi64_epi8".}

func mm512_cvtusepi64_epi8*(a: M512i): M128i {.importc: "_mm512_cvtusepi64_epi8".}

func mm512_mask_cvtusepi64_storeu_epi8*(p: pointer, m: MMask8, a: M512i): void {.importc: "_mm512_mask_cvtusepi64_storeu_epi8".}

func mm512_mask_cvtusepi64_epi8*(o: M128i, m: MMask8, a: M512i): M128i {.importc: "_mm512_mask_cvtusepi64_epi8".}

func mm512_maskz_cvtusepi64_epi8*(m: MMask8, a: M512i): M128i {.importc: "_mm512_maskz_cvtusepi64_epi8".}

func mm512_cvtepi32_pd*(a: M256i): M512d {.importc: "_mm512_cvtepi32_pd".}

func mm512_mask_cvtepi32_pd*(w: M512d, u: MMask8, a: M256i): M512d {.importc: "_mm512_mask_cvtepi32_pd".}

func mm512_maskz_cvtepi32_pd*(u: MMask8, a: M256i): M512d {.importc: "_mm512_maskz_cvtepi32_pd".}

func mm512_cvtepu32_pd*(a: M256i): M512d {.importc: "_mm512_cvtepu32_pd".}

func mm512_mask_cvtepu32_pd*(w: M512d, u: MMask8, a: M256i): M512d {.importc: "_mm512_mask_cvtepu32_pd".}

func mm512_maskz_cvtepu32_pd*(u: MMask8, a: M256i): M512d {.importc: "_mm512_maskz_cvtepu32_pd".}

func mm512_cvt_roundepi32_ps*(a: M512i, r: int32): M512 {.importc: "_mm512_cvt_roundepi32_ps".}

func mm512_mask_cvt_roundepi32_ps*(w: M512, u: MMask16, a: M512i, r: int32): M512 {.importc: "_mm512_mask_cvt_roundepi32_ps".}

func mm512_maskz_cvt_roundepi32_ps*(u: MMask16, a: M512i, r: int32): M512 {.importc: "_mm512_maskz_cvt_roundepi32_ps".}

func mm512_cvt_roundepu32_ps*(a: M512i, r: int32): M512 {.importc: "_mm512_cvt_roundepu32_ps".}

func mm512_mask_cvt_roundepu32_ps*(w: M512, u: MMask16, a: M512i, r: int32): M512 {.importc: "_mm512_mask_cvt_roundepu32_ps".}

func mm512_maskz_cvt_roundepu32_ps*(u: MMask16, a: M512i, r: int32): M512 {.importc: "_mm512_maskz_cvt_roundepu32_ps".}

## [Macro Original]
## #define _mm512_cvt_roundepi32_ps(A, B)        \
## (__m512)__builtin_ia32_cvtdq2ps512_mask((__v16si)(A), (__v16sf)_mm512_undefined_ps(), -1, B)

## [Macro Original]
## #define _mm512_mask_cvt_roundepi32_ps(W, U, A, B)   \
## (__m512)__builtin_ia32_cvtdq2ps512_mask((__v16si)(A), W, U, B)

## [Macro Original]
## #define _mm512_maskz_cvt_roundepi32_ps(U, A, B)      \
## (__m512)__builtin_ia32_cvtdq2ps512_mask((__v16si)(A), (__v16sf)_mm512_setzero_ps(), U, B)

## [Macro Original]
## #define _mm512_cvt_roundepu32_ps(A, B)        \
## (__m512)__builtin_ia32_cvtudq2ps512_mask((__v16si)(A), (__v16sf)_mm512_undefined_ps(), -1, B)

## [Macro Original]
## #define _mm512_mask_cvt_roundepu32_ps(W, U, A, B)   \
## (__m512)__builtin_ia32_cvtudq2ps512_mask((__v16si)(A), W, U, B)

## [Macro Original]
## #define _mm512_maskz_cvt_roundepu32_ps(U, A, B)      \
## (__m512)__builtin_ia32_cvtudq2ps512_mask((__v16si)(A), (__v16sf)_mm512_setzero_ps(), U, B)

func mm512_extractf64x4_pd*(a: M512d, imm: int32): M256d {.importc: "_mm512_extractf64x4_pd".}

func mm512_mask_extractf64x4_pd*(w: M256d, u: MMask8, a: M512d, imm: int32): M256d {.importc: "_mm512_mask_extractf64x4_pd".}

func mm512_maskz_extractf64x4_pd*(u: MMask8, a: M512d, imm: int32): M256d {.importc: "_mm512_maskz_extractf64x4_pd".}

func mm512_extractf32x4_ps*(a: M512, imm: int32): M128 {.importc: "_mm512_extractf32x4_ps".}

func mm512_mask_extractf32x4_ps*(w: M128, u: MMask8, a: M512, imm: int32): M128 {.importc: "_mm512_mask_extractf32x4_ps".}

func mm512_maskz_extractf32x4_ps*(u: MMask8, a: M512, imm: int32): M128 {.importc: "_mm512_maskz_extractf32x4_ps".}

func mm512_extracti64x4_epi64*(a: M512i, imm: int32): M256i {.importc: "_mm512_extracti64x4_epi64".}

func mm512_mask_extracti64x4_epi64*(w: M256i, u: MMask8, a: M512i, imm: int32): M256i {.importc: "_mm512_mask_extracti64x4_epi64".}

func mm512_maskz_extracti64x4_epi64*(u: MMask8, a: M512i, imm: int32): M256i {.importc: "_mm512_maskz_extracti64x4_epi64".}

func mm512_extracti32x4_epi32*(a: M512i, imm: int32): M128i {.importc: "_mm512_extracti32x4_epi32".}

func mm512_mask_extracti32x4_epi32*(w: M128i, u: MMask8, a: M512i, imm: int32): M128i {.importc: "_mm512_mask_extracti32x4_epi32".}

func mm512_maskz_extracti32x4_epi32*(u: MMask8, a: M512i, imm: int32): M128i {.importc: "_mm512_maskz_extracti32x4_epi32".}

## [Macro Original]
## #define _mm512_extractf64x4_pd(X, C)                                    \
## ((__m256d) __builtin_ia32_extractf64x4_mask ((__v8df)(__m512d) (X),   \
## (int) (C),\
## (__v4df)(__m256d)_mm256_undefined_pd(),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_extractf64x4_pd(W, U, X, C)                         \
## ((__m256d) __builtin_ia32_extractf64x4_mask ((__v8df)(__m512d) (X),   \
## (int) (C),\
## (__v4df)(__m256d)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_extractf64x4_pd(U, X, C)                           \
## ((__m256d) __builtin_ia32_extractf64x4_mask ((__v8df)(__m512d) (X),   \
## (int) (C),\
## (__v4df)(__m256d)_mm256_setzero_pd(),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_extractf32x4_ps(X, C)                                    \
## ((__m128) __builtin_ia32_extractf32x4_mask ((__v16sf)(__m512) (X),    \
## (int) (C),\
## (__v4sf)(__m128)_mm_undefined_ps(),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_extractf32x4_ps(W, U, X, C)                         \
## ((__m128) __builtin_ia32_extractf32x4_mask ((__v16sf)(__m512) (X),    \
## (int) (C),\
## (__v4sf)(__m128)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_extractf32x4_ps(U, X, C)                           \
## ((__m128) __builtin_ia32_extractf32x4_mask ((__v16sf)(__m512) (X),    \
## (int) (C),\
## (__v4sf)(__m128)_mm_setzero_ps(),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_extracti64x4_epi64(X, C)                                 \
## ((__m256i) __builtin_ia32_extracti64x4_mask ((__v8di)(__m512i) (X),   \
## (int) (C),\
## (__v4di)(__m256i)_mm256_undefined_si256 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_extracti64x4_epi64(W, U, X, C)                      \
## ((__m256i) __builtin_ia32_extracti64x4_mask ((__v8di)(__m512i) (X),   \
## (int) (C),\
## (__v4di)(__m256i)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_extracti64x4_epi64(U, X, C)                        \
## ((__m256i) __builtin_ia32_extracti64x4_mask ((__v8di)(__m512i) (X),   \
## (int) (C),\
## (__v4di)(__m256i)_mm256_setzero_si256 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_extracti32x4_epi32(X, C)                                 \
## ((__m128i) __builtin_ia32_extracti32x4_mask ((__v16si)(__m512i) (X),  \
## (int) (C),\
## (__v4si)(__m128i)_mm_undefined_si128 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_extracti32x4_epi32(W, U, X, C)                      \
## ((__m128i) __builtin_ia32_extracti32x4_mask ((__v16si)(__m512i) (X),  \
## (int) (C),\
## (__v4si)(__m128i)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_extracti32x4_epi32(U, X, C)                        \
## ((__m128i) __builtin_ia32_extracti32x4_mask ((__v16si)(__m512i) (X),  \
## (int) (C),\
## (__v4si)(__m128i)_mm_setzero_si128 (),\
## (__mmask8)(U)))

func mm512_inserti32x4*(a: M512i, b: M128i, imm: int32): M512i {.importc: "_mm512_inserti32x4".}

func mm512_insertf32x4*(a: M512, b: M128, imm: int32): M512 {.importc: "_mm512_insertf32x4".}

func mm512_inserti64x4*(a: M512i, b: M256i, imm: int32): M512i {.importc: "_mm512_inserti64x4".}

func mm512_mask_inserti64x4*(w: M512i, u: MMask8, a: M512i, b: M256i, imm: int32): M512i {.importc: "_mm512_mask_inserti64x4".}

func mm512_maskz_inserti64x4*(u: MMask8, a: M512i, b: M256i, imm: int32): M512i {.importc: "_mm512_maskz_inserti64x4".}

func mm512_insertf64x4*(a: M512d, b: M256d, imm: int32): M512d {.importc: "_mm512_insertf64x4".}

func mm512_mask_insertf64x4*(w: M512d, u: MMask8, a: M512d, b: M256d, imm: int32): M512d {.importc: "_mm512_mask_insertf64x4".}

func mm512_maskz_insertf64x4*(u: MMask8, a: M512d, b: M256d, imm: int32): M512d {.importc: "_mm512_maskz_insertf64x4".}

## [Macro Original]
## #define _mm512_insertf32x4(X, Y, C)                                     \
## ((__m512) __builtin_ia32_insertf32x4_mask ((__v16sf)(__m512) (X),     \
## (__v4sf)(__m128) (Y), (int) (C), (__v16sf)(__m512) (X), (__mmask16)(-1)))

## [Macro Original]
## #define _mm512_inserti32x4(X, Y, C)                                     \
## ((__m512i) __builtin_ia32_inserti32x4_mask ((__v16si)(__m512i) (X),   \
## (__v4si)(__m128i) (Y), (int) (C), (__v16si)(__m512i) (X), (__mmask16)(-1)))

## [Macro Original]
## #define _mm512_insertf64x4(X, Y, C)                                     \
## ((__m512d) __builtin_ia32_insertf64x4_mask ((__v8df)(__m512d) (X),    \
## (__v4df)(__m256d) (Y), (int) (C),					\
## (__v8df)(__m512d)_mm512_undefined_pd(),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_insertf64x4(W, U, X, Y, C)                          \
## ((__m512d) __builtin_ia32_insertf64x4_mask ((__v8df)(__m512d) (X),    \
## (__v4df)(__m256d) (Y), (int) (C),					\
## (__v8df)(__m512d)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_insertf64x4(U, X, Y, C)                            \
## ((__m512d) __builtin_ia32_insertf64x4_mask ((__v8df)(__m512d) (X),    \
## (__v4df)(__m256d) (Y), (int) (C),					\
## (__v8df)(__m512d)_mm512_setzero_pd(),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_inserti64x4(X, Y, C)                                     \
## ((__m512i) __builtin_ia32_inserti64x4_mask ((__v8di)(__m512i) (X),    \
## (__v4di)(__m256i) (Y), (int) (C),					\
## (__v8di)(__m512i)_mm512_undefined_epi32 (),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_inserti64x4(W, U, X, Y, C)                          \
## ((__m512i) __builtin_ia32_inserti64x4_mask ((__v8di)(__m512i) (X),    \
## (__v4di)(__m256i) (Y), (int) (C),\
## (__v8di)(__m512i)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_inserti64x4(U, X, Y, C)                            \
## ((__m512i) __builtin_ia32_inserti64x4_mask ((__v8di)(__m512i) (X),    \
## (__v4di)(__m256i) (Y), (int) (C),					\
## (__v8di)(__m512i)_mm512_setzero_si512 (),				\
## (__mmask8)(U)))

func mm512_loadu_pd*(p: pointer): M512d {.importc: "_mm512_loadu_pd".}

func mm512_mask_loadu_pd*(w: M512d, u: MMask8, p: pointer): M512d {.importc: "_mm512_mask_loadu_pd".}

func mm512_maskz_loadu_pd*(u: MMask8, p: pointer): M512d {.importc: "_mm512_maskz_loadu_pd".}

func mm512_storeu_pd*(p: pointer, a: M512d): void {.importc: "_mm512_storeu_pd".}

func mm512_mask_storeu_pd*(p: pointer, u: MMask8, a: M512d): void {.importc: "_mm512_mask_storeu_pd".}

func mm512_loadu_ps*(p: pointer): M512 {.importc: "_mm512_loadu_ps".}

func mm512_mask_loadu_ps*(w: M512, u: MMask16, p: pointer): M512 {.importc: "_mm512_mask_loadu_ps".}

func mm512_maskz_loadu_ps*(u: MMask16, p: pointer): M512 {.importc: "_mm512_maskz_loadu_ps".}

func mm512_storeu_ps*(p: pointer, a: M512): void {.importc: "_mm512_storeu_ps".}

func mm512_mask_storeu_ps*(p: pointer, u: MMask16, a: M512): void {.importc: "_mm512_mask_storeu_ps".}

func mm512_loadu_epi64*(p: pointer): M512i {.importc: "_mm512_loadu_epi64".}

func mm512_mask_loadu_epi64*(w: M512i, u: MMask8, p: pointer): M512i {.importc: "_mm512_mask_loadu_epi64".}

func mm512_maskz_loadu_epi64*(u: MMask8, p: pointer): M512i {.importc: "_mm512_maskz_loadu_epi64".}

func mm512_storeu_epi64*(p: pointer, a: M512i): void {.importc: "_mm512_storeu_epi64".}

func mm512_mask_storeu_epi64*(p: pointer, u: MMask8, a: M512i): void {.importc: "_mm512_mask_storeu_epi64".}

func mm512_loadu_si512*(p: pointer): M512i {.importc: "_mm512_loadu_si512".}

func mm512_loadu_epi32*(p: pointer): M512i {.importc: "_mm512_loadu_epi32".}

func mm512_mask_loadu_epi32*(w: M512i, u: MMask16, p: pointer): M512i {.importc: "_mm512_mask_loadu_epi32".}

func mm512_maskz_loadu_epi32*(u: MMask16, p: pointer): M512i {.importc: "_mm512_maskz_loadu_epi32".}

func mm512_storeu_si512*(p: pointer, a: M512i): void {.importc: "_mm512_storeu_si512".}

func mm512_storeu_epi32*(p: pointer, a: M512i): void {.importc: "_mm512_storeu_epi32".}

func mm512_mask_storeu_epi32*(p: pointer, u: MMask16, a: M512i): void {.importc: "_mm512_mask_storeu_epi32".}

func mm512_permutevar_pd*(a: M512d, c: M512i): M512d {.importc: "_mm512_permutevar_pd".}

func mm512_mask_permutevar_pd*(w: M512d, u: MMask8, a: M512d, c: M512i): M512d {.importc: "_mm512_mask_permutevar_pd".}

func mm512_maskz_permutevar_pd*(u: MMask8, a: M512d, c: M512i): M512d {.importc: "_mm512_maskz_permutevar_pd".}

func mm512_permutevar_ps*(a: M512, c: M512i): M512 {.importc: "_mm512_permutevar_ps".}

func mm512_mask_permutevar_ps*(w: M512, u: MMask16, a: M512, c: M512i): M512 {.importc: "_mm512_mask_permutevar_ps".}

func mm512_maskz_permutevar_ps*(u: MMask16, a: M512, c: M512i): M512 {.importc: "_mm512_maskz_permutevar_ps".}

func mm512_permutex2var_epi64*(a: M512i, i: M512i, b: M512i): M512i {.importc: "_mm512_permutex2var_epi64".}

func mm512_mask_permutex2var_epi64*(a: M512i, u: MMask8, i: M512i, b: M512i): M512i {.importc: "_mm512_mask_permutex2var_epi64".}

func mm512_mask2_permutex2var_epi64*(a: M512i, i: M512i, u: MMask8, b: M512i): M512i {.importc: "_mm512_mask2_permutex2var_epi64".}

func mm512_maskz_permutex2var_epi64*(u: MMask8, a: M512i, i: M512i, b: M512i): M512i {.importc: "_mm512_maskz_permutex2var_epi64".}

func mm512_permutex2var_epi32*(a: M512i, i: M512i, b: M512i): M512i {.importc: "_mm512_permutex2var_epi32".}

func mm512_mask_permutex2var_epi32*(a: M512i, u: MMask16, i: M512i, b: M512i): M512i {.importc: "_mm512_mask_permutex2var_epi32".}

func mm512_mask2_permutex2var_epi32*(a: M512i, i: M512i, u: MMask16, b: M512i): M512i {.importc: "_mm512_mask2_permutex2var_epi32".}

func mm512_maskz_permutex2var_epi32*(u: MMask16, a: M512i, i: M512i, b: M512i): M512i {.importc: "_mm512_maskz_permutex2var_epi32".}

func mm512_permutex2var_pd*(a: M512d, i: M512i, b: M512d): M512d {.importc: "_mm512_permutex2var_pd".}

func mm512_mask_permutex2var_pd*(a: M512d, u: MMask8, i: M512i, b: M512d): M512d {.importc: "_mm512_mask_permutex2var_pd".}

func mm512_mask2_permutex2var_pd*(a: M512d, i: M512i, u: MMask8, b: M512d): M512d {.importc: "_mm512_mask2_permutex2var_pd".}

func mm512_maskz_permutex2var_pd*(u: MMask8, a: M512d, i: M512i, b: M512d): M512d {.importc: "_mm512_maskz_permutex2var_pd".}

func mm512_permutex2var_ps*(a: M512, i: M512i, b: M512): M512 {.importc: "_mm512_permutex2var_ps".}

func mm512_mask_permutex2var_ps*(a: M512, u: MMask16, i: M512i, b: M512): M512 {.importc: "_mm512_mask_permutex2var_ps".}

func mm512_mask2_permutex2var_ps*(a: M512, i: M512i, u: MMask16, b: M512): M512 {.importc: "_mm512_mask2_permutex2var_ps".}

func mm512_maskz_permutex2var_ps*(u: MMask16, a: M512, i: M512i, b: M512): M512 {.importc: "_mm512_maskz_permutex2var_ps".}

func mm512_permute_pd*(x: M512d, c: int32): M512d {.importc: "_mm512_permute_pd".}

func mm512_mask_permute_pd*(w: M512d, u: MMask8, x: M512d, c: int32): M512d {.importc: "_mm512_mask_permute_pd".}

func mm512_maskz_permute_pd*(u: MMask8, x: M512d, c: int32): M512d {.importc: "_mm512_maskz_permute_pd".}

func mm512_permute_ps*(x: M512, c: int32): M512 {.importc: "_mm512_permute_ps".}

func mm512_mask_permute_ps*(w: M512, u: MMask16, x: M512, c: int32): M512 {.importc: "_mm512_mask_permute_ps".}

func mm512_maskz_permute_ps*(u: MMask16, x: M512, c: int32): M512 {.importc: "_mm512_maskz_permute_ps".}

## [Macro Original]
## #define _mm512_permute_pd(X, C)							    \
## ((__m512d) __builtin_ia32_vpermilpd512_mask ((__v8df)(__m512d)(X), (int)(C),	    \
## (__v8df)(__m512d)_mm512_undefined_pd(),\
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm512_mask_permute_pd(W, U, X, C)					    \
## ((__m512d) __builtin_ia32_vpermilpd512_mask ((__v8df)(__m512d)(X), (int)(C),	    \
## (__v8df)(__m512d)(W),		    \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_permute_pd(U, X, C)					    \
## ((__m512d) __builtin_ia32_vpermilpd512_mask ((__v8df)(__m512d)(X), (int)(C),	    \
## (__v8df)(__m512d)_mm512_setzero_pd(), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_permute_ps(X, C)							    \
## ((__m512) __builtin_ia32_vpermilps512_mask ((__v16sf)(__m512)(X), (int)(C),	    \
## (__v16sf)(__m512)_mm512_undefined_ps(),\
## (__mmask16)(-1)))

## [Macro Original]
## #define _mm512_mask_permute_ps(W, U, X, C)					    \
## ((__m512) __builtin_ia32_vpermilps512_mask ((__v16sf)(__m512)(X), (int)(C),	    \
## (__v16sf)(__m512)(W),		    \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_permute_ps(U, X, C)					    \
## ((__m512) __builtin_ia32_vpermilps512_mask ((__v16sf)(__m512)(X), (int)(C),	    \
## (__v16sf)(__m512)_mm512_setzero_ps(), \
## (__mmask16)(U)))

func mm512_permutex_epi64*(x: M512i, i: int32): M512i {.importc: "_mm512_permutex_epi64".}

func mm512_mask_permutex_epi64*(w: M512i, m: MMask8, x: M512i, i: int32): M512i {.importc: "_mm512_mask_permutex_epi64".}

func mm512_maskz_permutex_epi64*(m: MMask8, x: M512i, i: int32): M512i {.importc: "_mm512_maskz_permutex_epi64".}

func mm512_permutex_pd*(x: M512d, m: int32): M512d {.importc: "_mm512_permutex_pd".}

func mm512_mask_permutex_pd*(w: M512d, u: MMask8, x: M512d, m: int32): M512d {.importc: "_mm512_mask_permutex_pd".}

func mm512_maskz_permutex_pd*(u: MMask8, x: M512d, m: int32): M512d {.importc: "_mm512_maskz_permutex_pd".}

## [Macro Original]
## #define _mm512_permutex_pd(X, M)						\
## ((__m512d) __builtin_ia32_permdf512_mask ((__v8df)(__m512d)(X), (int)(M),	\
## (__v8df)(__m512d)_mm512_undefined_pd(),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_permutex_pd(W, U, X, M)					\
## ((__m512d) __builtin_ia32_permdf512_mask ((__v8df)(__m512d)(X), (int)(M),	\
## (__v8df)(__m512d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_permutex_pd(U, X, M)					\
## ((__m512d) __builtin_ia32_permdf512_mask ((__v8df)(__m512d)(X), (int)(M),	\
## (__v8df)(__m512d)_mm512_setzero_pd(),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_permutex_epi64(X, I)			          \
## ((__m512i) __builtin_ia32_permdi512_mask ((__v8di)(__m512i)(X), \
## (int)(I),             \
## (__v8di)(__m512i)	  \
## (_mm512_undefined_epi32 ()),\
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm512_maskz_permutex_epi64(M, X, I)                 \
## ((__m512i) __builtin_ia32_permdi512_mask ((__v8di)(__m512i)(X), \
## (int)(I),             \
## (__v8di)(__m512i)     \
## (_mm512_setzero_si512 ()),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm512_mask_permutex_epi64(W, M, X, I)               \
## ((__m512i) __builtin_ia32_permdi512_mask ((__v8di)(__m512i)(X), \
## (int)(I),             \
## (__v8di)(__m512i)(W), \
## (__mmask8)(M)))

func mm512_maskz_permutexvar_epi64*(m: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_permutexvar_epi64".}

func mm512_permutexvar_epi64*(x: M512i, y: M512i): M512i {.importc: "_mm512_permutexvar_epi64".}

func mm512_mask_permutexvar_epi64*(w: M512i, m: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_permutexvar_epi64".}

func mm512_maskz_permutexvar_epi32*(m: MMask16, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_permutexvar_epi32".}

func mm512_permutexvar_epi32*(x: M512i, y: M512i): M512i {.importc: "_mm512_permutexvar_epi32".}

func mm512_mask_permutexvar_epi32*(w: M512i, m: MMask16, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_permutexvar_epi32".}

func mm512_permutexvar_pd*(x: M512i, y: M512d): M512d {.importc: "_mm512_permutexvar_pd".}

func mm512_mask_permutexvar_pd*(w: M512d, u: MMask8, x: M512i, y: M512d): M512d {.importc: "_mm512_mask_permutexvar_pd".}

func mm512_maskz_permutexvar_pd*(u: MMask8, x: M512i, y: M512d): M512d {.importc: "_mm512_maskz_permutexvar_pd".}

func mm512_permutexvar_ps*(x: M512i, y: M512): M512 {.importc: "_mm512_permutexvar_ps".}

func mm512_mask_permutexvar_ps*(w: M512, u: MMask16, x: M512i, y: M512): M512 {.importc: "_mm512_mask_permutexvar_ps".}

func mm512_maskz_permutexvar_ps*(u: MMask16, x: M512i, y: M512): M512 {.importc: "_mm512_maskz_permutexvar_ps".}

func mm512_shuffle_ps*(m: M512, v: M512, imm: int32): M512 {.importc: "_mm512_shuffle_ps".}

func mm512_mask_shuffle_ps*(w: M512, u: MMask16, m: M512, v: M512, imm: int32): M512 {.importc: "_mm512_mask_shuffle_ps".}

func mm512_maskz_shuffle_ps*(u: MMask16, m: M512, v: M512, imm: int32): M512 {.importc: "_mm512_maskz_shuffle_ps".}

func mm512_shuffle_pd*(m: M512d, v: M512d, imm: int32): M512d {.importc: "_mm512_shuffle_pd".}

func mm512_mask_shuffle_pd*(w: M512d, u: MMask8, m: M512d, v: M512d, imm: int32): M512d {.importc: "_mm512_mask_shuffle_pd".}

func mm512_maskz_shuffle_pd*(u: MMask8, m: M512d, v: M512d, imm: int32): M512d {.importc: "_mm512_maskz_shuffle_pd".}

func mm512_fixupimm_round_pd*(a: M512d, b: M512d, c: M512i, imm: int32, r: int32): M512d {.importc: "_mm512_fixupimm_round_pd".}

func mm512_mask_fixupimm_round_pd*(a: M512d, u: MMask8, b: M512d, c: M512i, imm: int32, r: int32): M512d {.importc: "_mm512_mask_fixupimm_round_pd".}

func mm512_maskz_fixupimm_round_pd*(u: MMask8, a: M512d, b: M512d, c: M512i, imm: int32, r: int32): M512d {.importc: "_mm512_maskz_fixupimm_round_pd".}

func mm512_fixupimm_round_ps*(a: M512, b: M512, c: M512i, imm: int32, r: int32): M512 {.importc: "_mm512_fixupimm_round_ps".}

func mm512_mask_fixupimm_round_ps*(a: M512, u: MMask16, b: M512, c: M512i, imm: int32, r: int32): M512 {.importc: "_mm512_mask_fixupimm_round_ps".}

func mm512_maskz_fixupimm_round_ps*(u: MMask16, a: M512, b: M512, c: M512i, imm: int32, r: int32): M512 {.importc: "_mm512_maskz_fixupimm_round_ps".}

## [Macro Original]
## #define _mm512_shuffle_pd(X, Y, C)                                      \
## ((__m512d)__builtin_ia32_shufpd512_mask ((__v8df)(__m512d)(X),           \
## (__v8df)(__m512d)(Y), (int)(C),\
## (__v8df)(__m512d)_mm512_undefined_pd(),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_shuffle_pd(W, U, X, Y, C)                           \
## ((__m512d)__builtin_ia32_shufpd512_mask ((__v8df)(__m512d)(X),           \
## (__v8df)(__m512d)(Y), (int)(C),\
## (__v8df)(__m512d)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_shuffle_pd(U, X, Y, C)                             \
## ((__m512d)__builtin_ia32_shufpd512_mask ((__v8df)(__m512d)(X),           \
## (__v8df)(__m512d)(Y), (int)(C),\
## (__v8df)(__m512d)_mm512_setzero_pd(),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_shuffle_ps(X, Y, C)                                      \
## ((__m512)__builtin_ia32_shufps512_mask ((__v16sf)(__m512)(X),            \
## (__v16sf)(__m512)(Y), (int)(C),\
## (__v16sf)(__m512)_mm512_undefined_ps(),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_shuffle_ps(W, U, X, Y, C)                           \
## ((__m512)__builtin_ia32_shufps512_mask ((__v16sf)(__m512)(X),            \
## (__v16sf)(__m512)(Y), (int)(C),\
## (__v16sf)(__m512)(W),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_shuffle_ps(U, X, Y, C)                             \
## ((__m512)__builtin_ia32_shufps512_mask ((__v16sf)(__m512)(X),            \
## (__v16sf)(__m512)(Y), (int)(C),\
## (__v16sf)(__m512)_mm512_setzero_ps(),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_fixupimm_round_pd(X, Y, Z, C, R)					\
## ((__m512d)__builtin_ia32_fixupimmpd512_mask ((__v8df)(__m512d)(X),	\
## (__v8df)(__m512d)(Y), (__v8di)(__m512i)(Z), (int)(C),		\
## (__mmask8)(-1), (R)))

## [Macro Original]
## #define _mm512_mask_fixupimm_round_pd(X, U, Y, Z, C, R)                          \
## ((__m512d)__builtin_ia32_fixupimmpd512_mask ((__v8df)(__m512d)(X),    \
## (__v8df)(__m512d)(Y), (__v8di)(__m512i)(Z), (int)(C),             \
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm512_maskz_fixupimm_round_pd(U, X, Y, Z, C, R)                         \
## ((__m512d)__builtin_ia32_fixupimmpd512_maskz ((__v8df)(__m512d)(X),   \
## (__v8df)(__m512d)(Y), (__v8di)(__m512i)(Z), (int)(C),             \
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm512_fixupimm_round_ps(X, Y, Z, C, R)					\
## ((__m512)__builtin_ia32_fixupimmps512_mask ((__v16sf)(__m512)(X),	\
## (__v16sf)(__m512)(Y), (__v16si)(__m512i)(Z), (int)(C),		\
## (__mmask16)(-1), (R)))

## [Macro Original]
## #define _mm512_mask_fixupimm_round_ps(X, U, Y, Z, C, R)                          \
## ((__m512)__builtin_ia32_fixupimmps512_mask ((__v16sf)(__m512)(X),     \
## (__v16sf)(__m512)(Y), (__v16si)(__m512i)(Z), (int)(C),              \
## (__mmask16)(U), (R)))

## [Macro Original]
## #define _mm512_maskz_fixupimm_round_ps(U, X, Y, Z, C, R)                         \
## ((__m512)__builtin_ia32_fixupimmps512_maskz ((__v16sf)(__m512)(X),    \
## (__v16sf)(__m512)(Y), (__v16si)(__m512i)(Z), (int)(C),              \
## (__mmask16)(U), (R)))

func mm512_movehdup_ps*(a: M512): M512 {.importc: "_mm512_movehdup_ps".}

func mm512_mask_movehdup_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_movehdup_ps".}

func mm512_maskz_movehdup_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_movehdup_ps".}

func mm512_moveldup_ps*(a: M512): M512 {.importc: "_mm512_moveldup_ps".}

func mm512_mask_moveldup_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_moveldup_ps".}

func mm512_maskz_moveldup_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_moveldup_ps".}

func mm512_or_si512*(a: M512i, b: M512i): M512i {.importc: "_mm512_or_si512".}

func mm512_or_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_or_epi32".}

func mm512_mask_or_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_or_epi32".}

func mm512_maskz_or_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_or_epi32".}

func mm512_or_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_or_epi64".}

func mm512_mask_or_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_or_epi64".}

func mm512_maskz_or_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_or_epi64".}

func mm512_xor_si512*(a: M512i, b: M512i): M512i {.importc: "_mm512_xor_si512".}

func mm512_xor_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_xor_epi32".}

func mm512_mask_xor_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_xor_epi32".}

func mm512_maskz_xor_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_xor_epi32".}

func mm512_xor_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_xor_epi64".}

func mm512_mask_xor_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_xor_epi64".}

func mm512_maskz_xor_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_xor_epi64".}

func mm512_rol_epi32*(a: M512i, b: int32): M512i {.importc: "_mm512_rol_epi32".}

func mm512_mask_rol_epi32*(w: M512i, u: MMask16, a: M512i, b: int32): M512i {.importc: "_mm512_mask_rol_epi32".}

func mm512_maskz_rol_epi32*(u: MMask16, a: M512i, b: int32): M512i {.importc: "_mm512_maskz_rol_epi32".}

func mm512_ror_epi32*(a: M512i, b: int32): M512i {.importc: "_mm512_ror_epi32".}

func mm512_mask_ror_epi32*(w: M512i, u: MMask16, a: M512i, b: int32): M512i {.importc: "_mm512_mask_ror_epi32".}

func mm512_maskz_ror_epi32*(u: MMask16, a: M512i, b: int32): M512i {.importc: "_mm512_maskz_ror_epi32".}

func mm512_rol_epi64*(a: M512i, b: int32): M512i {.importc: "_mm512_rol_epi64".}

func mm512_mask_rol_epi64*(w: M512i, u: MMask8, a: M512i, b: int32): M512i {.importc: "_mm512_mask_rol_epi64".}

func mm512_maskz_rol_epi64*(u: MMask8, a: M512i, b: int32): M512i {.importc: "_mm512_maskz_rol_epi64".}

func mm512_ror_epi64*(a: M512i, b: int32): M512i {.importc: "_mm512_ror_epi64".}

func mm512_mask_ror_epi64*(w: M512i, u: MMask8, a: M512i, b: int32): M512i {.importc: "_mm512_mask_ror_epi64".}

func mm512_maskz_ror_epi64*(u: MMask8, a: M512i, b: int32): M512i {.importc: "_mm512_maskz_ror_epi64".}

## [Macro Original]
## #define _mm512_rol_epi32(A, B)						  \
## ((__m512i)__builtin_ia32_prold512_mask ((__v16si)(__m512i)(A),	  \
## (int)(B),			  \
## (__v16si)_mm512_undefined_epi32 (), \
## (__mmask16)(-1)))

## [Macro Original]
## #define _mm512_mask_rol_epi32(W, U, A, B)				  \
## ((__m512i)__builtin_ia32_prold512_mask ((__v16si)(__m512i)(A),	  \
## (int)(B),			  \
## (__v16si)(__m512i)(W),	  \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_rol_epi32(U, A, B)					  \
## ((__m512i)__builtin_ia32_prold512_mask ((__v16si)(__m512i)(A),	  \
## (int)(B),			  \
## (__v16si)_mm512_setzero_si512 (), \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_ror_epi32(A, B)						  \
## ((__m512i)__builtin_ia32_prord512_mask ((__v16si)(__m512i)(A),	  \
## (int)(B),			  \
## (__v16si)_mm512_undefined_epi32 (), \
## (__mmask16)(-1)))

## [Macro Original]
## #define _mm512_mask_ror_epi32(W, U, A, B)				  \
## ((__m512i)__builtin_ia32_prord512_mask ((__v16si)(__m512i)(A),	  \
## (int)(B),			  \
## (__v16si)(__m512i)(W),	  \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_ror_epi32(U, A, B)					  \
## ((__m512i)__builtin_ia32_prord512_mask ((__v16si)(__m512i)(A),	  \
## (int)(B),			  \
## (__v16si)_mm512_setzero_si512 (), \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_rol_epi64(A, B)						  \
## ((__m512i)__builtin_ia32_prolq512_mask ((__v8di)(__m512i)(A),	  \
## (int)(B),			  \
## (__v8di)_mm512_undefined_epi32 (),  \
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm512_mask_rol_epi64(W, U, A, B)				  \
## ((__m512i)__builtin_ia32_prolq512_mask ((__v8di)(__m512i)(A),	  \
## (int)(B),			  \
## (__v8di)(__m512i)(W),	  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_rol_epi64(U, A, B)					  \
## ((__m512i)__builtin_ia32_prolq512_mask ((__v8di)(__m512i)(A),	  \
## (int)(B),			  \
## (__v8di)_mm512_setzero_si512 (),  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_ror_epi64(A, B)						  \
## ((__m512i)__builtin_ia32_prorq512_mask ((__v8di)(__m512i)(A),	  \
## (int)(B),			  \
## (__v8di)_mm512_undefined_epi32 (),  \
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm512_mask_ror_epi64(W, U, A, B)				  \
## ((__m512i)__builtin_ia32_prorq512_mask ((__v8di)(__m512i)(A),	  \
## (int)(B),			  \
## (__v8di)(__m512i)(W),	  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_ror_epi64(U, A, B)					  \
## ((__m512i)__builtin_ia32_prorq512_mask ((__v8di)(__m512i)(A),	  \
## (int)(B),			  \
## (__v8di)_mm512_setzero_si512 (),  \
## (__mmask8)(U)))

func mm512_and_si512*(a: M512i, b: M512i): M512i {.importc: "_mm512_and_si512".}

func mm512_and_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_and_epi32".}

func mm512_mask_and_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_and_epi32".}

func mm512_maskz_and_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_and_epi32".}

func mm512_and_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_and_epi64".}

func mm512_mask_and_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_and_epi64".}

func mm512_maskz_and_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_and_epi64".}

func mm512_andnot_si512*(a: M512i, b: M512i): M512i {.importc: "_mm512_andnot_si512".}

func mm512_andnot_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_andnot_epi32".}

func mm512_mask_andnot_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_andnot_epi32".}

func mm512_maskz_andnot_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_andnot_epi32".}

func mm512_andnot_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_andnot_epi64".}

func mm512_mask_andnot_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_andnot_epi64".}

func mm512_maskz_andnot_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_andnot_epi64".}

func mm512_test_epi32_mask*(a: M512i, b: M512i): MMask16 {.importc: "_mm512_test_epi32_mask".}

func mm512_mask_test_epi32_mask*(u: MMask16, a: M512i, b: M512i): MMask16 {.importc: "_mm512_mask_test_epi32_mask".}

func mm512_test_epi64_mask*(a: M512i, b: M512i): MMask8 {.importc: "_mm512_test_epi64_mask".}

func mm512_mask_test_epi64_mask*(u: MMask8, a: M512i, b: M512i): MMask8 {.importc: "_mm512_mask_test_epi64_mask".}

func mm512_testn_epi32_mask*(a: M512i, b: M512i): MMask16 {.importc: "_mm512_testn_epi32_mask".}

func mm512_mask_testn_epi32_mask*(u: MMask16, a: M512i, b: M512i): MMask16 {.importc: "_mm512_mask_testn_epi32_mask".}

func mm512_testn_epi64_mask*(a: M512i, b: M512i): MMask8 {.importc: "_mm512_testn_epi64_mask".}

func mm512_mask_testn_epi64_mask*(u: MMask8, a: M512i, b: M512i): MMask8 {.importc: "_mm512_mask_testn_epi64_mask".}

func mm512_abs_ps*(a: M512): M512 {.importc: "_mm512_abs_ps".}

func mm512_mask_abs_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_abs_ps".}

func mm512_abs_pd*(a: M512d): M512d {.importc: "_mm512_abs_pd".}

func mm512_mask_abs_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_abs_pd".}

func mm512_unpackhi_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_unpackhi_epi32".}

func mm512_mask_unpackhi_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_unpackhi_epi32".}

func mm512_maskz_unpackhi_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_unpackhi_epi32".}

func mm512_unpackhi_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_unpackhi_epi64".}

func mm512_mask_unpackhi_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_unpackhi_epi64".}

func mm512_maskz_unpackhi_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_unpackhi_epi64".}

func mm512_unpacklo_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_unpacklo_epi32".}

func mm512_mask_unpacklo_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_unpacklo_epi32".}

func mm512_maskz_unpacklo_epi32*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_unpacklo_epi32".}

func mm512_unpacklo_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_unpacklo_epi64".}

func mm512_mask_unpacklo_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_unpacklo_epi64".}

func mm512_maskz_unpacklo_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_unpacklo_epi64".}

func mm512_movedup_pd*(a: M512d): M512d {.importc: "_mm512_movedup_pd".}

func mm512_mask_movedup_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_movedup_pd".}

func mm512_maskz_movedup_pd*(u: MMask8, a: M512d): M512d {.importc: "_mm512_maskz_movedup_pd".}

func mm512_unpacklo_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_unpacklo_pd".}

func mm512_mask_unpacklo_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_unpacklo_pd".}

func mm512_maskz_unpacklo_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_unpacklo_pd".}

func mm512_unpackhi_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_unpackhi_pd".}

func mm512_mask_unpackhi_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_unpackhi_pd".}

func mm512_maskz_unpackhi_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_unpackhi_pd".}

func mm512_unpackhi_ps*(a: M512, b: M512): M512 {.importc: "_mm512_unpackhi_ps".}

func mm512_mask_unpackhi_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_unpackhi_ps".}

func mm512_maskz_unpackhi_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_unpackhi_ps".}

func mm512_cvt_roundps_pd*(a: M256, r: int32): M512d {.importc: "_mm512_cvt_roundps_pd".}

func mm512_mask_cvt_roundps_pd*(w: M512d, u: MMask8, a: M256, r: int32): M512d {.importc: "_mm512_mask_cvt_roundps_pd".}

func mm512_maskz_cvt_roundps_pd*(u: MMask8, a: M256, r: int32): M512d {.importc: "_mm512_maskz_cvt_roundps_pd".}

func mm512_cvt_roundph_ps*(a: M256i, r: int32): M512 {.importc: "_mm512_cvt_roundph_ps".}

func mm512_mask_cvt_roundph_ps*(w: M512, u: MMask16, a: M256i, r: int32): M512 {.importc: "_mm512_mask_cvt_roundph_ps".}

func mm512_maskz_cvt_roundph_ps*(u: MMask16, a: M256i, r: int32): M512 {.importc: "_mm512_maskz_cvt_roundph_ps".}

func mm512_cvt_roundps_ph*(a: M512, i: int32): M256i {.importc: "_mm512_cvt_roundps_ph".}

func mm512_cvtps_ph*(a: M512, i: int32): M256i {.importc: "_mm512_cvtps_ph".}

func mm512_mask_cvt_roundps_ph*(u: M256i, w: MMask16, a: M512, i: int32): M256i {.importc: "_mm512_mask_cvt_roundps_ph".}

func mm512_mask_cvtps_ph*(u: M256i, w: MMask16, a: M512, i: int32): M256i {.importc: "_mm512_mask_cvtps_ph".}

func mm512_maskz_cvt_roundps_ph*(w: MMask16, a: M512, i: int32): M256i {.importc: "_mm512_maskz_cvt_roundps_ph".}

func mm512_maskz_cvtps_ph*(w: MMask16, a: M512, i: int32): M256i {.importc: "_mm512_maskz_cvtps_ph".}

## [Macro Original]
## #define _mm512_cvt_roundps_pd(A, B)		 \
## (__m512d)__builtin_ia32_cvtps2pd512_mask(A, (__v8df)_mm512_undefined_pd(), -1, B)

## [Macro Original]
## #define _mm512_mask_cvt_roundps_pd(W, U, A, B)   \
## (__m512d)__builtin_ia32_cvtps2pd512_mask(A, (__v8df)(W), U, B)

## [Macro Original]
## #define _mm512_maskz_cvt_roundps_pd(U, A, B)     \
## (__m512d)__builtin_ia32_cvtps2pd512_mask(A, (__v8df)_mm512_setzero_pd(), U, B)

## [Macro Original]
## #define _mm512_cvt_roundph_ps(A, B)		 \
## (__m512)__builtin_ia32_vcvtph2ps512_mask((__v16hi)(A), (__v16sf)_mm512_undefined_ps(), -1, B)

## [Macro Original]
## #define _mm512_mask_cvt_roundph_ps(W, U, A, B)   \
## (__m512)__builtin_ia32_vcvtph2ps512_mask((__v16hi)(A), (__v16sf)(W), U, B)

## [Macro Original]
## #define _mm512_maskz_cvt_roundph_ps(U, A, B)     \
## (__m512)__builtin_ia32_vcvtph2ps512_mask((__v16hi)(A), (__v16sf)_mm512_setzero_ps(), U, B)

## [Macro Original]
## #define _mm512_cvt_roundps_ph(A, I)						 \
## ((__m256i) __builtin_ia32_vcvtps2ph512_mask ((__v16sf)(__m512) (A), (int) (I),\
## (__v16hi)_mm256_undefined_si256 (), -1))

## [Macro Original]
## #define _mm512_cvtps_ph(A, I)						 \
## ((__m256i) __builtin_ia32_vcvtps2ph512_mask ((__v16sf)(__m512) (A), (int) (I),\
## (__v16hi)_mm256_undefined_si256 (), -1))

## [Macro Original]
## #define _mm512_mask_cvt_roundps_ph(U, W, A, I)				 \
## ((__m256i) __builtin_ia32_vcvtps2ph512_mask ((__v16sf)(__m512) (A), (int) (I),\
## (__v16hi)(__m256i)(U), (__mmask16) (W)))

## [Macro Original]
## #define _mm512_mask_cvtps_ph(U, W, A, I)				 \
## ((__m256i) __builtin_ia32_vcvtps2ph512_mask ((__v16sf)(__m512) (A), (int) (I),\
## (__v16hi)(__m256i)(U), (__mmask16) (W)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundps_ph(W, A, I)					 \
## ((__m256i) __builtin_ia32_vcvtps2ph512_mask ((__v16sf)(__m512) (A), (int) (I),\
## (__v16hi)_mm256_setzero_si256 (), (__mmask16) (W)))

## [Macro Original]
## #define _mm512_maskz_cvtps_ph(W, A, I)					 \
## ((__m256i) __builtin_ia32_vcvtps2ph512_mask ((__v16sf)(__m512) (A), (int) (I),\
## (__v16hi)_mm256_setzero_si256 (), (__mmask16) (W)))

func mm512_cvt_roundpd_ps*(a: M512d, r: int32): M256 {.importc: "_mm512_cvt_roundpd_ps".}

func mm512_mask_cvt_roundpd_ps*(w: M256, u: MMask8, a: M512d, r: int32): M256 {.importc: "_mm512_mask_cvt_roundpd_ps".}

func mm512_maskz_cvt_roundpd_ps*(u: MMask8, a: M512d, r: int32): M256 {.importc: "_mm512_maskz_cvt_roundpd_ps".}

## [Macro Original]
## #define _mm512_cvt_roundpd_ps(A, B)		 \
## (__m256)__builtin_ia32_cvtpd2ps512_mask(A, (__v8sf)_mm256_undefined_ps(), -1, B)

## [Macro Original]
## #define _mm512_mask_cvt_roundpd_ps(W, U, A, B)   \
## (__m256)__builtin_ia32_cvtpd2ps512_mask(A, (__v8sf)(W), U, B)

## [Macro Original]
## #define _mm512_maskz_cvt_roundpd_ps(U, A, B)     \
## (__m256)__builtin_ia32_cvtpd2ps512_mask(A, (__v8sf)_mm256_setzero_ps(), U, B)

func mm512_stream_si512*(p: ptr M512i, a: M512i): void {.importc: "_mm512_stream_si512".}

func mm512_stream_ps*(p: ptr float32, a: M512): void {.importc: "_mm512_stream_ps".}

func mm512_stream_pd*(p: ptr float64, a: M512d): void {.importc: "_mm512_stream_pd".}

func mm512_stream_load_si512*(p: pointer): M512i {.importc: "_mm512_stream_load_si512".}

func mm512_getexp_round_ps*(a: M512, r: int32): M512 {.importc: "_mm512_getexp_round_ps".}

func mm512_mask_getexp_round_ps*(w: M512, u: MMask16, a: M512, r: int32): M512 {.importc: "_mm512_mask_getexp_round_ps".}

func mm512_maskz_getexp_round_ps*(u: MMask16, a: M512, r: int32): M512 {.importc: "_mm512_maskz_getexp_round_ps".}

func mm512_getexp_round_pd*(a: M512d, r: int32): M512d {.importc: "_mm512_getexp_round_pd".}

func mm512_mask_getexp_round_pd*(w: M512d, u: MMask8, a: M512d, r: int32): M512d {.importc: "_mm512_mask_getexp_round_pd".}

func mm512_maskz_getexp_round_pd*(u: MMask8, a: M512d, r: int32): M512d {.importc: "_mm512_maskz_getexp_round_pd".}

func mm512_getmant_round_pd*(a: M512d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512d {.importc: "_mm512_getmant_round_pd".}

func mm512_mask_getmant_round_pd*(w: M512d, u: MMask8, a: M512d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512d {.importc: "_mm512_mask_getmant_round_pd".}

func mm512_maskz_getmant_round_pd*(u: MMask8, a: M512d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512d {.importc: "_mm512_maskz_getmant_round_pd".}

func mm512_getmant_round_ps*(a: M512, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512 {.importc: "_mm512_getmant_round_ps".}

func mm512_mask_getmant_round_ps*(w: M512, u: MMask16, a: M512, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512 {.importc: "_mm512_mask_getmant_round_ps".}

func mm512_maskz_getmant_round_ps*(u: MMask16, a: M512, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512 {.importc: "_mm512_maskz_getmant_round_ps".}

## [Macro Original]
## #define _mm512_getmant_round_pd(X, B, C, R)                                                  \
## ((__m512d)__builtin_ia32_getmantpd512_mask ((__v8df)(__m512d)(X),                 \
## (int)(((C)<<2) | (B)),                \
## (__v8df)(__m512d)_mm512_undefined_pd(), \
## (__mmask8)-1,\
## (R)))

## [Macro Original]
## #define _mm512_mask_getmant_round_pd(W, U, X, B, C, R)                                       \
## ((__m512d)__builtin_ia32_getmantpd512_mask ((__v8df)(__m512d)(X),                 \
## (int)(((C)<<2) | (B)),                \
## (__v8df)(__m512d)(W),                 \
## (__mmask8)(U),\
## (R)))

## [Macro Original]
## #define _mm512_maskz_getmant_round_pd(U, X, B, C, R)                                         \
## ((__m512d)__builtin_ia32_getmantpd512_mask ((__v8df)(__m512d)(X),                 \
## (int)(((C)<<2) | (B)),                \
## (__v8df)(__m512d)_mm512_setzero_pd(), \
## (__mmask8)(U),\
## (R)))

## [Macro Original]
## #define _mm512_getmant_round_ps(X, B, C, R)                                                  \
## ((__m512)__builtin_ia32_getmantps512_mask ((__v16sf)(__m512)(X),                  \
## (int)(((C)<<2) | (B)),                 \
## (__v16sf)(__m512)_mm512_undefined_ps(), \
## (__mmask16)-1,\
## (R)))

## [Macro Original]
## #define _mm512_mask_getmant_round_ps(W, U, X, B, C, R)                                       \
## ((__m512)__builtin_ia32_getmantps512_mask ((__v16sf)(__m512)(X),                  \
## (int)(((C)<<2) | (B)),                 \
## (__v16sf)(__m512)(W),                  \
## (__mmask16)(U),\
## (R)))

## [Macro Original]
## #define _mm512_maskz_getmant_round_ps(U, X, B, C, R)                                         \
## ((__m512)__builtin_ia32_getmantps512_mask ((__v16sf)(__m512)(X),                  \
## (int)(((C)<<2) | (B)),                 \
## (__v16sf)(__m512)_mm512_setzero_ps(),  \
## (__mmask16)(U),\
## (R)))

## [Macro Original]
## #define _mm512_getexp_round_ps(A, R)						\
## ((__m512)__builtin_ia32_getexpps512_mask((__v16sf)(__m512)(A),		\
## (__v16sf)_mm512_undefined_ps(), (__mmask16)-1, R))

## [Macro Original]
## #define _mm512_mask_getexp_round_ps(W, U, A, R)					\
## ((__m512)__builtin_ia32_getexpps512_mask((__v16sf)(__m512)(A),		\
## (__v16sf)(__m512)(W), (__mmask16)(U), R))

## [Macro Original]
## #define _mm512_maskz_getexp_round_ps(U, A, R)					\
## ((__m512)__builtin_ia32_getexpps512_mask((__v16sf)(__m512)(A),		\
## (__v16sf)_mm512_setzero_ps(), (__mmask16)(U), R))

## [Macro Original]
## #define _mm512_getexp_round_pd(A, R)						\
## ((__m512d)__builtin_ia32_getexppd512_mask((__v8df)(__m512d)(A),		\
## (__v8df)_mm512_undefined_pd(), (__mmask8)-1, R))

## [Macro Original]
## #define _mm512_mask_getexp_round_pd(W, U, A, R)					\
## ((__m512d)__builtin_ia32_getexppd512_mask((__v8df)(__m512d)(A),		\
## (__v8df)(__m512d)(W), (__mmask8)(U), R))

## [Macro Original]
## #define _mm512_maskz_getexp_round_pd(U, A, R)					\
## ((__m512d)__builtin_ia32_getexppd512_mask((__v8df)(__m512d)(A),		\
## (__v8df)_mm512_setzero_pd(), (__mmask8)(U), R))

func mm512_roundscale_round_ps*(a: M512, imm: int32, r: int32): M512 {.importc: "_mm512_roundscale_round_ps".}

func mm512_mask_roundscale_round_ps*(a: M512, b: MMask16, c: M512, imm: int32, r: int32): M512 {.importc: "_mm512_mask_roundscale_round_ps".}

func mm512_maskz_roundscale_round_ps*(a: MMask16, b: M512, imm: int32, r: int32): M512 {.importc: "_mm512_maskz_roundscale_round_ps".}

func mm512_roundscale_round_pd*(a: M512d, imm: int32, r: int32): M512d {.importc: "_mm512_roundscale_round_pd".}

func mm512_mask_roundscale_round_pd*(a: M512d, b: MMask8, c: M512d, imm: int32, r: int32): M512d {.importc: "_mm512_mask_roundscale_round_pd".}

func mm512_maskz_roundscale_round_pd*(a: MMask8, b: M512d, imm: int32, r: int32): M512d {.importc: "_mm512_maskz_roundscale_round_pd".}

## [Macro Original]
## #define _mm512_roundscale_round_ps(A, B, R) \
## ((__m512) __builtin_ia32_rndscaleps_mask ((__v16sf)(__m512)(A), (int)(B),\
## (__v16sf)_mm512_undefined_ps(), (__mmask16)(-1), R))

## [Macro Original]
## #define _mm512_mask_roundscale_round_ps(A, B, C, D, R)				\
## ((__m512) __builtin_ia32_rndscaleps_mask ((__v16sf)(__m512)(C),	\
## (int)(D),			\
## (__v16sf)(__m512)(A),	\
## (__mmask16)(B), R))

## [Macro Original]
## #define _mm512_maskz_roundscale_round_ps(A, B, C, R)				\
## ((__m512) __builtin_ia32_rndscaleps_mask ((__v16sf)(__m512)(B),	\
## (int)(C),			\
## (__v16sf)_mm512_setzero_ps(),\
## (__mmask16)(A), R))

## [Macro Original]
## #define _mm512_roundscale_round_pd(A, B, R) \
## ((__m512d) __builtin_ia32_rndscalepd_mask ((__v8df)(__m512d)(A), (int)(B),\
## (__v8df)_mm512_undefined_pd(), (__mmask8)(-1), R))

## [Macro Original]
## #define _mm512_mask_roundscale_round_pd(A, B, C, D, R)				\
## ((__m512d) __builtin_ia32_rndscalepd_mask ((__v8df)(__m512d)(C),	\
## (int)(D),			\
## (__v8df)(__m512d)(A),	\
## (__mmask8)(B), R))

## [Macro Original]
## #define _mm512_maskz_roundscale_round_pd(A, B, C, R)				\
## ((__m512d) __builtin_ia32_rndscalepd_mask ((__v8df)(__m512d)(B),	\
## (int)(C),			\
## (__v8df)_mm512_setzero_pd(),\
## (__mmask8)(A), R))

func mm512_floor_ps*(a: M512): M512 {.importc: "_mm512_floor_ps".}

func mm512_floor_pd*(a: M512d): M512d {.importc: "_mm512_floor_pd".}

func mm512_ceil_ps*(a: M512): M512 {.importc: "_mm512_ceil_ps".}

func mm512_ceil_pd*(a: M512d): M512d {.importc: "_mm512_ceil_pd".}

func mm512_mask_floor_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_floor_ps".}

func mm512_mask_floor_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_floor_pd".}

func mm512_mask_ceil_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_ceil_ps".}

func mm512_mask_ceil_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_ceil_pd".}

func mm512_alignr_epi32*(a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_alignr_epi32".}

func mm512_mask_alignr_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_mask_alignr_epi32".}

func mm512_maskz_alignr_epi32*(u: MMask16, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_maskz_alignr_epi32".}

func mm512_alignr_epi64*(a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_alignr_epi64".}

func mm512_mask_alignr_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_mask_alignr_epi64".}

func mm512_maskz_alignr_epi64*(u: MMask8, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_maskz_alignr_epi64".}

## [Macro Original]
## #define _mm512_alignr_epi32(X, Y, C)                                        \
## ((__m512i)__builtin_ia32_alignd512_mask ((__v16si)(__m512i)(X),         \
## (__v16si)(__m512i)(Y), (int)(C), (__v16si)_mm512_undefined_epi32 (),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_alignr_epi32(W, U, X, Y, C)                             \
## ((__m512i)__builtin_ia32_alignd512_mask ((__v16si)(__m512i)(X),         \
## (__v16si)(__m512i)(Y), (int)(C), (__v16si)(__m512i)(W),             \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_alignr_epi32(U, X, Y, C)                               \
## ((__m512i)__builtin_ia32_alignd512_mask ((__v16si)(__m512i)(X),         \
## (__v16si)(__m512i)(Y), (int)(C), (__v16si)_mm512_setzero_si512 (),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_alignr_epi64(X, Y, C)                                        \
## ((__m512i)__builtin_ia32_alignq512_mask ((__v8di)(__m512i)(X),          \
## (__v8di)(__m512i)(Y), (int)(C), (__v8di)_mm512_undefined_epi32 (),  \
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_alignr_epi64(W, U, X, Y, C)                             \
## ((__m512i)__builtin_ia32_alignq512_mask ((__v8di)(__m512i)(X),          \
## (__v8di)(__m512i)(Y), (int)(C), (__v8di)(__m512i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_alignr_epi64(U, X, Y, C)                               \
## ((__m512i)__builtin_ia32_alignq512_mask ((__v8di)(__m512i)(X),          \
## (__v8di)(__m512i)(Y), (int)(C), (__v8di)_mm512_setzero_si512 (),\
## (__mmask8)(U)))

func mm512_cmpeq_epi32_mask*(a: M512i, b: M512i): MMask16 {.importc: "_mm512_cmpeq_epi32_mask".}

func mm512_mask_cmpeq_epi32_mask*(u: MMask16, a: M512i, b: M512i): MMask16 {.importc: "_mm512_mask_cmpeq_epi32_mask".}

func mm512_mask_cmpeq_epi64_mask*(u: MMask8, a: M512i, b: M512i): MMask8 {.importc: "_mm512_mask_cmpeq_epi64_mask".}

func mm512_cmpeq_epi64_mask*(a: M512i, b: M512i): MMask8 {.importc: "_mm512_cmpeq_epi64_mask".}

func mm512_cmpgt_epi32_mask*(a: M512i, b: M512i): MMask16 {.importc: "_mm512_cmpgt_epi32_mask".}

func mm512_mask_cmpgt_epi32_mask*(u: MMask16, a: M512i, b: M512i): MMask16 {.importc: "_mm512_mask_cmpgt_epi32_mask".}

func mm512_mask_cmpgt_epi64_mask*(u: MMask8, a: M512i, b: M512i): MMask8 {.importc: "_mm512_mask_cmpgt_epi64_mask".}

func mm512_cmpgt_epi64_mask*(a: M512i, b: M512i): MMask8 {.importc: "_mm512_cmpgt_epi64_mask".}

func mm512_cmpge_epi32_mask*(x: M512i, y: M512i): MMask16 {.importc: "_mm512_cmpge_epi32_mask".}

func mm512_mask_cmpge_epi32_mask*(m: MMask16, x: M512i, y: M512i): MMask16 {.importc: "_mm512_mask_cmpge_epi32_mask".}

func mm512_mask_cmpge_epu32_mask*(m: MMask16, x: M512i, y: M512i): MMask16 {.importc: "_mm512_mask_cmpge_epu32_mask".}

func mm512_cmpge_epu32_mask*(x: M512i, y: M512i): MMask16 {.importc: "_mm512_cmpge_epu32_mask".}

func mm512_mask_cmpge_epi64_mask*(m: MMask8, x: M512i, y: M512i): MMask8 {.importc: "_mm512_mask_cmpge_epi64_mask".}

func mm512_cmpge_epi64_mask*(x: M512i, y: M512i): MMask8 {.importc: "_mm512_cmpge_epi64_mask".}

func mm512_mask_cmpge_epu64_mask*(m: MMask8, x: M512i, y: M512i): MMask8 {.importc: "_mm512_mask_cmpge_epu64_mask".}

func mm512_cmpge_epu64_mask*(x: M512i, y: M512i): MMask8 {.importc: "_mm512_cmpge_epu64_mask".}

func mm512_mask_cmple_epi32_mask*(m: MMask16, x: M512i, y: M512i): MMask16 {.importc: "_mm512_mask_cmple_epi32_mask".}

func mm512_cmple_epi32_mask*(x: M512i, y: M512i): MMask16 {.importc: "_mm512_cmple_epi32_mask".}

func mm512_mask_cmple_epu32_mask*(m: MMask16, x: M512i, y: M512i): MMask16 {.importc: "_mm512_mask_cmple_epu32_mask".}

func mm512_cmple_epu32_mask*(x: M512i, y: M512i): MMask16 {.importc: "_mm512_cmple_epu32_mask".}

func mm512_mask_cmple_epi64_mask*(m: MMask8, x: M512i, y: M512i): MMask8 {.importc: "_mm512_mask_cmple_epi64_mask".}

func mm512_cmple_epi64_mask*(x: M512i, y: M512i): MMask8 {.importc: "_mm512_cmple_epi64_mask".}

func mm512_mask_cmple_epu64_mask*(m: MMask8, x: M512i, y: M512i): MMask8 {.importc: "_mm512_mask_cmple_epu64_mask".}

func mm512_cmple_epu64_mask*(x: M512i, y: M512i): MMask8 {.importc: "_mm512_cmple_epu64_mask".}

func mm512_mask_cmplt_epi32_mask*(m: MMask16, x: M512i, y: M512i): MMask16 {.importc: "_mm512_mask_cmplt_epi32_mask".}

func mm512_cmplt_epi32_mask*(x: M512i, y: M512i): MMask16 {.importc: "_mm512_cmplt_epi32_mask".}

func mm512_mask_cmplt_epu32_mask*(m: MMask16, x: M512i, y: M512i): MMask16 {.importc: "_mm512_mask_cmplt_epu32_mask".}

func mm512_cmplt_epu32_mask*(x: M512i, y: M512i): MMask16 {.importc: "_mm512_cmplt_epu32_mask".}

func mm512_mask_cmplt_epi64_mask*(m: MMask8, x: M512i, y: M512i): MMask8 {.importc: "_mm512_mask_cmplt_epi64_mask".}

func mm512_cmplt_epi64_mask*(x: M512i, y: M512i): MMask8 {.importc: "_mm512_cmplt_epi64_mask".}

func mm512_mask_cmplt_epu64_mask*(m: MMask8, x: M512i, y: M512i): MMask8 {.importc: "_mm512_mask_cmplt_epu64_mask".}

func mm512_cmplt_epu64_mask*(x: M512i, y: M512i): MMask8 {.importc: "_mm512_cmplt_epu64_mask".}

func mm512_cmpneq_epi32_mask*(x: M512i, y: M512i): MMask16 {.importc: "_mm512_cmpneq_epi32_mask".}

func mm512_mask_cmpneq_epi32_mask*(m: MMask16, x: M512i, y: M512i): MMask16 {.importc: "_mm512_mask_cmpneq_epi32_mask".}

func mm512_mask_cmpneq_epu32_mask*(m: MMask16, x: M512i, y: M512i): MMask16 {.importc: "_mm512_mask_cmpneq_epu32_mask".}

func mm512_cmpneq_epu32_mask*(x: M512i, y: M512i): MMask16 {.importc: "_mm512_cmpneq_epu32_mask".}

func mm512_mask_cmpneq_epi64_mask*(m: MMask8, x: M512i, y: M512i): MMask8 {.importc: "_mm512_mask_cmpneq_epi64_mask".}

func mm512_cmpneq_epi64_mask*(x: M512i, y: M512i): MMask8 {.importc: "_mm512_cmpneq_epi64_mask".}

func mm512_mask_cmpneq_epu64_mask*(m: MMask8, x: M512i, y: M512i): MMask8 {.importc: "_mm512_mask_cmpneq_epu64_mask".}

func mm512_cmpneq_epu64_mask*(x: M512i, y: M512i): MMask8 {.importc: "_mm512_cmpneq_epu64_mask".}

## [Macro Original]
## #define _MM_CMPINT_EQ	    0x0

## [Macro Original]
## #define _MM_CMPINT_LT	    0x1

## [Macro Original]
## #define _MM_CMPINT_LE	    0x2

## [Macro Original]
## #define _MM_CMPINT_UNUSED   0x3

## [Macro Original]
## #define _MM_CMPINT_NE	    0x4

## [Macro Original]
## #define _MM_CMPINT_NLT	    0x5

## [Macro Original]
## #define _MM_CMPINT_GE	    0x5

## [Macro Original]
## #define _MM_CMPINT_NLE	    0x6

## [Macro Original]
## #define _MM_CMPINT_GT	    0x6

func mm512_cmp_epi64_mask*(x: M512i, y: M512i, p: int32): MMask8 {.importc: "_mm512_cmp_epi64_mask".}

func mm512_cmp_epi32_mask*(x: M512i, y: M512i, p: int32): MMask16 {.importc: "_mm512_cmp_epi32_mask".}

func mm512_cmp_epu64_mask*(x: M512i, y: M512i, p: int32): MMask8 {.importc: "_mm512_cmp_epu64_mask".}

func mm512_cmp_epu32_mask*(x: M512i, y: M512i, p: int32): MMask16 {.importc: "_mm512_cmp_epu32_mask".}

func mm512_cmp_round_pd_mask*(x: M512d, y: M512d, p: int32, r: int32): MMask8 {.importc: "_mm512_cmp_round_pd_mask".}

func mm512_cmp_round_ps_mask*(x: M512, y: M512, p: int32, r: int32): MMask16 {.importc: "_mm512_cmp_round_ps_mask".}

func mm512_mask_cmp_epi64_mask*(u: MMask8, x: M512i, y: M512i, p: int32): MMask8 {.importc: "_mm512_mask_cmp_epi64_mask".}

func mm512_mask_cmp_epi32_mask*(u: MMask16, x: M512i, y: M512i, p: int32): MMask16 {.importc: "_mm512_mask_cmp_epi32_mask".}

func mm512_mask_cmp_epu64_mask*(u: MMask8, x: M512i, y: M512i, p: int32): MMask8 {.importc: "_mm512_mask_cmp_epu64_mask".}

func mm512_mask_cmp_epu32_mask*(u: MMask16, x: M512i, y: M512i, p: int32): MMask16 {.importc: "_mm512_mask_cmp_epu32_mask".}

func mm512_mask_cmp_round_pd_mask*(u: MMask8, x: M512d, y: M512d, p: int32, r: int32): MMask8 {.importc: "_mm512_mask_cmp_round_pd_mask".}

func mm512_mask_cmp_round_ps_mask*(u: MMask16, x: M512, y: M512, p: int32, r: int32): MMask16 {.importc: "_mm512_mask_cmp_round_ps_mask".}

## [Macro Original]
## #define _mm512_cmp_epi64_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpq512_mask ((__v8di)(__m512i)(X),	\
## (__v8di)(__m512i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_cmp_epi32_mask(X, Y, P)					\
## ((__mmask16) __builtin_ia32_cmpd512_mask ((__v16si)(__m512i)(X),	\
## (__v16si)(__m512i)(Y), (int)(P), \
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_cmp_epu64_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_ucmpq512_mask ((__v8di)(__m512i)(X),	\
## (__v8di)(__m512i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_cmp_epu32_mask(X, Y, P)					\
## ((__mmask16) __builtin_ia32_ucmpd512_mask ((__v16si)(__m512i)(X),	\
## (__v16si)(__m512i)(Y), (int)(P), \
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_cmp_round_pd_mask(X, Y, P, R)				\
## ((__mmask8) __builtin_ia32_cmppd512_mask ((__v8df)(__m512d)(X),	\
## (__v8df)(__m512d)(Y), (int)(P),\
## (__mmask8)-1, R))

## [Macro Original]
## #define _mm512_cmp_round_ps_mask(X, Y, P, R)				\
## ((__mmask16) __builtin_ia32_cmpps512_mask ((__v16sf)(__m512)(X),	\
## (__v16sf)(__m512)(Y), (int)(P),\
## (__mmask16)-1, R))

## [Macro Original]
## #define _mm512_mask_cmp_epi64_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpq512_mask ((__v8di)(__m512i)(X),	\
## (__v8di)(__m512i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm512_mask_cmp_epi32_mask(M, X, Y, P)				\
## ((__mmask16) __builtin_ia32_cmpd512_mask ((__v16si)(__m512i)(X),	\
## (__v16si)(__m512i)(Y), (int)(P), \
## (__mmask16)(M)))

## [Macro Original]
## #define _mm512_mask_cmp_epu64_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_ucmpq512_mask ((__v8di)(__m512i)(X),	\
## (__v8di)(__m512i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm512_mask_cmp_epu32_mask(M, X, Y, P)				\
## ((__mmask16) __builtin_ia32_ucmpd512_mask ((__v16si)(__m512i)(X),	\
## (__v16si)(__m512i)(Y), (int)(P), \
## (__mmask16)(M)))

## [Macro Original]
## #define _mm512_mask_cmp_round_pd_mask(M, X, Y, P, R)			\
## ((__mmask8) __builtin_ia32_cmppd512_mask ((__v8df)(__m512d)(X),	\
## (__v8df)(__m512d)(Y), (int)(P),\
## (__mmask8)(M), R))

## [Macro Original]
## #define _mm512_mask_cmp_round_ps_mask(M, X, Y, P, R)			\
## ((__mmask16) __builtin_ia32_cmpps512_mask ((__v16sf)(__m512)(X),	\
## (__v16sf)(__m512)(Y), (int)(P),\
## (__mmask16)(M), R))

func mm512_i32gather_ps*(index: M512i, address: pointer, scale: int32): M512 {.importc: "_mm512_i32gather_ps".}

func mm512_mask_i32gather_ps*(v1_old: M512, mask: MMask16, index: M512i, address: pointer, scale: int32): M512 {.importc: "_mm512_mask_i32gather_ps".}

func mm512_i32gather_pd*(index: M256i, address: pointer, scale: int32): M512d {.importc: "_mm512_i32gather_pd".}

func mm512_mask_i32gather_pd*(v1_old: M512d, mask: MMask8, index: M256i, address: pointer, scale: int32): M512d {.importc: "_mm512_mask_i32gather_pd".}

func mm512_i64gather_ps*(index: M512i, address: pointer, scale: int32): M256 {.importc: "_mm512_i64gather_ps".}

func mm512_mask_i64gather_ps*(v1_old: M256, mask: MMask8, index: M512i, address: pointer, scale: int32): M256 {.importc: "_mm512_mask_i64gather_ps".}

func mm512_i64gather_pd*(index: M512i, address: pointer, scale: int32): M512d {.importc: "_mm512_i64gather_pd".}

func mm512_mask_i64gather_pd*(v1_old: M512d, mask: MMask8, index: M512i, address: pointer, scale: int32): M512d {.importc: "_mm512_mask_i64gather_pd".}

func mm512_i32gather_epi32*(index: M512i, address: pointer, scale: int32): M512i {.importc: "_mm512_i32gather_epi32".}

func mm512_mask_i32gather_epi32*(v1_old: M512i, mask: MMask16, index: M512i, address: pointer, scale: int32): M512i {.importc: "_mm512_mask_i32gather_epi32".}

func mm512_i32gather_epi64*(index: M256i, address: pointer, scale: int32): M512i {.importc: "_mm512_i32gather_epi64".}

func mm512_mask_i32gather_epi64*(v1_old: M512i, mask: MMask8, index: M256i, address: pointer, scale: int32): M512i {.importc: "_mm512_mask_i32gather_epi64".}

func mm512_i64gather_epi32*(index: M512i, address: pointer, scale: int32): M256i {.importc: "_mm512_i64gather_epi32".}

func mm512_mask_i64gather_epi32*(v1_old: M256i, mask: MMask8, index: M512i, address: pointer, scale: int32): M256i {.importc: "_mm512_mask_i64gather_epi32".}

func mm512_i64gather_epi64*(index: M512i, address: pointer, scale: int32): M512i {.importc: "_mm512_i64gather_epi64".}

func mm512_mask_i64gather_epi64*(v1_old: M512i, mask: MMask8, index: M512i, address: pointer, scale: int32): M512i {.importc: "_mm512_mask_i64gather_epi64".}

func mm512_i32scatter_ps*(address: pointer, index: M512i, v1: M512, scale: int32): void {.importc: "_mm512_i32scatter_ps".}

func mm512_mask_i32scatter_ps*(address: pointer, mask: MMask16, index: M512i, v1: M512, scale: int32): void {.importc: "_mm512_mask_i32scatter_ps".}

func mm512_i32scatter_pd*(address: pointer, index: M256i, v1: M512d, scale: int32): void {.importc: "_mm512_i32scatter_pd".}

func mm512_mask_i32scatter_pd*(address: pointer, mask: MMask8, index: M256i, v1: M512d, scale: int32): void {.importc: "_mm512_mask_i32scatter_pd".}

func mm512_i64scatter_ps*(address: pointer, index: M512i, v1: M256, scale: int32): void {.importc: "_mm512_i64scatter_ps".}

func mm512_mask_i64scatter_ps*(address: pointer, mask: MMask8, index: M512i, v1: M256, scale: int32): void {.importc: "_mm512_mask_i64scatter_ps".}

func mm512_i64scatter_pd*(address: pointer, index: M512i, v1: M512d, scale: int32): void {.importc: "_mm512_i64scatter_pd".}

func mm512_mask_i64scatter_pd*(address: pointer, mask: MMask8, index: M512i, v1: M512d, scale: int32): void {.importc: "_mm512_mask_i64scatter_pd".}

func mm512_i32scatter_epi32*(address: pointer, index: M512i, v1: M512i, scale: int32): void {.importc: "_mm512_i32scatter_epi32".}

func mm512_mask_i32scatter_epi32*(address: pointer, mask: MMask16, index: M512i, v1: M512i, scale: int32): void {.importc: "_mm512_mask_i32scatter_epi32".}

func mm512_i32scatter_epi64*(address: pointer, index: M256i, v1: M512i, scale: int32): void {.importc: "_mm512_i32scatter_epi64".}

func mm512_mask_i32scatter_epi64*(address: pointer, mask: MMask8, index: M256i, v1: M512i, scale: int32): void {.importc: "_mm512_mask_i32scatter_epi64".}

func mm512_i64scatter_epi32*(address: pointer, index: M512i, v1: M256i, scale: int32): void {.importc: "_mm512_i64scatter_epi32".}

func mm512_mask_i64scatter_epi32*(address: pointer, mask: MMask8, index: M512i, v1: M256i, scale: int32): void {.importc: "_mm512_mask_i64scatter_epi32".}

func mm512_i64scatter_epi64*(address: pointer, index: M512i, v1: M512i, scale: int32): void {.importc: "_mm512_i64scatter_epi64".}

func mm512_mask_i64scatter_epi64*(address: pointer, mask: MMask8, index: M512i, v1: M512i, scale: int32): void {.importc: "_mm512_mask_i64scatter_epi64".}

## [Macro Original]
## #define _mm512_i32gather_ps(INDEX, ADDR, SCALE)				\
## (__m512) __builtin_ia32_gathersiv16sf ((__v16sf)_mm512_undefined_ps(),\
## (void const *) (ADDR),		\
## (__v16si)(__m512i) (INDEX),	\
## (__mmask16)0xFFFF,		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i32gather_ps(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m512) __builtin_ia32_gathersiv16sf ((__v16sf)(__m512) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v16si)(__m512i) (INDEX),	\
## (__mmask16) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_i32gather_pd(INDEX, ADDR, SCALE)				\
## (__m512d) __builtin_ia32_gathersiv8df ((__v8df)_mm512_undefined_pd(),	\
## (void const *) (ADDR),		\
## (__v8si)(__m256i) (INDEX),	\
## (__mmask8)0xFF, (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i32gather_pd(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m512d) __builtin_ia32_gathersiv8df ((__v8df)(__m512d) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v8si)(__m256i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_i64gather_ps(INDEX, ADDR, SCALE)				\
## (__m256) __builtin_ia32_gatherdiv16sf ((__v8sf)_mm256_undefined_ps(),	\
## (void const *) (ADDR),		\
## (__v8di)(__m512i) (INDEX),	\
## (__mmask8)0xFF, (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i64gather_ps(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m256) __builtin_ia32_gatherdiv16sf ((__v8sf)(__m256) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v8di)(__m512i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_i64gather_pd(INDEX, ADDR, SCALE)				\
## (__m512d) __builtin_ia32_gatherdiv8df ((__v8df)_mm512_undefined_pd(),	\
## (void const *) (ADDR),		\
## (__v8di)(__m512i) (INDEX),	\
## (__mmask8)0xFF, (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i64gather_pd(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m512d) __builtin_ia32_gatherdiv8df ((__v8df)(__m512d) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v8di)(__m512i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_i32gather_epi32(INDEX, ADDR, SCALE)			\
## (__m512i) __builtin_ia32_gathersiv16si ((__v16si)_mm512_undefined_epi32 (),\
## (void const *) (ADDR),	\
## (__v16si)(__m512i) (INDEX),	\
## (__mmask16)0xFFFF,		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i32gather_epi32(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m512i) __builtin_ia32_gathersiv16si ((__v16si)(__m512i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v16si)(__m512i) (INDEX),	\
## (__mmask16) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_i32gather_epi64(INDEX, ADDR, SCALE)			\
## (__m512i) __builtin_ia32_gathersiv8di ((__v8di)_mm512_undefined_epi32 (),\
## (void const *) (ADDR),		\
## (__v8si)(__m256i) (INDEX),	\
## (__mmask8)0xFF, (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i32gather_epi64(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m512i) __builtin_ia32_gathersiv8di ((__v8di)(__m512i) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v8si)(__m256i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_i64gather_epi32(INDEX, ADDR, SCALE)			   \
## (__m256i) __builtin_ia32_gatherdiv16si ((__v8si)_mm256_undefined_si256(),\
## (void const *) (ADDR),	   \
## (__v8di)(__m512i) (INDEX),	   \
## (__mmask8)0xFF, (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i64gather_epi32(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m256i) __builtin_ia32_gatherdiv16si ((__v8si)(__m256i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v8di)(__m512i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_i64gather_epi64(INDEX, ADDR, SCALE)			\
## (__m512i) __builtin_ia32_gatherdiv8di ((__v8di)_mm512_undefined_epi32 (),\
## (void const *) (ADDR),		\
## (__v8di)(__m512i) (INDEX),	\
## (__mmask8)0xFF, (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i64gather_epi64(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m512i) __builtin_ia32_gatherdiv8di ((__v8di)(__m512i) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v8di)(__m512i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm512_i32scatter_ps(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv16sf ((void *) (ADDR), (__mmask16)0xFFFF,	\
## (__v16si)(__m512i) (INDEX),		\
## (__v16sf)(__m512) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i32scatter_ps(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scattersiv16sf ((void *) (ADDR), (__mmask16) (MASK),	\
## (__v16si)(__m512i) (INDEX),		\
## (__v16sf)(__m512) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_i32scatter_pd(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv8df ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v8si)(__m256i) (INDEX),		\
## (__v8df)(__m512d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i32scatter_pd(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scattersiv8df ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v8si)(__m256i) (INDEX),		\
## (__v8df)(__m512d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_i64scatter_ps(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv16sf ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v8di)(__m512i) (INDEX),		\
## (__v8sf)(__m256) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i64scatter_ps(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scatterdiv16sf ((void *) (ADDR), (__mmask16) (MASK),	\
## (__v8di)(__m512i) (INDEX),		\
## (__v8sf)(__m256) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_i64scatter_pd(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv8df ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v8di)(__m512i) (INDEX),		\
## (__v8df)(__m512d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i64scatter_pd(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scatterdiv8df ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v8di)(__m512i) (INDEX),		\
## (__v8df)(__m512d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_i32scatter_epi32(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv16si ((void *) (ADDR), (__mmask16)0xFFFF,	\
## (__v16si)(__m512i) (INDEX),		\
## (__v16si)(__m512i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i32scatter_epi32(ADDR, MASK, INDEX, V1, SCALE)	\
## __builtin_ia32_scattersiv16si ((void *) (ADDR), (__mmask16) (MASK),	\
## (__v16si)(__m512i) (INDEX),		\
## (__v16si)(__m512i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_i32scatter_epi64(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv8di ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v8si)(__m256i) (INDEX),		\
## (__v8di)(__m512i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i32scatter_epi64(ADDR, MASK, INDEX, V1, SCALE)	\
## __builtin_ia32_scattersiv8di ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v8si)(__m256i) (INDEX),		\
## (__v8di)(__m512i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_i64scatter_epi32(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv16si ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v8di)(__m512i) (INDEX),		\
## (__v8si)(__m256i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i64scatter_epi32(ADDR, MASK, INDEX, V1, SCALE)	\
## __builtin_ia32_scatterdiv16si ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v8di)(__m512i) (INDEX),		\
## (__v8si)(__m256i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_i64scatter_epi64(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv8di ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v8di)(__m512i) (INDEX),		\
## (__v8di)(__m512i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm512_mask_i64scatter_epi64(ADDR, MASK, INDEX, V1, SCALE)	\
## __builtin_ia32_scatterdiv8di ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v8di)(__m512i) (INDEX),		\
## (__v8di)(__m512i) (V1), (int) (SCALE))

func mm512_mask_compress_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_compress_pd".}

func mm512_maskz_compress_pd*(u: MMask8, a: M512d): M512d {.importc: "_mm512_maskz_compress_pd".}

func mm512_mask_compressstoreu_pd*(p: pointer, u: MMask8, a: M512d): void {.importc: "_mm512_mask_compressstoreu_pd".}

func mm512_mask_compress_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_compress_ps".}

func mm512_maskz_compress_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_compress_ps".}

func mm512_mask_compressstoreu_ps*(p: pointer, u: MMask16, a: M512): void {.importc: "_mm512_mask_compressstoreu_ps".}

func mm512_mask_compress_epi64*(w: M512i, u: MMask8, a: M512i): M512i {.importc: "_mm512_mask_compress_epi64".}

func mm512_maskz_compress_epi64*(u: MMask8, a: M512i): M512i {.importc: "_mm512_maskz_compress_epi64".}

func mm512_mask_compressstoreu_epi64*(p: pointer, u: MMask8, a: M512i): void {.importc: "_mm512_mask_compressstoreu_epi64".}

func mm512_mask_compress_epi32*(w: M512i, u: MMask16, a: M512i): M512i {.importc: "_mm512_mask_compress_epi32".}

func mm512_maskz_compress_epi32*(u: MMask16, a: M512i): M512i {.importc: "_mm512_maskz_compress_epi32".}

func mm512_mask_compressstoreu_epi32*(p: pointer, u: MMask16, a: M512i): void {.importc: "_mm512_mask_compressstoreu_epi32".}

func mm512_mask_expand_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_expand_pd".}

func mm512_maskz_expand_pd*(u: MMask8, a: M512d): M512d {.importc: "_mm512_maskz_expand_pd".}

func mm512_mask_expandloadu_pd*(w: M512d, u: MMask8, p: pointer): M512d {.importc: "_mm512_mask_expandloadu_pd".}

func mm512_maskz_expandloadu_pd*(u: MMask8, p: pointer): M512d {.importc: "_mm512_maskz_expandloadu_pd".}

func mm512_mask_expand_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_expand_ps".}

func mm512_maskz_expand_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_expand_ps".}

func mm512_mask_expandloadu_ps*(w: M512, u: MMask16, p: pointer): M512 {.importc: "_mm512_mask_expandloadu_ps".}

func mm512_maskz_expandloadu_ps*(u: MMask16, p: pointer): M512 {.importc: "_mm512_maskz_expandloadu_ps".}

func mm512_mask_expand_epi64*(w: M512i, u: MMask8, a: M512i): M512i {.importc: "_mm512_mask_expand_epi64".}

func mm512_maskz_expand_epi64*(u: MMask8, a: M512i): M512i {.importc: "_mm512_maskz_expand_epi64".}

func mm512_mask_expandloadu_epi64*(w: M512i, u: MMask8, p: pointer): M512i {.importc: "_mm512_mask_expandloadu_epi64".}

func mm512_maskz_expandloadu_epi64*(u: MMask8, p: pointer): M512i {.importc: "_mm512_maskz_expandloadu_epi64".}

func mm512_mask_expand_epi32*(w: M512i, u: MMask16, a: M512i): M512i {.importc: "_mm512_mask_expand_epi32".}

func mm512_maskz_expand_epi32*(u: MMask16, a: M512i): M512i {.importc: "_mm512_maskz_expand_epi32".}

func mm512_mask_expandloadu_epi32*(w: M512i, u: MMask16, p: pointer): M512i {.importc: "_mm512_mask_expandloadu_epi32".}

func mm512_maskz_expandloadu_epi32*(u: MMask16, p: pointer): M512i {.importc: "_mm512_maskz_expandloadu_epi32".}

func mm512_kand*(a: MMask16, b: MMask16): MMask16 {.importc: "_mm512_kand".}

func mm512_kandn*(a: MMask16, b: MMask16): MMask16 {.importc: "_mm512_kandn".}

func mm512_kor*(a: MMask16, b: MMask16): MMask16 {.importc: "_mm512_kor".}

func mm512_kortestz*(a: MMask16, b: MMask16): int32 {.importc: "_mm512_kortestz".}

func mm512_kortestc*(a: MMask16, b: MMask16): int32 {.importc: "_mm512_kortestc".}

func mm512_kxnor*(a: MMask16, b: MMask16): MMask16 {.importc: "_mm512_kxnor".}

func mm512_kxor*(a: MMask16, b: MMask16): MMask16 {.importc: "_mm512_kxor".}

func mm512_knot*(a: MMask16): MMask16 {.importc: "_mm512_knot".}

func mm512_kunpackb*(a: MMask16, b: MMask16): MMask16 {.importc: "_mm512_kunpackb".}

func mm512_maskz_inserti32x4*(b: MMask16, c: M512i, d: M128i, imm: int32): M512i {.importc: "_mm512_maskz_inserti32x4".}

func mm512_maskz_insertf32x4*(b: MMask16, c: M512, d: M128, imm: int32): M512 {.importc: "_mm512_maskz_insertf32x4".}

func mm512_mask_inserti32x4*(a: M512i, b: MMask16, c: M512i, d: M128i, imm: int32): M512i {.importc: "_mm512_mask_inserti32x4".}

func mm512_mask_insertf32x4*(a: M512, b: MMask16, c: M512, d: M128, imm: int32): M512 {.importc: "_mm512_mask_insertf32x4".}

## [Macro Original]
## #define _mm512_maskz_insertf32x4(A, X, Y, C)                            \
## ((__m512) __builtin_ia32_insertf32x4_mask ((__v16sf)(__m512) (X),     \
## (__v4sf)(__m128) (Y), (int) (C), (__v16sf)_mm512_setzero_ps(),      \
## (__mmask16)(A)))

## [Macro Original]
## #define _mm512_maskz_inserti32x4(A, X, Y, C)                            \
## ((__m512i) __builtin_ia32_inserti32x4_mask ((__v16si)(__m512i) (X),   \
## (__v4si)(__m128i) (Y), (int) (C), (__v16si)_mm512_setzero_si512 (),     \
## (__mmask16)(A)))

## [Macro Original]
## #define _mm512_mask_insertf32x4(A, B, X, Y, C)                          \
## ((__m512) __builtin_ia32_insertf32x4_mask ((__v16sf)(__m512) (X),     \
## (__v4sf)(__m128) (Y), (int) (C), (__v16sf)(__m512) (A),             \
## (__mmask16)(B)))

## [Macro Original]
## #define _mm512_mask_inserti32x4(A, B, X, Y, C)                          \
## ((__m512i) __builtin_ia32_inserti32x4_mask ((__v16si)(__m512i) (X),   \
## (__v4si)(__m128i) (Y), (int) (C), (__v16si)(__m512i) (A),           \
## (__mmask16)(B)))

func mm512_max_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_max_epi64".}

func mm512_maskz_max_epi64*(m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_max_epi64".}

func mm512_mask_max_epi64*(w: M512i, m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_max_epi64".}

func mm512_min_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_min_epi64".}

func mm512_mask_min_epi64*(w: M512i, m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_min_epi64".}

func mm512_maskz_min_epi64*(m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_min_epi64".}

func mm512_max_epu64*(a: M512i, b: M512i): M512i {.importc: "_mm512_max_epu64".}

func mm512_maskz_max_epu64*(m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_max_epu64".}

func mm512_mask_max_epu64*(w: M512i, m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_max_epu64".}

func mm512_min_epu64*(a: M512i, b: M512i): M512i {.importc: "_mm512_min_epu64".}

func mm512_mask_min_epu64*(w: M512i, m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_min_epu64".}

func mm512_maskz_min_epu64*(m: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_min_epu64".}

func mm512_max_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_max_epi32".}

func mm512_maskz_max_epi32*(m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_max_epi32".}

func mm512_mask_max_epi32*(w: M512i, m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_max_epi32".}

func mm512_min_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_min_epi32".}

func mm512_maskz_min_epi32*(m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_min_epi32".}

func mm512_mask_min_epi32*(w: M512i, m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_min_epi32".}

func mm512_max_epu32*(a: M512i, b: M512i): M512i {.importc: "_mm512_max_epu32".}

func mm512_maskz_max_epu32*(m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_max_epu32".}

func mm512_mask_max_epu32*(w: M512i, m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_max_epu32".}

func mm512_min_epu32*(a: M512i, b: M512i): M512i {.importc: "_mm512_min_epu32".}

func mm512_maskz_min_epu32*(m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_min_epu32".}

func mm512_mask_min_epu32*(w: M512i, m: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_min_epu32".}

func mm512_unpacklo_ps*(a: M512, b: M512): M512 {.importc: "_mm512_unpacklo_ps".}

func mm512_mask_unpacklo_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_unpacklo_ps".}

func mm512_maskz_unpacklo_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_unpacklo_ps".}

func mm512_mask_blend_pd*(u: MMask8, a: M512d, w: M512d): M512d {.importc: "_mm512_mask_blend_pd".}

func mm512_mask_blend_ps*(u: MMask16, a: M512, w: M512): M512 {.importc: "_mm512_mask_blend_ps".}

func mm512_mask_blend_epi64*(u: MMask8, a: M512i, w: M512i): M512i {.importc: "_mm512_mask_blend_epi64".}

func mm512_mask_blend_epi32*(u: MMask16, a: M512i, w: M512i): M512i {.importc: "_mm512_mask_blend_epi32".}

func mm512_sqrt_pd*(a: M512d): M512d {.importc: "_mm512_sqrt_pd".}

func mm512_mask_sqrt_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_sqrt_pd".}

func mm512_maskz_sqrt_pd*(u: MMask8, a: M512d): M512d {.importc: "_mm512_maskz_sqrt_pd".}

func mm512_sqrt_ps*(a: M512): M512 {.importc: "_mm512_sqrt_ps".}

func mm512_mask_sqrt_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_sqrt_ps".}

func mm512_maskz_sqrt_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_sqrt_ps".}

func mm512_add_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_add_pd".}

func mm512_mask_add_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_add_pd".}

func mm512_maskz_add_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_add_pd".}

func mm512_add_ps*(a: M512, b: M512): M512 {.importc: "_mm512_add_ps".}

func mm512_mask_add_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_add_ps".}

func mm512_maskz_add_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_add_ps".}

func mm512_sub_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_sub_pd".}

func mm512_mask_sub_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_sub_pd".}

func mm512_maskz_sub_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_sub_pd".}

func mm512_sub_ps*(a: M512, b: M512): M512 {.importc: "_mm512_sub_ps".}

func mm512_mask_sub_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_sub_ps".}

func mm512_maskz_sub_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_sub_ps".}

func mm512_mul_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_mul_pd".}

func mm512_mask_mul_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_mul_pd".}

func mm512_maskz_mul_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_mul_pd".}

func mm512_mul_ps*(a: M512, b: M512): M512 {.importc: "_mm512_mul_ps".}

func mm512_mask_mul_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_mul_ps".}

func mm512_maskz_mul_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_mul_ps".}

func mm512_div_pd*(m: M512d, v: M512d): M512d {.importc: "_mm512_div_pd".}

func mm512_mask_div_pd*(w: M512d, u: MMask8, m: M512d, v: M512d): M512d {.importc: "_mm512_mask_div_pd".}

func mm512_maskz_div_pd*(u: MMask8, m: M512d, v: M512d): M512d {.importc: "_mm512_maskz_div_pd".}

func mm512_div_ps*(a: M512, b: M512): M512 {.importc: "_mm512_div_ps".}

func mm512_mask_div_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_div_ps".}

func mm512_maskz_div_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_div_ps".}

func mm512_max_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_max_pd".}

func mm512_mask_max_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_max_pd".}

func mm512_maskz_max_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_max_pd".}

func mm512_max_ps*(a: M512, b: M512): M512 {.importc: "_mm512_max_ps".}

func mm512_mask_max_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_max_ps".}

func mm512_maskz_max_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_max_ps".}

func mm512_min_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_min_pd".}

func mm512_mask_min_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_min_pd".}

func mm512_maskz_min_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_min_pd".}

func mm512_min_ps*(a: M512, b: M512): M512 {.importc: "_mm512_min_ps".}

func mm512_mask_min_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_min_ps".}

func mm512_maskz_min_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_min_ps".}

func mm512_scalef_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_scalef_pd".}

func mm512_mask_scalef_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_scalef_pd".}

func mm512_maskz_scalef_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_scalef_pd".}

func mm512_scalef_ps*(a: M512, b: M512): M512 {.importc: "_mm512_scalef_ps".}

func mm512_mask_scalef_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_scalef_ps".}

func mm512_maskz_scalef_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_scalef_ps".}

func mm512_fmadd_pd*(a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_fmadd_pd".}

func mm512_mask_fmadd_pd*(a: M512d, u: MMask8, b: M512d, c: M512d): M512d {.importc: "_mm512_mask_fmadd_pd".}

func mm512_mask3_fmadd_pd*(a: M512d, b: M512d, c: M512d, u: MMask8): M512d {.importc: "_mm512_mask3_fmadd_pd".}

func mm512_maskz_fmadd_pd*(u: MMask8, a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_maskz_fmadd_pd".}

func mm512_fmadd_ps*(a: M512, b: M512, c: M512): M512 {.importc: "_mm512_fmadd_ps".}

func mm512_mask_fmadd_ps*(a: M512, u: MMask16, b: M512, c: M512): M512 {.importc: "_mm512_mask_fmadd_ps".}

func mm512_mask3_fmadd_ps*(a: M512, b: M512, c: M512, u: MMask16): M512 {.importc: "_mm512_mask3_fmadd_ps".}

func mm512_maskz_fmadd_ps*(u: MMask16, a: M512, b: M512, c: M512): M512 {.importc: "_mm512_maskz_fmadd_ps".}

func mm512_fmsub_pd*(a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_fmsub_pd".}

func mm512_mask_fmsub_pd*(a: M512d, u: MMask8, b: M512d, c: M512d): M512d {.importc: "_mm512_mask_fmsub_pd".}

func mm512_mask3_fmsub_pd*(a: M512d, b: M512d, c: M512d, u: MMask8): M512d {.importc: "_mm512_mask3_fmsub_pd".}

func mm512_maskz_fmsub_pd*(u: MMask8, a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_maskz_fmsub_pd".}

func mm512_fmsub_ps*(a: M512, b: M512, c: M512): M512 {.importc: "_mm512_fmsub_ps".}

func mm512_mask_fmsub_ps*(a: M512, u: MMask16, b: M512, c: M512): M512 {.importc: "_mm512_mask_fmsub_ps".}

func mm512_mask3_fmsub_ps*(a: M512, b: M512, c: M512, u: MMask16): M512 {.importc: "_mm512_mask3_fmsub_ps".}

func mm512_maskz_fmsub_ps*(u: MMask16, a: M512, b: M512, c: M512): M512 {.importc: "_mm512_maskz_fmsub_ps".}

func mm512_fmaddsub_pd*(a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_fmaddsub_pd".}

func mm512_mask_fmaddsub_pd*(a: M512d, u: MMask8, b: M512d, c: M512d): M512d {.importc: "_mm512_mask_fmaddsub_pd".}

func mm512_mask3_fmaddsub_pd*(a: M512d, b: M512d, c: M512d, u: MMask8): M512d {.importc: "_mm512_mask3_fmaddsub_pd".}

func mm512_maskz_fmaddsub_pd*(u: MMask8, a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_maskz_fmaddsub_pd".}

func mm512_fmaddsub_ps*(a: M512, b: M512, c: M512): M512 {.importc: "_mm512_fmaddsub_ps".}

func mm512_mask_fmaddsub_ps*(a: M512, u: MMask16, b: M512, c: M512): M512 {.importc: "_mm512_mask_fmaddsub_ps".}

func mm512_mask3_fmaddsub_ps*(a: M512, b: M512, c: M512, u: MMask16): M512 {.importc: "_mm512_mask3_fmaddsub_ps".}

func mm512_maskz_fmaddsub_ps*(u: MMask16, a: M512, b: M512, c: M512): M512 {.importc: "_mm512_maskz_fmaddsub_ps".}

func mm512_fmsubadd_pd*(a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_fmsubadd_pd".}

func mm512_mask_fmsubadd_pd*(a: M512d, u: MMask8, b: M512d, c: M512d): M512d {.importc: "_mm512_mask_fmsubadd_pd".}

func mm512_mask3_fmsubadd_pd*(a: M512d, b: M512d, c: M512d, u: MMask8): M512d {.importc: "_mm512_mask3_fmsubadd_pd".}

func mm512_maskz_fmsubadd_pd*(u: MMask8, a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_maskz_fmsubadd_pd".}

func mm512_fmsubadd_ps*(a: M512, b: M512, c: M512): M512 {.importc: "_mm512_fmsubadd_ps".}

func mm512_mask_fmsubadd_ps*(a: M512, u: MMask16, b: M512, c: M512): M512 {.importc: "_mm512_mask_fmsubadd_ps".}

func mm512_mask3_fmsubadd_ps*(a: M512, b: M512, c: M512, u: MMask16): M512 {.importc: "_mm512_mask3_fmsubadd_ps".}

func mm512_maskz_fmsubadd_ps*(u: MMask16, a: M512, b: M512, c: M512): M512 {.importc: "_mm512_maskz_fmsubadd_ps".}

func mm512_fnmadd_pd*(a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_fnmadd_pd".}

func mm512_mask_fnmadd_pd*(a: M512d, u: MMask8, b: M512d, c: M512d): M512d {.importc: "_mm512_mask_fnmadd_pd".}

func mm512_mask3_fnmadd_pd*(a: M512d, b: M512d, c: M512d, u: MMask8): M512d {.importc: "_mm512_mask3_fnmadd_pd".}

func mm512_maskz_fnmadd_pd*(u: MMask8, a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_maskz_fnmadd_pd".}

func mm512_fnmadd_ps*(a: M512, b: M512, c: M512): M512 {.importc: "_mm512_fnmadd_ps".}

func mm512_mask_fnmadd_ps*(a: M512, u: MMask16, b: M512, c: M512): M512 {.importc: "_mm512_mask_fnmadd_ps".}

func mm512_mask3_fnmadd_ps*(a: M512, b: M512, c: M512, u: MMask16): M512 {.importc: "_mm512_mask3_fnmadd_ps".}

func mm512_maskz_fnmadd_ps*(u: MMask16, a: M512, b: M512, c: M512): M512 {.importc: "_mm512_maskz_fnmadd_ps".}

func mm512_fnmsub_pd*(a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_fnmsub_pd".}

func mm512_mask_fnmsub_pd*(a: M512d, u: MMask8, b: M512d, c: M512d): M512d {.importc: "_mm512_mask_fnmsub_pd".}

func mm512_mask3_fnmsub_pd*(a: M512d, b: M512d, c: M512d, u: MMask8): M512d {.importc: "_mm512_mask3_fnmsub_pd".}

func mm512_maskz_fnmsub_pd*(u: MMask8, a: M512d, b: M512d, c: M512d): M512d {.importc: "_mm512_maskz_fnmsub_pd".}

func mm512_fnmsub_ps*(a: M512, b: M512, c: M512): M512 {.importc: "_mm512_fnmsub_ps".}

func mm512_mask_fnmsub_ps*(a: M512, u: MMask16, b: M512, c: M512): M512 {.importc: "_mm512_mask_fnmsub_ps".}

func mm512_mask3_fnmsub_ps*(a: M512, b: M512, c: M512, u: MMask16): M512 {.importc: "_mm512_mask3_fnmsub_ps".}

func mm512_maskz_fnmsub_ps*(u: MMask16, a: M512, b: M512, c: M512): M512 {.importc: "_mm512_maskz_fnmsub_ps".}

func mm512_cvttpd_epi32*(a: M512d): M256i {.importc: "_mm512_cvttpd_epi32".}

func mm512_mask_cvttpd_epi32*(w: M256i, u: MMask8, a: M512d): M256i {.importc: "_mm512_mask_cvttpd_epi32".}

func mm512_maskz_cvttpd_epi32*(u: MMask8, a: M512d): M256i {.importc: "_mm512_maskz_cvttpd_epi32".}

func mm512_cvttpd_epu32*(a: M512d): M256i {.importc: "_mm512_cvttpd_epu32".}

func mm512_mask_cvttpd_epu32*(w: M256i, u: MMask8, a: M512d): M256i {.importc: "_mm512_mask_cvttpd_epu32".}

func mm512_maskz_cvttpd_epu32*(u: MMask8, a: M512d): M256i {.importc: "_mm512_maskz_cvttpd_epu32".}

func mm512_cvtpd_epi32*(a: M512d): M256i {.importc: "_mm512_cvtpd_epi32".}

func mm512_mask_cvtpd_epi32*(w: M256i, u: MMask8, a: M512d): M256i {.importc: "_mm512_mask_cvtpd_epi32".}

func mm512_maskz_cvtpd_epi32*(u: MMask8, a: M512d): M256i {.importc: "_mm512_maskz_cvtpd_epi32".}

func mm512_cvtpd_epu32*(a: M512d): M256i {.importc: "_mm512_cvtpd_epu32".}

func mm512_mask_cvtpd_epu32*(w: M256i, u: MMask8, a: M512d): M256i {.importc: "_mm512_mask_cvtpd_epu32".}

func mm512_maskz_cvtpd_epu32*(u: MMask8, a: M512d): M256i {.importc: "_mm512_maskz_cvtpd_epu32".}

func mm512_cvttps_epi32*(a: M512): M512i {.importc: "_mm512_cvttps_epi32".}

func mm512_mask_cvttps_epi32*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_cvttps_epi32".}

func mm512_maskz_cvttps_epi32*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_cvttps_epi32".}

func mm512_cvttps_epu32*(a: M512): M512i {.importc: "_mm512_cvttps_epu32".}

func mm512_mask_cvttps_epu32*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_cvttps_epu32".}

func mm512_maskz_cvttps_epu32*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_cvttps_epu32".}

func mm512_cvtps_epi32*(a: M512): M512i {.importc: "_mm512_cvtps_epi32".}

func mm512_mask_cvtps_epi32*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_cvtps_epi32".}

func mm512_maskz_cvtps_epi32*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_cvtps_epi32".}

func mm512_cvtps_epu32*(a: M512): M512i {.importc: "_mm512_cvtps_epu32".}

func mm512_mask_cvtps_epu32*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_cvtps_epu32".}

func mm512_maskz_cvtps_epu32*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_cvtps_epu32".}

func mm512_cvtsd_f64*(a: M512d): float64 {.importc: "_mm512_cvtsd_f64".}

func mm512_cvtss_f32*(a: M512): float32 {.importc: "_mm512_cvtss_f32".}

func mm512_cvtepi32_ps*(a: M512i): M512 {.importc: "_mm512_cvtepi32_ps".}

func mm512_mask_cvtepi32_ps*(w: M512, u: MMask16, a: M512i): M512 {.importc: "_mm512_mask_cvtepi32_ps".}

func mm512_maskz_cvtepi32_ps*(u: MMask16, a: M512i): M512 {.importc: "_mm512_maskz_cvtepi32_ps".}

func mm512_cvtepu32_ps*(a: M512i): M512 {.importc: "_mm512_cvtepu32_ps".}

func mm512_mask_cvtepu32_ps*(w: M512, u: MMask16, a: M512i): M512 {.importc: "_mm512_mask_cvtepu32_ps".}

func mm512_maskz_cvtepu32_ps*(u: MMask16, a: M512i): M512 {.importc: "_mm512_maskz_cvtepu32_ps".}

func mm512_fixupimm_pd*(a: M512d, b: M512d, c: M512i, imm: int32): M512d {.importc: "_mm512_fixupimm_pd".}

func mm512_mask_fixupimm_pd*(a: M512d, u: MMask8, b: M512d, c: M512i, imm: int32): M512d {.importc: "_mm512_mask_fixupimm_pd".}

func mm512_maskz_fixupimm_pd*(u: MMask8, a: M512d, b: M512d, c: M512i, imm: int32): M512d {.importc: "_mm512_maskz_fixupimm_pd".}

func mm512_fixupimm_ps*(a: M512, b: M512, c: M512i, imm: int32): M512 {.importc: "_mm512_fixupimm_ps".}

func mm512_mask_fixupimm_ps*(a: M512, u: MMask16, b: M512, c: M512i, imm: int32): M512 {.importc: "_mm512_mask_fixupimm_ps".}

func mm512_maskz_fixupimm_ps*(u: MMask16, a: M512, b: M512, c: M512i, imm: int32): M512 {.importc: "_mm512_maskz_fixupimm_ps".}

## [Macro Original]
## #define _mm512_fixupimm_pd(X, Y, Z, C)					\
## ((__m512d)__builtin_ia32_fixupimmpd512_mask ((__v8df)(__m512d)(X),	\
## (__v8df)(__m512d)(Y), (__v8di)(__m512i)(Z), (int)(C),		\
## (__mmask8)(-1), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_fixupimm_pd(X, U, Y, Z, C)                          \
## ((__m512d)__builtin_ia32_fixupimmpd512_mask ((__v8df)(__m512d)(X),    \
## (__v8df)(__m512d)(Y), (__v8di)(__m512i)(Z), (int)(C),             \
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_fixupimm_pd(U, X, Y, Z, C)                         \
## ((__m512d)__builtin_ia32_fixupimmpd512_maskz ((__v8df)(__m512d)(X),   \
## (__v8df)(__m512d)(Y), (__v8di)(__m512i)(Z), (int)(C),             \
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_fixupimm_ps(X, Y, Z, C)					\
## ((__m512)__builtin_ia32_fixupimmps512_mask ((__v16sf)(__m512)(X),	\
## (__v16sf)(__m512)(Y), (__v16si)(__m512i)(Z), (int)(C),		\
## (__mmask16)(-1), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_fixupimm_ps(X, U, Y, Z, C)                          \
## ((__m512)__builtin_ia32_fixupimmps512_mask ((__v16sf)(__m512)(X),     \
## (__v16sf)(__m512)(Y), (__v16si)(__m512i)(Z), (int)(C),              \
## (__mmask16)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_fixupimm_ps(U, X, Y, Z, C)                         \
## ((__m512)__builtin_ia32_fixupimmps512_maskz ((__v16sf)(__m512)(X),    \
## (__v16sf)(__m512)(Y), (__v16si)(__m512i)(Z), (int)(C),              \
## (__mmask16)(U), _MM_FROUND_CUR_DIRECTION))

func mm512_cvtsi512_si32*(a: M512i): int32 {.importc: "_mm512_cvtsi512_si32".}

func mm512_cvtps_pd*(a: M256): M512d {.importc: "_mm512_cvtps_pd".}

func mm512_mask_cvtps_pd*(w: M512d, u: MMask8, a: M256): M512d {.importc: "_mm512_mask_cvtps_pd".}

func mm512_maskz_cvtps_pd*(u: MMask8, a: M256): M512d {.importc: "_mm512_maskz_cvtps_pd".}

func mm512_cvtph_ps*(a: M256i): M512 {.importc: "_mm512_cvtph_ps".}

func mm512_mask_cvtph_ps*(w: M512, u: MMask16, a: M256i): M512 {.importc: "_mm512_mask_cvtph_ps".}

func mm512_maskz_cvtph_ps*(u: MMask16, a: M256i): M512 {.importc: "_mm512_maskz_cvtph_ps".}

func mm512_cvtpd_ps*(a: M512d): M256 {.importc: "_mm512_cvtpd_ps".}

func mm512_mask_cvtpd_ps*(w: M256, u: MMask8, a: M512d): M256 {.importc: "_mm512_mask_cvtpd_ps".}

func mm512_maskz_cvtpd_ps*(u: MMask8, a: M512d): M256 {.importc: "_mm512_maskz_cvtpd_ps".}

func mm512_getexp_ps*(a: M512): M512 {.importc: "_mm512_getexp_ps".}

func mm512_mask_getexp_ps*(w: M512, u: MMask16, a: M512): M512 {.importc: "_mm512_mask_getexp_ps".}

func mm512_maskz_getexp_ps*(u: MMask16, a: M512): M512 {.importc: "_mm512_maskz_getexp_ps".}

func mm512_getexp_pd*(a: M512d): M512d {.importc: "_mm512_getexp_pd".}

func mm512_mask_getexp_pd*(w: M512d, u: MMask8, a: M512d): M512d {.importc: "_mm512_mask_getexp_pd".}

func mm512_maskz_getexp_pd*(u: MMask8, a: M512d): M512d {.importc: "_mm512_maskz_getexp_pd".}

func mm512_getmant_pd*(a: M512d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512d {.importc: "_mm512_getmant_pd".}

func mm512_mask_getmant_pd*(w: M512d, u: MMask8, a: M512d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512d {.importc: "_mm512_mask_getmant_pd".}

func mm512_maskz_getmant_pd*(u: MMask8, a: M512d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512d {.importc: "_mm512_maskz_getmant_pd".}

func mm512_getmant_ps*(a: M512, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512 {.importc: "_mm512_getmant_ps".}

func mm512_mask_getmant_ps*(w: M512, u: MMask16, a: M512, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512 {.importc: "_mm512_mask_getmant_ps".}

func mm512_maskz_getmant_ps*(u: MMask16, a: M512, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512 {.importc: "_mm512_maskz_getmant_ps".}

## [Macro Original]
## #define _mm512_getmant_pd(X, B, C)                                                  \
## ((__m512d)__builtin_ia32_getmantpd512_mask ((__v8df)(__m512d)(X),                 \
## (int)(((C)<<2) | (B)),                \
## (__v8df)_mm512_undefined_pd(),        \
## (__mmask8)-1,\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_getmant_pd(W, U, X, B, C)                                       \
## ((__m512d)__builtin_ia32_getmantpd512_mask ((__v8df)(__m512d)(X),                 \
## (int)(((C)<<2) | (B)),                \
## (__v8df)(__m512d)(W),                 \
## (__mmask8)(U),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_getmant_pd(U, X, B, C)                                         \
## ((__m512d)__builtin_ia32_getmantpd512_mask ((__v8df)(__m512d)(X),                 \
## (int)(((C)<<2) | (B)),                \
## (__v8df)_mm512_setzero_pd(),          \
## (__mmask8)(U),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_getmant_ps(X, B, C)                                                  \
## ((__m512)__builtin_ia32_getmantps512_mask ((__v16sf)(__m512)(X),                  \
## (int)(((C)<<2) | (B)),                 \
## (__v16sf)_mm512_undefined_ps(),        \
## (__mmask16)-1,\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_getmant_ps(W, U, X, B, C)                                       \
## ((__m512)__builtin_ia32_getmantps512_mask ((__v16sf)(__m512)(X),                  \
## (int)(((C)<<2) | (B)),                 \
## (__v16sf)(__m512)(W),                  \
## (__mmask16)(U),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_getmant_ps(U, X, B, C)                                         \
## ((__m512)__builtin_ia32_getmantps512_mask ((__v16sf)(__m512)(X),                  \
## (int)(((C)<<2) | (B)),                 \
## (__v16sf)_mm512_setzero_ps(),          \
## (__mmask16)(U),\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_getexp_ps(A)						\
## ((__m512)__builtin_ia32_getexpps512_mask((__v16sf)(__m512)(A),		\
## (__v16sf)_mm512_undefined_ps(), (__mmask16)-1, _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_getexp_ps(W, U, A)					\
## ((__m512)__builtin_ia32_getexpps512_mask((__v16sf)(__m512)(A),		\
## (__v16sf)(__m512)(W), (__mmask16)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_getexp_ps(U, A)					\
## ((__m512)__builtin_ia32_getexpps512_mask((__v16sf)(__m512)(A),		\
## (__v16sf)_mm512_setzero_ps(), (__mmask16)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_getexp_pd(A)						\
## ((__m512d)__builtin_ia32_getexppd512_mask((__v8df)(__m512d)(A),		\
## (__v8df)_mm512_undefined_pd(), (__mmask8)-1, _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_getexp_pd(W, U, A)					\
## ((__m512d)__builtin_ia32_getexppd512_mask((__v8df)(__m512d)(A),		\
## (__v8df)(__m512d)(W), (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_getexp_pd(U, A)					\
## ((__m512d)__builtin_ia32_getexppd512_mask((__v8df)(__m512d)(A),		\
## (__v8df)_mm512_setzero_pd(), (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

func mm512_roundscale_ps*(a: M512, imm: int32): M512 {.importc: "_mm512_roundscale_ps".}

func mm512_mask_roundscale_ps*(a: M512, b: MMask16, c: M512, imm: int32): M512 {.importc: "_mm512_mask_roundscale_ps".}

func mm512_maskz_roundscale_ps*(a: MMask16, b: M512, imm: int32): M512 {.importc: "_mm512_maskz_roundscale_ps".}

func mm512_roundscale_pd*(a: M512d, imm: int32): M512d {.importc: "_mm512_roundscale_pd".}

func mm512_mask_roundscale_pd*(a: M512d, b: MMask8, c: M512d, imm: int32): M512d {.importc: "_mm512_mask_roundscale_pd".}

func mm512_maskz_roundscale_pd*(a: MMask8, b: M512d, imm: int32): M512d {.importc: "_mm512_maskz_roundscale_pd".}

## [Macro Original]
## #define _mm512_roundscale_ps(A, B) \
## ((__m512) __builtin_ia32_rndscaleps_mask ((__v16sf)(__m512)(A), (int)(B),\
## (__v16sf)_mm512_undefined_ps(), (__mmask16)(-1), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_roundscale_ps(A, B, C, D)				\
## ((__m512) __builtin_ia32_rndscaleps_mask ((__v16sf)(__m512)(C),	\
## (int)(D),			\
## (__v16sf)(__m512)(A),	\
## (__mmask16)(B), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_roundscale_ps(A, B, C)				\
## ((__m512) __builtin_ia32_rndscaleps_mask ((__v16sf)(__m512)(B),	\
## (int)(C),			\
## (__v16sf)_mm512_setzero_ps(),\
## (__mmask16)(A), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_roundscale_pd(A, B) \
## ((__m512d) __builtin_ia32_rndscalepd_mask ((__v8df)(__m512d)(A), (int)(B),\
## (__v8df)_mm512_undefined_pd(), (__mmask8)(-1), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_roundscale_pd(A, B, C, D)				\
## ((__m512d) __builtin_ia32_rndscalepd_mask ((__v8df)(__m512d)(C),	\
## (int)(D),			\
## (__v8df)(__m512d)(A),	\
## (__mmask8)(B), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_roundscale_pd(A, B, C)				\
## ((__m512d) __builtin_ia32_rndscalepd_mask ((__v8df)(__m512d)(B),	\
## (int)(C),			\
## (__v8df)_mm512_setzero_pd(),\
## (__mmask8)(A), _MM_FROUND_CUR_DIRECTION))

func mm512_cmp_pd_mask*(x: M512d, y: M512d, p: int32): MMask8 {.importc: "_mm512_cmp_pd_mask".}

func mm512_cmp_ps_mask*(x: M512, y: M512, p: int32): MMask16 {.importc: "_mm512_cmp_ps_mask".}

func mm512_mask_cmp_ps_mask*(u: MMask16, x: M512, y: M512, p: int32): MMask16 {.importc: "_mm512_mask_cmp_ps_mask".}

func mm512_mask_cmp_pd_mask*(u: MMask8, x: M512d, y: M512d, p: int32): MMask8 {.importc: "_mm512_mask_cmp_pd_mask".}

## [Macro Original]
## #define _mm512_cmp_pd_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmppd512_mask ((__v8df)(__m512d)(X),	\
## (__v8df)(__m512d)(Y), (int)(P),\
## (__mmask8)-1,_MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_cmp_ps_mask(X, Y, P)					\
## ((__mmask16) __builtin_ia32_cmpps512_mask ((__v16sf)(__m512)(X),	\
## (__v16sf)(__m512)(Y), (int)(P),\
## (__mmask16)-1,_MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_cmp_pd_mask(M, X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmppd512_mask ((__v8df)(__m512d)(X),	\
## (__v8df)(__m512d)(Y), (int)(P),\
## (__mmask8)(M), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_cmp_ps_mask(M, X, Y, P)					\
## ((__mmask16) __builtin_ia32_cmpps512_mask ((__v16sf)(__m512)(X),	\
## (__v16sf)(__m512)(Y), (int)(P),\
## (__mmask16)(M),_MM_FROUND_CUR_DIRECTION))

func mm512_cmpeq_pd_mask*(x: M512d, y: M512d): MMask8 {.importc: "_mm512_cmpeq_pd_mask".}

func mm512_mask_cmpeq_pd_mask*(u: MMask8, x: M512d, y: M512d): MMask8 {.importc: "_mm512_mask_cmpeq_pd_mask".}

func mm512_cmplt_pd_mask*(x: M512d, y: M512d): MMask8 {.importc: "_mm512_cmplt_pd_mask".}

func mm512_mask_cmplt_pd_mask*(u: MMask8, x: M512d, y: M512d): MMask8 {.importc: "_mm512_mask_cmplt_pd_mask".}

func mm512_cmple_pd_mask*(x: M512d, y: M512d): MMask8 {.importc: "_mm512_cmple_pd_mask".}

func mm512_mask_cmple_pd_mask*(u: MMask8, x: M512d, y: M512d): MMask8 {.importc: "_mm512_mask_cmple_pd_mask".}

func mm512_cmpunord_pd_mask*(x: M512d, y: M512d): MMask8 {.importc: "_mm512_cmpunord_pd_mask".}

func mm512_mask_cmpunord_pd_mask*(u: MMask8, x: M512d, y: M512d): MMask8 {.importc: "_mm512_mask_cmpunord_pd_mask".}

func mm512_cmpneq_pd_mask*(x: M512d, y: M512d): MMask8 {.importc: "_mm512_cmpneq_pd_mask".}

func mm512_mask_cmpneq_pd_mask*(u: MMask8, x: M512d, y: M512d): MMask8 {.importc: "_mm512_mask_cmpneq_pd_mask".}

func mm512_cmpnlt_pd_mask*(x: M512d, y: M512d): MMask8 {.importc: "_mm512_cmpnlt_pd_mask".}

func mm512_mask_cmpnlt_pd_mask*(u: MMask8, x: M512d, y: M512d): MMask8 {.importc: "_mm512_mask_cmpnlt_pd_mask".}

func mm512_cmpnle_pd_mask*(x: M512d, y: M512d): MMask8 {.importc: "_mm512_cmpnle_pd_mask".}

func mm512_mask_cmpnle_pd_mask*(u: MMask8, x: M512d, y: M512d): MMask8 {.importc: "_mm512_mask_cmpnle_pd_mask".}

func mm512_cmpord_pd_mask*(x: M512d, y: M512d): MMask8 {.importc: "_mm512_cmpord_pd_mask".}

func mm512_mask_cmpord_pd_mask*(u: MMask8, x: M512d, y: M512d): MMask8 {.importc: "_mm512_mask_cmpord_pd_mask".}

func mm512_cmpeq_ps_mask*(x: M512, y: M512): MMask16 {.importc: "_mm512_cmpeq_ps_mask".}

func mm512_mask_cmpeq_ps_mask*(u: MMask16, x: M512, y: M512): MMask16 {.importc: "_mm512_mask_cmpeq_ps_mask".}

func mm512_cmplt_ps_mask*(x: M512, y: M512): MMask16 {.importc: "_mm512_cmplt_ps_mask".}

func mm512_mask_cmplt_ps_mask*(u: MMask16, x: M512, y: M512): MMask16 {.importc: "_mm512_mask_cmplt_ps_mask".}

func mm512_cmple_ps_mask*(x: M512, y: M512): MMask16 {.importc: "_mm512_cmple_ps_mask".}

func mm512_mask_cmple_ps_mask*(u: MMask16, x: M512, y: M512): MMask16 {.importc: "_mm512_mask_cmple_ps_mask".}

func mm512_cmpunord_ps_mask*(x: M512, y: M512): MMask16 {.importc: "_mm512_cmpunord_ps_mask".}

func mm512_mask_cmpunord_ps_mask*(u: MMask16, x: M512, y: M512): MMask16 {.importc: "_mm512_mask_cmpunord_ps_mask".}

func mm512_cmpneq_ps_mask*(x: M512, y: M512): MMask16 {.importc: "_mm512_cmpneq_ps_mask".}

func mm512_mask_cmpneq_ps_mask*(u: MMask16, x: M512, y: M512): MMask16 {.importc: "_mm512_mask_cmpneq_ps_mask".}

func mm512_cmpnlt_ps_mask*(x: M512, y: M512): MMask16 {.importc: "_mm512_cmpnlt_ps_mask".}

func mm512_mask_cmpnlt_ps_mask*(u: MMask16, x: M512, y: M512): MMask16 {.importc: "_mm512_mask_cmpnlt_ps_mask".}

func mm512_cmpnle_ps_mask*(x: M512, y: M512): MMask16 {.importc: "_mm512_cmpnle_ps_mask".}

func mm512_mask_cmpnle_ps_mask*(u: MMask16, x: M512, y: M512): MMask16 {.importc: "_mm512_mask_cmpnle_ps_mask".}

func mm512_cmpord_ps_mask*(x: M512, y: M512): MMask16 {.importc: "_mm512_cmpord_ps_mask".}

func mm512_mask_cmpord_ps_mask*(u: MMask16, x: M512, y: M512): MMask16 {.importc: "_mm512_mask_cmpord_ps_mask".}

func mm512_kmov*(a: MMask16): MMask16 {.importc: "_mm512_kmov".}

func mm512_castpd_ps*(a: M512d): M512 {.importc: "_mm512_castpd_ps".}

func mm512_castpd_si512*(a: M512d): M512i {.importc: "_mm512_castpd_si512".}

func mm512_castps_pd*(a: M512): M512d {.importc: "_mm512_castps_pd".}

func mm512_castps_si512*(a: M512): M512i {.importc: "_mm512_castps_si512".}

func mm512_castsi512_ps*(a: M512i): M512 {.importc: "_mm512_castsi512_ps".}

func mm512_castsi512_pd*(a: M512i): M512d {.importc: "_mm512_castsi512_pd".}

func mm512_castpd512_pd128*(a: M512d): M128d {.importc: "_mm512_castpd512_pd128".}

func mm512_castps512_ps128*(a: M512): M128 {.importc: "_mm512_castps512_ps128".}

func mm512_castsi512_si128*(a: M512i): M128i {.importc: "_mm512_castsi512_si128".}

func mm512_castpd512_pd256*(a: M512d): M256d {.importc: "_mm512_castpd512_pd256".}

func mm512_castps512_ps256*(a: M512): M256 {.importc: "_mm512_castps512_ps256".}

func mm512_castsi512_si256*(a: M512i): M256i {.importc: "_mm512_castsi512_si256".}

func mm512_castpd128_pd512*(a: M128d): M512d {.importc: "_mm512_castpd128_pd512".}

func mm512_castps128_ps512*(a: M128): M512 {.importc: "_mm512_castps128_ps512".}

func mm512_castsi128_si512*(a: M128i): M512i {.importc: "_mm512_castsi128_si512".}

func mm512_castpd256_pd512*(a: M256d): M512d {.importc: "_mm512_castpd256_pd512".}

func mm512_castps256_ps512*(a: M256): M512 {.importc: "_mm512_castps256_ps512".}

func mm512_castsi256_si512*(a: M256i): M512i {.importc: "_mm512_castsi256_si512".}

func mm512_zextpd128_pd512*(a: M128d): M512d {.importc: "_mm512_zextpd128_pd512".}

func mm512_zextps128_ps512*(a: M128): M512 {.importc: "_mm512_zextps128_ps512".}

func mm512_zextsi128_si512*(a: M128i): M512i {.importc: "_mm512_zextsi128_si512".}

func mm512_zextpd256_pd512*(a: M256d): M512d {.importc: "_mm512_zextpd256_pd512".}

func mm512_zextps256_ps512*(a: M256): M512 {.importc: "_mm512_zextps256_ps512".}

func mm512_zextsi256_si512*(a: M256i): M512i {.importc: "_mm512_zextsi256_si512".}

func mm512_cmpeq_epu32_mask*(a: M512i, b: M512i): MMask16 {.importc: "_mm512_cmpeq_epu32_mask".}

func mm512_mask_cmpeq_epu32_mask*(u: MMask16, a: M512i, b: M512i): MMask16 {.importc: "_mm512_mask_cmpeq_epu32_mask".}

func mm512_mask_cmpeq_epu64_mask*(u: MMask8, a: M512i, b: M512i): MMask8 {.importc: "_mm512_mask_cmpeq_epu64_mask".}

func mm512_cmpeq_epu64_mask*(a: M512i, b: M512i): MMask8 {.importc: "_mm512_cmpeq_epu64_mask".}

func mm512_cmpgt_epu32_mask*(a: M512i, b: M512i): MMask16 {.importc: "_mm512_cmpgt_epu32_mask".}

func mm512_mask_cmpgt_epu32_mask*(u: MMask16, a: M512i, b: M512i): MMask16 {.importc: "_mm512_mask_cmpgt_epu32_mask".}

func mm512_mask_cmpgt_epu64_mask*(u: MMask8, a: M512i, b: M512i): MMask8 {.importc: "_mm512_mask_cmpgt_epu64_mask".}

func mm512_cmpgt_epu64_mask*(a: M512i, b: M512i): MMask8 {.importc: "_mm512_cmpgt_epu64_mask".}

## [Macro Original]
## #define __MM512_REDUCE_OP(op) \
## __v8si __T1 = (__v8si) _mm512_extracti64x4_epi64 (__A, 1);		\
## __v8si __T2 = (__v8si) _mm512_extracti64x4_epi64 (__A, 0);		\
## __m256i __T3 = (__m256i) (__T1 op __T2);				\
## __v4si __T4 = (__v4si) _mm256_extracti128_si256 (__T3, 1);		\
## __v4si __T5 = (__v4si) _mm256_extracti128_si256 (__T3, 0);		\
## __v4si __T6 = __T4 op __T5;						\
## __v4si __T7 = __builtin_shuffle (__T6, (__v4si) { 2, 3, 0, 1 });	\
## __v4si __T8 = __T6 op __T7;						\
## return __T8[0] op __T8[1]

func mm512_reduce_add_epi32*(a: M512i): int32 {.importc: "_mm512_reduce_add_epi32".}

func mm512_reduce_mul_epi32*(a: M512i): int32 {.importc: "_mm512_reduce_mul_epi32".}

func mm512_reduce_and_epi32*(a: M512i): int32 {.importc: "_mm512_reduce_and_epi32".}

func mm512_reduce_or_epi32*(a: M512i): int32 {.importc: "_mm512_reduce_or_epi32".}

func mm512_mask_reduce_add_epi32*(u: MMask16, a: M512i): int32 {.importc: "_mm512_mask_reduce_add_epi32".}

func mm512_mask_reduce_mul_epi32*(u: MMask16, a: M512i): int32 {.importc: "_mm512_mask_reduce_mul_epi32".}

func mm512_mask_reduce_and_epi32*(u: MMask16, a: M512i): int32 {.importc: "_mm512_mask_reduce_and_epi32".}

func mm512_mask_reduce_or_epi32*(u: MMask16, a: M512i): int32 {.importc: "_mm512_mask_reduce_or_epi32".}

## [Macro Original]
## #define __MM512_REDUCE_OP(op) \
## __m256i __T1 = (__m256i) _mm512_extracti64x4_epi64 (__A, 1);		\
## __m256i __T2 = (__m256i) _mm512_extracti64x4_epi64 (__A, 0);		\
## __m256i __T3 = _mm256_##op (__T1, __T2);				\
## __m128i __T4 = (__m128i) _mm256_extracti128_si256 (__T3, 1);		\
## __m128i __T5 = (__m128i) _mm256_extracti128_si256 (__T3, 0);		\
## __m128i __T6 = _mm_##op (__T4, __T5);					\
## __m128i __T7 = (__m128i) __builtin_shuffle ((__v4si) __T6,		\
## (__v4si) { 2, 3, 0, 1 });	\
## __m128i __T8 = _mm_##op (__T6, __T7);					\
## __m128i __T9 = (__m128i) __builtin_shuffle ((__v4si) __T8,		\
## (__v4si) { 1, 0, 1, 0 });	\
## __v4si __T10 = (__v4si) _mm_##op (__T8, __T9);			\
## return __T10[0]

func mm512_reduce_min_epi32*(a: M512i): int32 {.importc: "_mm512_reduce_min_epi32".}

func mm512_reduce_max_epi32*(a: M512i): int32 {.importc: "_mm512_reduce_max_epi32".}

func mm512_reduce_min_epu32*(a: M512i): uint32 {.importc: "_mm512_reduce_min_epu32".}

func mm512_reduce_max_epu32*(a: M512i): uint32 {.importc: "_mm512_reduce_max_epu32".}

func mm512_mask_reduce_min_epi32*(u: MMask16, a: M512i): int32 {.importc: "_mm512_mask_reduce_min_epi32".}

func mm512_mask_reduce_max_epi32*(u: MMask16, a: M512i): int32 {.importc: "_mm512_mask_reduce_max_epi32".}

func mm512_mask_reduce_min_epu32*(u: MMask16, a: M512i): uint32 {.importc: "_mm512_mask_reduce_min_epu32".}

func mm512_mask_reduce_max_epu32*(u: MMask16, a: M512i): uint32 {.importc: "_mm512_mask_reduce_max_epu32".}

## [Macro Original]
## #define __MM512_REDUCE_OP(op) \
## __m256 __T1 = (__m256) _mm512_extractf64x4_pd ((__m512d) __A, 1);	\
## __m256 __T2 = (__m256) _mm512_extractf64x4_pd ((__m512d) __A, 0);	\
## __m256 __T3 = __T1 op __T2;						\
## __m128 __T4 = _mm256_extractf128_ps (__T3, 1);			\
## __m128 __T5 = _mm256_extractf128_ps (__T3, 0);			\
## __m128 __T6 = __T4 op __T5;						\
## __m128 __T7 = __builtin_shuffle (__T6, (__v4si) { 2, 3, 0, 1 });	\
## __m128 __T8 = __T6 op __T7;						\
## return __T8[0] op __T8[1]

func mm512_reduce_add_ps*(a: M512): float32 {.importc: "_mm512_reduce_add_ps".}

func mm512_reduce_mul_ps*(a: M512): float32 {.importc: "_mm512_reduce_mul_ps".}

func mm512_mask_reduce_add_ps*(u: MMask16, a: M512): float32 {.importc: "_mm512_mask_reduce_add_ps".}

func mm512_mask_reduce_mul_ps*(u: MMask16, a: M512): float32 {.importc: "_mm512_mask_reduce_mul_ps".}

## [Macro Original]
## #define __MM512_REDUCE_OP(op) \
## __m256 __T1 = (__m256) _mm512_extractf64x4_pd ((__m512d) __A, 1);	\
## __m256 __T2 = (__m256) _mm512_extractf64x4_pd ((__m512d) __A, 0);	\
## __m256 __T3 = _mm256_##op (__T1, __T2);				\
## __m128 __T4 = _mm256_extractf128_ps (__T3, 1);			\
## __m128 __T5 = _mm256_extractf128_ps (__T3, 0);			\
## __m128 __T6 = _mm_##op (__T4, __T5);					\
## __m128 __T7 = __builtin_shuffle (__T6, (__v4si) { 2, 3, 0, 1 });	\
## __m128 __T8 = _mm_##op (__T6, __T7);					\
## __m128 __T9 = __builtin_shuffle (__T8, (__v4si) { 1, 0, 1, 0 });	\
## __m128 __T10 = _mm_##op (__T8, __T9);					\
## return __T10[0]

func mm512_reduce_min_ps*(a: M512): float32 {.importc: "_mm512_reduce_min_ps".}

func mm512_reduce_max_ps*(a: M512): float32 {.importc: "_mm512_reduce_max_ps".}

func mm512_mask_reduce_min_ps*(u: MMask16, a: M512): float32 {.importc: "_mm512_mask_reduce_min_ps".}

func mm512_mask_reduce_max_ps*(u: MMask16, a: M512): float32 {.importc: "_mm512_mask_reduce_max_ps".}

## [Macro Original]
## #define __MM512_REDUCE_OP(op) \
## __v4di __T1 = (__v4di) _mm512_extracti64x4_epi64 (__A, 1);		\
## __v4di __T2 = (__v4di) _mm512_extracti64x4_epi64 (__A, 0);		\
## __m256i __T3 = (__m256i) (__T1 op __T2);				\
## __v2di __T4 = (__v2di) _mm256_extracti128_si256 (__T3, 1);		\
## __v2di __T5 = (__v2di) _mm256_extracti128_si256 (__T3, 0);		\
## __v2di __T6 = __T4 op __T5;						\
## return __T6[0] op __T6[1]

func mm512_reduce_add_epi64*(a: M512i): int64 {.importc: "_mm512_reduce_add_epi64".}

func mm512_reduce_mul_epi64*(a: M512i): int64 {.importc: "_mm512_reduce_mul_epi64".}

func mm512_reduce_and_epi64*(a: M512i): int64 {.importc: "_mm512_reduce_and_epi64".}

func mm512_reduce_or_epi64*(a: M512i): int64 {.importc: "_mm512_reduce_or_epi64".}

func mm512_mask_reduce_add_epi64*(u: MMask8, a: M512i): int64 {.importc: "_mm512_mask_reduce_add_epi64".}

func mm512_mask_reduce_mul_epi64*(u: MMask8, a: M512i): int64 {.importc: "_mm512_mask_reduce_mul_epi64".}

func mm512_mask_reduce_and_epi64*(u: MMask8, a: M512i): int64 {.importc: "_mm512_mask_reduce_and_epi64".}

func mm512_mask_reduce_or_epi64*(u: MMask8, a: M512i): int64 {.importc: "_mm512_mask_reduce_or_epi64".}

## [Macro Original]
## #define __MM512_REDUCE_OP(op) \
## __m512i __T1 = _mm512_shuffle_i64x2 (__A, __A, 0x4e);			\
## __m512i __T2 = _mm512_##op (__A, __T1);				\
## __m512i __T3								\
## = (__m512i) __builtin_shuffle ((__v8di) __T2,			\
## (__v8di) { 2, 3, 0, 1, 6, 7, 4, 5 });\
## __m512i __T4 = _mm512_##op (__T2, __T3);				\
## __m512i __T5								\
## = (__m512i) __builtin_shuffle ((__v8di) __T4,			\
## (__v8di) { 1, 0, 3, 2, 5, 4, 7, 6 });\
## __v8di __T6 = (__v8di) _mm512_##op (__T4, __T5);			\
## return __T6[0]

func mm512_reduce_min_epi64*(a: M512i): int64 {.importc: "_mm512_reduce_min_epi64".}

func mm512_reduce_max_epi64*(a: M512i): int64 {.importc: "_mm512_reduce_max_epi64".}

func mm512_mask_reduce_min_epi64*(u: MMask8, a: M512i): int64 {.importc: "_mm512_mask_reduce_min_epi64".}

func mm512_mask_reduce_max_epi64*(u: MMask8, a: M512i): int64 {.importc: "_mm512_mask_reduce_max_epi64".}

func mm512_reduce_min_epu64*(a: M512i): uint64 {.importc: "_mm512_reduce_min_epu64".}

func mm512_reduce_max_epu64*(a: M512i): uint64 {.importc: "_mm512_reduce_max_epu64".}

func mm512_mask_reduce_min_epu64*(u: MMask8, a: M512i): uint64 {.importc: "_mm512_mask_reduce_min_epu64".}

func mm512_mask_reduce_max_epu64*(u: MMask8, a: M512i): uint64 {.importc: "_mm512_mask_reduce_max_epu64".}

## [Macro Original]
## #define __MM512_REDUCE_OP(op) \
## __m256d __T1 = (__m256d) _mm512_extractf64x4_pd (__A, 1);		\
## __m256d __T2 = (__m256d) _mm512_extractf64x4_pd (__A, 0);		\
## __m256d __T3 = __T1 op __T2;						\
## __m128d __T4 = _mm256_extractf128_pd (__T3, 1);			\
## __m128d __T5 = _mm256_extractf128_pd (__T3, 0);			\
## __m128d __T6 = __T4 op __T5;						\
## return __T6[0] op __T6[1]

func mm512_reduce_add_pd*(a: M512d): float64 {.importc: "_mm512_reduce_add_pd".}

func mm512_reduce_mul_pd*(a: M512d): float64 {.importc: "_mm512_reduce_mul_pd".}

func mm512_mask_reduce_add_pd*(u: MMask8, a: M512d): float64 {.importc: "_mm512_mask_reduce_add_pd".}

func mm512_mask_reduce_mul_pd*(u: MMask8, a: M512d): float64 {.importc: "_mm512_mask_reduce_mul_pd".}

## [Macro Original]
## #define __MM512_REDUCE_OP(op) \
## __m256d __T1 = (__m256d) _mm512_extractf64x4_pd (__A, 1);		\
## __m256d __T2 = (__m256d) _mm512_extractf64x4_pd (__A, 0);		\
## __m256d __T3 = _mm256_##op (__T1, __T2);				\
## __m128d __T4 = _mm256_extractf128_pd (__T3, 1);			\
## __m128d __T5 = _mm256_extractf128_pd (__T3, 0);			\
## __m128d __T6 = _mm_##op (__T4, __T5);					\
## __m128d __T7 = (__m128d) __builtin_shuffle (__T6, (__v2di) { 1, 0 });	\
## __m128d __T8 = _mm_##op (__T6, __T7);					\
## return __T8[0]

func mm512_reduce_min_pd*(a: M512d): float64 {.importc: "_mm512_reduce_min_pd".}

func mm512_reduce_max_pd*(a: M512d): float64 {.importc: "_mm512_reduce_max_pd".}

func mm512_mask_reduce_min_pd*(u: MMask8, a: M512d): float64 {.importc: "_mm512_mask_reduce_min_pd".}

func mm512_mask_reduce_max_pd*(u: MMask8, a: M512d): float64 {.importc: "_mm512_mask_reduce_max_pd".}
