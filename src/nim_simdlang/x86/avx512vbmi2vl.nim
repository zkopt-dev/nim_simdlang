import avx512f

## [Macro Original]
## #define _AVX512VBMI2VLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VBMI2VL__

func mm_mask_compress_epi8*(a: M128i, b: MMask16, c: M128i): M128i {.importc: "_mm_mask_compress_epi8".}

func mm_maskz_compress_epi8*(a: MMask16, b: M128i): M128i {.importc: "_mm_maskz_compress_epi8".}

func mm256_mask_compressstoreu_epi16*(a: pointer, b: MMask16, c: M256i): void {.importc: "_mm256_mask_compressstoreu_epi16".}

func mm_mask_compress_epi16*(a: M128i, b: MMask8, c: M128i): M128i {.importc: "_mm_mask_compress_epi16".}

func mm_maskz_compress_epi16*(a: MMask8, b: M128i): M128i {.importc: "_mm_maskz_compress_epi16".}

func mm256_mask_compress_epi16*(a: M256i, b: MMask16, c: M256i): M256i {.importc: "_mm256_mask_compress_epi16".}

func mm256_maskz_compress_epi16*(a: MMask16, b: M256i): M256i {.importc: "_mm256_maskz_compress_epi16".}

func mm_mask_compressstoreu_epi8*(a: pointer, b: MMask16, c: M128i): void {.importc: "_mm_mask_compressstoreu_epi8".}

func mm_mask_compressstoreu_epi16*(a: pointer, b: MMask8, c: M128i): void {.importc: "_mm_mask_compressstoreu_epi16".}

func mm_mask_expand_epi8*(a: M128i, b: MMask16, c: M128i): M128i {.importc: "_mm_mask_expand_epi8".}

func mm_maskz_expand_epi8*(a: MMask16, b: M128i): M128i {.importc: "_mm_maskz_expand_epi8".}

func mm_mask_expandloadu_epi8*(a: M128i, b: MMask16, c: pointer): M128i {.importc: "_mm_mask_expandloadu_epi8".}

func mm_maskz_expandloadu_epi8*(a: MMask16, b: pointer): M128i {.importc: "_mm_maskz_expandloadu_epi8".}

func mm_mask_expand_epi16*(a: M128i, b: MMask8, c: M128i): M128i {.importc: "_mm_mask_expand_epi16".}

func mm_maskz_expand_epi16*(a: MMask8, b: M128i): M128i {.importc: "_mm_maskz_expand_epi16".}

func mm_mask_expandloadu_epi16*(a: M128i, b: MMask8, c: pointer): M128i {.importc: "_mm_mask_expandloadu_epi16".}

func mm_maskz_expandloadu_epi16*(a: MMask8, b: pointer): M128i {.importc: "_mm_maskz_expandloadu_epi16".}

func mm256_mask_expand_epi16*(a: M256i, b: MMask16, c: M256i): M256i {.importc: "_mm256_mask_expand_epi16".}

func mm256_maskz_expand_epi16*(a: MMask16, b: M256i): M256i {.importc: "_mm256_maskz_expand_epi16".}

func mm256_mask_expandloadu_epi16*(a: M256i, b: MMask16, c: pointer): M256i {.importc: "_mm256_mask_expandloadu_epi16".}

func mm256_maskz_expandloadu_epi16*(a: MMask16, b: pointer): M256i {.importc: "_mm256_maskz_expandloadu_epi16".}

func mm256_shrdi_epi16*(a: M256i, b: M256i, c: int32): M256i {.importc: "_mm256_shrdi_epi16".}

func mm256_mask_shrdi_epi16*(a: M256i, b: MMask16, c: M256i, d: M256i, e: int32): M256i {.importc: "_mm256_mask_shrdi_epi16".}

func mm256_maskz_shrdi_epi16*(a: MMask16, b: M256i, c: M256i, d: int32): M256i {.importc: "_mm256_maskz_shrdi_epi16".}

func mm256_mask_shrdi_epi32*(a: M256i, b: MMask8, c: M256i, d: M256i, e: int32): M256i {.importc: "_mm256_mask_shrdi_epi32".}

func mm256_maskz_shrdi_epi32*(a: MMask8, b: M256i, c: M256i, d: int32): M256i {.importc: "_mm256_maskz_shrdi_epi32".}

func mm256_shrdi_epi32*(a: M256i, b: M256i, c: int32): M256i {.importc: "_mm256_shrdi_epi32".}

func mm256_mask_shrdi_epi64*(a: M256i, b: MMask8, c: M256i, d: M256i, e: int32): M256i {.importc: "_mm256_mask_shrdi_epi64".}

func mm256_maskz_shrdi_epi64*(a: MMask8, b: M256i, c: M256i, d: int32): M256i {.importc: "_mm256_maskz_shrdi_epi64".}

func mm256_shrdi_epi64*(a: M256i, b: M256i, c: int32): M256i {.importc: "_mm256_shrdi_epi64".}

func mm_mask_shrdi_epi16*(a: M128i, b: MMask8, c: M128i, d: M128i, e: int32): M128i {.importc: "_mm_mask_shrdi_epi16".}

func mm_maskz_shrdi_epi16*(a: MMask8, b: M128i, c: M128i, d: int32): M128i {.importc: "_mm_maskz_shrdi_epi16".}

func mm_shrdi_epi16*(a: M128i, b: M128i, c: int32): M128i {.importc: "_mm_shrdi_epi16".}

func mm_mask_shrdi_epi32*(a: M128i, b: MMask8, c: M128i, d: M128i, e: int32): M128i {.importc: "_mm_mask_shrdi_epi32".}

func mm_maskz_shrdi_epi32*(a: MMask8, b: M128i, c: M128i, d: int32): M128i {.importc: "_mm_maskz_shrdi_epi32".}

func mm_shrdi_epi32*(a: M128i, b: M128i, c: int32): M128i {.importc: "_mm_shrdi_epi32".}

func mm_mask_shrdi_epi64*(a: M128i, b: MMask8, c: M128i, d: M128i, e: int32): M128i {.importc: "_mm_mask_shrdi_epi64".}

func mm_maskz_shrdi_epi64*(a: MMask8, b: M128i, c: M128i, d: int32): M128i {.importc: "_mm_maskz_shrdi_epi64".}

func mm_shrdi_epi64*(a: M128i, b: M128i, c: int32): M128i {.importc: "_mm_shrdi_epi64".}

func mm256_shldi_epi16*(a: M256i, b: M256i, c: int32): M256i {.importc: "_mm256_shldi_epi16".}

func mm256_mask_shldi_epi16*(a: M256i, b: MMask16, c: M256i, d: M256i, e: int32): M256i {.importc: "_mm256_mask_shldi_epi16".}

func mm256_maskz_shldi_epi16*(a: MMask16, b: M256i, c: M256i, d: int32): M256i {.importc: "_mm256_maskz_shldi_epi16".}

func mm256_mask_shldi_epi32*(a: M256i, b: MMask8, c: M256i, d: M256i, e: int32): M256i {.importc: "_mm256_mask_shldi_epi32".}

func mm256_maskz_shldi_epi32*(a: MMask8, b: M256i, c: M256i, d: int32): M256i {.importc: "_mm256_maskz_shldi_epi32".}

func mm256_shldi_epi32*(a: M256i, b: M256i, c: int32): M256i {.importc: "_mm256_shldi_epi32".}

func mm256_mask_shldi_epi64*(a: M256i, b: MMask8, c: M256i, d: M256i, e: int32): M256i {.importc: "_mm256_mask_shldi_epi64".}

func mm256_maskz_shldi_epi64*(a: MMask8, b: M256i, c: M256i, d: int32): M256i {.importc: "_mm256_maskz_shldi_epi64".}

func mm256_shldi_epi64*(a: M256i, b: M256i, c: int32): M256i {.importc: "_mm256_shldi_epi64".}

func mm_mask_shldi_epi16*(a: M128i, b: MMask8, c: M128i, d: M128i, e: int32): M128i {.importc: "_mm_mask_shldi_epi16".}

func mm_maskz_shldi_epi16*(a: MMask8, b: M128i, c: M128i, d: int32): M128i {.importc: "_mm_maskz_shldi_epi16".}

func mm_shldi_epi16*(a: M128i, b: M128i, c: int32): M128i {.importc: "_mm_shldi_epi16".}

func mm_mask_shldi_epi32*(a: M128i, b: MMask8, c: M128i, d: M128i, e: int32): M128i {.importc: "_mm_mask_shldi_epi32".}

func mm_maskz_shldi_epi32*(a: MMask8, b: M128i, c: M128i, d: int32): M128i {.importc: "_mm_maskz_shldi_epi32".}

func mm_shldi_epi32*(a: M128i, b: M128i, c: int32): M128i {.importc: "_mm_shldi_epi32".}

func mm_mask_shldi_epi64*(a: M128i, b: MMask8, c: M128i, d: M128i, e: int32): M128i {.importc: "_mm_mask_shldi_epi64".}

func mm_maskz_shldi_epi64*(a: MMask8, b: M128i, c: M128i, d: int32): M128i {.importc: "_mm_maskz_shldi_epi64".}

func mm_shldi_epi64*(a: M128i, b: M128i, c: int32): M128i {.importc: "_mm_shldi_epi64".}

## [Macro Original]
## #define _mm256_shrdi_epi16(A, B, C) \
## ((__m256i) __builtin_ia32_vpshrd_v16hi ((__v16hi)(__m256i)(A), \
## (__v16hi)(__m256i)(B),(int)(C)))

## [Macro Original]
## #define _mm256_mask_shrdi_epi16(A, B, C, D, E) \
## ((__m256i) __builtin_ia32_vpshrd_v16hi_mask ((__v16hi)(__m256i)(C), \
## (__v16hi)(__m256i)(D), \
## (int)(E),		\
## (__v16hi)(__m256i)(A), \
## (__mmask16)(B)))

## [Macro Original]
## #define _mm256_maskz_shrdi_epi16(A, B, C, D) \
## ((__m256i) \
## __builtin_ia32_vpshrd_v16hi_mask ((__v16hi)(__m256i)(B),		\
## (__v16hi)(__m256i)(C),(int)(D),	\
## (__v16hi)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask16)(A)))

## [Macro Original]
## #define _mm256_shrdi_epi32(A, B, C) \
## ((__m256i) __builtin_ia32_vpshrd_v8si ((__v8si)(__m256i)(A), \
## (__v8si)(__m256i)(B),(int)(C)))

## [Macro Original]
## #define _mm256_mask_shrdi_epi32(A, B, C, D, E) \
## ((__m256i) __builtin_ia32_vpshrd_v8si_mask ((__v8si)(__m256i)(C), \
## (__v8si)(__m256i)(D), \
## (int)(E), \
## (__v8si)(__m256i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm256_maskz_shrdi_epi32(A, B, C, D) \
## ((__m256i) \
## __builtin_ia32_vpshrd_v8si_mask ((__v8si)(__m256i)(B),		\
## (__v8si)(__m256i)(C),(int)(D),	\
## (__v8si)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm256_shrdi_epi64(A, B, C) \
## ((__m256i) __builtin_ia32_vpshrd_v4di ((__v4di)(__m256i)(A), \
## (__v4di)(__m256i)(B),(int)(C)))

## [Macro Original]
## #define _mm256_mask_shrdi_epi64(A, B, C, D, E) \
## ((__m256i) __builtin_ia32_vpshrd_v4di_mask ((__v4di)(__m256i)(C), \
## (__v4di)(__m256i)(D), (int)(E), \
## (__v4di)(__m256i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm256_maskz_shrdi_epi64(A, B, C, D) \
## ((__m256i) \
## __builtin_ia32_vpshrd_v4di_mask ((__v4di)(__m256i)(B),		\
## (__v4di)(__m256i)(C),(int)(D),	\
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm_shrdi_epi16(A, B, C) \
## ((__m128i) __builtin_ia32_vpshrd_v8hi ((__v8hi)(__m128i)(A), \
## (__v8hi)(__m128i)(B),(int)(C)))

## [Macro Original]
## #define _mm_mask_shrdi_epi16(A, B, C, D, E) \
## ((__m128i) __builtin_ia32_vpshrd_v8hi_mask ((__v8hi)(__m128i)(C), \
## (__v8hi)(__m128i)(D), (int)(E), \
## (__v8hi)(__m128i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm_maskz_shrdi_epi16(A, B, C, D) \
## ((__m128i) \
## __builtin_ia32_vpshrd_v8hi_mask ((__v8hi)(__m128i)(B),		\
## (__v8hi)(__m128i)(C),(int)(D),	\
## (__v8hi)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm_shrdi_epi32(A, B, C) \
## ((__m128i) __builtin_ia32_vpshrd_v4si ((__v4si)(__m128i)(A), \
## (__v4si)(__m128i)(B),(int)(C)))

## [Macro Original]
## #define _mm_mask_shrdi_epi32(A, B, C, D, E) \
## ((__m128i) __builtin_ia32_vpshrd_v4si_mask ((__v4si)(__m128i)(C),	\
## (__v4si)(__m128i)(D), (int)(E), \
## (__v4si)(__m128i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm_maskz_shrdi_epi32(A, B, C, D) \
## ((__m128i) \
## __builtin_ia32_vpshrd_v4si_mask ((__v4si)(__m128i)(B),		\
## (__v4si)(__m128i)(C),(int)(D),	\
## (__v4si)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm_shrdi_epi64(A, B, C) \
## ((__m128i) __builtin_ia32_vpshrd_v2di ((__v2di)(__m128i)(A), \
## (__v2di)(__m128i)(B),(int)(C)))

## [Macro Original]
## #define _mm_mask_shrdi_epi64(A, B, C, D, E) \
## ((__m128i) __builtin_ia32_vpshrd_v2di_mask ((__v2di)(__m128i)(C), \
## (__v2di)(__m128i)(D), (int)(E), \
## (__v2di)(__m128i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm_maskz_shrdi_epi64(A, B, C, D) \
## ((__m128i) \
## __builtin_ia32_vpshrd_v2di_mask ((__v2di)(__m128i)(B),		\
## (__v2di)(__m128i)(C),(int)(D),	\
## (__v2di)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm256_shldi_epi16(A, B, C) \
## ((__m256i) __builtin_ia32_vpshld_v16hi ((__v16hi)(__m256i)(A), \
## (__v16hi)(__m256i)(B),(int)(C)))

## [Macro Original]
## #define _mm256_mask_shldi_epi16(A, B, C, D, E) \
## ((__m256i) __builtin_ia32_vpshld_v16hi_mask ((__v16hi)(__m256i)(C), \
## (__v16hi)(__m256i)(D), \
## (int)(E),		\
## (__v16hi)(__m256i)(A), \
## (__mmask16)(B)))

## [Macro Original]
## #define _mm256_maskz_shldi_epi16(A, B, C, D) \
## ((__m256i) \
## __builtin_ia32_vpshld_v16hi_mask ((__v16hi)(__m256i)(B),		\
## (__v16hi)(__m256i)(C),(int)(D),	\
## (__v16hi)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask16)(A)))

## [Macro Original]
## #define _mm256_shldi_epi32(A, B, C) \
## ((__m256i) __builtin_ia32_vpshld_v8si ((__v8si)(__m256i)(A), \
## (__v8si)(__m256i)(B),(int)(C)))

## [Macro Original]
## #define _mm256_mask_shldi_epi32(A, B, C, D, E) \
## ((__m256i) __builtin_ia32_vpshld_v8si_mask ((__v8si)(__m256i)(C), \
## (__v8si)(__m256i)(D), (int)(E), \
## (__v8si)(__m256i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm256_maskz_shldi_epi32(A, B, C, D) \
## ((__m256i) \
## __builtin_ia32_vpshld_v8si_mask ((__v8si)(__m256i)(B),		\
## (__v8si)(__m256i)(C),(int)(D),	\
## (__v8si)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm256_shldi_epi64(A, B, C) \
## ((__m256i) __builtin_ia32_vpshld_v4di ((__v4di)(__m256i)(A), \
## (__v4di)(__m256i)(B),(int)(C)))

## [Macro Original]
## #define _mm256_mask_shldi_epi64(A, B, C, D, E) \
## ((__m256i) __builtin_ia32_vpshld_v4di_mask ((__v4di)(__m256i)(C), \
## (__v4di)(__m256i)(D), (int)(E), \
## (__v4di)(__m256i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm256_maskz_shldi_epi64(A, B, C, D) \
## ((__m256i) \
## __builtin_ia32_vpshld_v4di_mask ((__v4di)(__m256i)(B),		\
## (__v4di)(__m256i)(C),(int)(D),	\
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm_shldi_epi16(A, B, C) \
## ((__m128i) __builtin_ia32_vpshld_v8hi ((__v8hi)(__m128i)(A), \
## (__v8hi)(__m128i)(B),(int)(C)))

## [Macro Original]
## #define _mm_mask_shldi_epi16(A, B, C, D, E) \
## ((__m128i) __builtin_ia32_vpshld_v8hi_mask ((__v8hi)(__m128i)(C), \
## (__v8hi)(__m128i)(D), (int)(E), \
## (__v8hi)(__m128i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm_maskz_shldi_epi16(A, B, C, D) \
## ((__m128i) \
## __builtin_ia32_vpshld_v8hi_mask ((__v8hi)(__m128i)(B),		\
## (__v8hi)(__m128i)(C),(int)(D),	\
## (__v8hi)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm_shldi_epi32(A, B, C) \
## ((__m128i) __builtin_ia32_vpshld_v4si ((__v4si)(__m128i)(A), \
## (__v4si)(__m128i)(B),(int)(C)))

## [Macro Original]
## #define _mm_mask_shldi_epi32(A, B, C, D, E) \
## ((__m128i) __builtin_ia32_vpshld_v4si_mask ((__v4si)(__m128i)(C), \
## (__v4si)(__m128i)(D), (int)(E), \
## (__v4si)(__m128i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm_maskz_shldi_epi32(A, B, C, D) \
## ((__m128i) \
## __builtin_ia32_vpshld_v4si_mask ((__v4si)(__m128i)(B),		\
## (__v4si)(__m128i)(C),(int)(D),	\
## (__v4si)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(A)))

## [Macro Original]
## #define _mm_shldi_epi64(A, B, C) \
## ((__m128i) __builtin_ia32_vpshld_v2di ((__v2di)(__m128i)(A), \
## (__v2di)(__m128i)(B),(int)(C)))

## [Macro Original]
## #define _mm_mask_shldi_epi64(A, B, C, D, E) \
## ((__m128i) __builtin_ia32_vpshld_v2di_mask ((__v2di)(__m128i)(C), \
## (__v2di)(__m128i)(D), (int)(E), \
## (__v2di)(__m128i)(A), \
## (__mmask8)(B)))

## [Macro Original]
## #define _mm_maskz_shldi_epi64(A, B, C, D) \
## ((__m128i) \
## __builtin_ia32_vpshld_v2di_mask ((__v2di)(__m128i)(B),		\
## (__v2di)(__m128i)(C),(int)(D),	\
## (__v2di)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(A)))

func mm256_shrdv_epi16*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_shrdv_epi16".}

func mm256_mask_shrdv_epi16*(a: M256i, b: MMask16, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_shrdv_epi16".}

func mm256_maskz_shrdv_epi16*(a: MMask16, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_shrdv_epi16".}

func mm256_shrdv_epi32*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_shrdv_epi32".}

func mm256_mask_shrdv_epi32*(a: M256i, b: MMask8, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_shrdv_epi32".}

func mm256_maskz_shrdv_epi32*(a: MMask8, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_shrdv_epi32".}

func mm256_shrdv_epi64*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_shrdv_epi64".}

func mm256_mask_shrdv_epi64*(a: M256i, b: MMask8, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_shrdv_epi64".}

func mm256_maskz_shrdv_epi64*(a: MMask8, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_shrdv_epi64".}

func mm_shrdv_epi16*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_shrdv_epi16".}

func mm_mask_shrdv_epi16*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_shrdv_epi16".}

func mm_maskz_shrdv_epi16*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_shrdv_epi16".}

func mm_shrdv_epi32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_shrdv_epi32".}

func mm_mask_shrdv_epi32*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_shrdv_epi32".}

func mm_maskz_shrdv_epi32*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_shrdv_epi32".}

func mm_shrdv_epi64*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_shrdv_epi64".}

func mm_mask_shrdv_epi64*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_shrdv_epi64".}

func mm_maskz_shrdv_epi64*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_shrdv_epi64".}

func mm256_shldv_epi16*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_shldv_epi16".}

func mm256_mask_shldv_epi16*(a: M256i, b: MMask16, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_shldv_epi16".}

func mm256_maskz_shldv_epi16*(a: MMask16, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_shldv_epi16".}

func mm256_shldv_epi32*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_shldv_epi32".}

func mm256_mask_shldv_epi32*(a: M256i, b: MMask8, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_shldv_epi32".}

func mm256_maskz_shldv_epi32*(a: MMask8, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_shldv_epi32".}

func mm256_shldv_epi64*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_shldv_epi64".}

func mm256_mask_shldv_epi64*(a: M256i, b: MMask8, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_shldv_epi64".}

func mm256_maskz_shldv_epi64*(a: MMask8, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_shldv_epi64".}

func mm_shldv_epi16*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_shldv_epi16".}

func mm_mask_shldv_epi16*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_shldv_epi16".}

func mm_maskz_shldv_epi16*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_shldv_epi16".}

func mm_shldv_epi32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_shldv_epi32".}

func mm_mask_shldv_epi32*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_shldv_epi32".}

func mm_maskz_shldv_epi32*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_shldv_epi32".}

func mm_shldv_epi64*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_shldv_epi64".}

func mm_mask_shldv_epi64*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_shldv_epi64".}

func mm_maskz_shldv_epi64*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_shldv_epi64".}

func mm256_mask_compress_epi8*(a: M256i, b: MMask32, c: M256i): M256i {.importc: "_mm256_mask_compress_epi8".}

func mm256_maskz_compress_epi8*(a: MMask32, b: M256i): M256i {.importc: "_mm256_maskz_compress_epi8".}

func mm256_mask_compressstoreu_epi8*(a: pointer, b: MMask32, c: M256i): void {.importc: "_mm256_mask_compressstoreu_epi8".}

func mm256_mask_expand_epi8*(a: M256i, b: MMask32, c: M256i): M256i {.importc: "_mm256_mask_expand_epi8".}

func mm256_maskz_expand_epi8*(a: MMask32, b: M256i): M256i {.importc: "_mm256_maskz_expand_epi8".}

func mm256_mask_expandloadu_epi8*(a: M256i, b: MMask32, c: pointer): M256i {.importc: "_mm256_mask_expandloadu_epi8".}

func mm256_maskz_expandloadu_epi8*(a: MMask32, b: pointer): M256i {.importc: "_mm256_maskz_expandloadu_epi8".}