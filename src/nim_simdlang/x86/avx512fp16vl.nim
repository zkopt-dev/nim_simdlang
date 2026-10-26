import avx512f

## [Macro Original]
## #define __AVX512FP16VLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512FP16VL__

func mm_avx512_set1_ps*(f: float32): M128 {.importc: "_mm_avx512_set1_ps".}

func mm256_avx512_set1_ps*(a: float32): M256 {.importc: "_mm256_avx512_set1_ps".}

func mm_avx512_and_si128*(a: M128i, b: M128i): M128i {.importc: "_mm_avx512_and_si128".}

func mm256_avx512_and_si256*(a: M256i, b: M256i): M256i {.importc: "_mm256_avx512_and_si256".}

func mm_castph_ps*(a: M128h): M128 {.importc: "_mm_castph_ps".}

func mm256_castph_ps*(a: M256h): M256 {.importc: "_mm256_castph_ps".}

func mm_castph_pd*(a: M128h): M128d {.importc: "_mm_castph_pd".}

func mm256_castph_pd*(a: M256h): M256d {.importc: "_mm256_castph_pd".}

func mm_castph_si128*(a: M128h): M128i {.importc: "_mm_castph_si128".}

func mm256_castph_si256*(a: M256h): M256i {.importc: "_mm256_castph_si256".}

func mm_castps_ph*(a: M128): M128h {.importc: "_mm_castps_ph".}

func mm256_castps_ph*(a: M256): M256h {.importc: "_mm256_castps_ph".}

func mm_castpd_ph*(a: M128d): M128h {.importc: "_mm_castpd_ph".}

func mm256_castpd_ph*(a: M256d): M256h {.importc: "_mm256_castpd_ph".}

func mm_castsi128_ph*(a: M128i): M128h {.importc: "_mm_castsi128_ph".}

func mm256_castsi256_ph*(a: M256i): M256h {.importc: "_mm256_castsi256_ph".}

func mm256_castph256_ph128*(a: M256h): M128h {.importc: "_mm256_castph256_ph128".}

func mm256_castph128_ph256*(a: M128h): M256h {.importc: "_mm256_castph128_ph256".}

func mm256_zextph128_ph256*(a: M128h): M256h {.importc: "_mm256_zextph128_ph256".}

func mm256_conj_pch*(a: M256h): M256h {.importc: "_mm256_conj_pch".}

func mm256_mask_conj_pch*(w: M256h, u: MMask8, a: M256h): M256h {.importc: "_mm256_mask_conj_pch".}

func mm256_maskz_conj_pch*(u: MMask8, a: M256h): M256h {.importc: "_mm256_maskz_conj_pch".}

func mm_conj_pch*(a: M128h): M128h {.importc: "_mm_conj_pch".}

func mm_mask_conj_pch*(w: M128h, u: MMask8, a: M128h): M128h {.importc: "_mm_mask_conj_pch".}

func mm_maskz_conj_pch*(u: MMask8, a: M128h): M128h {.importc: "_mm_maskz_conj_pch".}

func mm_add_ph*(a: M128h, b: M128h): M128h {.importc: "_mm_add_ph".}

func mm256_add_ph*(a: M256h, b: M256h): M256h {.importc: "_mm256_add_ph".}

func mm_mask_add_ph*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_add_ph".}

func mm256_mask_add_ph*(a: M256h, b: MMask16, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_add_ph".}

func mm_maskz_add_ph*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_add_ph".}

func mm256_maskz_add_ph*(a: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_add_ph".}

func mm_sub_ph*(a: M128h, b: M128h): M128h {.importc: "_mm_sub_ph".}

func mm256_sub_ph*(a: M256h, b: M256h): M256h {.importc: "_mm256_sub_ph".}

func mm_mask_sub_ph*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_sub_ph".}

func mm256_mask_sub_ph*(a: M256h, b: MMask16, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_sub_ph".}

func mm_maskz_sub_ph*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_sub_ph".}

func mm256_maskz_sub_ph*(a: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_sub_ph".}

func mm_mul_ph*(a: M128h, b: M128h): M128h {.importc: "_mm_mul_ph".}

func mm256_mul_ph*(a: M256h, b: M256h): M256h {.importc: "_mm256_mul_ph".}

func mm_mask_mul_ph*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_mul_ph".}

func mm256_mask_mul_ph*(a: M256h, b: MMask16, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_mul_ph".}

func mm_maskz_mul_ph*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_mul_ph".}

func mm256_maskz_mul_ph*(a: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_mul_ph".}

func mm_div_ph*(a: M128h, b: M128h): M128h {.importc: "_mm_div_ph".}

func mm256_div_ph*(a: M256h, b: M256h): M256h {.importc: "_mm256_div_ph".}

func mm_mask_div_ph*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_div_ph".}

func mm256_mask_div_ph*(a: M256h, b: MMask16, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_div_ph".}

func mm_maskz_div_ph*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_div_ph".}

func mm256_maskz_div_ph*(a: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_div_ph".}

func mm_max_ph*(a: M128h, b: M128h): M128h {.importc: "_mm_max_ph".}

func mm256_max_ph*(a: M256h, b: M256h): M256h {.importc: "_mm256_max_ph".}

func mm_mask_max_ph*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_max_ph".}

func mm256_mask_max_ph*(a: M256h, b: MMask16, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_max_ph".}

func mm_maskz_max_ph*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_max_ph".}

func mm256_maskz_max_ph*(a: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_max_ph".}

func mm_min_ph*(a: M128h, b: M128h): M128h {.importc: "_mm_min_ph".}

func mm256_min_ph*(a: M256h, b: M256h): M256h {.importc: "_mm256_min_ph".}

func mm_mask_min_ph*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_min_ph".}

func mm256_mask_min_ph*(a: M256h, b: MMask16, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_min_ph".}

func mm_maskz_min_ph*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_min_ph".}

func mm256_maskz_min_ph*(a: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_min_ph".}

func mm_abs_ph*(a: M128h): M128h {.importc: "_mm_abs_ph".}

func mm256_abs_ph*(a: M256h): M256h {.importc: "_mm256_abs_ph".}

func mm_cmp_ph_mask*(a: M128h, b: M128h, c: int32): MMask8 {.importc: "_mm_cmp_ph_mask".}

func mm_mask_cmp_ph_mask*(a: MMask8, b: M128h, c: M128h, d: int32): MMask8 {.importc: "_mm_mask_cmp_ph_mask".}

func mm_cmp_ph_mask*(a: M256h, b: M256h, c: int32): MMask16 {.importc: "_mm_cmp_ph_mask".}

func mm_mask_cmp_ph_mask*(a: MMask16, b: M256h, c: M256h, d: int32): MMask16 {.importc: "_mm_mask_cmp_ph_mask".}

## [Macro Original]
## #define _mm_cmp_ph_mask(A, B, C)			\
## (__builtin_ia32_cmpph128_mask ((A), (B), (C), (-1)))

## [Macro Original]
## #define _mm_mask_cmp_ph_mask(A, B, C, D)		\
## (__builtin_ia32_cmpph128_mask ((B), (C), (D), (A)))

## [Macro Original]
## #define _mm256_cmp_ph_mask(A, B, C)			\
## (__builtin_ia32_cmpph256_mask ((A), (B), (C), (-1)))

## [Macro Original]
## #define _mm256_mask_cmp_ph_mask(A, B, C, D)		\
## (__builtin_ia32_cmpph256_mask ((B), (C), (D), (A)))

func mm_sqrt_ph*(a: M128h): M128h {.importc: "_mm_sqrt_ph".}

func mm256_sqrt_ph*(a: M256h): M256h {.importc: "_mm256_sqrt_ph".}

func mm_mask_sqrt_ph*(a: M128h, b: MMask8, c: M128h): M128h {.importc: "_mm_mask_sqrt_ph".}

func mm256_mask_sqrt_ph*(a: M256h, b: MMask16, c: M256h): M256h {.importc: "_mm256_mask_sqrt_ph".}

func mm_maskz_sqrt_ph*(a: MMask8, b: M128h): M128h {.importc: "_mm_maskz_sqrt_ph".}

func mm256_maskz_sqrt_ph*(a: MMask16, b: M256h): M256h {.importc: "_mm256_maskz_sqrt_ph".}

func mm_rsqrt_ph*(a: M128h): M128h {.importc: "_mm_rsqrt_ph".}

func mm256_rsqrt_ph*(a: M256h): M256h {.importc: "_mm256_rsqrt_ph".}

func mm_mask_rsqrt_ph*(a: M128h, b: MMask8, c: M128h): M128h {.importc: "_mm_mask_rsqrt_ph".}

func mm256_mask_rsqrt_ph*(a: M256h, b: MMask16, c: M256h): M256h {.importc: "_mm256_mask_rsqrt_ph".}

func mm_maskz_rsqrt_ph*(a: MMask8, b: M128h): M128h {.importc: "_mm_maskz_rsqrt_ph".}

func mm256_maskz_rsqrt_ph*(a: MMask16, b: M256h): M256h {.importc: "_mm256_maskz_rsqrt_ph".}

func mm_rcp_ph*(a: M128h): M128h {.importc: "_mm_rcp_ph".}

func mm256_rcp_ph*(a: M256h): M256h {.importc: "_mm256_rcp_ph".}

func mm_mask_rcp_ph*(a: M128h, b: MMask8, c: M128h): M128h {.importc: "_mm_mask_rcp_ph".}

func mm256_mask_rcp_ph*(a: M256h, b: MMask16, c: M256h): M256h {.importc: "_mm256_mask_rcp_ph".}

func mm_maskz_rcp_ph*(a: MMask8, b: M128h): M128h {.importc: "_mm_maskz_rcp_ph".}

func mm256_maskz_rcp_ph*(a: MMask16, b: M256h): M256h {.importc: "_mm256_maskz_rcp_ph".}

func mm_scalef_ph*(a: M128h, b: M128h): M128h {.importc: "_mm_scalef_ph".}

func mm256_scalef_ph*(a: M256h, b: M256h): M256h {.importc: "_mm256_scalef_ph".}

func mm_mask_scalef_ph*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_scalef_ph".}

func mm256_mask_scalef_ph*(a: M256h, b: MMask16, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_scalef_ph".}

func mm_maskz_scalef_ph*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_scalef_ph".}

func mm256_maskz_scalef_ph*(a: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_scalef_ph".}

func mm_reduce_ph*(a: M128h, b: int32): M128h {.importc: "_mm_reduce_ph".}

func mm_mask_reduce_ph*(a: M128h, b: MMask8, c: M128h, d: int32): M128h {.importc: "_mm_mask_reduce_ph".}

func mm_maskz_reduce_ph*(a: MMask8, b: M128h, c: int32): M128h {.importc: "_mm_maskz_reduce_ph".}

func mm256_reduce_ph*(a: M256h, b: int32): M256h {.importc: "_mm256_reduce_ph".}

func mm256_mask_reduce_ph*(a: M256h, b: MMask16, c: M256h, d: int32): M256h {.importc: "_mm256_mask_reduce_ph".}

func mm256_maskz_reduce_ph*(a: MMask16, b: M256h, c: int32): M256h {.importc: "_mm256_maskz_reduce_ph".}

## [Macro Original]
## #define _mm_reduce_ph(A, B)				\
## (__builtin_ia32_reduceph128_mask ((A), (B),		\
## _mm_setzero_ph (),	\
## ((__mmask8)-1)))

## [Macro Original]
## #define _mm_mask_reduce_ph(A,  B,  C, D)			\
## (__builtin_ia32_reduceph128_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm_maskz_reduce_ph(A,  B, C)					\
## (__builtin_ia32_reduceph128_mask ((B), (C), _mm_setzero_ph (), (A)))

## [Macro Original]
## #define _mm256_reduce_ph(A, B)					\
## (__builtin_ia32_reduceph256_mask ((A), (B),			\
## _mm256_setzero_ph (),	\
## ((__mmask16)-1)))

## [Macro Original]
## #define _mm256_mask_reduce_ph(A, B, C, D)			\
## (__builtin_ia32_reduceph256_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm256_maskz_reduce_ph(A, B, C)					\
## (__builtin_ia32_reduceph256_mask ((B), (C), _mm256_setzero_ph (), (A)))

func mm_roundscale_ph*(a: M128h, b: int32): M128h {.importc: "_mm_roundscale_ph".}

func mm_mask_roundscale_ph*(a: M128h, b: MMask8, c: M128h, d: int32): M128h {.importc: "_mm_mask_roundscale_ph".}

func mm_maskz_roundscale_ph*(a: MMask8, b: M128h, c: int32): M128h {.importc: "_mm_maskz_roundscale_ph".}

func mm256_roundscale_ph*(a: M256h, b: int32): M256h {.importc: "_mm256_roundscale_ph".}

func mm256_mask_roundscale_ph*(a: M256h, b: MMask16, c: M256h, d: int32): M256h {.importc: "_mm256_mask_roundscale_ph".}

func mm256_maskz_roundscale_ph*(a: MMask16, b: M256h, c: int32): M256h {.importc: "_mm256_maskz_roundscale_ph".}

## [Macro Original]
## #define _mm_roundscale_ph(A, B)						\
## (__builtin_ia32_rndscaleph128_mask ((A), (B), _mm_setzero_ph (),	\
## ((__mmask8)-1)))

## [Macro Original]
## #define _mm_mask_roundscale_ph(A, B, C, D)			\
## (__builtin_ia32_rndscaleph128_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm_maskz_roundscale_ph(A, B, C)				\
## (__builtin_ia32_rndscaleph128_mask ((B), (C), _mm_setzero_ph (), (A)))

## [Macro Original]
## #define _mm256_roundscale_ph(A, B)				\
## (__builtin_ia32_rndscaleph256_mask ((A), (B),			\
## _mm256_setzero_ph(),	\
## ((__mmask16)-1)))

## [Macro Original]
## #define _mm256_mask_roundscale_ph(A, B, C, D)			\
## (__builtin_ia32_rndscaleph256_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm256_maskz_roundscale_ph(A, B, C)				\
## (__builtin_ia32_rndscaleph256_mask ((B), (C),				\
## _mm256_setzero_ph (), (A)))

func mm_mask_fpclass_ph_mask*(u: MMask8, a: M128h, imm: int32): MMask8 {.importc: "_mm_mask_fpclass_ph_mask".}

func mm_fpclass_ph_mask*(a: M128h, imm: int32): MMask8 {.importc: "_mm_fpclass_ph_mask".}

func mm256_mask_fpclass_ph_mask*(u: MMask16, a: M256h, imm: int32): MMask16 {.importc: "_mm256_mask_fpclass_ph_mask".}

func mm256_fpclass_ph_mask*(a: M256h, imm: int32): MMask16 {.importc: "_mm256_fpclass_ph_mask".}

## [Macro Original]
## #define _mm_fpclass_ph_mask(X, C)                                       \
## ((__mmask8) __builtin_ia32_fpclassph128_mask ((__v8hf) (__m128h) (X),	\
## (int) (C),(__mmask8)-1))

## [Macro Original]
## #define _mm_mask_fpclass_ph_mask(u, X, C)                               \
## ((__mmask8) __builtin_ia32_fpclassph128_mask ((__v8hf) (__m128h) (X),	\
## (int) (C),(__mmask8)(u)))

## [Macro Original]
## #define _mm256_fpclass_ph_mask(X, C)                                    \
## ((__mmask16) __builtin_ia32_fpclassph256_mask ((__v16hf) (__m256h) (X), \
## (int) (C),(__mmask16)-1))

## [Macro Original]
## #define _mm256_mask_fpclass_ph_mask(u, X, C)				\
## ((__mmask16) __builtin_ia32_fpclassph256_mask ((__v16hf) (__m256h) (X), \
## (int) (C),(__mmask16)(u)))

func mm256_getexp_ph*(a: M256h): M256h {.importc: "_mm256_getexp_ph".}

func mm256_mask_getexp_ph*(w: M256h, u: MMask16, a: M256h): M256h {.importc: "_mm256_mask_getexp_ph".}

func mm256_maskz_getexp_ph*(u: MMask16, a: M256h): M256h {.importc: "_mm256_maskz_getexp_ph".}

func mm_getexp_ph*(a: M128h): M128h {.importc: "_mm_getexp_ph".}

func mm_mask_getexp_ph*(w: M128h, u: MMask8, a: M128h): M128h {.importc: "_mm_mask_getexp_ph".}

func mm_maskz_getexp_ph*(u: MMask8, a: M128h): M128h {.importc: "_mm_maskz_getexp_ph".}

func mm256_getmant_ph*(a: M256h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256h {.importc: "_mm256_getmant_ph".}

func mm256_mask_getmant_ph*(w: M256h, u: MMask16, a: M256h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256h {.importc: "_mm256_mask_getmant_ph".}

func mm256_maskz_getmant_ph*(u: MMask16, a: M256h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256h {.importc: "_mm256_maskz_getmant_ph".}

func mm_getmant_ph*(a: M128h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128h {.importc: "_mm_getmant_ph".}

func mm_mask_getmant_ph*(w: M128h, u: MMask8, a: M128h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128h {.importc: "_mm_mask_getmant_ph".}

func mm_maskz_getmant_ph*(u: MMask8, a: M128h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128h {.importc: "_mm_maskz_getmant_ph".}

## [Macro Original]
## #define _mm256_getmant_ph(X, B, C)					\
## ((__m256h) __builtin_ia32_getmantph256_mask ((__v16hf)(__m256h) (X),	\
## (int)(((C)<<2) | (B)),	\
## (__v16hf)(__m256h)_mm256_setzero_ph (), \
## (__mmask16)-1))

## [Macro Original]
## #define _mm256_mask_getmant_ph(W, U, X, B, C)				\
## ((__m256h) __builtin_ia32_getmantph256_mask ((__v16hf)(__m256h) (X),	\
## (int)(((C)<<2) | (B)),	\
## (__v16hf)(__m256h)(W),	\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm256_maskz_getmant_ph(U, X, B, C)				\
## ((__m256h) __builtin_ia32_getmantph256_mask ((__v16hf)(__m256h) (X),	\
## (int)(((C)<<2) | (B)),	\
## (__v16hf)(__m256h)_mm256_setzero_ph (), \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm_getmant_ph(X, B, C)						\
## ((__m128h) __builtin_ia32_getmantph128_mask ((__v8hf)(__m128h) (X),	\
## (int)(((C)<<2) | (B)),	\
## (__v8hf)(__m128h)_mm_setzero_ph (), \
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_getmant_ph(W, U, X, B, C)				\
## ((__m128h) __builtin_ia32_getmantph128_mask ((__v8hf)(__m128h) (X),	\
## (int)(((C)<<2) | (B)),	\
## (__v8hf)(__m128h)(W),	\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_getmant_ph(U, X, B, C)				\
## ((__m128h) __builtin_ia32_getmantph128_mask ((__v8hf)(__m128h) (X),	\
## (int)(((C)<<2) | (B)),	\
## (__v8hf)(__m128h)_mm_setzero_ph (), \
## (__mmask8)(U)))

func mm_cvtph_epi32*(a: M128h): M128i {.importc: "_mm_cvtph_epi32".}

func mm_mask_cvtph_epi32*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvtph_epi32".}

func mm_maskz_cvtph_epi32*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvtph_epi32".}

func mm256_cvtph_epi32*(a: M128h): M256i {.importc: "_mm256_cvtph_epi32".}

func mm256_mask_cvtph_epi32*(a: M256i, b: MMask8, c: M128h): M256i {.importc: "_mm256_mask_cvtph_epi32".}

func mm256_maskz_cvtph_epi32*(a: MMask8, b: M128h): M256i {.importc: "_mm256_maskz_cvtph_epi32".}

func mm_cvtph_epu32*(a: M128h): M128i {.importc: "_mm_cvtph_epu32".}

func mm_mask_cvtph_epu32*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvtph_epu32".}

func mm_maskz_cvtph_epu32*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvtph_epu32".}

func mm256_cvtph_epu32*(a: M128h): M256i {.importc: "_mm256_cvtph_epu32".}

func mm256_mask_cvtph_epu32*(a: M256i, b: MMask8, c: M128h): M256i {.importc: "_mm256_mask_cvtph_epu32".}

func mm256_maskz_cvtph_epu32*(a: MMask8, b: M128h): M256i {.importc: "_mm256_maskz_cvtph_epu32".}

func mm_cvttph_epi32*(a: M128h): M128i {.importc: "_mm_cvttph_epi32".}

func mm_mask_cvttph_epi32*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvttph_epi32".}

func mm_maskz_cvttph_epi32*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvttph_epi32".}

func mm256_cvttph_epi32*(a: M128h): M256i {.importc: "_mm256_cvttph_epi32".}

func mm256_mask_cvttph_epi32*(a: M256i, b: MMask8, c: M128h): M256i {.importc: "_mm256_mask_cvttph_epi32".}

func mm256_maskz_cvttph_epi32*(a: MMask8, b: M128h): M256i {.importc: "_mm256_maskz_cvttph_epi32".}

func mm_cvttph_epu32*(a: M128h): M128i {.importc: "_mm_cvttph_epu32".}

func mm_mask_cvttph_epu32*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvttph_epu32".}

func mm_maskz_cvttph_epu32*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvttph_epu32".}

func mm256_cvttph_epu32*(a: M128h): M256i {.importc: "_mm256_cvttph_epu32".}

func mm256_mask_cvttph_epu32*(a: M256i, b: MMask8, c: M128h): M256i {.importc: "_mm256_mask_cvttph_epu32".}

func mm256_maskz_cvttph_epu32*(a: MMask8, b: M128h): M256i {.importc: "_mm256_maskz_cvttph_epu32".}

func mm_cvtepi32_ph*(a: M128i): M128h {.importc: "_mm_cvtepi32_ph".}

func mm_mask_cvtepi32_ph*(a: M128h, b: MMask8, c: M128i): M128h {.importc: "_mm_mask_cvtepi32_ph".}

func mm_maskz_cvtepi32_ph*(a: MMask8, b: M128i): M128h {.importc: "_mm_maskz_cvtepi32_ph".}

func mm256_cvtepi32_ph*(a: M256i): M128h {.importc: "_mm256_cvtepi32_ph".}

func mm256_mask_cvtepi32_ph*(a: M128h, b: MMask8, c: M256i): M128h {.importc: "_mm256_mask_cvtepi32_ph".}

func mm256_maskz_cvtepi32_ph*(a: MMask8, b: M256i): M128h {.importc: "_mm256_maskz_cvtepi32_ph".}

func mm_cvtepu32_ph*(a: M128i): M128h {.importc: "_mm_cvtepu32_ph".}

func mm_mask_cvtepu32_ph*(a: M128h, b: MMask8, c: M128i): M128h {.importc: "_mm_mask_cvtepu32_ph".}

func mm_maskz_cvtepu32_ph*(a: MMask8, b: M128i): M128h {.importc: "_mm_maskz_cvtepu32_ph".}

func mm256_cvtepu32_ph*(a: M256i): M128h {.importc: "_mm256_cvtepu32_ph".}

func mm256_mask_cvtepu32_ph*(a: M128h, b: MMask8, c: M256i): M128h {.importc: "_mm256_mask_cvtepu32_ph".}

func mm256_maskz_cvtepu32_ph*(a: MMask8, b: M256i): M128h {.importc: "_mm256_maskz_cvtepu32_ph".}

func mm_cvtph_epi64*(a: M128h): M128i {.importc: "_mm_cvtph_epi64".}

func mm_mask_cvtph_epi64*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvtph_epi64".}

func mm_maskz_cvtph_epi64*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvtph_epi64".}

func mm256_cvtph_epi64*(a: M128h): M256i {.importc: "_mm256_cvtph_epi64".}

func mm256_mask_cvtph_epi64*(a: M256i, b: MMask8, c: M128h): M256i {.importc: "_mm256_mask_cvtph_epi64".}

func mm256_maskz_cvtph_epi64*(a: MMask8, b: M128h): M256i {.importc: "_mm256_maskz_cvtph_epi64".}

func mm_cvtph_epu64*(a: M128h): M128i {.importc: "_mm_cvtph_epu64".}

func mm_mask_cvtph_epu64*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvtph_epu64".}

func mm_maskz_cvtph_epu64*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvtph_epu64".}

func mm256_cvtph_epu64*(a: M128h): M256i {.importc: "_mm256_cvtph_epu64".}

func mm256_mask_cvtph_epu64*(a: M256i, b: MMask8, c: M128h): M256i {.importc: "_mm256_mask_cvtph_epu64".}

func mm256_maskz_cvtph_epu64*(a: MMask8, b: M128h): M256i {.importc: "_mm256_maskz_cvtph_epu64".}

func mm_cvttph_epi64*(a: M128h): M128i {.importc: "_mm_cvttph_epi64".}

func mm_mask_cvttph_epi64*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvttph_epi64".}

func mm_maskz_cvttph_epi64*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvttph_epi64".}

func mm256_cvttph_epi64*(a: M128h): M256i {.importc: "_mm256_cvttph_epi64".}

func mm256_mask_cvttph_epi64*(a: M256i, b: MMask8, c: M128h): M256i {.importc: "_mm256_mask_cvttph_epi64".}

func mm256_maskz_cvttph_epi64*(a: MMask8, b: M128h): M256i {.importc: "_mm256_maskz_cvttph_epi64".}

func mm_cvttph_epu64*(a: M128h): M128i {.importc: "_mm_cvttph_epu64".}

func mm_mask_cvttph_epu64*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvttph_epu64".}

func mm_maskz_cvttph_epu64*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvttph_epu64".}

func mm256_cvttph_epu64*(a: M128h): M256i {.importc: "_mm256_cvttph_epu64".}

func mm256_mask_cvttph_epu64*(a: M256i, b: MMask8, c: M128h): M256i {.importc: "_mm256_mask_cvttph_epu64".}

func mm256_maskz_cvttph_epu64*(a: MMask8, b: M128h): M256i {.importc: "_mm256_maskz_cvttph_epu64".}

func mm_cvtepi64_ph*(a: M128i): M128h {.importc: "_mm_cvtepi64_ph".}

func mm_mask_cvtepi64_ph*(a: M128h, b: MMask8, c: M128i): M128h {.importc: "_mm_mask_cvtepi64_ph".}

func mm_maskz_cvtepi64_ph*(a: MMask8, b: M128i): M128h {.importc: "_mm_maskz_cvtepi64_ph".}

func mm256_cvtepi64_ph*(a: M256i): M128h {.importc: "_mm256_cvtepi64_ph".}

func mm256_mask_cvtepi64_ph*(a: M128h, b: MMask8, c: M256i): M128h {.importc: "_mm256_mask_cvtepi64_ph".}

func mm256_maskz_cvtepi64_ph*(a: MMask8, b: M256i): M128h {.importc: "_mm256_maskz_cvtepi64_ph".}

func mm_cvtepu64_ph*(a: M128i): M128h {.importc: "_mm_cvtepu64_ph".}

func mm_mask_cvtepu64_ph*(a: M128h, b: MMask8, c: M128i): M128h {.importc: "_mm_mask_cvtepu64_ph".}

func mm_maskz_cvtepu64_ph*(a: MMask8, b: M128i): M128h {.importc: "_mm_maskz_cvtepu64_ph".}

func mm256_cvtepu64_ph*(a: M256i): M128h {.importc: "_mm256_cvtepu64_ph".}

func mm256_mask_cvtepu64_ph*(a: M128h, b: MMask8, c: M256i): M128h {.importc: "_mm256_mask_cvtepu64_ph".}

func mm256_maskz_cvtepu64_ph*(a: MMask8, b: M256i): M128h {.importc: "_mm256_maskz_cvtepu64_ph".}

func mm_cvtph_epi16*(a: M128h): M128i {.importc: "_mm_cvtph_epi16".}

func mm_mask_cvtph_epi16*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvtph_epi16".}

func mm_maskz_cvtph_epi16*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvtph_epi16".}

func mm256_cvtph_epi16*(a: M256h): M256i {.importc: "_mm256_cvtph_epi16".}

func mm256_mask_cvtph_epi16*(a: M256i, b: MMask16, c: M256h): M256i {.importc: "_mm256_mask_cvtph_epi16".}

func mm256_maskz_cvtph_epi16*(a: MMask16, b: M256h): M256i {.importc: "_mm256_maskz_cvtph_epi16".}

func mm_cvtph_epu16*(a: M128h): M128i {.importc: "_mm_cvtph_epu16".}

func mm_mask_cvtph_epu16*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvtph_epu16".}

func mm_maskz_cvtph_epu16*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvtph_epu16".}

func mm256_cvtph_epu16*(a: M256h): M256i {.importc: "_mm256_cvtph_epu16".}

func mm256_mask_cvtph_epu16*(a: M256i, b: MMask16, c: M256h): M256i {.importc: "_mm256_mask_cvtph_epu16".}

func mm256_maskz_cvtph_epu16*(a: MMask16, b: M256h): M256i {.importc: "_mm256_maskz_cvtph_epu16".}

func mm_cvttph_epi16*(a: M128h): M128i {.importc: "_mm_cvttph_epi16".}

func mm_mask_cvttph_epi16*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvttph_epi16".}

func mm_maskz_cvttph_epi16*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvttph_epi16".}

func mm256_cvttph_epi16*(a: M256h): M256i {.importc: "_mm256_cvttph_epi16".}

func mm256_mask_cvttph_epi16*(a: M256i, b: MMask16, c: M256h): M256i {.importc: "_mm256_mask_cvttph_epi16".}

func mm256_maskz_cvttph_epi16*(a: MMask16, b: M256h): M256i {.importc: "_mm256_maskz_cvttph_epi16".}

func mm_cvttph_epu16*(a: M128h): M128i {.importc: "_mm_cvttph_epu16".}

func mm_mask_cvttph_epu16*(a: M128i, b: MMask8, c: M128h): M128i {.importc: "_mm_mask_cvttph_epu16".}

func mm_maskz_cvttph_epu16*(a: MMask8, b: M128h): M128i {.importc: "_mm_maskz_cvttph_epu16".}

func mm256_cvttph_epu16*(a: M256h): M256i {.importc: "_mm256_cvttph_epu16".}

func mm256_mask_cvttph_epu16*(a: M256i, b: MMask16, c: M256h): M256i {.importc: "_mm256_mask_cvttph_epu16".}

func mm256_maskz_cvttph_epu16*(a: MMask16, b: M256h): M256i {.importc: "_mm256_maskz_cvttph_epu16".}

func mm_cvtepi16_ph*(a: M128i): M128h {.importc: "_mm_cvtepi16_ph".}

func mm_mask_cvtepi16_ph*(a: M128h, b: MMask8, c: M128i): M128h {.importc: "_mm_mask_cvtepi16_ph".}

func mm_maskz_cvtepi16_ph*(a: MMask8, b: M128i): M128h {.importc: "_mm_maskz_cvtepi16_ph".}

func mm256_cvtepi16_ph*(a: M256i): M256h {.importc: "_mm256_cvtepi16_ph".}

func mm256_mask_cvtepi16_ph*(a: M256h, b: MMask16, c: M256i): M256h {.importc: "_mm256_mask_cvtepi16_ph".}

func mm256_maskz_cvtepi16_ph*(a: MMask16, b: M256i): M256h {.importc: "_mm256_maskz_cvtepi16_ph".}

func mm_cvtepu16_ph*(a: M128i): M128h {.importc: "_mm_cvtepu16_ph".}

func mm_mask_cvtepu16_ph*(a: M128h, b: MMask8, c: M128i): M128h {.importc: "_mm_mask_cvtepu16_ph".}

func mm_maskz_cvtepu16_ph*(a: MMask8, b: M128i): M128h {.importc: "_mm_maskz_cvtepu16_ph".}

func mm256_cvtepu16_ph*(a: M256i): M256h {.importc: "_mm256_cvtepu16_ph".}

func mm256_mask_cvtepu16_ph*(a: M256h, b: MMask16, c: M256i): M256h {.importc: "_mm256_mask_cvtepu16_ph".}

func mm256_maskz_cvtepu16_ph*(a: MMask16, b: M256i): M256h {.importc: "_mm256_maskz_cvtepu16_ph".}

func mm_cvtph_pd*(a: M128h): M128d {.importc: "_mm_cvtph_pd".}

func mm_mask_cvtph_pd*(a: M128d, b: MMask8, c: M128h): M128d {.importc: "_mm_mask_cvtph_pd".}

func mm_maskz_cvtph_pd*(a: MMask8, b: M128h): M128d {.importc: "_mm_maskz_cvtph_pd".}

func mm256_cvtph_pd*(a: M128h): M256d {.importc: "_mm256_cvtph_pd".}

func mm256_mask_cvtph_pd*(a: M256d, b: MMask8, c: M128h): M256d {.importc: "_mm256_mask_cvtph_pd".}

func mm256_maskz_cvtph_pd*(a: MMask8, b: M128h): M256d {.importc: "_mm256_maskz_cvtph_pd".}

func mm_cvtxph_ps*(a: M128h): M128 {.importc: "_mm_cvtxph_ps".}

func mm_mask_cvtxph_ps*(a: M128, b: MMask8, c: M128h): M128 {.importc: "_mm_mask_cvtxph_ps".}

func mm_maskz_cvtxph_ps*(a: MMask8, b: M128h): M128 {.importc: "_mm_maskz_cvtxph_ps".}

func mm256_cvtxph_ps*(a: M128h): M256 {.importc: "_mm256_cvtxph_ps".}

func mm256_mask_cvtxph_ps*(a: M256, b: MMask8, c: M128h): M256 {.importc: "_mm256_mask_cvtxph_ps".}

func mm256_maskz_cvtxph_ps*(a: MMask8, b: M128h): M256 {.importc: "_mm256_maskz_cvtxph_ps".}

func mm_cvtxps_ph*(a: M128): M128h {.importc: "_mm_cvtxps_ph".}

func mm_mask_cvtxps_ph*(a: M128h, b: MMask8, c: M128): M128h {.importc: "_mm_mask_cvtxps_ph".}

func mm_maskz_cvtxps_ph*(a: MMask8, b: M128): M128h {.importc: "_mm_maskz_cvtxps_ph".}

func mm256_cvtxps_ph*(a: M256): M128h {.importc: "_mm256_cvtxps_ph".}

func mm256_mask_cvtxps_ph*(a: M128h, b: MMask8, c: M256): M128h {.importc: "_mm256_mask_cvtxps_ph".}

func mm256_maskz_cvtxps_ph*(a: MMask8, b: M256): M128h {.importc: "_mm256_maskz_cvtxps_ph".}

func mm_cvtpd_ph*(a: M128d): M128h {.importc: "_mm_cvtpd_ph".}

func mm_mask_cvtpd_ph*(a: M128h, b: MMask8, c: M128d): M128h {.importc: "_mm_mask_cvtpd_ph".}

func mm_maskz_cvtpd_ph*(a: MMask8, b: M128d): M128h {.importc: "_mm_maskz_cvtpd_ph".}

func mm256_cvtpd_ph*(a: M256d): M128h {.importc: "_mm256_cvtpd_ph".}

func mm256_mask_cvtpd_ph*(a: M128h, b: MMask8, c: M256d): M128h {.importc: "_mm256_mask_cvtpd_ph".}

func mm256_maskz_cvtpd_ph*(a: MMask8, b: M256d): M128h {.importc: "_mm256_maskz_cvtpd_ph".}

func mm256_fmaddsub_ph*(a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_fmaddsub_ph".}

func mm256_mask_fmaddsub_ph*(a: M256h, u: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_mask_fmaddsub_ph".}

func mm256_mask3_fmaddsub_ph*(a: M256h, b: M256h, c: M256h, u: MMask16): M256h {.importc: "_mm256_mask3_fmaddsub_ph".}

func mm256_maskz_fmaddsub_ph*(u: MMask16, a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_fmaddsub_ph".}

func mm_fmaddsub_ph*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fmaddsub_ph".}

func mm_mask_fmaddsub_ph*(a: M128h, u: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_mask_fmaddsub_ph".}

func mm_mask3_fmaddsub_ph*(a: M128h, b: M128h, c: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fmaddsub_ph".}

func mm_maskz_fmaddsub_ph*(u: MMask8, a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fmaddsub_ph".}

func mm256_fmsubadd_ph*(a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_fmsubadd_ph".}

func mm256_mask_fmsubadd_ph*(a: M256h, u: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_mask_fmsubadd_ph".}

func mm256_mask3_fmsubadd_ph*(a: M256h, b: M256h, c: M256h, u: MMask16): M256h {.importc: "_mm256_mask3_fmsubadd_ph".}

func mm256_maskz_fmsubadd_ph*(u: MMask16, a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_fmsubadd_ph".}

func mm_fmsubadd_ph*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fmsubadd_ph".}

func mm_mask_fmsubadd_ph*(a: M128h, u: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_mask_fmsubadd_ph".}

func mm_mask3_fmsubadd_ph*(a: M128h, b: M128h, c: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fmsubadd_ph".}

func mm_maskz_fmsubadd_ph*(u: MMask8, a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fmsubadd_ph".}

func mm256_fmadd_ph*(a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_fmadd_ph".}

func mm256_mask_fmadd_ph*(a: M256h, u: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_mask_fmadd_ph".}

func mm256_mask3_fmadd_ph*(a: M256h, b: M256h, c: M256h, u: MMask16): M256h {.importc: "_mm256_mask3_fmadd_ph".}

func mm256_maskz_fmadd_ph*(u: MMask16, a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_fmadd_ph".}

func mm_fmadd_ph*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fmadd_ph".}

func mm_mask_fmadd_ph*(a: M128h, u: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_mask_fmadd_ph".}

func mm_mask3_fmadd_ph*(a: M128h, b: M128h, c: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fmadd_ph".}

func mm_maskz_fmadd_ph*(u: MMask8, a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fmadd_ph".}

func mm256_fnmadd_ph*(a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_fnmadd_ph".}

func mm256_mask_fnmadd_ph*(a: M256h, u: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_mask_fnmadd_ph".}

func mm256_mask3_fnmadd_ph*(a: M256h, b: M256h, c: M256h, u: MMask16): M256h {.importc: "_mm256_mask3_fnmadd_ph".}

func mm256_maskz_fnmadd_ph*(u: MMask16, a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_fnmadd_ph".}

func mm_fnmadd_ph*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fnmadd_ph".}

func mm_mask_fnmadd_ph*(a: M128h, u: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_mask_fnmadd_ph".}

func mm_mask3_fnmadd_ph*(a: M128h, b: M128h, c: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fnmadd_ph".}

func mm_maskz_fnmadd_ph*(u: MMask8, a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fnmadd_ph".}

func mm256_fmsub_ph*(a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_fmsub_ph".}

func mm256_mask_fmsub_ph*(a: M256h, u: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_mask_fmsub_ph".}

func mm256_mask3_fmsub_ph*(a: M256h, b: M256h, c: M256h, u: MMask16): M256h {.importc: "_mm256_mask3_fmsub_ph".}

func mm256_maskz_fmsub_ph*(u: MMask16, a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_fmsub_ph".}

func mm_fmsub_ph*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fmsub_ph".}

func mm_mask_fmsub_ph*(a: M128h, u: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_mask_fmsub_ph".}

func mm_mask3_fmsub_ph*(a: M128h, b: M128h, c: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fmsub_ph".}

func mm_maskz_fmsub_ph*(u: MMask8, a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fmsub_ph".}

func mm256_fnmsub_ph*(a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_fnmsub_ph".}

func mm256_mask_fnmsub_ph*(a: M256h, u: MMask16, b: M256h, c: M256h): M256h {.importc: "_mm256_mask_fnmsub_ph".}

func mm256_mask3_fnmsub_ph*(a: M256h, b: M256h, c: M256h, u: MMask16): M256h {.importc: "_mm256_mask3_fnmsub_ph".}

func mm256_maskz_fnmsub_ph*(u: MMask16, a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_fnmsub_ph".}

func mm_fnmsub_ph*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fnmsub_ph".}

func mm_mask_fnmsub_ph*(a: M128h, u: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_mask_fnmsub_ph".}

func mm_mask3_fnmsub_ph*(a: M128h, b: M128h, c: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fnmsub_ph".}

func mm_maskz_fnmsub_ph*(u: MMask8, a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fnmsub_ph".}

func mm_fmadd_pch*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fmadd_pch".}

func mm_mask_fmadd_pch*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_fmadd_pch".}

func mm_mask3_fmadd_pch*(a: M128h, b: M128h, c: M128h, d: MMask8): M128h {.importc: "_mm_mask3_fmadd_pch".}

func mm_maskz_fmadd_pch*(a: MMask8, b: M128h, c: M128h, d: M128h): M128h {.importc: "_mm_maskz_fmadd_pch".}

func mm256_fmadd_pch*(a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_fmadd_pch".}

func mm256_mask_fmadd_pch*(a: M256h, b: MMask8, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_fmadd_pch".}

func mm256_mask3_fmadd_pch*(a: M256h, b: M256h, c: M256h, d: MMask8): M256h {.importc: "_mm256_mask3_fmadd_pch".}

func mm256_maskz_fmadd_pch*(a: MMask8, b: M256h, c: M256h, d: M256h): M256h {.importc: "_mm256_maskz_fmadd_pch".}

func mm_fcmadd_pch*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fcmadd_pch".}

func mm_mask_fcmadd_pch*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_fcmadd_pch".}

func mm_mask3_fcmadd_pch*(a: M128h, b: M128h, c: M128h, d: MMask8): M128h {.importc: "_mm_mask3_fcmadd_pch".}

func mm_maskz_fcmadd_pch*(a: MMask8, b: M128h, c: M128h, d: M128h): M128h {.importc: "_mm_maskz_fcmadd_pch".}

func mm256_fcmadd_pch*(a: M256h, b: M256h, c: M256h): M256h {.importc: "_mm256_fcmadd_pch".}

func mm256_mask_fcmadd_pch*(a: M256h, b: MMask8, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_fcmadd_pch".}

func mm256_mask3_fcmadd_pch*(a: M256h, b: M256h, c: M256h, d: MMask8): M256h {.importc: "_mm256_mask3_fcmadd_pch".}

func mm256_maskz_fcmadd_pch*(a: MMask8, b: M256h, c: M256h, d: M256h): M256h {.importc: "_mm256_maskz_fcmadd_pch".}

func mm_fmul_pch*(a: M128h, b: M128h): M128h {.importc: "_mm_fmul_pch".}

func mm_mask_fmul_pch*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_fmul_pch".}

func mm_maskz_fmul_pch*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fmul_pch".}

func mm256_fmul_pch*(a: M256h, b: M256h): M256h {.importc: "_mm256_fmul_pch".}

func mm256_mask_fmul_pch*(a: M256h, b: MMask8, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_fmul_pch".}

func mm256_maskz_fmul_pch*(a: MMask8, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_fmul_pch".}

func mm_fcmul_pch*(a: M128h, b: M128h): M128h {.importc: "_mm_fcmul_pch".}

func mm_mask_fcmul_pch*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_fcmul_pch".}

func mm_maskz_fcmul_pch*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fcmul_pch".}

func mm256_fcmul_pch*(a: M256h, b: M256h): M256h {.importc: "_mm256_fcmul_pch".}

func mm256_mask_fcmul_pch*(a: M256h, b: MMask8, c: M256h, d: M256h): M256h {.importc: "_mm256_mask_fcmul_pch".}

func mm256_maskz_fcmul_pch*(a: MMask8, b: M256h, c: M256h): M256h {.importc: "_mm256_maskz_fcmul_pch".}

## [Macro Original]
## #define _MM256_REDUCE_OP(op)						\
## __m128h __T1 = (__m128h) _mm256_avx512_extractf128_pd ((__m256d) __A, 0);	\
## __m128h __T2 = (__m128h) _mm256_avx512_extractf128_pd ((__m256d) __A, 1);	\
## __m128h __T3 = (__T1 op __T2);					\
## __m128h __T4 = (__m128h) __builtin_shuffle (__T3,			\
## (__v8hi) { 4, 5, 6, 7, 0, 1, 2, 3 });			\
## __m128h __T5 = (__T3) op (__T4);					\
## __m128h __T6 = (__m128h) __builtin_shuffle (__T5,			\
## (__v8hi) { 2, 3, 0, 1, 4, 5, 6, 7 });			\
## __m128h __T7 = __T5 op __T6;						\
## return __T7[0] op __T7[1]

func mm256_reduce_add_ph*(a: M256h): Float16 {.importc: "_mm256_reduce_add_ph".}

func mm256_reduce_mul_ph*(a: M256h): Float16 {.importc: "_mm256_reduce_mul_ph".}

## [Macro Original]
## #define _MM256_REDUCE_OP(op)						\
## __m128h __T1 = (__m128h) _mm256_avx512_extractf128_pd ((__m256d) __A, 0);	\
## __m128h __T2 = (__m128h) _mm256_avx512_extractf128_pd ((__m256d) __A, 1);	\
## __m128h __T3 = _mm_##op (__T1, __T2);				\
## __m128h __T4 = (__m128h) __builtin_shuffle (__T3,			\
## (__v8hi) { 2, 3, 0, 1, 6, 7, 4, 5 });			\
## __m128h __T5 = _mm_##op (__T3, __T4);				\
## __m128h __T6 = (__m128h) __builtin_shuffle (__T5, (__v8hi) { 4, 5 }); \
## __m128h __T7 = _mm_##op (__T5, __T6);				\
## __m128h __T8 = (__m128h) __builtin_shuffle (__T7, (__v8hi) { 1, 0 }); \
## __m128h __T9 = _mm_##op (__T7, __T8);				\
## return __T9[0]

func mm256_reduce_min_ph*(a: M256h): Float16 {.importc: "_mm256_reduce_min_ph".}

func mm256_reduce_max_ph*(a: M256h): Float16 {.importc: "_mm256_reduce_max_ph".}

## [Macro Original]
## #define _MM_REDUCE_OP(op) 						\
## __m128h __T1 = (__m128h) __builtin_shuffle (__A,			\
## (__v8hi) { 4, 5, 6, 7, 0, 1, 2, 3 });			\
## __m128h __T2 = (__A) op (__T1);					\
## __m128h __T3 = (__m128h) __builtin_shuffle (__T2,			\
## (__v8hi){ 2, 3, 0, 1, 4, 5, 6, 7 });			\
## __m128h __T4 = __T2 op __T3;						\
## return __T4[0] op __T4[1]

func mm_reduce_add_ph*(a: M128h): Float16 {.importc: "_mm_reduce_add_ph".}

func mm_reduce_mul_ph*(a: M128h): Float16 {.importc: "_mm_reduce_mul_ph".}

## [Macro Original]
## #define _MM_REDUCE_OP(op) 						\
## __m128h __T1 = (__m128h) __builtin_shuffle (__A,			\
## (__v8hi) { 2, 3, 0, 1, 6, 7, 4, 5 });			\
## __m128h __T2 = _mm_##op (__A, __T1);					\
## __m128h __T3 = (__m128h) __builtin_shuffle (__T2, (__v8hi){ 4, 5 });	\
## __m128h __T4 = _mm_##op (__T2, __T3);				\
## __m128h __T5 = (__m128h) __builtin_shuffle (__T4, (__v8hi){ 1, 0 });	\
## __m128h __T6 = _mm_##op (__T4, __T5);				\
## return __T6[0]

func mm_reduce_min_ph*(a: M128h): Float16 {.importc: "_mm_reduce_min_ph".}

func mm_reduce_max_ph*(a: M128h): Float16 {.importc: "_mm_reduce_max_ph".}

func mm256_mask_blend_ph*(u: MMask16, a: M256h, w: M256h): M256h {.importc: "_mm256_mask_blend_ph".}

func mm256_permutex2var_ph*(a: M256h, i: M256i, b: M256h): M256h {.importc: "_mm256_permutex2var_ph".}

func mm256_permutexvar_ph*(a: M256i, b: M256h): M256h {.importc: "_mm256_permutexvar_ph".}

func mm_mask_blend_ph*(u: MMask8, a: M128h, w: M128h): M128h {.importc: "_mm_mask_blend_ph".}

func mm_permutex2var_ph*(a: M128h, i: M128i, b: M128h): M128h {.importc: "_mm_permutex2var_ph".}

func mm_permutexvar_ph*(a: M128i, b: M128h): M128h {.importc: "_mm_permutexvar_ph".}

# func mm256_set1_pch*(a: _Float16 _Complex): M256h {.importc: "_mm256_set1_pch".}

# func mm_set1_pch*(a: _Float16 _Complex): M128h {.importc: "_mm_set1_pch".}

## [Macro Original]
## #define _mm_mul_pch(A, B) _mm_fmul_pch ((A), (B))

## [Macro Original]
## #define _mm_mask_mul_pch(W, U, A, B) _mm_mask_fmul_pch ((W), (U), (A), (B))

## [Macro Original]
## #define _mm_maskz_mul_pch(U, A, B) _mm_maskz_fmul_pch ((U), (A), (B))

## [Macro Original]
## #define _mm256_mul_pch(A, B) _mm256_fmul_pch ((A), (B))

## [Macro Original]
## #define _mm256_mask_mul_pch(W, U, A, B)				      \
## _mm256_mask_fmul_pch ((W), (U), (A), (B))

## [Macro Original]
## #define _mm256_maskz_mul_pch(U, A, B) _mm256_maskz_fmul_pch ((U), (A), (B))

## [Macro Original]
## #define _mm_cmul_pch(A, B) _mm_fcmul_pch ((A), (B))

## [Macro Original]
## #define _mm_mask_cmul_pch(W, U, A, B) _mm_mask_fcmul_pch ((W), (U), (A), (B))

## [Macro Original]
## #define _mm_maskz_cmul_pch(U, A, B) _mm_maskz_fcmul_pch ((U), (A), (B))

## [Macro Original]
## #define _mm256_cmul_pch(A, B) _mm256_fcmul_pch ((A), (B))

## [Macro Original]
## #define _mm256_mask_cmul_pch(W, U, A, B)			      \
## _mm256_mask_fcmul_pch ((W), (U), (A), (B))

## [Macro Original]
## #define _mm256_maskz_cmul_pch(U, A, B) _mm256_maskz_fcmul_pch((U), (A), (B))