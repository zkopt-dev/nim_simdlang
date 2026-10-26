import avx512f

## [Macro Original]
## #define __AVX512VBMI2INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VBMI2__

func mm512_shrdi_epi16*(a: M512i, b: M512i, c: int32): M512i {.importc: "_mm512_shrdi_epi16".}

func mm512_shrdi_epi32*(a: M512i, b: M512i, c: int32): M512i {.importc: "_mm512_shrdi_epi32".}

func mm512_mask_shrdi_epi32*(a: M512i, b: MMask16, c: M512i, d: M512i, e: int32): M512i {.importc: "_mm512_mask_shrdi_epi32".}

func mm512_maskz_shrdi_epi32*(a: MMask16, b: M512i, c: M512i, d: int32): M512i {.importc: "_mm512_maskz_shrdi_epi32".}

func mm512_shrdi_epi64*(a: M512i, b: M512i, c: int32): M512i {.importc: "_mm512_shrdi_epi64".}

func mm512_mask_shrdi_epi64*(a: M512i, b: MMask8, c: M512i, d: M512i, e: int32): M512i {.importc: "_mm512_mask_shrdi_epi64".}

func mm512_maskz_shrdi_epi64*(a: MMask8, b: M512i, c: M512i, d: int32): M512i {.importc: "_mm512_maskz_shrdi_epi64".}

func mm512_shldi_epi16*(a: M512i, b: M512i, c: int32): M512i {.importc: "_mm512_shldi_epi16".}

func mm512_shldi_epi32*(a: M512i, b: M512i, c: int32): M512i {.importc: "_mm512_shldi_epi32".}

func mm512_mask_shldi_epi32*(a: M512i, b: MMask16, c: M512i, d: M512i, e: int32): M512i {.importc: "_mm512_mask_shldi_epi32".}

func mm512_maskz_shldi_epi32*(a: MMask16, b: M512i, c: M512i, d: int32): M512i {.importc: "_mm512_maskz_shldi_epi32".}

func mm512_shldi_epi64*(a: M512i, b: M512i, c: int32): M512i {.importc: "_mm512_shldi_epi64".}

func mm512_mask_shldi_epi64*(a: M512i, b: MMask8, c: M512i, d: M512i, e: int32): M512i {.importc: "_mm512_mask_shldi_epi64".}

func mm512_maskz_shldi_epi64*(a: MMask8, b: M512i, c: M512i, d: int32): M512i {.importc: "_mm512_maskz_shldi_epi64".}

## [Macro Original]
## #define _mm512_shrdi_epi16(A, B, C) \
## ((__m512i) __builtin_ia32_vpshrd_v32hi ((__v32hi)(__m512i)(A), \
## (__v32hi)(__m512i)(B),(int)(C)))

## [Macro Original]
## #define _mm512_shrdi_epi32(A, B, C) \
## ((__m512i) __builtin_ia32_vpshrd_v16si ((__v16si)(__m512i)(A), \
## (__v16si)(__m512i)(B),(int)(C)))

## [Macro Original]
## #define _mm512_mask_shrdi_epi32(A, B, C, D, E) \
## ((__m512i) __builtin_ia32_vpshrd_v16si_mask ((__v16si)(__m512i)(C), \
## (__v16si)(__m512i)(D), \
## (int)(E),		\
## (__v16si)(__m512i)(A),	\
## (__mmask16)(B)))

## [Macro Original]
## #define _mm512_maskz_shrdi_epi32(A, B, C, D) \
## ((__m512i) \
## __builtin_ia32_vpshrd_v16si_mask ((__v16si)(__m512i)(B),		\
## (__v16si)(__m512i)(C),(int)(D),	\
## (__v16si)(__m512i)_mm512_setzero_si512 (), \
## (__mmask16)(A)))

## [Macro Original]
## #define _mm512_shrdi_epi64(A, B, C) \
## ((__m512i) __builtin_ia32_vpshrd_v8di ((__v8di)(__m512i)(A), \
## (__v8di)(__m512i)(B),(int)(C)))

## [Macro Original]
## #define _mm512_mask_shrdi_epi64(A, B, C, D, E) \
## ((__m512i) __builtin_ia32_vpshrd_v8di_mask ((__v8di)(__m512i)(C), \
## (__v8di)(__m512i)(D), (int)(E), \
## (__v8di)(__m512i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm512_maskz_shrdi_epi64(A, B, C, D) \
## ((__m512i) \
## __builtin_ia32_vpshrd_v8di_mask ((__v8di)(__m512i)(B),		\
## (__v8di)(__m512i)(C),(int)(D),	\
## (__v8di)(__m512i)_mm512_setzero_si512 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm512_shldi_epi16(A, B, C) \
## ((__m512i) __builtin_ia32_vpshld_v32hi ((__v32hi)(__m512i)(A), \
## (__v32hi)(__m512i)(B),(int)(C)))

## [Macro Original]
## #define _mm512_shldi_epi32(A, B, C) \
## ((__m512i) __builtin_ia32_vpshld_v16si ((__v16si)(__m512i)(A),	\
## (__v16si)(__m512i)(B),(int)(C)))

## [Macro Original]
## #define _mm512_mask_shldi_epi32(A, B, C, D, E) \
## ((__m512i) __builtin_ia32_vpshld_v16si_mask ((__v16si)(__m512i)(C), \
## (__v16si)(__m512i)(D), \
## (int)(E),		\
## (__v16si)(__m512i)(A), \
## (__mmask16)(B)))

## [Macro Original]
## #define _mm512_maskz_shldi_epi32(A, B, C, D) \
## ((__m512i) \
## __builtin_ia32_vpshld_v16si_mask ((__v16si)(__m512i)(B),		\
## (__v16si)(__m512i)(C),(int)(D),	\
## (__v16si)(__m512i)_mm512_setzero_si512 (), \
## (__mmask16)(A)))

## [Macro Original]
## #define _mm512_shldi_epi64(A, B, C) \
## ((__m512i) __builtin_ia32_vpshld_v8di ((__v8di)(__m512i)(A), \
## (__v8di)(__m512i)(B), (int)(C)))

## [Macro Original]
## #define _mm512_mask_shldi_epi64(A, B, C, D, E) \
## ((__m512i) __builtin_ia32_vpshld_v8di_mask ((__v8di)(__m512i)(C), \
## (__v8di)(__m512i)(D), (int)(E), \
## (__v8di)(__m512i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm512_maskz_shldi_epi64(A, B, C, D) \
## ((__m512i) \
## __builtin_ia32_vpshld_v8di_mask ((__v8di)(__m512i)(B),		\
## (__v8di)(__m512i)(C),(int)(D),	\
## (__v8di)(__m512i)_mm512_setzero_si512 (), \
## (__mmask8)(A)))

func mm512_shrdv_epi16*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_shrdv_epi16".}

func mm512_shrdv_epi32*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_shrdv_epi32".}

func mm512_mask_shrdv_epi32*(a: M512i, b: MMask16, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_shrdv_epi32".}

func mm512_maskz_shrdv_epi32*(a: MMask16, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_shrdv_epi32".}

func mm512_shrdv_epi64*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_shrdv_epi64".}

func mm512_mask_shrdv_epi64*(a: M512i, b: MMask8, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_shrdv_epi64".}

func mm512_maskz_shrdv_epi64*(a: MMask8, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_shrdv_epi64".}

func mm512_shldv_epi16*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_shldv_epi16".}

func mm512_shldv_epi32*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_shldv_epi32".}

func mm512_mask_shldv_epi32*(a: M512i, b: MMask16, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_shldv_epi32".}

func mm512_maskz_shldv_epi32*(a: MMask16, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_shldv_epi32".}

func mm512_shldv_epi64*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_shldv_epi64".}

func mm512_mask_shldv_epi64*(a: M512i, b: MMask8, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_shldv_epi64".}

func mm512_maskz_shldv_epi64*(a: MMask8, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_shldv_epi64".}

func mm512_mask_compress_epi8*(a: M512i, b: MMask64, c: M512i): M512i {.importc: "_mm512_mask_compress_epi8".}

func mm512_maskz_compress_epi8*(a: MMask64, b: M512i): M512i {.importc: "_mm512_maskz_compress_epi8".}

func mm512_mask_compressstoreu_epi8*(a: pointer, b: MMask64, c: M512i): void {.importc: "_mm512_mask_compressstoreu_epi8".}

func mm512_mask_compress_epi16*(a: M512i, b: MMask32, c: M512i): M512i {.importc: "_mm512_mask_compress_epi16".}

func mm512_maskz_compress_epi16*(a: MMask32, b: M512i): M512i {.importc: "_mm512_maskz_compress_epi16".}

func mm512_mask_compressstoreu_epi16*(a: pointer, b: MMask32, c: M512i): void {.importc: "_mm512_mask_compressstoreu_epi16".}

func mm512_mask_expand_epi8*(a: M512i, b: MMask64, c: M512i): M512i {.importc: "_mm512_mask_expand_epi8".}

func mm512_maskz_expand_epi8*(a: MMask64, b: M512i): M512i {.importc: "_mm512_maskz_expand_epi8".}

func mm512_mask_expandloadu_epi8*(a: M512i, b: MMask64, c: pointer): M512i {.importc: "_mm512_mask_expandloadu_epi8".}

func mm512_maskz_expandloadu_epi8*(a: MMask64, b: pointer): M512i {.importc: "_mm512_maskz_expandloadu_epi8".}

func mm512_mask_expand_epi16*(a: M512i, b: MMask32, c: M512i): M512i {.importc: "_mm512_mask_expand_epi16".}

func mm512_maskz_expand_epi16*(a: MMask32, b: M512i): M512i {.importc: "_mm512_maskz_expand_epi16".}

func mm512_mask_expandloadu_epi16*(a: M512i, b: MMask32, c: pointer): M512i {.importc: "_mm512_mask_expandloadu_epi16".}

func mm512_maskz_expandloadu_epi16*(a: MMask32, b: pointer): M512i {.importc: "_mm512_maskz_expandloadu_epi16".}

func mm512_mask_shrdi_epi16*(a: M512i, b: MMask32, c: M512i, d: M512i, e: int32): M512i {.importc: "_mm512_mask_shrdi_epi16".}

func mm512_maskz_shrdi_epi16*(a: MMask32, b: M512i, c: M512i, d: int32): M512i {.importc: "_mm512_maskz_shrdi_epi16".}

func mm512_mask_shldi_epi16*(a: M512i, b: MMask32, c: M512i, d: M512i, e: int32): M512i {.importc: "_mm512_mask_shldi_epi16".}

func mm512_maskz_shldi_epi16*(a: MMask32, b: M512i, c: M512i, d: int32): M512i {.importc: "_mm512_maskz_shldi_epi16".}

## [Macro Original]
## #define _mm512_mask_shrdi_epi16(A, B, C, D, E) \
## ((__m512i) __builtin_ia32_vpshrd_v32hi_mask ((__v32hi)(__m512i)(C), \
## (__v32hi)(__m512i)(D), \
## (int)(E),		\
## (__v32hi)(__m512i)(A),	\
## (__mmask32)(B)))

## [Macro Original]
## #define _mm512_maskz_shrdi_epi16(A, B, C, D) \
## ((__m512i) \
## __builtin_ia32_vpshrd_v32hi_mask ((__v32hi)(__m512i)(B),		\
## (__v32hi)(__m512i)(C),(int)(D),	\
## (__v32hi)(__m512i)_mm512_setzero_si512 (), \
## (__mmask32)(A)))

## [Macro Original]
## #define _mm512_mask_shldi_epi16(A, B, C, D, E) \
## ((__m512i) __builtin_ia32_vpshld_v32hi_mask ((__v32hi)(__m512i)(C), \
## (__v32hi)(__m512i)(D), \
## (int)(E), \
## (__v32hi)(__m512i)(A),	\
## (__mmask32)(B)))

## [Macro Original]
## #define _mm512_maskz_shldi_epi16(A, B, C, D) \
## ((__m512i) \
## __builtin_ia32_vpshld_v32hi_mask ((__v32hi)(__m512i)(B),		\
## (__v32hi)(__m512i)(C),(int)(D),	\
## (__v32hi)(__m512i)_mm512_setzero_si512 (), \
## (__mmask32)(A)))

func mm512_mask_shrdv_epi16*(a: M512i, b: MMask32, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_shrdv_epi16".}

func mm512_maskz_shrdv_epi16*(a: MMask32, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_shrdv_epi16".}

func mm512_mask_shldv_epi16*(a: M512i, b: MMask32, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_shldv_epi16".}

func mm512_maskz_shldv_epi16*(a: MMask32, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_shldv_epi16".}