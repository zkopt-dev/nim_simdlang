import avx512f

## [Macro Original]
## #define _AVX512FP16INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512FP16__

func mm_set_ph*(a7: Float16, a6: Float16, a5: Float16, a4: Float16, a3: Float16, a2: Float16, a1: Float16, a0: Float16): M128h {.importc: "_mm_set_ph".}

func mm256_set_ph*(a15: Float16, a14: Float16, a13: Float16, a12: Float16, a11: Float16, a10: Float16, a9: Float16, a8: Float16, a7: Float16, a6: Float16, a5: Float16, a4: Float16, a3: Float16, a2: Float16, a1: Float16, a0: Float16): M256h {.importc: "_mm256_set_ph".}

func mm_setr_ph*(a0: Float16, a1: Float16, a2: Float16, a3: Float16, a4: Float16, a5: Float16, a6: Float16, a7: Float16): M128h {.importc: "_mm_setr_ph".}

func mm256_setr_ph*(a0: Float16, a1: Float16, a2: Float16, a3: Float16, a4: Float16, a5: Float16, a6: Float16, a7: Float16, a8: Float16, a9: Float16, a10: Float16, a11: Float16, a12: Float16, a13: Float16, a14: Float16, a15: Float16): M256h {.importc: "_mm256_setr_ph".}

func mm_set1_ph*(a: Float16): M128h {.importc: "_mm_set1_ph".}

func mm256_set1_ph*(a: Float16): M256h {.importc: "_mm256_set1_ph".}

func mm_setzero_ph*(): M128h {.importc: "_mm_setzero_ph".}

func mm256_setzero_ph*(): M256h {.importc: "_mm256_setzero_ph".}

func mm_undefined_ph*(): M128h {.importc: "_mm_undefined_ph".}

func mm256_undefined_ph*(): M256h {.importc: "_mm256_undefined_ph".}

func mm256_cvtsh_h*(a: M256h): Float16 {.importc: "_mm256_cvtsh_h".}

func mm256_load_ph*(p: pointer): M256h {.importc: "_mm256_load_ph".}

func mm_load_ph*(p: pointer): M128h {.importc: "_mm_load_ph".}

func mm256_loadu_ph*(p: pointer): M256h {.importc: "_mm256_loadu_ph".}

func mm_loadu_ph*(p: pointer): M128h {.importc: "_mm_loadu_ph".}

func mm256_store_ph*(p: pointer, a: M256h): void {.importc: "_mm256_store_ph".}

func mm_store_ph*(p: pointer, a: M128h): void {.importc: "_mm_store_ph".}

func mm256_storeu_ph*(p: pointer, a: M256h): void {.importc: "_mm256_storeu_ph".}

func mm_storeu_ph*(p: pointer, a: M128h): void {.importc: "_mm_storeu_ph".}

func mm_set_sh*(f: Float16): M128h {.importc: "_mm_set_sh".}

func mm_load_sh*(p: pointer): M128h {.importc: "_mm_load_sh".}

func mm_store_sh*(p: pointer, a: M128h): void {.importc: "_mm_store_sh".}

func mm_add_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_add_sh".}

func mm_mask_add_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_add_sh".}

func mm_maskz_add_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_add_sh".}

func mm_sub_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_sub_sh".}

func mm_mask_sub_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_sub_sh".}

func mm_maskz_sub_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_sub_sh".}

func mm_mul_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_mul_sh".}

func mm_mask_mul_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_mul_sh".}

func mm_maskz_mul_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_mul_sh".}

func mm_div_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_div_sh".}

func mm_mask_div_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_div_sh".}

func mm_maskz_div_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_div_sh".}

func mm_add_round_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_add_round_sh".}

func mm_mask_add_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_add_round_sh".}

func mm_maskz_add_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_add_round_sh".}

func mm_sub_round_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_sub_round_sh".}

func mm_mask_sub_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_sub_round_sh".}

func mm_maskz_sub_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_sub_round_sh".}

func mm_mul_round_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_mul_round_sh".}

func mm_mask_mul_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_mul_round_sh".}

func mm_maskz_mul_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_mul_round_sh".}

func mm_div_round_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_div_round_sh".}

func mm_mask_div_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_div_round_sh".}

func mm_maskz_div_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_div_round_sh".}

## [Macro Original]
## #define _mm_add_round_sh(A, B, C)					\
## ((__m128h)__builtin_ia32_addsh_mask_round ((A), (B),			\
## _mm_setzero_ph (),		\
## (__mmask8)-1, (C)))

## [Macro Original]
## #define _mm_mask_add_round_sh(A, B, C, D, E)				\
## ((__m128h)__builtin_ia32_addsh_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm_maskz_add_round_sh(A, B, C, D)			\
## ((__m128h)__builtin_ia32_addsh_mask_round ((B), (C),		\
## _mm_setzero_ph (),	\
## (A), (D)))

## [Macro Original]
## #define _mm_sub_round_sh(A, B, C)					\
## ((__m128h)__builtin_ia32_subsh_mask_round ((A), (B),			\
## _mm_setzero_ph (),		\
## (__mmask8)-1, (C)))

## [Macro Original]
## #define _mm_mask_sub_round_sh(A, B, C, D, E)				\
## ((__m128h)__builtin_ia32_subsh_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm_maskz_sub_round_sh(A, B, C, D)			\
## ((__m128h)__builtin_ia32_subsh_mask_round ((B), (C),		\
## _mm_setzero_ph (),	\
## (A), (D)))

## [Macro Original]
## #define _mm_mul_round_sh(A, B, C)					\
## ((__m128h)__builtin_ia32_mulsh_mask_round ((A), (B),			\
## _mm_setzero_ph (),		\
## (__mmask8)-1, (C)))

## [Macro Original]
## #define _mm_mask_mul_round_sh(A, B, C, D, E)				\
## ((__m128h)__builtin_ia32_mulsh_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm_maskz_mul_round_sh(A, B, C, D)			\
## ((__m128h)__builtin_ia32_mulsh_mask_round ((B), (C),		\
## _mm_setzero_ph (),	\
## (A), (D)))

## [Macro Original]
## #define _mm_div_round_sh(A, B, C)					\
## ((__m128h)__builtin_ia32_divsh_mask_round ((A), (B),			\
## _mm_setzero_ph (),		\
## (__mmask8)-1, (C)))

## [Macro Original]
## #define _mm_mask_div_round_sh(A, B, C, D, E)				\
## ((__m128h)__builtin_ia32_divsh_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm_maskz_div_round_sh(A, B, C, D)			\
## ((__m128h)__builtin_ia32_divsh_mask_round ((B), (C),		\
## _mm_setzero_ph (),	\
## (A), (D)))

func mm_max_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_max_sh".}

func mm_mask_max_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_max_sh".}

func mm_maskz_max_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_max_sh".}

func mm_min_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_min_sh".}

func mm_mask_min_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_min_sh".}

func mm_maskz_min_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_min_sh".}

func mm_max_round_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_max_round_sh".}

func mm_mask_max_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_max_round_sh".}

func mm_maskz_max_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_max_round_sh".}

func mm_min_round_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_min_round_sh".}

func mm_mask_min_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_min_round_sh".}

func mm_maskz_min_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_min_round_sh".}

## [Macro Original]
## #define _mm_max_round_sh(A, B, C)			\
## (__builtin_ia32_maxsh_mask_round ((A), (B),		\
## _mm_setzero_ph (),	\
## (__mmask8)-1, (C)))

## [Macro Original]
## #define _mm_mask_max_round_sh(A, B, C, D, E)			\
## (__builtin_ia32_maxsh_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm_maskz_max_round_sh(A, B, C, D)		\
## (__builtin_ia32_maxsh_mask_round ((B), (C),		\
## _mm_setzero_ph (),	\
## (A), (D)))

## [Macro Original]
## #define _mm_min_round_sh(A, B, C)			\
## (__builtin_ia32_minsh_mask_round ((A), (B),		\
## _mm_setzero_ph (),	\
## (__mmask8)-1, (C)))

## [Macro Original]
## #define _mm_mask_min_round_sh(A, B, C, D, E)			\
## (__builtin_ia32_minsh_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm_maskz_min_round_sh(A, B, C, D)		\
## (__builtin_ia32_minsh_mask_round ((B), (C),		\
## _mm_setzero_ph (),	\
## (A), (D)))

func mm_cmp_sh_mask*(a: M128h, b: M128h, c: int32): MMask8 {.importc: "_mm_cmp_sh_mask".}

func mm_mask_cmp_sh_mask*(a: MMask8, b: M128h, c: M128h, d: int32): MMask8 {.importc: "_mm_mask_cmp_sh_mask".}

func mm_cmp_round_sh_mask*(a: M128h, b: M128h, c: int32, d: int32): MMask8 {.importc: "_mm_cmp_round_sh_mask".}

func mm_mask_cmp_round_sh_mask*(a: MMask8, b: M128h, c: M128h, d: int32, e: int32): MMask8 {.importc: "_mm_mask_cmp_round_sh_mask".}

## [Macro Original]
## #define _mm_cmp_sh_mask(A, B, C)					\
## (__builtin_ia32_cmpsh_mask_round ((A), (B), (C), (-1),		\
## (_MM_FROUND_CUR_DIRECTION)))

## [Macro Original]
## #define _mm_mask_cmp_sh_mask(A, B, C, D)				\
## (__builtin_ia32_cmpsh_mask_round ((B), (C), (D), (A),			\
## (_MM_FROUND_CUR_DIRECTION)))

## [Macro Original]
## #define _mm_cmp_round_sh_mask(A, B, C, D)			\
## (__builtin_ia32_cmpsh_mask_round ((A), (B), (C), (-1), (D)))

## [Macro Original]
## #define _mm_mask_cmp_round_sh_mask(A, B, C, D, E)		\
## (__builtin_ia32_cmpsh_mask_round ((B), (C), (D), (A), (E)))

func mm_comieq_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_comieq_sh".}

func mm_comilt_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_comilt_sh".}

func mm_comile_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_comile_sh".}

func mm_comigt_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_comigt_sh".}

func mm_comige_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_comige_sh".}

func mm_comineq_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_comineq_sh".}

func mm_ucomieq_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_ucomieq_sh".}

func mm_ucomilt_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_ucomilt_sh".}

func mm_ucomile_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_ucomile_sh".}

func mm_ucomigt_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_ucomigt_sh".}

func mm_ucomige_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_ucomige_sh".}

func mm_ucomineq_sh*(a: M128h, b: M128h): int32 {.importc: "_mm_ucomineq_sh".}

func mm_comi_sh*(a: M128h, b: M128h, p: int32): int32 {.importc: "_mm_comi_sh".}

func mm_comi_round_sh*(a: M128h, b: M128h, p: int32, r: int32): int32 {.importc: "_mm_comi_round_sh".}

## [Macro Original]
## #define _mm_comi_round_sh(A, B, P, R)					\
## (__builtin_ia32_cmpsh_mask_round ((A), (B), (P), (__mmask8) (-1), (R)))

## [Macro Original]
## #define _mm_comi_sh(A, B, P)						\
## (__builtin_ia32_cmpsh_mask_round ((A), (B), (P), (__mmask8) (-1),	\
## _MM_FROUND_CUR_DIRECTION))

func mm_sqrt_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_sqrt_sh".}

func mm_mask_sqrt_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_sqrt_sh".}

func mm_maskz_sqrt_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_sqrt_sh".}

func mm_sqrt_round_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_sqrt_round_sh".}

func mm_mask_sqrt_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_sqrt_round_sh".}

func mm_maskz_sqrt_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_sqrt_round_sh".}

## [Macro Original]
## #define _mm_sqrt_round_sh(A, B, C)				\
## (__builtin_ia32_sqrtsh_mask_round ((B), (A),			\
## _mm_setzero_ph (),		\
## (__mmask8)-1, (C)))

## [Macro Original]
## #define _mm_mask_sqrt_round_sh(A, B, C, D, E)			\
## (__builtin_ia32_sqrtsh_mask_round ((D), (C), (A), (B), (E)))

## [Macro Original]
## #define _mm_maskz_sqrt_round_sh(A, B, C, D)		\
## (__builtin_ia32_sqrtsh_mask_round ((C), (B),		\
## _mm_setzero_ph (),	\
## (A), (D)))

func mm_rsqrt_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_rsqrt_sh".}

func mm_mask_rsqrt_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_rsqrt_sh".}

func mm_maskz_rsqrt_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_rsqrt_sh".}

func mm_rcp_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_rcp_sh".}

func mm_mask_rcp_sh*(a: M128h, b: MMask32, c: M128h, d: M128h): M128h {.importc: "_mm_mask_rcp_sh".}

func mm_maskz_rcp_sh*(a: MMask32, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_rcp_sh".}

func mm_scalef_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_scalef_sh".}

func mm_mask_scalef_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_scalef_sh".}

func mm_maskz_scalef_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_scalef_sh".}

func mm_scalef_round_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_scalef_round_sh".}

func mm_mask_scalef_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_scalef_round_sh".}

func mm_maskz_scalef_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_scalef_round_sh".}

## [Macro Original]
## #define _mm_scalef_round_sh(A, B, C)				\
## (__builtin_ia32_scalefsh_mask_round ((A), (B),		\
## _mm_setzero_ph (),	\
## (__mmask8)-1, (C)))

## [Macro Original]
## #define _mm_mask_scalef_round_sh(A, B, C, D, E)				\
## (__builtin_ia32_scalefsh_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm_maskz_scalef_round_sh(A, B, C, D)				\
## (__builtin_ia32_scalefsh_mask_round ((B), (C), _mm_setzero_ph (),	\
## (A), (D)))

func mm_reduce_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_reduce_sh".}

func mm_mask_reduce_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_reduce_sh".}

func mm_maskz_reduce_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_reduce_sh".}

func mm_reduce_round_sh*(a: M128h, b: M128h, c: int32, d: int32): M128h {.importc: "_mm_reduce_round_sh".}

func mm_mask_reduce_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32, f: int32): M128h {.importc: "_mm_mask_reduce_round_sh".}

func mm_maskz_reduce_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32, e: int32): M128h {.importc: "_mm_maskz_reduce_round_sh".}

## [Macro Original]
## #define _mm_reduce_sh(A, B, C)						\
## (__builtin_ia32_reducesh_mask_round ((A), (B), (C),			\
## _mm_setzero_ph (),		\
## (__mmask8)-1,			\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_reduce_sh(A, B, C, D, E)				\
## (__builtin_ia32_reducesh_mask_round ((C), (D), (E), (A), (B),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_reduce_sh(A, B, C, D)					\
## (__builtin_ia32_reducesh_mask_round ((B), (C), (D),			\
## _mm_setzero_ph (),		\
## (A), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_reduce_round_sh(A, B, C, D)				\
## (__builtin_ia32_reducesh_mask_round ((A), (B), (C),		\
## _mm_setzero_ph (),	\
## (__mmask8)-1, (D)))

## [Macro Original]
## #define _mm_mask_reduce_round_sh(A, B, C, D, E, F)			\
## (__builtin_ia32_reducesh_mask_round ((C), (D), (E), (A), (B), (F)))

## [Macro Original]
## #define _mm_maskz_reduce_round_sh(A, B, C, D, E)		\
## (__builtin_ia32_reducesh_mask_round ((B), (C), (D),		\
## _mm_setzero_ph (),	\
## (A), (E)))

func mm_roundscale_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_roundscale_sh".}

func mm_mask_roundscale_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_roundscale_sh".}

func mm_maskz_roundscale_sh*(a: MMask8, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_maskz_roundscale_sh".}

func mm_roundscale_round_sh*(a: M128h, b: M128h, c: int32, d: int32): M128h {.importc: "_mm_roundscale_round_sh".}

func mm_mask_roundscale_round_sh*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32, f: int32): M128h {.importc: "_mm_mask_roundscale_round_sh".}

func mm_maskz_roundscale_round_sh*(a: MMask8, b: M128h, c: M128h, d: int32, e: int32): M128h {.importc: "_mm_maskz_roundscale_round_sh".}

## [Macro Original]
## #define _mm_roundscale_sh(A, B, C)					\
## (__builtin_ia32_rndscalesh_mask_round ((A), (B), (C),			\
## _mm_setzero_ph (),		\
## (__mmask8)-1,			\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_roundscale_sh(A, B, C, D, E)				\
## (__builtin_ia32_rndscalesh_mask_round ((C), (D), (E), (A), (B),	\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_roundscale_sh(A, B, C, D)				\
## (__builtin_ia32_rndscalesh_mask_round ((B), (C), (D),			\
## _mm_setzero_ph (),		\
## (A), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_roundscale_round_sh(A, B, C, D)			\
## (__builtin_ia32_rndscalesh_mask_round ((A), (B), (C),		\
## _mm_setzero_ph (),	\
## (__mmask8)-1, (D)))

## [Macro Original]
## #define _mm_mask_roundscale_round_sh(A, B, C, D, E, F)			\
## (__builtin_ia32_rndscalesh_mask_round ((C), (D), (E), (A), (B), (F)))

## [Macro Original]
## #define _mm_maskz_roundscale_round_sh(A, B, C, D, E)		\
## (__builtin_ia32_rndscalesh_mask_round ((B), (C), (D),		\
## _mm_setzero_ph (),	\
## (A), (E)))

func mm_fpclass_sh_mask*(a: M128h, imm: int32): MMask8 {.importc: "_mm_fpclass_sh_mask".}

func mm_mask_fpclass_sh_mask*(u: MMask8, a: M128h, imm: int32): MMask8 {.importc: "_mm_mask_fpclass_sh_mask".}

## [Macro Original]
## #define _mm_fpclass_sh_mask(X, C)					\
## ((__mmask8) __builtin_ia32_fpclasssh_mask ((__v8hf) (__m128h) (X),	\
## (int) (C), (__mmask8) (-1))) \
## 

## [Macro Original]
## #define _mm_mask_fpclass_sh_mask(U, X, C)				\
## ((__mmask8) __builtin_ia32_fpclasssh_mask ((__v8hf) (__m128h) (X),	\
## (int) (C), (__mmask8) (U)))

func mm_getexp_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_getexp_sh".}

func mm_mask_getexp_sh*(w: M128h, u: MMask8, a: M128h, b: M128h): M128h {.importc: "_mm_mask_getexp_sh".}

func mm_maskz_getexp_sh*(u: MMask8, a: M128h, b: M128h): M128h {.importc: "_mm_maskz_getexp_sh".}

func mm_getexp_round_sh*(a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_getexp_round_sh".}

func mm_mask_getexp_round_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_mask_getexp_round_sh".}

func mm_maskz_getexp_round_sh*(u: MMask8, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_maskz_getexp_round_sh".}

## [Macro Original]
## #define _mm_getexp_round_sh(A, B, R)					\
## ((__m128h)__builtin_ia32_getexpsh_mask_round((__v8hf)(__m128h)(A),	\
## (__v8hf)(__m128h)(B),	\
## (__v8hf)_mm_setzero_ph(), \
## (__mmask8)-1, R))

## [Macro Original]
## #define _mm_mask_getexp_round_sh(W, U, A, B, C)			\
## (__m128h)__builtin_ia32_getexpsh_mask_round(A, B, W, U, C)

## [Macro Original]
## #define _mm_maskz_getexp_round_sh(U, A, B, C)				\
## (__m128h)__builtin_ia32_getexpsh_mask_round(A, B,			\
## (__v8hf)_mm_setzero_ph(),	\
## U, C)

func mm_getmant_sh*(a: M128h, b: M128h, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128h {.importc: "_mm_getmant_sh".}

func mm_mask_getmant_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128h {.importc: "_mm_mask_getmant_sh".}

func mm_maskz_getmant_sh*(u: MMask8, a: M128h, b: M128h, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM): M128h {.importc: "_mm_maskz_getmant_sh".} 

func mm_getmant_round_sh*(a: M128h, b: M128h, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128h {.importc: "_mm_getmant_round_sh".}

func mm_mask_getmant_round_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128h {.importc: "_mm_mask_getmant_round_sh".}

func mm_maskz_getmant_round_sh*(u: MMask8, a: M128h, b: M128h, c: MM_MANTISSA_NORM_ENUM, d: MM_MANTISSA_SIGN_ENUM, r: int32): M128h {.importc: "_mm_maskz_getmant_round_sh".}

## [Macro Original]
## #define _mm_getmant_sh(X, Y, C, D)					\
## ((__m128h)__builtin_ia32_getmantsh_mask_round ((__v8hf)(__m128h)(X),	\
## (__v8hf)(__m128h)(Y),	\
## (int)(((D)<<2) | (C)),	\
## (__v8hf)(__m128h)	\
## _mm_setzero_ph (),	\
## (__mmask8)-1,		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_getmant_sh(W, U, X, Y, C, D)				\
## ((__m128h)__builtin_ia32_getmantsh_mask_round ((__v8hf)(__m128h)(X),	\
## (__v8hf)(__m128h)(Y),	\
## (int)(((D)<<2) | (C)),	\
## (__v8hf)(__m128h)(W),	\
## (__mmask8)(U),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_getmant_sh(U, X, Y, C, D)				\
## ((__m128h)__builtin_ia32_getmantsh_mask_round ((__v8hf)(__m128h)(X),	\
## (__v8hf)(__m128h)(Y),	\
## (int)(((D)<<2) | (C)),	\
## (__v8hf)(__m128h)	\
## _mm_setzero_ph(),	\
## (__mmask8)(U),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_getmant_round_sh(X, Y, C, D, R)				\
## ((__m128h)__builtin_ia32_getmantsh_mask_round ((__v8hf)(__m128h)(X),	\
## (__v8hf)(__m128h)(Y),	\
## (int)(((D)<<2) | (C)),	\
## (__v8hf)(__m128h)	\
## _mm_setzero_ph (),	\
## (__mmask8)-1,		\
## (R)))

## [Macro Original]
## #define _mm_mask_getmant_round_sh(W, U, X, Y, C, D, R)			\
## ((__m128h)__builtin_ia32_getmantsh_mask_round ((__v8hf)(__m128h)(X),	\
## (__v8hf)(__m128h)(Y),	\
## (int)(((D)<<2) | (C)),	\
## (__v8hf)(__m128h)(W),	\
## (__mmask8)(U),		\
## (R)))

## [Macro Original]
## #define _mm_maskz_getmant_round_sh(U, X, Y, C, D, R)			\
## ((__m128h)__builtin_ia32_getmantsh_mask_round ((__v8hf)(__m128h)(X),	\
## (__v8hf)(__m128h)(Y),	\
## (int)(((D)<<2) | (C)),	\
## (__v8hf)(__m128h)	\
## _mm_setzero_ph(),	\
## (__mmask8)(U),		\
## (R)))

func mm_cvtsi16_si128*(a: int16): M128i {.importc: "_mm_cvtsi16_si128".}

func mm_cvtsi128_si16*(a: M128i): int16 {.importc: "_mm_cvtsi128_si16".}

func mm_mask_load_sh*(a: M128h, b: MMask8, c: ptr Float16): M128h {.importc: "_mm_mask_load_sh".}

func mm_maskz_load_sh*(a: MMask8, b: ptr Float16): M128h {.importc: "_mm_maskz_load_sh".}

func mm_mask_store_sh*(a: ptr Float16, b: MMask8, c: M128h): void {.importc: "_mm_mask_store_sh".}

func mm_move_sh*(a: M128h, b: M128h): M128h {.importc: "_mm_move_sh".}

func mm_mask_move_sh*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_move_sh".}

func mm_maskz_move_sh*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_move_sh".}

func mm_cvtsh_i32*(a: M128h): int32 {.importc: "_mm_cvtsh_i32".}

func mm_cvtsh_u32*(a: M128h): uint32 {.importc: "_mm_cvtsh_u32".}

func mm_cvt_roundsh_i32*(a: M128h, r: int32): int32 {.importc: "_mm_cvt_roundsh_i32".}

func mm_cvt_roundsh_u32*(a: M128h, r: int32): uint32 {.importc: "_mm_cvt_roundsh_u32".}

## [Macro Original]
## #define _mm_cvt_roundsh_i32(A, B)		\
## ((int)__builtin_ia32_vcvtsh2si32_round ((A), (B)))

## [Macro Original]
## #define _mm_cvt_roundsh_u32(A, B)		\
## ((int)__builtin_ia32_vcvtsh2usi32_round ((A), (B)))

func mm_cvtsh_i64*(a: M128h): int64 {.importc: "_mm_cvtsh_i64".}

func mm_cvtsh_u64*(a: M128h): uint64 {.importc: "_mm_cvtsh_u64".}

func mm_cvt_roundsh_i64*(a: M128h, r: int32): int64 {.importc: "_mm_cvt_roundsh_i64".}

func mm_cvt_roundsh_u64*(a: M128h, r: int32): uint64 {.importc: "_mm_cvt_roundsh_u64".}

## [Macro Original]
## #define _mm_cvt_roundsh_i64(A, B)			\
## ((long long)__builtin_ia32_vcvtsh2si64_round ((A), (B)))

## [Macro Original]
## #define _mm_cvt_roundsh_u64(A, B)			\
## ((long long)__builtin_ia32_vcvtsh2usi64_round ((A), (B)))

func mm_cvti32_sh*(a: M128h, b: int32): M128h {.importc: "_mm_cvti32_sh".}

func mm_cvtu32_sh*(a: M128h, b: uint32): M128h {.importc: "_mm_cvtu32_sh".}

func mm_cvt_roundi32_sh*(a: M128h, b: int32, r: int32): M128h {.importc: "_mm_cvt_roundi32_sh".}

func mm_cvt_roundu32_sh*(a: M128h, b: uint32, r: int32): M128h {.importc: "_mm_cvt_roundu32_sh".}

## [Macro Original]
## #define _mm_cvt_roundi32_sh(A, B, C)		\
## (__builtin_ia32_vcvtsi2sh32_round ((A), (B), (C)))

## [Macro Original]
## #define _mm_cvt_roundu32_sh(A, B, C)		\
## (__builtin_ia32_vcvtusi2sh32_round ((A), (B), (C)))

func mm_cvti64_sh*(a: M128h, b: int64): M128h {.importc: "_mm_cvti64_sh".}

func mm_cvtu64_sh*(a: M128h, b: uint64): M128h {.importc: "_mm_cvtu64_sh".}

func mm_cvt_roundi64_sh*(a: M128h, b: int64, r: int32): M128h {.importc: "_mm_cvt_roundi64_sh".}

func mm_cvt_roundu64_sh*(a: M128h, b: uint64, r: int32): M128h {.importc: "_mm_cvt_roundu64_sh".}

## [Macro Original]
## #define _mm_cvt_roundi64_sh(A, B, C)		\
## (__builtin_ia32_vcvtsi2sh64_round ((A), (B), (C)))

## [Macro Original]
## #define _mm_cvt_roundu64_sh(A, B, C)		\
## (__builtin_ia32_vcvtusi2sh64_round ((A), (B), (C)))

func mm_cvttsh_i32*(a: M128h): int32 {.importc: "_mm_cvttsh_i32".}

func mm_cvttsh_u32*(a: M128h): uint32 {.importc: "_mm_cvttsh_u32".}

func mm_cvtt_roundsh_i32*(a: M128h, r: int32): int32 {.importc: "_mm_cvtt_roundsh_i32".}

func mm_cvtt_roundsh_u32*(a: M128h, r: int32): uint32 {.importc: "_mm_cvtt_roundsh_u32".}

## [Macro Original]
## #define _mm_cvtt_roundsh_i32(A, B)		\
## ((int)__builtin_ia32_vcvttsh2si32_round ((A), (B)))

## [Macro Original]
## #define _mm_cvtt_roundsh_u32(A, B)		\
## ((int)__builtin_ia32_vcvttsh2usi32_round ((A), (B)))

func mm_cvttsh_i64*(a: M128h): int64 {.importc: "_mm_cvttsh_i64".}

func mm_cvttsh_u64*(a: M128h): uint64 {.importc: "_mm_cvttsh_u64".}

func mm_cvtt_roundsh_i64*(a: M128h, r: int32): int64 {.importc: "_mm_cvtt_roundsh_i64".}

func mm_cvtt_roundsh_u64*(a: M128h, r: int32): uint64 {.importc: "_mm_cvtt_roundsh_u64".}

## [Macro Original]
## #define _mm_cvtt_roundsh_i64(A, B)			\
## ((long long)__builtin_ia32_vcvttsh2si64_round ((A), (B)))

## [Macro Original]
## #define _mm_cvtt_roundsh_u64(A, B)			\
## ((long long)__builtin_ia32_vcvttsh2usi64_round ((A), (B)))

func mm_cvtsh_ss*(a: M128, b: M128h): M128 {.importc: "_mm_cvtsh_ss".}

func mm_mask_cvtsh_ss*(a: M128, b: MMask8, c: M128, d: M128h): M128 {.importc: "_mm_mask_cvtsh_ss".}

func mm_maskz_cvtsh_ss*(a: MMask8, b: M128, c: M128h): M128 {.importc: "_mm_maskz_cvtsh_ss".}

func mm_cvtsh_sd*(a: M128d, b: M128h): M128d {.importc: "_mm_cvtsh_sd".}

func mm_mask_cvtsh_sd*(a: M128d, b: MMask8, c: M128d, d: M128h): M128d {.importc: "_mm_mask_cvtsh_sd".}

func mm_maskz_cvtsh_sd*(a: MMask8, b: M128d, c: M128h): M128d {.importc: "_mm_maskz_cvtsh_sd".}

func mm_cvt_roundsh_ss*(a: M128, b: M128h, r: int32): M128 {.importc: "_mm_cvt_roundsh_ss".}

func mm_mask_cvt_roundsh_ss*(a: M128, b: MMask8, c: M128, d: M128h, r: int32): M128 {.importc: "_mm_mask_cvt_roundsh_ss".}

func mm_maskz_cvt_roundsh_ss*(a: MMask8, b: M128, c: M128h, r: int32): M128 {.importc: "_mm_maskz_cvt_roundsh_ss".}

func mm_cvt_roundsh_sd*(a: M128d, b: M128h, r: int32): M128d {.importc: "_mm_cvt_roundsh_sd".}

func mm_mask_cvt_roundsh_sd*(a: M128d, b: MMask8, c: M128d, d: M128h, r: int32): M128d {.importc: "_mm_mask_cvt_roundsh_sd".}

func mm_maskz_cvt_roundsh_sd*(a: MMask8, b: M128d, c: M128h, r: int32): M128d {.importc: "_mm_maskz_cvt_roundsh_sd".}

## [Macro Original]
## #define _mm_cvt_roundsh_ss(A, B, R)				\
## (__builtin_ia32_vcvtsh2ss_mask_round ((B), (A),		\
## _mm_avx512_setzero_ps (),	\
## (__mmask8) -1, (R)))

## [Macro Original]
## #define _mm_mask_cvt_roundsh_ss(A, B, C, D, R)				\
## (__builtin_ia32_vcvtsh2ss_mask_round ((D), (C), (A), (B), (R)))

## [Macro Original]
## #define _mm_maskz_cvt_roundsh_ss(A, B, C, R)			\
## (__builtin_ia32_vcvtsh2ss_mask_round ((C), (B),		\
## _mm_avx512_setzero_ps (),	\
## (A), (R)))

## [Macro Original]
## #define _mm_cvt_roundsh_sd(A, B, R)				\
## (__builtin_ia32_vcvtsh2sd_mask_round ((B), (A),		\
## _mm_avx512_setzero_pd (),	\
## (__mmask8) -1, (R)))

## [Macro Original]
## #define _mm_mask_cvt_roundsh_sd(A, B, C, D, R)				\
## (__builtin_ia32_vcvtsh2sd_mask_round ((D), (C), (A), (B), (R)))

## [Macro Original]
## #define _mm_maskz_cvt_roundsh_sd(A, B, C, R)			\
## (__builtin_ia32_vcvtsh2sd_mask_round ((C), (B),		\
## _mm_avx512_setzero_pd (),	\
## (A), (R)))

func mm_cvtss_sh*(a: M128h, b: M128): M128h {.importc: "_mm_cvtss_sh".}

func mm_mask_cvtss_sh*(a: M128h, b: MMask8, c: M128h, d: M128): M128h {.importc: "_mm_mask_cvtss_sh".}

func mm_maskz_cvtss_sh*(a: MMask8, b: M128h, c: M128): M128h {.importc: "_mm_maskz_cvtss_sh".}

func mm_cvtsd_sh*(a: M128h, b: M128d): M128h {.importc: "_mm_cvtsd_sh".}

func mm_mask_cvtsd_sh*(a: M128h, b: MMask8, c: M128h, d: M128d): M128h {.importc: "_mm_mask_cvtsd_sh".}

func mm_maskz_cvtsd_sh*(a: MMask8, b: M128h, c: M128d): M128h {.importc: "_mm_maskz_cvtsd_sh".}

func mm_cvt_roundss_sh*(a: M128h, b: M128, r: int32): M128h {.importc: "_mm_cvt_roundss_sh".}

func mm_mask_cvt_roundss_sh*(a: M128h, b: MMask8, c: M128h, d: M128, r: int32): M128h {.importc: "_mm_mask_cvt_roundss_sh".}

func mm_maskz_cvt_roundss_sh*(a: MMask8, b: M128h, c: M128, r: int32): M128h {.importc: "_mm_maskz_cvt_roundss_sh".}

func mm_cvt_roundsd_sh*(a: M128h, b: M128d, r: int32): M128h {.importc: "_mm_cvt_roundsd_sh".}

func mm_mask_cvt_roundsd_sh*(a: M128h, b: MMask8, c: M128h, d: M128d, r: int32): M128h {.importc: "_mm_mask_cvt_roundsd_sh".}

func mm_maskz_cvt_roundsd_sh*(a: MMask8, b: M128h, c: M128d, r: int32): M128h {.importc: "_mm_maskz_cvt_roundsd_sh".}

## [Macro Original]
## #define _mm_cvt_roundss_sh(A, B, R)				\
## (__builtin_ia32_vcvtss2sh_mask_round ((B), (A),		\
## _mm_setzero_ph (),	\
## (__mmask8) -1, R))

## [Macro Original]
## #define _mm_mask_cvt_roundss_sh(A, B, C, D, R)				\
## (__builtin_ia32_vcvtss2sh_mask_round ((D), (C), (A), (B), (R)))

## [Macro Original]
## #define _mm_maskz_cvt_roundss_sh(A, B, C, R)			\
## (__builtin_ia32_vcvtss2sh_mask_round ((C), (B),		\
## _mm_setzero_ph (),	\
## A, R))

## [Macro Original]
## #define _mm_cvt_roundsd_sh(A, B, R)				\
## (__builtin_ia32_vcvtsd2sh_mask_round ((B), (A),		\
## _mm_setzero_ph (),	\
## (__mmask8) -1, R))

## [Macro Original]
## #define _mm_mask_cvt_roundsd_sh(A, B, C, D, R)				\
## (__builtin_ia32_vcvtsd2sh_mask_round ((D), (C), (A), (B), (R)))

## [Macro Original]
## #define _mm_maskz_cvt_roundsd_sh(A, B, C, R)			\
## (__builtin_ia32_vcvtsd2sh_mask_round ((C), (B),		\
## _mm_setzero_ph (),	\
## (A), (R)))

func mm_cvtsh_h*(a: M128h): Float16 {.importc: "_mm_cvtsh_h".}

func mm_fmadd_sh*(w: M128h, a: M128h, b: M128h): M128h {.importc: "_mm_fmadd_sh".}

func mm_mask_fmadd_sh*(w: M128h, u: MMask8, a: M128h, b: M128h): M128h {.importc: "_mm_mask_fmadd_sh".}

func mm_mask3_fmadd_sh*(w: M128h, a: M128h, b: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fmadd_sh".}

func mm_maskz_fmadd_sh*(u: MMask8, w: M128h, a: M128h, b: M128h): M128h {.importc: "_mm_maskz_fmadd_sh".}

func mm_fmadd_round_sh*(w: M128h, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_fmadd_round_sh".}

func mm_mask_fmadd_round_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_mask_fmadd_round_sh".}

func mm_mask3_fmadd_round_sh*(w: M128h, a: M128h, b: M128h, u: MMask8, r: int32): M128h {.importc: "_mm_mask3_fmadd_round_sh".}

func mm_maskz_fmadd_round_sh*(u: MMask8, w: M128h, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_maskz_fmadd_round_sh".}

## [Macro Original]
## #define _mm_fmadd_round_sh(A, B, C, R)					\
## ((__m128h) __builtin_ia32_vfmaddsh3_mask ((A), (B), (C), (-1), (R)))

## [Macro Original]
## #define _mm_mask_fmadd_round_sh(A, U, B, C, R)				\
## ((__m128h) __builtin_ia32_vfmaddsh3_mask ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm_mask3_fmadd_round_sh(A, B, C, U, R)				\
## ((__m128h) __builtin_ia32_vfmaddsh3_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm_maskz_fmadd_round_sh(U, A, B, C, R)				\
## ((__m128h) __builtin_ia32_vfmaddsh3_maskz ((A), (B), (C), (U), (R)))

func mm_fnmadd_sh*(w: M128h, a: M128h, b: M128h): M128h {.importc: "_mm_fnmadd_sh".}

func mm_mask_fnmadd_sh*(w: M128h, u: MMask8, a: M128h, b: M128h): M128h {.importc: "_mm_mask_fnmadd_sh".}

func mm_mask3_fnmadd_sh*(w: M128h, a: M128h, b: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fnmadd_sh".}

func mm_maskz_fnmadd_sh*(u: MMask8, w: M128h, a: M128h, b: M128h): M128h {.importc: "_mm_maskz_fnmadd_sh".}

func mm_fnmadd_round_sh*(w: M128h, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_fnmadd_round_sh".}

func mm_mask_fnmadd_round_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_mask_fnmadd_round_sh".}

func mm_mask3_fnmadd_round_sh*(w: M128h, a: M128h, b: M128h, u: MMask8, r: int32): M128h {.importc: "_mm_mask3_fnmadd_round_sh".}

func mm_maskz_fnmadd_round_sh*(u: MMask8, w: M128h, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_maskz_fnmadd_round_sh".}

## [Macro Original]
## #define _mm_fnmadd_round_sh(A, B, C, R)					\
## ((__m128h) __builtin_ia32_vfnmaddsh3_mask ((A), (B), (C), (-1), (R)))

## [Macro Original]
## #define _mm_mask_fnmadd_round_sh(A, U, B, C, R)				\
## ((__m128h) __builtin_ia32_vfnmaddsh3_mask ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm_mask3_fnmadd_round_sh(A, B, C, U, R)			\
## ((__m128h) __builtin_ia32_vfnmaddsh3_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm_maskz_fnmadd_round_sh(U, A, B, C, R)			\
## ((__m128h) __builtin_ia32_vfnmaddsh3_maskz ((A), (B), (C), (U), (R)))

func mm_fmsub_sh*(w: M128h, a: M128h, b: M128h): M128h {.importc: "_mm_fmsub_sh".}

func mm_mask_fmsub_sh*(w: M128h, u: MMask8, a: M128h, b: M128h): M128h {.importc: "_mm_mask_fmsub_sh".}

func mm_mask3_fmsub_sh*(w: M128h, a: M128h, b: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fmsub_sh".}

func mm_maskz_fmsub_sh*(u: MMask8, w: M128h, a: M128h, b: M128h): M128h {.importc: "_mm_maskz_fmsub_sh".}

func mm_fmsub_round_sh*(w: M128h, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_fmsub_round_sh".}

func mm_mask_fmsub_round_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_mask_fmsub_round_sh".}

func mm_mask3_fmsub_round_sh*(w: M128h, a: M128h, b: M128h, u: MMask8, r: int32): M128h {.importc: "_mm_mask3_fmsub_round_sh".}

func mm_maskz_fmsub_round_sh*(u: MMask8, w: M128h, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_maskz_fmsub_round_sh".}

## [Macro Original]
## #define _mm_fmsub_round_sh(A, B, C, R)					\
## ((__m128h) __builtin_ia32_vfmaddsh3_mask ((A), (B), -(C), (-1), (R)))

## [Macro Original]
## #define _mm_mask_fmsub_round_sh(A, U, B, C, R)				\
## ((__m128h) __builtin_ia32_vfmaddsh3_mask ((A), (B), -(C), (U), (R)))

## [Macro Original]
## #define _mm_mask3_fmsub_round_sh(A, B, C, U, R)				\
## ((__m128h) __builtin_ia32_vfmsubsh3_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm_maskz_fmsub_round_sh(U, A, B, C, R)				\
## ((__m128h) __builtin_ia32_vfmaddsh3_maskz ((A), (B), -(C), (U), (R)))

func mm_fnmsub_sh*(w: M128h, a: M128h, b: M128h): M128h {.importc: "_mm_fnmsub_sh".}

func mm_mask_fnmsub_sh*(w: M128h, u: MMask8, a: M128h, b: M128h): M128h {.importc: "_mm_mask_fnmsub_sh".}

func mm_mask3_fnmsub_sh*(w: M128h, a: M128h, b: M128h, u: MMask8): M128h {.importc: "_mm_mask3_fnmsub_sh".}

func mm_maskz_fnmsub_sh*(u: MMask8, w: M128h, a: M128h, b: M128h): M128h {.importc: "_mm_maskz_fnmsub_sh".}

func mm_fnmsub_round_sh*(w: M128h, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_fnmsub_round_sh".}

func mm_mask_fnmsub_round_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_mask_fnmsub_round_sh".}

func mm_mask3_fnmsub_round_sh*(w: M128h, a: M128h, b: M128h, u: MMask8, r: int32): M128h {.importc: "_mm_mask3_fnmsub_round_sh".}

func mm_maskz_fnmsub_round_sh*(u: MMask8, w: M128h, a: M128h, b: M128h, r: int32): M128h {.importc: "_mm_maskz_fnmsub_round_sh".}

## [Macro Original]
## #define _mm_fnmsub_round_sh(A, B, C, R)					\
## ((__m128h) __builtin_ia32_vfmaddsh3_mask ((A), -(B), -(C), (-1), (R)))

## [Macro Original]
## #define _mm_mask_fnmsub_round_sh(A, U, B, C, R)				\
## ((__m128h) __builtin_ia32_vfmaddsh3_mask ((A), -(B), -(C), (U), (R)))

## [Macro Original]
## #define _mm_mask3_fnmsub_round_sh(A, B, C, U, R)			\
## ((__m128h) __builtin_ia32_vfmsubsh3_mask3 ((A), -(B), (C), (U), (R)))

## [Macro Original]
## #define _mm_maskz_fnmsub_round_sh(U, A, B, C, R)			\
## ((__m128h) __builtin_ia32_vfmaddsh3_maskz ((A), -(B), -(C), (U), (R)))

func mm_mask_fcmadd_sch*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_fcmadd_sch".}

func mm_mask3_fcmadd_sch*(a: M128h, b: M128h, c: M128h, d: MMask8): M128h {.importc: "_mm_mask3_fcmadd_sch".}

func mm_maskz_fcmadd_sch*(a: MMask8, b: M128h, c: M128h, d: M128h): M128h {.importc: "_mm_maskz_fcmadd_sch".}

func mm_fcmadd_sch*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fcmadd_sch".}

func mm_mask_fmadd_sch*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_fmadd_sch".}

func mm_mask3_fmadd_sch*(a: M128h, b: M128h, c: M128h, d: MMask8): M128h {.importc: "_mm_mask3_fmadd_sch".}

func mm_maskz_fmadd_sch*(a: MMask8, b: M128h, c: M128h, d: M128h): M128h {.importc: "_mm_maskz_fmadd_sch".}

func mm_fmadd_sch*(a: M128h, b: M128h, c: M128h): M128h {.importc: "_mm_fmadd_sch".}

func mm_mask_fcmadd_round_sch*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_fcmadd_round_sch".}

func mm_mask3_fcmadd_round_sch*(a: M128h, b: M128h, c: M128h, d: MMask8, e: int32): M128h {.importc: "_mm_mask3_fcmadd_round_sch".}

func mm_maskz_fcmadd_round_sch*(a: MMask8, b: M128h, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_maskz_fcmadd_round_sch".}

func mm_fcmadd_round_sch*(a: M128h, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_fcmadd_round_sch".}

func mm_mask_fmadd_round_sch*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_fmadd_round_sch".}

func mm_mask3_fmadd_round_sch*(a: M128h, b: M128h, c: M128h, d: MMask8, e: int32): M128h {.importc: "_mm_mask3_fmadd_round_sch".}

func mm_maskz_fmadd_round_sch*(a: MMask8, b: M128h, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_maskz_fmadd_round_sch".}

func mm_fmadd_round_sch*(a: M128h, b: M128h, c: M128h, d: int32): M128h {.importc: "_mm_fmadd_round_sch".}

## [Macro Original]
## #define _mm_mask_fcmadd_round_sch(A, B, C, D, E)			\
## ((__m128h)								\
## __builtin_ia32_vfcmaddcsh_mask_round ((__v8hf) (A),		\
## (__v8hf) (C),		\
## (__v8hf) (D),		\
## (B), (E)))

## [Macro Original]
## #define _mm_mask3_fcmadd_round_sch(A, B, C, D, E)			\
## ((__m128h)								\
## __builtin_ia32_vfcmaddcsh_mask3_round ((__v8hf) (A),		\
## (__v8hf) (B),		\
## (__v8hf) (C),		\
## (D), (E)))

## [Macro Original]
## #define _mm_maskz_fcmadd_round_sch(A, B, C, D, E)		\
## __builtin_ia32_vfcmaddcsh_maskz_round ((B), (C), (D), (A), (E))

## [Macro Original]
## #define _mm_fcmadd_round_sch(A, B, C, D)		\
## __builtin_ia32_vfcmaddcsh_round ((A), (B), (C), (D))

## [Macro Original]
## #define _mm_mask_fmadd_round_sch(A, B, C, D, E)				\
## ((__m128h)								\
## __builtin_ia32_vfmaddcsh_mask_round ((__v8hf) (A),		\
## (__v8hf) (C),		\
## (__v8hf) (D),		\
## (B), (E)))

## [Macro Original]
## #define _mm_mask3_fmadd_round_sch(A, B, C, D, E)			\
## ((__m128h)								\
## __builtin_ia32_vfmaddcsh_mask3_round ((__v8hf) (A),		\
## (__v8hf) (B),		\
## (__v8hf) (C),		\
## (D), (E)))

## [Macro Original]
## #define _mm_maskz_fmadd_round_sch(A, B, C, D, E)		\
## __builtin_ia32_vfmaddcsh_maskz_round ((B), (C), (D), (A), (E))

## [Macro Original]
## #define _mm_fmadd_round_sch(A, B, C, D)		\
## __builtin_ia32_vfmaddcsh_round ((A), (B), (C), (D))

func mm_fcmul_sch*(a: M128h, b: M128h): M128h {.importc: "_mm_fcmul_sch".}

func mm_mask_fcmul_sch*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_fcmul_sch".}

func mm_maskz_fcmul_sch*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fcmul_sch".}

func mm_fmul_sch*(a: M128h, b: M128h): M128h {.importc: "_mm_fmul_sch".}

func mm_mask_fmul_sch*(a: M128h, b: MMask8, c: M128h, d: M128h): M128h {.importc: "_mm_mask_fmul_sch".}

func mm_maskz_fmul_sch*(a: MMask8, b: M128h, c: M128h): M128h {.importc: "_mm_maskz_fmul_sch".}

func mm_fcmul_round_sch*(a: M128h, b: M128h, d: int32): M128h {.importc: "_mm_fcmul_round_sch".}

func mm_mask_fcmul_round_sch*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_fcmul_round_sch".}

func mm_maskz_fcmul_round_sch*(a: MMask8, b: M128h, c: M128h, e: int32): M128h {.importc: "_mm_maskz_fcmul_round_sch".}

func mm_fmul_round_sch*(a: M128h, b: M128h, d: int32): M128h {.importc: "_mm_fmul_round_sch".}

func mm_mask_fmul_round_sch*(a: M128h, b: MMask8, c: M128h, d: M128h, e: int32): M128h {.importc: "_mm_mask_fmul_round_sch".}

func mm_maskz_fmul_round_sch*(a: MMask8, b: M128h, c: M128h, e: int32): M128h {.importc: "_mm_maskz_fmul_round_sch".}

## [Macro Original]
## #define _mm_fcmul_round_sch(__A, __B, __D)				\
## (__m128h) __builtin_ia32_vfcmulcsh_round ((__v8hf) __A,		\
## (__v8hf) __B, __D)

## [Macro Original]
## #define _mm_mask_fcmul_round_sch(__A, __B, __C, __D, __E)		\
## (__m128h) __builtin_ia32_vfcmulcsh_mask_round ((__v8hf) __C,		\
## (__v8hf) __D,		\
## (__v8hf) __A,		\
## __B, __E)

## [Macro Original]
## #define _mm_maskz_fcmul_round_sch(__A, __B, __C, __E)			\
## (__m128h) __builtin_ia32_vfcmulcsh_mask_round ((__v8hf) __B,		\
## (__v8hf) __C,		\
## _mm_setzero_ph (),	\
## __A, __E)

## [Macro Original]
## #define _mm_fmul_round_sch(__A, __B, __D)				\
## (__m128h) __builtin_ia32_vfmulcsh_round ((__v8hf) __A,		\
## (__v8hf) __B, __D)

## [Macro Original]
## #define _mm_mask_fmul_round_sch(__A, __B, __C, __D, __E)		\
## (__m128h) __builtin_ia32_vfmulcsh_mask_round ((__v8hf) __C,		\
## (__v8hf) __D,		\
## (__v8hf) __A,		\
## __B, __E)

## [Macro Original]
## #define _mm_maskz_fmul_round_sch(__A, __B, __C, __E)			\
## (__m128h) __builtin_ia32_vfmulcsh_mask_round ((__v8hf) __B,		\
## (__v8hf) __C,		\
## _mm_setzero_ph (),	\
## __A, __E)

## [Macro Original]
## #define _mm_mul_sch(A, B) _mm_fmul_sch ((A), (B))

## [Macro Original]
## #define _mm_mask_mul_sch(W, U, A, B) _mm_mask_fmul_sch ((W), (U), (A), (B))

## [Macro Original]
## #define _mm_maskz_mul_sch(U, A, B) _mm_maskz_fmul_sch ((U), (A), (B))

## [Macro Original]
## #define _mm_mul_round_sch(A, B, R) _mm_fmul_round_sch ((A), (B), (R))

## [Macro Original]
## #define _mm_mask_mul_round_sch(W, U, A, B, R)			      \
## _mm_mask_fmul_round_sch ((W), (U), (A), (B), (R))

## [Macro Original]
## #define _mm_maskz_mul_round_sch(U, A, B, R)			      \
## _mm_maskz_fmul_round_sch ((U), (A), (B), (R))

## [Macro Original]
## #define _mm_cmul_sch(A, B) _mm_fcmul_sch ((A), (B))

## [Macro Original]
## #define _mm_mask_cmul_sch(W, U, A, B) _mm_mask_fcmul_sch ((W), (U), (A), (B))

## [Macro Original]
## #define _mm_maskz_cmul_sch(U, A, B) _mm_maskz_fcmul_sch ((U), (A), (B))

## [Macro Original]
## #define _mm_cmul_round_sch(A, B, R) _mm_fcmul_round_sch ((A), (B), (R))

## [Macro Original]
## #define _mm_mask_cmul_round_sch(W, U, A, B, R)			      \
## _mm_mask_fcmul_round_sch ((W), (U), (A), (B), (R))

## [Macro Original]
## #define _mm_maskz_cmul_round_sch(U, A, B, R)			      \
## _mm_maskz_fcmul_round_sch ((U), (A), (B), (R))

func mm512_set_ph*(a31: Float16, a30: Float16, a29: Float16, a28: Float16, a27: Float16, a26: Float16, a25: Float16, a24: Float16, a23: Float16, a22: Float16, a21: Float16, a20: Float16, a19: Float16, a18: Float16, a17: Float16, a16: Float16, a15: Float16, a14: Float16, a13: Float16, a12: Float16, a11: Float16, a10: Float16, a9: Float16, a8: Float16, a7: Float16, a6: Float16, a5: Float16, a4: Float16, a3: Float16, a2: Float16, a1: Float16, a0: Float16): M512h {.importc: "_mm512_set_ph".}

func mm512_setr_ph*(a0: Float16, a1: Float16, a2: Float16, a3: Float16, a4: Float16, a5: Float16, a6: Float16, a7: Float16, a8: Float16, a9: Float16, a10: Float16, a11: Float16, a12: Float16, a13: Float16, a14: Float16, a15: Float16, a16: Float16, a17: Float16, a18: Float16, a19: Float16, a20: Float16, a21: Float16, a22: Float16, a23: Float16, a24: Float16, a25: Float16, a26: Float16, a27: Float16, a28: Float16, a29: Float16, a30: Float16, a31: Float16): M512h {.importc: "_mm512_setr_ph".}

func mm512_set1_ph*(a: Float16): M512h {.importc: "_mm512_set1_ph".}

func mm512_setzero_ph*(): M512h {.importc: "_mm512_setzero_ph".}

func mm512_undefined_ph*(): M512h {.importc: "_mm512_undefined_ph".}

func mm512_cvtsh_h*(a: M512h): Float16 {.importc: "_mm512_cvtsh_h".}

func mm512_castph_ps*(a: M512h): M512 {.importc: "_mm512_castph_ps".}

func mm512_castph_pd*(a: M512h): M512d {.importc: "_mm512_castph_pd".}

func mm512_castph_si512*(a: M512h): M512i {.importc: "_mm512_castph_si512".}

func mm512_castph512_ph128*(a: M512h): M128h {.importc: "_mm512_castph512_ph128".}

func mm512_castph512_ph256*(a: M512h): M256h {.importc: "_mm512_castph512_ph256".}

func mm512_castph128_ph512*(a: M128h): M512h {.importc: "_mm512_castph128_ph512".}

func mm512_castph256_ph512*(a: M256h): M512h {.importc: "_mm512_castph256_ph512".}

func mm512_zextph128_ph512*(a: M128h): M512h {.importc: "_mm512_zextph128_ph512".}

func mm512_zextph256_ph512*(a: M256h): M512h {.importc: "_mm512_zextph256_ph512".}

func mm512_castps_ph*(a: M512): M512h {.importc: "_mm512_castps_ph".}

func mm512_castpd_ph*(a: M512d): M512h {.importc: "_mm512_castpd_ph".}

func mm512_castsi512_ph*(a: M512i): M512h {.importc: "_mm512_castsi512_ph".}

func mm512_load_ph*(p: pointer): M512h {.importc: "_mm512_load_ph".}

func mm512_loadu_ph*(p: pointer): M512h {.importc: "_mm512_loadu_ph".}

func mm512_store_ph*(p: pointer, a: M512h): void {.importc: "_mm512_store_ph".}

func mm512_storeu_ph*(p: pointer, a: M512h): void {.importc: "_mm512_storeu_ph".}

func mm512_abs_ph*(a: M512h): M512h {.importc: "_mm512_abs_ph".}

func mm512_add_ph*(a: M512h, b: M512h): M512h {.importc: "_mm512_add_ph".}

func mm512_mask_add_ph*(a: M512h, b: MMask32, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_add_ph".}

func mm512_maskz_add_ph*(a: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_add_ph".}

func mm512_sub_ph*(a: M512h, b: M512h): M512h {.importc: "_mm512_sub_ph".}

func mm512_mask_sub_ph*(a: M512h, b: MMask32, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_sub_ph".}

func mm512_maskz_sub_ph*(a: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_sub_ph".}

func mm512_mul_ph*(a: M512h, b: M512h): M512h {.importc: "_mm512_mul_ph".}

func mm512_mask_mul_ph*(a: M512h, b: MMask32, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_mul_ph".}

func mm512_maskz_mul_ph*(a: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_mul_ph".}

func mm512_div_ph*(a: M512h, b: M512h): M512h {.importc: "_mm512_div_ph".}

func mm512_mask_div_ph*(a: M512h, b: MMask32, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_div_ph".}

func mm512_maskz_div_ph*(a: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_div_ph".}

func mm512_add_round_ph*(a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_add_round_ph".}

func mm512_mask_add_round_ph*(a: M512h, b: MMask32, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_add_round_ph".}

func mm512_maskz_add_round_ph*(a: MMask32, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_maskz_add_round_ph".}

func mm512_sub_round_ph*(a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_sub_round_ph".}

func mm512_mask_sub_round_ph*(a: M512h, b: MMask32, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_sub_round_ph".}

func mm512_maskz_sub_round_ph*(a: MMask32, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_maskz_sub_round_ph".}

func mm512_mul_round_ph*(a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_mul_round_ph".}

func mm512_mask_mul_round_ph*(a: M512h, b: MMask32, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_mul_round_ph".}

func mm512_maskz_mul_round_ph*(a: MMask32, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_maskz_mul_round_ph".}

func mm512_div_round_ph*(a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_div_round_ph".}

func mm512_mask_div_round_ph*(a: M512h, b: MMask32, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_div_round_ph".}

func mm512_maskz_div_round_ph*(a: MMask32, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_maskz_div_round_ph".}

## [Macro Original]
## #define _mm512_add_round_ph(A, B, C)					\
## ((__m512h)__builtin_ia32_addph512_mask_round((A), (B),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_add_round_ph(A, B, C, D, E)				\
## ((__m512h)__builtin_ia32_addph512_mask_round((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_add_round_ph(A, B, C, D)				\
## ((__m512h)__builtin_ia32_addph512_mask_round((B), (C),		\
## _mm512_setzero_ph (),	\
## (A), (D)))

## [Macro Original]
## #define _mm512_sub_round_ph(A, B, C)					\
## ((__m512h)__builtin_ia32_subph512_mask_round((A), (B),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_sub_round_ph(A, B, C, D, E)				\
## ((__m512h)__builtin_ia32_subph512_mask_round((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_sub_round_ph(A, B, C, D)				\
## ((__m512h)__builtin_ia32_subph512_mask_round((B), (C),		\
## _mm512_setzero_ph (),	\
## (A), (D)))

## [Macro Original]
## #define _mm512_mul_round_ph(A, B, C)					\
## ((__m512h)__builtin_ia32_mulph512_mask_round((A), (B),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_mul_round_ph(A, B, C, D, E)				\
## ((__m512h)__builtin_ia32_mulph512_mask_round((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_mul_round_ph(A, B, C, D)				\
## ((__m512h)__builtin_ia32_mulph512_mask_round((B), (C),		\
## _mm512_setzero_ph (),	\
## (A), (D)))

## [Macro Original]
## #define _mm512_div_round_ph(A, B, C)					\
## ((__m512h)__builtin_ia32_divph512_mask_round((A), (B),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_div_round_ph(A, B, C, D, E)				\
## ((__m512h)__builtin_ia32_divph512_mask_round((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_div_round_ph(A, B, C, D)				\
## ((__m512h)__builtin_ia32_divph512_mask_round((B), (C),		\
## _mm512_setzero_ph (),	\
## (A), (D)))

func mm512_conj_pch*(a: M512h): M512h {.importc: "_mm512_conj_pch".}

func mm512_mask_conj_pch*(w: M512h, u: MMask16, a: M512h): M512h {.importc: "_mm512_mask_conj_pch".}

func mm512_maskz_conj_pch*(u: MMask16, a: M512h): M512h {.importc: "_mm512_maskz_conj_pch".}

func mm512_max_ph*(a: M512h, b: M512h): M512h {.importc: "_mm512_max_ph".}

func mm512_mask_max_ph*(a: M512h, b: MMask32, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_max_ph".}

func mm512_maskz_max_ph*(a: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_max_ph".}

func mm512_min_ph*(a: M512h, b: M512h): M512h {.importc: "_mm512_min_ph".}

func mm512_mask_min_ph*(a: M512h, b: MMask32, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_min_ph".}

func mm512_maskz_min_ph*(a: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_min_ph".}

func mm512_max_round_ph*(a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_max_round_ph".}

func mm512_mask_max_round_ph*(a: M512h, b: MMask32, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_max_round_ph".}

func mm512_maskz_max_round_ph*(a: MMask32, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_maskz_max_round_ph".}

func mm512_min_round_ph*(a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_min_round_ph".}

func mm512_mask_min_round_ph*(a: M512h, b: MMask32, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_min_round_ph".}

func mm512_maskz_min_round_ph*(a: MMask32, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_maskz_min_round_ph".}

## [Macro Original]
## #define _mm512_max_round_ph(A, B, C)				\
## (__builtin_ia32_maxph512_mask_round ((A), (B),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_max_round_ph(A, B, C, D, E)				\
## (__builtin_ia32_maxph512_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_max_round_ph(A, B, C, D)			\
## (__builtin_ia32_maxph512_mask_round ((B), (C),		\
## _mm512_setzero_ph (),	\
## (A), (D)))

## [Macro Original]
## #define _mm512_min_round_ph(A, B, C)				\
## (__builtin_ia32_minph512_mask_round ((A), (B),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_min_round_ph(A, B, C, D, E)				\
## (__builtin_ia32_minph512_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_min_round_ph(A, B, C, D)			\
## (__builtin_ia32_minph512_mask_round ((B), (C),		\
## _mm512_setzero_ph (),	\
## (A), (D)))

func mm512_cmp_ph_mask*(a: M512h, b: M512h, c: int32): MMask32 {.importc: "_mm512_cmp_ph_mask".}

func mm512_mask_cmp_ph_mask*(a: MMask32, b: M512h, c: M512h, d: int32): MMask32 {.importc: "_mm512_mask_cmp_ph_mask".}

func mm512_cmp_round_ph_mask*(a: M512h, b: M512h, c: int32, d: int32): MMask32 {.importc: "_mm512_cmp_round_ph_mask".}

func mm512_mask_cmp_round_ph_mask*(a: MMask32, b: M512h, c: M512h, d: int32, e: int32): MMask32 {.importc: "_mm512_mask_cmp_round_ph_mask".}

## [Macro Original]
## #define _mm512_cmp_ph_mask(A, B, C)			\
## (__builtin_ia32_cmpph512_mask ((A), (B), (C), (-1)))

## [Macro Original]
## #define _mm512_mask_cmp_ph_mask(A, B, C, D)		\
## (__builtin_ia32_cmpph512_mask ((B), (C), (D), (A)))

## [Macro Original]
## #define _mm512_cmp_round_ph_mask(A, B, C, D)				\
## (__builtin_ia32_cmpph512_mask_round ((A), (B), (C), (-1), (D)))

## [Macro Original]
## #define _mm512_mask_cmp_round_ph_mask(A, B, C, D, E)			\
## (__builtin_ia32_cmpph512_mask_round ((B), (C), (D), (A), (E)))

func mm512_sqrt_ph*(a: M512h): M512h {.importc: "_mm512_sqrt_ph".}

func mm512_mask_sqrt_ph*(a: M512h, b: MMask32, c: M512h): M512h {.importc: "_mm512_mask_sqrt_ph".}

func mm512_maskz_sqrt_ph*(a: MMask32, b: M512h): M512h {.importc: "_mm512_maskz_sqrt_ph".}

func mm512_sqrt_round_ph*(a: M512h, b: int32): M512h {.importc: "_mm512_sqrt_round_ph".}

func mm512_mask_sqrt_round_ph*(a: M512h, b: MMask32, c: M512h, d: int32): M512h {.importc: "_mm512_mask_sqrt_round_ph".}

func mm512_maskz_sqrt_round_ph*(a: MMask32, b: M512h, c: int32): M512h {.importc: "_mm512_maskz_sqrt_round_ph".}

## [Macro Original]
## #define _mm512_sqrt_round_ph(A, B)				\
## (__builtin_ia32_sqrtph512_mask_round ((A),			\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (B)))

## [Macro Original]
## #define _mm512_mask_sqrt_round_ph(A, B, C, D)			\
## (__builtin_ia32_sqrtph512_mask_round ((C), (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_sqrt_round_ph(A, B, C)			\
## (__builtin_ia32_sqrtph512_mask_round ((B),			\
## _mm512_setzero_ph (),	\
## (A), (C)))

func mm512_rsqrt_ph*(a: M512h): M512h {.importc: "_mm512_rsqrt_ph".}

func mm512_mask_rsqrt_ph*(a: M512h, b: MMask32, c: M512h): M512h {.importc: "_mm512_mask_rsqrt_ph".}

func mm512_maskz_rsqrt_ph*(a: MMask32, b: M512h): M512h {.importc: "_mm512_maskz_rsqrt_ph".}

func mm512_rcp_ph*(a: M512h): M512h {.importc: "_mm512_rcp_ph".}

func mm512_mask_rcp_ph*(a: M512h, b: MMask32, c: M512h): M512h {.importc: "_mm512_mask_rcp_ph".}

func mm512_maskz_rcp_ph*(a: MMask32, b: M512h): M512h {.importc: "_mm512_maskz_rcp_ph".}

func mm512_scalef_ph*(a: M512h, b: M512h): M512h {.importc: "_mm512_scalef_ph".}

func mm512_mask_scalef_ph*(a: M512h, b: MMask32, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_scalef_ph".}

func mm512_maskz_scalef_ph*(a: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_scalef_ph".}

func mm512_scalef_round_ph*(a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_scalef_round_ph".}

func mm512_mask_scalef_round_ph*(a: M512h, b: MMask32, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_scalef_round_ph".}

func mm512_maskz_scalef_round_ph*(a: MMask32, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_maskz_scalef_round_ph".}

## [Macro Original]
## #define _mm512_scalef_round_ph(A, B, C)				\
## (__builtin_ia32_scalefph512_mask_round ((A), (B),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_scalef_round_ph(A, B, C, D, E)			\
## (__builtin_ia32_scalefph512_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_scalef_round_ph(A, B, C, D)		\
## (__builtin_ia32_scalefph512_mask_round ((B), (C),		\
## _mm512_setzero_ph (),	\
## (A), (D)))

func mm512_reduce_ph*(a: M512h, b: int32): M512h {.importc: "_mm512_reduce_ph".}

func mm512_mask_reduce_ph*(a: M512h, b: MMask32, c: M512h, d: int32): M512h {.importc: "_mm512_mask_reduce_ph".}

func mm512_maskz_reduce_ph*(a: MMask32, b: M512h, c: int32): M512h {.importc: "_mm512_maskz_reduce_ph".}

func mm512_reduce_round_ph*(a: M512h, b: int32, c: int32): M512h {.importc: "_mm512_reduce_round_ph".}

func mm512_mask_reduce_round_ph*(a: M512h, b: MMask32, c: M512h, d: int32, e: int32): M512h {.importc: "_mm512_mask_reduce_round_ph".}

func mm512_maskz_reduce_round_ph*(a: MMask32, b: M512h, c: int32, d: int32): M512h {.importc: "_mm512_maskz_reduce_round_ph".}

## [Macro Original]
## #define _mm512_reduce_ph(A, B)						\
## (__builtin_ia32_reduceph512_mask_round ((A), (B),			\
## _mm512_setzero_ph (),		\
## (__mmask32)-1,		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_reduce_ph(A, B, C, D)				\
## (__builtin_ia32_reduceph512_mask_round ((C), (D), (A), (B),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_reduce_ph(A, B, C)					\
## (__builtin_ia32_reduceph512_mask_round ((B), (C),			\
## _mm512_setzero_ph (),		\
## (A), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_reduce_round_ph(A, B, C)				\
## (__builtin_ia32_reduceph512_mask_round ((A), (B),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_reduce_round_ph(A, B, C, D, E)			\
## (__builtin_ia32_reduceph512_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_reduce_round_ph(A, B, C, D)		\
## (__builtin_ia32_reduceph512_mask_round ((B), (C),		\
## _mm512_setzero_ph (),	\
## (A), (D)))

func mm512_roundscale_ph*(a: M512h, b: int32): M512h {.importc: "_mm512_roundscale_ph".}

func mm512_mask_roundscale_ph*(a: M512h, b: MMask32, c: M512h, d: int32): M512h {.importc: "_mm512_mask_roundscale_ph".}

func mm512_maskz_roundscale_ph*(a: MMask32, b: M512h, c: int32): M512h {.importc: "_mm512_maskz_roundscale_ph".}

func mm512_roundscale_round_ph*(a: M512h, b: int32, c: int32): M512h {.importc: "_mm512_roundscale_round_ph".}

func mm512_mask_roundscale_round_ph*(a: M512h, b: MMask32, c: M512h, d: int32, e: int32): M512h {.importc: "_mm512_mask_roundscale_round_ph".}

func mm512_maskz_roundscale_round_ph*(a: MMask32, b: M512h, c: int32, d: int32): M512h {.importc: "_mm512_maskz_roundscale_round_ph".}

## [Macro Original]
## #define _mm512_roundscale_ph(A, B)					\
## (__builtin_ia32_rndscaleph512_mask_round ((A), (B),			\
## _mm512_setzero_ph (),	\
## (__mmask32)-1,		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_roundscale_ph(A, B, C, D)				\
## (__builtin_ia32_rndscaleph512_mask_round ((C), (D), (A), (B),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_roundscale_ph(A, B, C)				\
## (__builtin_ia32_rndscaleph512_mask_round ((B), (C),			\
## _mm512_setzero_ph (),	\
## (A),			\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_roundscale_round_ph(A, B, C)				\
## (__builtin_ia32_rndscaleph512_mask_round ((A), (B),			\
## _mm512_setzero_ph (),	\
## (__mmask32)-1, (C)))

## [Macro Original]
## #define _mm512_mask_roundscale_round_ph(A, B, C, D, E)			\
## (__builtin_ia32_rndscaleph512_mask_round ((C), (D), (A), (B), (E)))

## [Macro Original]
## #define _mm512_maskz_roundscale_round_ph(A, B, C, D)			\
## (__builtin_ia32_rndscaleph512_mask_round ((B), (C),			\
## _mm512_setzero_ph (),	\
## (A), (D)))

func mm512_mask_fpclass_ph_mask*(u: MMask32, a: M512h, imm: int32): MMask32 {.importc: "_mm512_mask_fpclass_ph_mask".}

func mm512_fpclass_ph_mask*(a: M512h, imm: int32): MMask32 {.importc: "_mm512_fpclass_ph_mask".}

## [Macro Original]
## #define _mm512_mask_fpclass_ph_mask(u, x, c)				\
## ((__mmask32) __builtin_ia32_fpclassph512_mask ((__v32hf) (__m512h) (x), \
## (int) (c),(__mmask32)(u)))

## [Macro Original]
## #define _mm512_fpclass_ph_mask(x, c)                                    \
## ((__mmask32) __builtin_ia32_fpclassph512_mask ((__v32hf) (__m512h) (x), \
## (int) (c),(__mmask32)-1))

func mm512_getexp_ph*(a: M512h): M512h {.importc: "_mm512_getexp_ph".}

func mm512_mask_getexp_ph*(w: M512h, u: MMask32, a: M512h): M512h {.importc: "_mm512_mask_getexp_ph".}

func mm512_maskz_getexp_ph*(u: MMask32, a: M512h): M512h {.importc: "_mm512_maskz_getexp_ph".}

func mm512_getexp_round_ph*(a: M512h, r: int32): M512h {.importc: "_mm512_getexp_round_ph".}

func mm512_mask_getexp_round_ph*(w: M512h, u: MMask32, a: M512h, r: int32): M512h {.importc: "_mm512_mask_getexp_round_ph".}

func mm512_maskz_getexp_round_ph*(u: MMask32, a: M512h, r: int32): M512h {.importc: "_mm512_maskz_getexp_round_ph".}

## [Macro Original]
## #define _mm512_getexp_round_ph(A, R)					\
## ((__m512h)__builtin_ia32_getexpph512_mask((__v32hf)(__m512h)(A),	\
## (__v32hf)_mm512_setzero_ph(), (__mmask32)-1, R))

## [Macro Original]
## #define _mm512_mask_getexp_round_ph(W, U, A, R)				\
## ((__m512h)__builtin_ia32_getexpph512_mask((__v32hf)(__m512h)(A),	\
## (__v32hf)(__m512h)(W), (__mmask32)(U), R))

## [Macro Original]
## #define _mm512_maskz_getexp_round_ph(U, A, R)				\
## ((__m512h)__builtin_ia32_getexpph512_mask((__v32hf)(__m512h)(A),	\
## (__v32hf)_mm512_setzero_ph(), (__mmask32)(U), R))

func mm512_getmant_ph*(a: M512h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512h {.importc: "_mm512_getmant_ph".}

func mm512_mask_getmant_ph*(w: M512h, u: MMask32, a: M512h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512h {.importc: "_mm512_mask_getmant_ph".}

func mm512_maskz_getmant_ph*(u: MMask32, a: M512h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M512h {.importc: "_mm512_maskz_getmant_ph".}

func mm512_getmant_round_ph*(a: M512h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512h {.importc: "_mm512_getmant_round_ph".}

func mm512_mask_getmant_round_ph*(w: M512h, u: MMask32, a: M512h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512h {.importc: "_mm512_mask_getmant_round_ph".}

func mm512_maskz_getmant_round_ph*(u: MMask32, a: M512h, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM, r: int32): M512h {.importc: "_mm512_maskz_getmant_round_ph".}

## [Macro Original]
## #define _mm512_getmant_ph(X, B, C)					\
## ((__m512h)__builtin_ia32_getmantph512_mask ((__v32hf)(__m512h)(X),	\
## (int)(((C)<<2) | (B)),	\
## (__v32hf)(__m512h)	\
## _mm512_setzero_ph(),	\
## (__mmask32)-1,		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_getmant_ph(W, U, X, B, C)				\
## ((__m512h)__builtin_ia32_getmantph512_mask ((__v32hf)(__m512h)(X),	\
## (int)(((C)<<2) | (B)),	\
## (__v32hf)(__m512h)(W),	\
## (__mmask32)(U),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_getmant_ph(U, X, B, C)				\
## ((__m512h)__builtin_ia32_getmantph512_mask ((__v32hf)(__m512h)(X),	\
## (int)(((C)<<2) | (B)),	\
## (__v32hf)(__m512h)	\
## _mm512_setzero_ph(),	\
## (__mmask32)(U),		\
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_getmant_round_ph(X, B, C, R)				\
## ((__m512h)__builtin_ia32_getmantph512_mask ((__v32hf)(__m512h)(X),	\
## (int)(((C)<<2) | (B)),	\
## (__v32hf)(__m512h)	\
## _mm512_setzero_ph(),	\
## (__mmask32)-1,		\
## (R)))

## [Macro Original]
## #define _mm512_mask_getmant_round_ph(W, U, X, B, C, R)			\
## ((__m512h)__builtin_ia32_getmantph512_mask ((__v32hf)(__m512h)(X),	\
## (int)(((C)<<2) | (B)),	\
## (__v32hf)(__m512h)(W),	\
## (__mmask32)(U),		\
## (R)))

## [Macro Original]
## #define _mm512_maskz_getmant_round_ph(U, X, B, C, R)			\
## ((__m512h)__builtin_ia32_getmantph512_mask ((__v32hf)(__m512h)(X),	\
## (int)(((C)<<2) | (B)),	\
## (__v32hf)(__m512h)	\
## _mm512_setzero_ph(),	\
## (__mmask32)(U),		\
## (R)))

func mm512_cvtph_epi32*(a: M256h): M512i {.importc: "_mm512_cvtph_epi32".}

func mm512_mask_cvtph_epi32*(a: M512i, b: MMask16, c: M256h): M512i {.importc: "_mm512_mask_cvtph_epi32".}

func mm512_maskz_cvtph_epi32*(a: MMask16, b: M256h): M512i {.importc: "_mm512_maskz_cvtph_epi32".}

func mm512_cvt_roundph_epi32*(a: M256h, b: int32): M512i {.importc: "_mm512_cvt_roundph_epi32".}

func mm512_mask_cvt_roundph_epi32*(a: M512i, b: MMask16, c: M256h, d: int32): M512i {.importc: "_mm512_mask_cvt_roundph_epi32".}

func mm512_maskz_cvt_roundph_epi32*(a: MMask16, b: M256h, c: int32): M512i {.importc: "_mm512_maskz_cvt_roundph_epi32".}

## [Macro Original]
## #define _mm512_cvt_roundph_epi32(A, B)					\
## ((__m512i)								\
## __builtin_ia32_vcvtph2dq512_mask_round ((A),				\
## (__v16si)			\
## _mm512_setzero_si512 (),	\
## (__mmask16)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundph_epi32(A, B, C, D)			\
## ((__m512i)								\
## __builtin_ia32_vcvtph2dq512_mask_round ((C), (__v16si)(A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundph_epi32(A, B, C)				\
## ((__m512i)								\
## __builtin_ia32_vcvtph2dq512_mask_round ((B),				\
## (__v16si)			\
## _mm512_setzero_si512 (),	\
## (A),				\
## (C)))

func mm512_cvtph_epu32*(a: M256h): M512i {.importc: "_mm512_cvtph_epu32".}

func mm512_mask_cvtph_epu32*(a: M512i, b: MMask16, c: M256h): M512i {.importc: "_mm512_mask_cvtph_epu32".}

func mm512_maskz_cvtph_epu32*(a: MMask16, b: M256h): M512i {.importc: "_mm512_maskz_cvtph_epu32".}

func mm512_cvt_roundph_epu32*(a: M256h, b: int32): M512i {.importc: "_mm512_cvt_roundph_epu32".}

func mm512_mask_cvt_roundph_epu32*(a: M512i, b: MMask16, c: M256h, d: int32): M512i {.importc: "_mm512_mask_cvt_roundph_epu32".}

func mm512_maskz_cvt_roundph_epu32*(a: MMask16, b: M256h, c: int32): M512i {.importc: "_mm512_maskz_cvt_roundph_epu32".}

## [Macro Original]
## #define _mm512_cvt_roundph_epu32(A, B)					\
## ((__m512i)								\
## __builtin_ia32_vcvtph2udq512_mask_round ((A),			\
## (__v16si)			\
## _mm512_setzero_si512 (),	\
## (__mmask16)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundph_epu32(A, B, C, D)			\
## ((__m512i)								\
## __builtin_ia32_vcvtph2udq512_mask_round ((C), (__v16si)(A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundph_epu32(A, B, C)				\
## ((__m512i)								\
## __builtin_ia32_vcvtph2udq512_mask_round ((B),			\
## (__v16si)			\
## _mm512_setzero_si512 (),	\
## (A),			\
## (C)))

func mm512_cvttph_epi32*(a: M256h): M512i {.importc: "_mm512_cvttph_epi32".}

func mm512_mask_cvttph_epi32*(a: M512i, b: MMask16, c: M256h): M512i {.importc: "_mm512_mask_cvttph_epi32".}

func mm512_maskz_cvttph_epi32*(a: MMask16, b: M256h): M512i {.importc: "_mm512_maskz_cvttph_epi32".}

func mm512_cvtt_roundph_epi32*(a: M256h, b: int32): M512i {.importc: "_mm512_cvtt_roundph_epi32".}

func mm512_mask_cvtt_roundph_epi32*(a: M512i, b: MMask16, c: M256h, d: int32): M512i {.importc: "_mm512_mask_cvtt_roundph_epi32".}

func mm512_maskz_cvtt_roundph_epi32*(a: MMask16, b: M256h, c: int32): M512i {.importc: "_mm512_maskz_cvtt_roundph_epi32".}

## [Macro Original]
## #define _mm512_cvtt_roundph_epi32(A, B)					\
## ((__m512i)								\
## __builtin_ia32_vcvttph2dq512_mask_round ((A),			\
## (__v16si)			\
## (_mm512_setzero_si512 ()),	\
## (__mmask16)(-1), (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundph_epi32(A, B, C, D)		\
## ((__m512i)							\
## __builtin_ia32_vcvttph2dq512_mask_round ((C),		\
## (__v16si)(A),	\
## (B),		\
## (D)))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundph_epi32(A, B, C)			\
## ((__m512i)								\
## __builtin_ia32_vcvttph2dq512_mask_round ((B),			\
## (__v16si)			\
## _mm512_setzero_si512 (),	\
## (A),			\
## (C)))

func mm512_cvttph_epu32*(a: M256h): M512i {.importc: "_mm512_cvttph_epu32".}

func mm512_mask_cvttph_epu32*(a: M512i, b: MMask16, c: M256h): M512i {.importc: "_mm512_mask_cvttph_epu32".}

func mm512_maskz_cvttph_epu32*(a: MMask16, b: M256h): M512i {.importc: "_mm512_maskz_cvttph_epu32".}

func mm512_cvtt_roundph_epu32*(a: M256h, b: int32): M512i {.importc: "_mm512_cvtt_roundph_epu32".}

func mm512_mask_cvtt_roundph_epu32*(a: M512i, b: MMask16, c: M256h, d: int32): M512i {.importc: "_mm512_mask_cvtt_roundph_epu32".}

func mm512_maskz_cvtt_roundph_epu32*(a: MMask16, b: M256h, c: int32): M512i {.importc: "_mm512_maskz_cvtt_roundph_epu32".}

## [Macro Original]
## #define _mm512_cvtt_roundph_epu32(A, B)					\
## ((__m512i)								\
## __builtin_ia32_vcvttph2udq512_mask_round ((A),			\
## (__v16si)			\
## _mm512_setzero_si512 (),	\
## (__mmask16)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundph_epu32(A, B, C, D)		\
## ((__m512i)							\
## __builtin_ia32_vcvttph2udq512_mask_round ((C),		\
## (__v16si)(A),	\
## (B),		\
## (D)))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundph_epu32(A, B, C)			\
## ((__m512i)								\
## __builtin_ia32_vcvttph2udq512_mask_round ((B),			\
## (__v16si)			\
## _mm512_setzero_si512 (),	\
## (A),			\
## (C)))

func mm512_cvtepi32_ph*(a: M512i): M256h {.importc: "_mm512_cvtepi32_ph".}

func mm512_mask_cvtepi32_ph*(a: M256h, b: MMask16, c: M512i): M256h {.importc: "_mm512_mask_cvtepi32_ph".}

func mm512_maskz_cvtepi32_ph*(a: MMask16, b: M512i): M256h {.importc: "_mm512_maskz_cvtepi32_ph".}

func mm512_cvt_roundepi32_ph*(a: M512i, b: int32): M256h {.importc: "_mm512_cvt_roundepi32_ph".}

func mm512_mask_cvt_roundepi32_ph*(a: M256h, b: MMask16, c: M512i, d: int32): M256h {.importc: "_mm512_mask_cvt_roundepi32_ph".}

func mm512_maskz_cvt_roundepi32_ph*(a: MMask16, b: M512i, c: int32): M256h {.importc: "_mm512_maskz_cvt_roundepi32_ph".}

## [Macro Original]
## #define _mm512_cvt_roundepi32_ph(A, B)					\
## (__builtin_ia32_vcvtdq2ph512_mask_round ((__v16si)(A),		\
## _mm256_setzero_ph (),	\
## (__mmask16)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepi32_ph(A, B, C, D)		\
## (__builtin_ia32_vcvtdq2ph512_mask_round ((__v16si)(C),	\
## (A),			\
## (B),			\
## (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepi32_ph(A, B, C)				\
## (__builtin_ia32_vcvtdq2ph512_mask_round ((__v16si)(B),		\
## _mm256_setzero_ph (),	\
## (A),				\
## (C)))

func mm512_cvtepu32_ph*(a: M512i): M256h {.importc: "_mm512_cvtepu32_ph".}

func mm512_mask_cvtepu32_ph*(a: M256h, b: MMask16, c: M512i): M256h {.importc: "_mm512_mask_cvtepu32_ph".}

func mm512_maskz_cvtepu32_ph*(a: MMask16, b: M512i): M256h {.importc: "_mm512_maskz_cvtepu32_ph".}

func mm512_cvt_roundepu32_ph*(a: M512i, b: int32): M256h {.importc: "_mm512_cvt_roundepu32_ph".}

func mm512_mask_cvt_roundepu32_ph*(a: M256h, b: MMask16, c: M512i, d: int32): M256h {.importc: "_mm512_mask_cvt_roundepu32_ph".}

func mm512_maskz_cvt_roundepu32_ph*(a: MMask16, b: M512i, c: int32): M256h {.importc: "_mm512_maskz_cvt_roundepu32_ph".}

## [Macro Original]
## #define _mm512_cvt_roundepu32_ph(A, B)					\
## (__builtin_ia32_vcvtudq2ph512_mask_round ((__v16si)(A),		\
## _mm256_setzero_ph (),	\
## (__mmask16)-1,		\
## B))

## [Macro Original]
## #define _mm512_mask_cvt_roundepu32_ph(A, B, C, D)	\
## (__builtin_ia32_vcvtudq2ph512_mask_round ((__v16si)C,	\
## A,		\
## B,		\
## D))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepu32_ph(A, B, C)				\
## (__builtin_ia32_vcvtudq2ph512_mask_round ((__v16si)B,			\
## _mm256_setzero_ph (),	\
## A,				\
## C))

func mm512_cvtph_epi64*(a: M128h): M512i {.importc: "_mm512_cvtph_epi64".}

func mm512_mask_cvtph_epi64*(a: M512i, b: MMask8, c: M128h): M512i {.importc: "_mm512_mask_cvtph_epi64".}

func mm512_maskz_cvtph_epi64*(a: MMask8, b: M128h): M512i {.importc: "_mm512_maskz_cvtph_epi64".}

func mm512_cvt_roundph_epi64*(a: M128h, b: int32): M512i {.importc: "_mm512_cvt_roundph_epi64".}

func mm512_mask_cvt_roundph_epi64*(a: M512i, b: MMask8, c: M128h, d: int32): M512i {.importc: "_mm512_mask_cvt_roundph_epi64".}

func mm512_maskz_cvt_roundph_epi64*(a: MMask8, b: M128h, c: int32): M512i {.importc: "_mm512_maskz_cvt_roundph_epi64".}

## [Macro Original]
## #define _mm512_cvt_roundph_epi64(A, B)					\
## (__builtin_ia32_vcvtph2qq512_mask_round ((A),				\
## _mm512_setzero_si512 (),	\
## (__mmask8)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundph_epi64(A, B, C, D)		\
## (__builtin_ia32_vcvtph2qq512_mask_round ((C), (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundph_epi64(A, B, C)				\
## (__builtin_ia32_vcvtph2qq512_mask_round ((B),				\
## _mm512_setzero_si512 (),	\
## (A),				\
## (C)))

func mm512_cvtph_epu64*(a: M128h): M512i {.importc: "_mm512_cvtph_epu64".}

func mm512_mask_cvtph_epu64*(a: M512i, b: MMask8, c: M128h): M512i {.importc: "_mm512_mask_cvtph_epu64".}

func mm512_maskz_cvtph_epu64*(a: MMask8, b: M128h): M512i {.importc: "_mm512_maskz_cvtph_epu64".}

func mm512_cvt_roundph_epu64*(a: M128h, b: int32): M512i {.importc: "_mm512_cvt_roundph_epu64".}

func mm512_mask_cvt_roundph_epu64*(a: M512i, b: MMask8, c: M128h, d: int32): M512i {.importc: "_mm512_mask_cvt_roundph_epu64".}

func mm512_maskz_cvt_roundph_epu64*(a: MMask8, b: M128h, c: int32): M512i {.importc: "_mm512_maskz_cvt_roundph_epu64".}

## [Macro Original]
## #define _mm512_cvt_roundph_epu64(A, B)					\
## (__builtin_ia32_vcvtph2uqq512_mask_round ((A),			\
## _mm512_setzero_si512 (),	\
## (__mmask8)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundph_epu64(A, B, C, D)			\
## (__builtin_ia32_vcvtph2uqq512_mask_round ((C), (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundph_epu64(A, B, C)				\
## (__builtin_ia32_vcvtph2uqq512_mask_round ((B),			\
## _mm512_setzero_si512 (),	\
## (A),			\
## (C)))

func mm512_cvttph_epi64*(a: M128h): M512i {.importc: "_mm512_cvttph_epi64".}

func mm512_mask_cvttph_epi64*(a: M512i, b: MMask8, c: M128h): M512i {.importc: "_mm512_mask_cvttph_epi64".}

func mm512_maskz_cvttph_epi64*(a: MMask8, b: M128h): M512i {.importc: "_mm512_maskz_cvttph_epi64".}

func mm512_cvtt_roundph_epi64*(a: M128h, b: int32): M512i {.importc: "_mm512_cvtt_roundph_epi64".}

func mm512_mask_cvtt_roundph_epi64*(a: M512i, b: MMask8, c: M128h, d: int32): M512i {.importc: "_mm512_mask_cvtt_roundph_epi64".}

func mm512_maskz_cvtt_roundph_epi64*(a: MMask8, b: M128h, c: int32): M512i {.importc: "_mm512_maskz_cvtt_roundph_epi64".}

## [Macro Original]
## #define _mm512_cvtt_roundph_epi64(A, B)					\
## (__builtin_ia32_vcvttph2qq512_mask_round ((A),			\
## _mm512_setzero_si512 (),	\
## (__mmask8)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundph_epi64(A, B, C, D)			\
## __builtin_ia32_vcvttph2qq512_mask_round ((C), (A), (B), (D))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundph_epi64(A, B, C)			\
## (__builtin_ia32_vcvttph2qq512_mask_round ((B),			\
## _mm512_setzero_si512 (),	\
## (A),			\
## (C)))

func mm512_cvttph_epu64*(a: M128h): M512i {.importc: "_mm512_cvttph_epu64".}

func mm512_mask_cvttph_epu64*(a: M512i, b: MMask8, c: M128h): M512i {.importc: "_mm512_mask_cvttph_epu64".}

func mm512_maskz_cvttph_epu64*(a: MMask8, b: M128h): M512i {.importc: "_mm512_maskz_cvttph_epu64".}

func mm512_cvtt_roundph_epu64*(a: M128h, b: int32): M512i {.importc: "_mm512_cvtt_roundph_epu64".}

func mm512_mask_cvtt_roundph_epu64*(a: M512i, b: MMask8, c: M128h, d: int32): M512i {.importc: "_mm512_mask_cvtt_roundph_epu64".}

func mm512_maskz_cvtt_roundph_epu64*(a: MMask8, b: M128h, c: int32): M512i {.importc: "_mm512_maskz_cvtt_roundph_epu64".}

## [Macro Original]
## #define _mm512_cvtt_roundph_epu64(A, B)					\
## (__builtin_ia32_vcvttph2uqq512_mask_round ((A),			\
## _mm512_setzero_si512 (),	\
## (__mmask8)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundph_epu64(A, B, C, D)			\
## __builtin_ia32_vcvttph2uqq512_mask_round ((C), (A), (B), (D))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundph_epu64(A, B, C)			\
## (__builtin_ia32_vcvttph2uqq512_mask_round ((B),			\
## _mm512_setzero_si512 (),	\
## (A),			\
## (C)))

func mm512_cvtepi64_ph*(a: M512i): M128h {.importc: "_mm512_cvtepi64_ph".}

func mm512_mask_cvtepi64_ph*(a: M128h, b: MMask8, c: M512i): M128h {.importc: "_mm512_mask_cvtepi64_ph".}

func mm512_maskz_cvtepi64_ph*(a: MMask8, b: M512i): M128h {.importc: "_mm512_maskz_cvtepi64_ph".}

func mm512_cvt_roundepi64_ph*(a: M512i, b: int32): M128h {.importc: "_mm512_cvt_roundepi64_ph".}

func mm512_mask_cvt_roundepi64_ph*(a: M128h, b: MMask8, c: M512i, d: int32): M128h {.importc: "_mm512_mask_cvt_roundepi64_ph".}

func mm512_maskz_cvt_roundepi64_ph*(a: MMask8, b: M512i, c: int32): M128h {.importc: "_mm512_maskz_cvt_roundepi64_ph".}

## [Macro Original]
## #define _mm512_cvt_roundepi64_ph(A, B)				\
## (__builtin_ia32_vcvtqq2ph512_mask_round ((__v8di)(A),		\
## _mm_setzero_ph (),	\
## (__mmask8)-1,	\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepi64_ph(A, B, C, D)			\
## (__builtin_ia32_vcvtqq2ph512_mask_round ((__v8di)(C), (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepi64_ph(A, B, C)			\
## (__builtin_ia32_vcvtqq2ph512_mask_round ((__v8di)(B),		\
## _mm_setzero_ph (),	\
## (A),			\
## (C)))

func mm512_cvtepu64_ph*(a: M512i): M128h {.importc: "_mm512_cvtepu64_ph".}

func mm512_mask_cvtepu64_ph*(a: M128h, b: MMask8, c: M512i): M128h {.importc: "_mm512_mask_cvtepu64_ph".}

func mm512_maskz_cvtepu64_ph*(a: MMask8, b: M512i): M128h {.importc: "_mm512_maskz_cvtepu64_ph".}

func mm512_cvt_roundepu64_ph*(a: M512i, b: int32): M128h {.importc: "_mm512_cvt_roundepu64_ph".}

func mm512_mask_cvt_roundepu64_ph*(a: M128h, b: MMask8, c: M512i, d: int32): M128h {.importc: "_mm512_mask_cvt_roundepu64_ph".}

func mm512_maskz_cvt_roundepu64_ph*(a: MMask8, b: M512i, c: int32): M128h {.importc: "_mm512_maskz_cvt_roundepu64_ph".}

## [Macro Original]
## #define _mm512_cvt_roundepu64_ph(A, B)				\
## (__builtin_ia32_vcvtuqq2ph512_mask_round ((__v8di)(A),	\
## _mm_setzero_ph (),	\
## (__mmask8)-1,	\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepu64_ph(A, B, C, D)			\
## (__builtin_ia32_vcvtuqq2ph512_mask_round ((__v8di)(C), (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepu64_ph(A, B, C)			\
## (__builtin_ia32_vcvtuqq2ph512_mask_round ((__v8di)(B),	\
## _mm_setzero_ph (),	\
## (A),		\
## (C)))

func mm512_cvtph_epi16*(a: M512h): M512i {.importc: "_mm512_cvtph_epi16".}

func mm512_mask_cvtph_epi16*(a: M512i, b: MMask32, c: M512h): M512i {.importc: "_mm512_mask_cvtph_epi16".}

func mm512_maskz_cvtph_epi16*(a: MMask32, b: M512h): M512i {.importc: "_mm512_maskz_cvtph_epi16".}

func mm512_cvt_roundph_epi16*(a: M512h, b: int32): M512i {.importc: "_mm512_cvt_roundph_epi16".}

func mm512_mask_cvt_roundph_epi16*(a: M512i, b: MMask32, c: M512h, d: int32): M512i {.importc: "_mm512_mask_cvt_roundph_epi16".}

func mm512_maskz_cvt_roundph_epi16*(a: MMask32, b: M512h, c: int32): M512i {.importc: "_mm512_maskz_cvt_roundph_epi16".}

## [Macro Original]
## #define _mm512_cvt_roundph_epi16(A, B)					\
## ((__m512i)__builtin_ia32_vcvtph2w512_mask_round ((A),		\
## (__v32hi)		\
## _mm512_setzero_si512 (), \
## (__mmask32)-1,	\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundph_epi16(A, B, C, D)			\
## ((__m512i)__builtin_ia32_vcvtph2w512_mask_round ((C),		\
## (__v32hi)(A),	\
## (B),		\
## (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundph_epi16(A, B, C)				\
## ((__m512i)__builtin_ia32_vcvtph2w512_mask_round ((B),		\
## (__v32hi)		\
## _mm512_setzero_si512 (), \
## (A),		\
## (C)))

func mm512_cvtph_epu16*(a: M512h): M512i {.importc: "_mm512_cvtph_epu16".}

func mm512_mask_cvtph_epu16*(a: M512i, b: MMask32, c: M512h): M512i {.importc: "_mm512_mask_cvtph_epu16".}

func mm512_maskz_cvtph_epu16*(a: MMask32, b: M512h): M512i {.importc: "_mm512_maskz_cvtph_epu16".}

func mm512_cvt_roundph_epu16*(a: M512h, b: int32): M512i {.importc: "_mm512_cvt_roundph_epu16".}

func mm512_mask_cvt_roundph_epu16*(a: M512i, b: MMask32, c: M512h, d: int32): M512i {.importc: "_mm512_mask_cvt_roundph_epu16".}

func mm512_maskz_cvt_roundph_epu16*(a: MMask32, b: M512h, c: int32): M512i {.importc: "_mm512_maskz_cvt_roundph_epu16".}

## [Macro Original]
## #define _mm512_cvt_roundph_epu16(A, B)					\
## ((__m512i)								\
## __builtin_ia32_vcvtph2uw512_mask_round ((A),			\
## (__v32hi)			\
## _mm512_setzero_si512 (),	\
## (__mmask32)-1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundph_epu16(A, B, C, D)			\
## ((__m512i)								\
## __builtin_ia32_vcvtph2uw512_mask_round ((C), (__v32hi)(A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundph_epu16(A, B, C)				\
## ((__m512i)								\
## __builtin_ia32_vcvtph2uw512_mask_round ((B),			\
## (__v32hi)			\
## _mm512_setzero_si512 (),	\
## (A),			\
## (C)))

func mm512_cvttph_epi16*(a: M512h): M512i {.importc: "_mm512_cvttph_epi16".}

func mm512_mask_cvttph_epi16*(a: M512i, b: MMask32, c: M512h): M512i {.importc: "_mm512_mask_cvttph_epi16".}

func mm512_maskz_cvttph_epi16*(a: MMask32, b: M512h): M512i {.importc: "_mm512_maskz_cvttph_epi16".}

func mm512_cvtt_roundph_epi16*(a: M512h, b: int32): M512i {.importc: "_mm512_cvtt_roundph_epi16".}

func mm512_mask_cvtt_roundph_epi16*(a: M512i, b: MMask32, c: M512h, d: int32): M512i {.importc: "_mm512_mask_cvtt_roundph_epi16".}

func mm512_maskz_cvtt_roundph_epi16*(a: MMask32, b: M512h, c: int32): M512i {.importc: "_mm512_maskz_cvtt_roundph_epi16".}

## [Macro Original]
## #define _mm512_cvtt_roundph_epi16(A, B)				    \
## ((__m512i)							    \
## __builtin_ia32_vcvttph2w512_mask_round ((A),			    \
## (__v32hi)		    \
## _mm512_setzero_si512 (), \
## (__mmask32)-1,	    \
## (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundph_epi16(A, B, C, D)		\
## ((__m512i)							\
## __builtin_ia32_vcvttph2w512_mask_round ((C),			\
## (__v32hi)(A),	\
## (B),			\
## (D)))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundph_epi16(A, B, C)		    \
## ((__m512i)							    \
## __builtin_ia32_vcvttph2w512_mask_round ((B),			    \
## (__v32hi)		    \
## _mm512_setzero_si512 (), \
## (A),			    \
## (C)))

func mm512_cvttph_epu16*(a: M512h): M512i {.importc: "_mm512_cvttph_epu16".}

func mm512_mask_cvttph_epu16*(a: M512i, b: MMask32, c: M512h): M512i {.importc: "_mm512_mask_cvttph_epu16".}

func mm512_maskz_cvttph_epu16*(a: MMask32, b: M512h): M512i {.importc: "_mm512_maskz_cvttph_epu16".}

func mm512_cvtt_roundph_epu16*(a: M512h, b: int32): M512i {.importc: "_mm512_cvtt_roundph_epu16".}

func mm512_mask_cvtt_roundph_epu16*(a: M512i, b: MMask32, c: M512h, d: int32): M512i {.importc: "_mm512_mask_cvtt_roundph_epu16".}

func mm512_maskz_cvtt_roundph_epu16*(a: MMask32, b: M512h, c: int32): M512i {.importc: "_mm512_maskz_cvtt_roundph_epu16".}

## [Macro Original]
## #define _mm512_cvtt_roundph_epu16(A, B)				     \
## ((__m512i)							     \
## __builtin_ia32_vcvttph2uw512_mask_round ((A),		     \
## (__v32hi)		     \
## _mm512_setzero_si512 (), \
## (__mmask32)-1,	     \
## (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundph_epu16(A, B, C, D)		\
## ((__m512i)							\
## __builtin_ia32_vcvttph2uw512_mask_round ((C),		\
## (__v32hi)(A),	\
## (B),		\
## (D)))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundph_epu16(A, B, C)		     \
## ((__m512i)							     \
## __builtin_ia32_vcvttph2uw512_mask_round ((B),		     \
## (__v32hi)		     \
## _mm512_setzero_si512 (), \
## (A),		     \
## (C)))

func mm512_cvtepi16_ph*(a: M512i): M512h {.importc: "_mm512_cvtepi16_ph".}

func mm512_mask_cvtepi16_ph*(a: M512h, b: MMask32, c: M512i): M512h {.importc: "_mm512_mask_cvtepi16_ph".}

func mm512_maskz_cvtepi16_ph*(a: MMask32, b: M512i): M512h {.importc: "_mm512_maskz_cvtepi16_ph".}

func mm512_cvt_roundepi16_ph*(a: M512i, b: int32): M512h {.importc: "_mm512_cvt_roundepi16_ph".}

func mm512_mask_cvt_roundepi16_ph*(a: M512h, b: MMask32, c: M512i, d: int32): M512h {.importc: "_mm512_mask_cvt_roundepi16_ph".}

func mm512_maskz_cvt_roundepi16_ph*(a: MMask32, b: M512i, c: int32): M512h {.importc: "_mm512_maskz_cvt_roundepi16_ph".}

## [Macro Original]
## #define _mm512_cvt_roundepi16_ph(A, B)				\
## (__builtin_ia32_vcvtw2ph512_mask_round ((__v32hi)(A),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1,	\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepi16_ph(A, B, C, D)	\
## (__builtin_ia32_vcvtw2ph512_mask_round ((__v32hi)(C),	\
## (A),		\
## (B),		\
## (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepi16_ph(A, B, C)			\
## (__builtin_ia32_vcvtw2ph512_mask_round ((__v32hi)(B),		\
## _mm512_setzero_ph (),	\
## (A),			\
## (C)))

func mm512_cvtepu16_ph*(a: M512i): M512h {.importc: "_mm512_cvtepu16_ph".}

func mm512_mask_cvtepu16_ph*(a: M512h, b: MMask32, c: M512i): M512h {.importc: "_mm512_mask_cvtepu16_ph".}

func mm512_maskz_cvtepu16_ph*(a: MMask32, b: M512i): M512h {.importc: "_mm512_maskz_cvtepu16_ph".}

func mm512_cvt_roundepu16_ph*(a: M512i, b: int32): M512h {.importc: "_mm512_cvt_roundepu16_ph".}

func mm512_mask_cvt_roundepu16_ph*(a: M512h, b: MMask32, c: M512i, d: int32): M512h {.importc: "_mm512_mask_cvt_roundepu16_ph".}

func mm512_maskz_cvt_roundepu16_ph*(a: MMask32, b: M512i, c: int32): M512h {.importc: "_mm512_maskz_cvt_roundepu16_ph".}

## [Macro Original]
## #define _mm512_cvt_roundepu16_ph(A, B)					\
## (__builtin_ia32_vcvtuw2ph512_mask_round ((__v32hi)(A),		\
## _mm512_setzero_ph (),	\
## (__mmask32)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepu16_ph(A, B, C, D)		\
## (__builtin_ia32_vcvtuw2ph512_mask_round ((__v32hi)(C),	\
## (A),			\
## (B),			\
## (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepu16_ph(A, B, C)				\
## (__builtin_ia32_vcvtuw2ph512_mask_round ((__v32hi)(B),		\
## _mm512_setzero_ph (),	\
## (A),				\
## (C)))

func mm512_cvtph_pd*(a: M128h): M512d {.importc: "_mm512_cvtph_pd".}

func mm512_mask_cvtph_pd*(a: M512d, b: MMask8, c: M128h): M512d {.importc: "_mm512_mask_cvtph_pd".}

func mm512_maskz_cvtph_pd*(a: MMask8, b: M128h): M512d {.importc: "_mm512_maskz_cvtph_pd".}

func mm512_cvt_roundph_pd*(a: M128h, b: int32): M512d {.importc: "_mm512_cvt_roundph_pd".}

func mm512_mask_cvt_roundph_pd*(a: M512d, b: MMask8, c: M128h, d: int32): M512d {.importc: "_mm512_mask_cvt_roundph_pd".}

func mm512_maskz_cvt_roundph_pd*(a: MMask8, b: M128h, c: int32): M512d {.importc: "_mm512_maskz_cvt_roundph_pd".}

## [Macro Original]
## #define _mm512_cvt_roundph_pd(A, B)					\
## (__builtin_ia32_vcvtph2pd512_mask_round ((A),			\
## _mm512_setzero_pd (),	\
## (__mmask8)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundph_pd(A, B, C, D)				\
## (__builtin_ia32_vcvtph2pd512_mask_round ((C), (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundph_pd(A, B, C)				\
## (__builtin_ia32_vcvtph2pd512_mask_round ((B),			\
## _mm512_setzero_pd (),	\
## (A),			\
## (C)))

func mm512_cvtxph_ps*(a: M256h): M512 {.importc: "_mm512_cvtxph_ps".}

func mm512_mask_cvtxph_ps*(a: M512, b: MMask16, c: M256h): M512 {.importc: "_mm512_mask_cvtxph_ps".}

func mm512_maskz_cvtxph_ps*(a: MMask16, b: M256h): M512 {.importc: "_mm512_maskz_cvtxph_ps".}

func mm512_cvtx_roundph_ps*(a: M256h, b: int32): M512 {.importc: "_mm512_cvtx_roundph_ps".}

func mm512_mask_cvtx_roundph_ps*(a: M512, b: MMask16, c: M256h, d: int32): M512 {.importc: "_mm512_mask_cvtx_roundph_ps".}

func mm512_maskz_cvtx_roundph_ps*(a: MMask16, b: M256h, c: int32): M512 {.importc: "_mm512_maskz_cvtx_roundph_ps".}

## [Macro Original]
## #define _mm512_cvtx_roundph_ps(A, B)					\
## (__builtin_ia32_vcvtph2psx512_mask_round ((A),			\
## _mm512_setzero_ps (),	\
## (__mmask16)-1,		\
## (B)))

## [Macro Original]
## #define _mm512_mask_cvtx_roundph_ps(A, B, C, D)				\
## (__builtin_ia32_vcvtph2psx512_mask_round ((C), (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvtx_roundph_ps(A, B, C)				\
## (__builtin_ia32_vcvtph2psx512_mask_round ((B),			\
## _mm512_setzero_ps (),	\
## (A),			\
## (C)))

func mm512_cvtxps_ph*(a: M512): M256h {.importc: "_mm512_cvtxps_ph".}

func mm512_mask_cvtxps_ph*(a: M256h, b: MMask16, c: M512): M256h {.importc: "_mm512_mask_cvtxps_ph".}

func mm512_maskz_cvtxps_ph*(a: MMask16, b: M512): M256h {.importc: "_mm512_maskz_cvtxps_ph".}

func mm512_cvtx_roundps_ph*(a: M512, b: int32): M256h {.importc: "_mm512_cvtx_roundps_ph".}

func mm512_mask_cvtx_roundps_ph*(a: M256h, b: MMask16, c: M512, d: int32): M256h {.importc: "_mm512_mask_cvtx_roundps_ph".}

func mm512_maskz_cvtx_roundps_ph*(a: MMask16, b: M512, c: int32): M256h {.importc: "_mm512_maskz_cvtx_roundps_ph".}

## [Macro Original]
## #define _mm512_cvtx_roundps_ph(A, B)				\
## (__builtin_ia32_vcvtps2phx512_mask_round ((__v16sf)(A),	\
## _mm256_setzero_ph (),\
## (__mmask16)-1, (B)))

## [Macro Original]
## #define _mm512_mask_cvtx_roundps_ph(A, B, C, D)			\
## (__builtin_ia32_vcvtps2phx512_mask_round ((__v16sf)(C),	\
## (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvtx_roundps_ph(A, B, C)			\
## (__builtin_ia32_vcvtps2phx512_mask_round ((__v16sf)(B),	\
## _mm256_setzero_ph (),\
## (A), (C)))

func mm512_cvtpd_ph*(a: M512d): M128h {.importc: "_mm512_cvtpd_ph".}

func mm512_mask_cvtpd_ph*(a: M128h, b: MMask8, c: M512d): M128h {.importc: "_mm512_mask_cvtpd_ph".}

func mm512_maskz_cvtpd_ph*(a: MMask8, b: M512d): M128h {.importc: "_mm512_maskz_cvtpd_ph".}

func mm512_cvt_roundpd_ph*(a: M512d, b: int32): M128h {.importc: "_mm512_cvt_roundpd_ph".}

func mm512_mask_cvt_roundpd_ph*(a: M128h, b: MMask8, c: M512d, d: int32): M128h {.importc: "_mm512_mask_cvt_roundpd_ph".}

func mm512_maskz_cvt_roundpd_ph*(a: MMask8, b: M512d, c: int32): M128h {.importc: "_mm512_maskz_cvt_roundpd_ph".}

## [Macro Original]
## #define _mm512_cvt_roundpd_ph(A, B)				\
## (__builtin_ia32_vcvtpd2ph512_mask_round ((__v8df)(A),		\
## _mm_setzero_ph (),	\
## (__mmask8)-1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundpd_ph(A, B, C, D)			\
## (__builtin_ia32_vcvtpd2ph512_mask_round ((__v8df)(C),		\
## (A), (B), (D)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundpd_ph(A, B, C)			\
## (__builtin_ia32_vcvtpd2ph512_mask_round ((__v8df)(B),		\
## _mm_setzero_ph (),	\
## (A), (C)))

func mm512_fmaddsub_ph*(a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_fmaddsub_ph".}

func mm512_mask_fmaddsub_ph*(a: M512h, u: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_mask_fmaddsub_ph".}

func mm512_mask3_fmaddsub_ph*(a: M512h, b: M512h, c: M512h, u: MMask32): M512h {.importc: "_mm512_mask3_fmaddsub_ph".}

func mm512_maskz_fmaddsub_ph*(u: MMask32, a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_fmaddsub_ph".}

func mm512_fmaddsub_round_ph*(a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_fmaddsub_round_ph".}

func mm512_mask_fmaddsub_round_ph*(a: M512h, u: MMask32, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_mask_fmaddsub_round_ph".}

func mm512_mask3_fmaddsub_round_ph*(a: M512h, b: M512h, c: M512h, u: MMask32, r: int32): M512h {.importc: "_mm512_mask3_fmaddsub_round_ph".}

func mm512_maskz_fmaddsub_round_ph*(u: MMask32, a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_maskz_fmaddsub_round_ph".}

## [Macro Original]
## #define _mm512_fmaddsub_round_ph(A, B, C, R)				\
## ((__m512h)__builtin_ia32_vfmaddsubph512_mask ((A), (B), (C), -1, (R)))

## [Macro Original]
## #define _mm512_mask_fmaddsub_round_ph(A, U, B, C, R)			\
## ((__m512h)__builtin_ia32_vfmaddsubph512_mask ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_mask3_fmaddsub_round_ph(A, B, C, U, R)			\
## ((__m512h)__builtin_ia32_vfmaddsubph512_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_maskz_fmaddsub_round_ph(U, A, B, C, R)			\
## ((__m512h)__builtin_ia32_vfmaddsubph512_maskz ((A), (B), (C), (U), (R)))

func mm512_fmsubadd_ph*(a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_fmsubadd_ph".}

func mm512_mask_fmsubadd_ph*(a: M512h, u: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_mask_fmsubadd_ph".}

func mm512_mask3_fmsubadd_ph*(a: M512h, b: M512h, c: M512h, u: MMask32): M512h {.importc: "_mm512_mask3_fmsubadd_ph".}

func mm512_maskz_fmsubadd_ph*(u: MMask32, a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_fmsubadd_ph".}

func mm512_fmsubadd_round_ph*(a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_fmsubadd_round_ph".}

func mm512_mask_fmsubadd_round_ph*(a: M512h, u: MMask32, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_mask_fmsubadd_round_ph".}

func mm512_mask3_fmsubadd_round_ph*(a: M512h, b: M512h, c: M512h, u: MMask32, r: int32): M512h {.importc: "_mm512_mask3_fmsubadd_round_ph".}

func mm512_maskz_fmsubadd_round_ph*(u: MMask32, a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_maskz_fmsubadd_round_ph".}

## [Macro Original]
## #define _mm512_fmsubadd_round_ph(A, B, C, R)				\
## ((__m512h)__builtin_ia32_vfmsubaddph512_mask ((A), (B), (C), -1, (R)))

## [Macro Original]
## #define _mm512_mask_fmsubadd_round_ph(A, U, B, C, R)			\
## ((__m512h)__builtin_ia32_vfmsubaddph512_mask ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_mask3_fmsubadd_round_ph(A, B, C, U, R)			\
## ((__m512h)__builtin_ia32_vfmsubaddph512_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_maskz_fmsubadd_round_ph(U, A, B, C, R)			\
## ((__m512h)__builtin_ia32_vfmsubaddph512_maskz ((A), (B), (C), (U), (R)))

func mm512_fmadd_ph*(a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_fmadd_ph".}

func mm512_mask_fmadd_ph*(a: M512h, u: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_mask_fmadd_ph".}

func mm512_mask3_fmadd_ph*(a: M512h, b: M512h, c: M512h, u: MMask32): M512h {.importc: "_mm512_mask3_fmadd_ph".}

func mm512_maskz_fmadd_ph*(u: MMask32, a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_fmadd_ph".}

func mm512_fmadd_round_ph*(a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_fmadd_round_ph".}

func mm512_mask_fmadd_round_ph*(a: M512h, u: MMask32, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_mask_fmadd_round_ph".}

func mm512_mask3_fmadd_round_ph*(a: M512h, b: M512h, c: M512h, u: MMask32, r: int32): M512h {.importc: "_mm512_mask3_fmadd_round_ph".}

func mm512_maskz_fmadd_round_ph*(u: MMask32, a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_maskz_fmadd_round_ph".}

## [Macro Original]
## #define _mm512_fmadd_round_ph(A, B, C, R)				\
## ((__m512h)__builtin_ia32_vfmaddph512_mask ((A), (B), (C), -1, (R)))

## [Macro Original]
## #define _mm512_mask_fmadd_round_ph(A, U, B, C, R)			\
## ((__m512h)__builtin_ia32_vfmaddph512_mask ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_mask3_fmadd_round_ph(A, B, C, U, R)			\
## ((__m512h)__builtin_ia32_vfmaddph512_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_maskz_fmadd_round_ph(U, A, B, C, R)			\
## ((__m512h)__builtin_ia32_vfmaddph512_maskz ((A), (B), (C), (U), (R)))

func mm512_fnmadd_ph*(a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_fnmadd_ph".}

func mm512_mask_fnmadd_ph*(a: M512h, u: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_mask_fnmadd_ph".}

func mm512_mask3_fnmadd_ph*(a: M512h, b: M512h, c: M512h, u: MMask32): M512h {.importc: "_mm512_mask3_fnmadd_ph".}

func mm512_maskz_fnmadd_ph*(u: MMask32, a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_fnmadd_ph".}

func mm512_fnmadd_round_ph*(a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_fnmadd_round_ph".}

func mm512_mask_fnmadd_round_ph*(a: M512h, u: MMask32, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_mask_fnmadd_round_ph".}

func mm512_mask3_fnmadd_round_ph*(a: M512h, b: M512h, c: M512h, u: MMask32, r: int32): M512h {.importc: "_mm512_mask3_fnmadd_round_ph".}

func mm512_maskz_fnmadd_round_ph*(u: MMask32, a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_maskz_fnmadd_round_ph".}

## [Macro Original]
## #define _mm512_fnmadd_round_ph(A, B, C, R)				\
## ((__m512h)__builtin_ia32_vfnmaddph512_mask ((A), (B), (C), -1, (R)))

## [Macro Original]
## #define _mm512_mask_fnmadd_round_ph(A, U, B, C, R)			\
## ((__m512h)__builtin_ia32_vfnmaddph512_mask ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_mask3_fnmadd_round_ph(A, B, C, U, R)			\
## ((__m512h)__builtin_ia32_vfnmaddph512_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_maskz_fnmadd_round_ph(U, A, B, C, R)			\
## ((__m512h)__builtin_ia32_vfnmaddph512_maskz ((A), (B), (C), (U), (R)))

func mm512_fmsub_ph*(a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_fmsub_ph".}

func mm512_mask_fmsub_ph*(a: M512h, u: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_mask_fmsub_ph".}

func mm512_mask3_fmsub_ph*(a: M512h, b: M512h, c: M512h, u: MMask32): M512h {.importc: "_mm512_mask3_fmsub_ph".}

func mm512_maskz_fmsub_ph*(u: MMask32, a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_fmsub_ph".}

func mm512_fmsub_round_ph*(a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_fmsub_round_ph".}

func mm512_mask_fmsub_round_ph*(a: M512h, u: MMask32, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_mask_fmsub_round_ph".}

func mm512_mask3_fmsub_round_ph*(a: M512h, b: M512h, c: M512h, u: MMask32, r: int32): M512h {.importc: "_mm512_mask3_fmsub_round_ph".}

func mm512_maskz_fmsub_round_ph*(u: MMask32, a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_maskz_fmsub_round_ph".}

## [Macro Original]
## #define _mm512_fmsub_round_ph(A, B, C, R)				\
## ((__m512h)__builtin_ia32_vfmsubph512_mask ((A), (B), (C), -1, (R)))

## [Macro Original]
## #define _mm512_mask_fmsub_round_ph(A, U, B, C, R)			\
## ((__m512h)__builtin_ia32_vfmsubph512_mask ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_mask3_fmsub_round_ph(A, B, C, U, R)			\
## ((__m512h)__builtin_ia32_vfmsubph512_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_maskz_fmsub_round_ph(U, A, B, C, R)			\
## ((__m512h)__builtin_ia32_vfmsubph512_maskz ((A), (B), (C), (U), (R)))

func mm512_fnmsub_ph*(a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_fnmsub_ph".}

func mm512_mask_fnmsub_ph*(a: M512h, u: MMask32, b: M512h, c: M512h): M512h {.importc: "_mm512_mask_fnmsub_ph".}

func mm512_mask3_fnmsub_ph*(a: M512h, b: M512h, c: M512h, u: MMask32): M512h {.importc: "_mm512_mask3_fnmsub_ph".}

func mm512_maskz_fnmsub_ph*(u: MMask32, a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_fnmsub_ph".}

func mm512_fnmsub_round_ph*(a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_fnmsub_round_ph".}

func mm512_mask_fnmsub_round_ph*(a: M512h, u: MMask32, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_mask_fnmsub_round_ph".}

func mm512_mask3_fnmsub_round_ph*(a: M512h, b: M512h, c: M512h, u: MMask32, r: int32): M512h {.importc: "_mm512_mask3_fnmsub_round_ph".}

func mm512_maskz_fnmsub_round_ph*(u: MMask32, a: M512h, b: M512h, c: M512h, r: int32): M512h {.importc: "_mm512_maskz_fnmsub_round_ph".}

## [Macro Original]
## #define _mm512_fnmsub_round_ph(A, B, C, R)				\
## ((__m512h)__builtin_ia32_vfnmsubph512_mask ((A), (B), (C), -1, (R)))

## [Macro Original]
## #define _mm512_mask_fnmsub_round_ph(A, U, B, C, R)			\
## ((__m512h)__builtin_ia32_vfnmsubph512_mask ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_mask3_fnmsub_round_ph(A, B, C, U, R)			\
## ((__m512h)__builtin_ia32_vfnmsubph512_mask3 ((A), (B), (C), (U), (R)))

## [Macro Original]
## #define _mm512_maskz_fnmsub_round_ph(U, A, B, C, R)			\
## ((__m512h)__builtin_ia32_vfnmsubph512_maskz ((A), (B), (C), (U), (R)))

func mm512_fcmadd_pch*(a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_fcmadd_pch".}

func mm512_mask_fcmadd_pch*(a: M512h, b: MMask16, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_fcmadd_pch".}

func mm512_mask3_fcmadd_pch*(a: M512h, b: M512h, c: M512h, d: MMask16): M512h {.importc: "_mm512_mask3_fcmadd_pch".}

func mm512_maskz_fcmadd_pch*(a: MMask16, b: M512h, c: M512h, d: M512h): M512h {.importc: "_mm512_maskz_fcmadd_pch".}

func mm512_fmadd_pch*(a: M512h, b: M512h, c: M512h): M512h {.importc: "_mm512_fmadd_pch".}

func mm512_mask_fmadd_pch*(a: M512h, b: MMask16, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_fmadd_pch".}

func mm512_mask3_fmadd_pch*(a: M512h, b: M512h, c: M512h, d: MMask16): M512h {.importc: "_mm512_mask3_fmadd_pch".}

func mm512_maskz_fmadd_pch*(a: MMask16, b: M512h, c: M512h, d: M512h): M512h {.importc: "_mm512_maskz_fmadd_pch".}

func mm512_fcmadd_round_pch*(a: M512h, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_fcmadd_round_pch".}

func mm512_mask_fcmadd_round_pch*(a: M512h, b: MMask16, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_fcmadd_round_pch".}

func mm512_mask3_fcmadd_round_pch*(a: M512h, b: M512h, c: M512h, d: MMask16, e: int32): M512h {.importc: "_mm512_mask3_fcmadd_round_pch".}

func mm512_maskz_fcmadd_round_pch*(a: MMask16, b: M512h, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_maskz_fcmadd_round_pch".}

func mm512_fmadd_round_pch*(a: M512h, b: M512h, c: M512h, d: int32): M512h {.importc: "_mm512_fmadd_round_pch".}

func mm512_mask_fmadd_round_pch*(a: M512h, b: MMask16, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_fmadd_round_pch".}

func mm512_mask3_fmadd_round_pch*(a: M512h, b: M512h, c: M512h, d: MMask16, e: int32): M512h {.importc: "_mm512_mask3_fmadd_round_pch".}

func mm512_maskz_fmadd_round_pch*(a: MMask16, b: M512h, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_maskz_fmadd_round_pch".}

## [Macro Original]
## #define _mm512_fcmadd_round_pch(A, B, C, D)			\
## (__m512h) __builtin_ia32_vfcmaddcph512_round ((A), (B), (C), (D))

## [Macro Original]
## #define _mm512_mask_fcmadd_round_pch(A, B, C, D, E)			\
## ((__m512h) 								\
## __builtin_ia32_vfcmaddcph512_mask_round ((__v32hf) (A),		\
## (__v32hf) (C),		\
## (__v32hf) (D),		\
## (B), (E)))

## [Macro Original]
## #define _mm512_mask3_fcmadd_round_pch(A, B, C, D, E)			\
## ((__m512h)								\
## __builtin_ia32_vfcmaddcph512_mask3_round ((A), (B), (C), (D), (E)))

## [Macro Original]
## #define _mm512_maskz_fcmadd_round_pch(A, B, C, D, E)			\
## (__m512h)								\
## __builtin_ia32_vfcmaddcph512_maskz_round ((B), (C), (D), (A), (E))

## [Macro Original]
## #define _mm512_fmadd_round_pch(A, B, C, D)			\
## (__m512h) __builtin_ia32_vfmaddcph512_round ((A), (B), (C), (D))

## [Macro Original]
## #define _mm512_mask_fmadd_round_pch(A, B, C, D, E)			\
## ((__m512h)								\
## __builtin_ia32_vfmaddcph512_mask_round ((__v32hf) (A),		\
## (__v32hf) (C),		\
## (__v32hf) (D),		\
## (B), (E)))

## [Macro Original]
## #define _mm512_mask3_fmadd_round_pch(A, B, C, D, E)			\
## (__m512h)								\
## __builtin_ia32_vfmaddcph512_mask3_round ((A), (B), (C), (D), (E))

## [Macro Original]
## #define _mm512_maskz_fmadd_round_pch(A, B, C, D, E)			\
## (__m512h)								\
## __builtin_ia32_vfmaddcph512_maskz_round ((B), (C), (D), (A), (E))

func mm512_fcmul_pch*(a: M512h, b: M512h): M512h {.importc: "_mm512_fcmul_pch".}

func mm512_mask_fcmul_pch*(a: M512h, b: MMask16, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_fcmul_pch".}

func mm512_maskz_fcmul_pch*(a: MMask16, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_fcmul_pch".}

func mm512_fmul_pch*(a: M512h, b: M512h): M512h {.importc: "_mm512_fmul_pch".}

func mm512_mask_fmul_pch*(a: M512h, b: MMask16, c: M512h, d: M512h): M512h {.importc: "_mm512_mask_fmul_pch".}

func mm512_maskz_fmul_pch*(a: MMask16, b: M512h, c: M512h): M512h {.importc: "_mm512_maskz_fmul_pch".}

func mm512_fcmul_round_pch*(a: M512h, b: M512h, d: int32): M512h {.importc: "_mm512_fcmul_round_pch".}

func mm512_mask_fcmul_round_pch*(a: M512h, b: MMask16, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_fcmul_round_pch".}

func mm512_maskz_fcmul_round_pch*(a: MMask16, b: M512h, c: M512h, e: int32): M512h {.importc: "_mm512_maskz_fcmul_round_pch".}

func mm512_fmul_round_pch*(a: M512h, b: M512h, d: int32): M512h {.importc: "_mm512_fmul_round_pch".}

func mm512_mask_fmul_round_pch*(a: M512h, b: MMask16, c: M512h, d: M512h, e: int32): M512h {.importc: "_mm512_mask_fmul_round_pch".}

func mm512_maskz_fmul_round_pch*(a: MMask16, b: M512h, c: M512h, e: int32): M512h {.importc: "_mm512_maskz_fmul_round_pch".}

## [Macro Original]
## #define _mm512_fcmul_round_pch(A, B, D)				\
## (__m512h) __builtin_ia32_vfcmulcph512_round ((A), (B), (D))

## [Macro Original]
## #define _mm512_mask_fcmul_round_pch(A, B, C, D, E)			\
## (__m512h) __builtin_ia32_vfcmulcph512_mask_round ((C), (D), (A), (B), (E))

## [Macro Original]
## #define _mm512_maskz_fcmul_round_pch(A, B, C, E)			\
## (__m512h) __builtin_ia32_vfcmulcph512_mask_round ((B), (C),		\
## (__v32hf)		\
## _mm512_setzero_ph (), \
## (A), (E))

## [Macro Original]
## #define _mm512_fmul_round_pch(A, B, D)			\
## (__m512h) __builtin_ia32_vfmulcph512_round ((A), (B), (D))

## [Macro Original]
## #define _mm512_mask_fmul_round_pch(A, B, C, D, E)			  \
## (__m512h) __builtin_ia32_vfmulcph512_mask_round ((C), (D), (A), (B), (E))

## [Macro Original]
## #define _mm512_maskz_fmul_round_pch(A, B, C, E)				  \
## (__m512h) __builtin_ia32_vfmulcph512_mask_round ((B), (C),		  \
## (__v32hf)		  \
## _mm512_setzero_ph (),  \
## (A), (E))

## [Macro Original]
## #define _MM512_REDUCE_OP(op)						\
## __m256h __T1 = (__m256h) _mm512_extractf64x4_pd ((__m512d) __A, 0);	\
## __m256h __T2 = (__m256h) _mm512_extractf64x4_pd ((__m512d) __A, 1);	\
## __m256h __T3 = (__T1 op __T2);					\
## __m128h __T4 = (__m128h) _mm256_extractf128_pd ((__m256d) __T3, 0);	\
## __m128h __T5 = (__m128h) _mm256_extractf128_pd ((__m256d) __T3, 1);	\
## __m128h __T6 = (__T4 op __T5);					\
## __m128h __T7 = (__m128h) __builtin_shuffle ((__m128h)__T6,		\
## (__v8hi) { 4, 5, 6, 7, 0, 1, 2, 3 });			\
## __m128h __T8 = (__T6 op __T7);					\
## __m128h __T9 = (__m128h) __builtin_shuffle ((__m128h)__T8,		\
## (__v8hi) { 2, 3, 0, 1, 4, 5, 6, 7 });			\
## __m128h __T10 = __T8 op __T9;					\
## return __T10[0] op __T10[1]

func mm512_reduce_add_ph*(a: M512h): Float16 {.importc: "_mm512_reduce_add_ph".}

func mm512_reduce_mul_ph*(a: M512h): Float16 {.importc: "_mm512_reduce_mul_ph".}

## [Macro Original]
## #define _MM512_REDUCE_OP(op)						\
## __m256h __T1 = (__m256h) _mm512_extractf64x4_pd ((__m512d) __A, 0);	\
## __m256h __T2 = (__m256h) _mm512_extractf64x4_pd ((__m512d) __A, 1);	\
## __m256h __T3 = __builtin_ia32_##op##ph256_mask (__T1, __T2,		\
## _mm256_setzero_ph (), (__mmask16) -1);		\
## __m128h __T4 = (__m128h) _mm256_extractf128_pd ((__m256d) __T3, 0);	\
## __m128h __T5 = (__m128h) _mm256_extractf128_pd ((__m256d) __T3, 1);	\
## __m128h __T6 = __builtin_ia32_##op##ph128_mask			\
## (__T4, __T5, _mm_setzero_ph (),(__mmask8) -1);	\
## __m128h __T7 = (__m128h) __builtin_shuffle ((__m128h)__T6,		\
## (__v8hi) { 2, 3, 0, 1, 6, 7, 4, 5 });			\
## __m128h __T8 = (__m128h)  __builtin_ia32_##op##ph128_mask		\
## (__T6, __T7, _mm_setzero_ph (),(__mmask8) -1);	\
## __m128h __T9 = (__m128h) __builtin_shuffle ((__m128h)__T8,		\
## (__v8hi) { 4, 5 });					\
## __m128h __T10 = __builtin_ia32_##op##ph128_mask			\
## (__T8, __T9, _mm_setzero_ph (),(__mmask8) -1);	\
## __m128h __T11 = (__m128h) __builtin_shuffle (__T10,			\
## (__v8hi) { 1, 0 });					\
## __m128h __T12 = __builtin_ia32_##op##ph128_mask			\
## (__T10, __T11, _mm_setzero_ph (),(__mmask8) -1);	\
## return __T12[0]

## [Macro Original]
## #define _MM512_REDUCE_OP(op)						\
## __m512h __T1 = (__m512h) __builtin_shuffle ((__m512d) __A,		\
## (__v8di) { 4, 5, 6, 7, 0, 0, 0, 0 });			\
## __m512h __T2 = _mm512_##op##_ph (__A, __T1);				\
## __m512h __T3 = (__m512h) __builtin_shuffle ((__m512d) __T2,		\
## (__v8di) { 2, 3, 0, 0, 0, 0, 0, 0 });			\
## __m512h __T4 = _mm512_##op##_ph (__T2, __T3);			\
## __m512h __T5 = (__m512h) __builtin_shuffle ((__m512d) __T4,		\
## (__v8di) { 1, 0, 0, 0, 0, 0, 0, 0 });			\
## __m512h __T6 = _mm512_##op##_ph (__T4, __T5);			\
## __m512h __T7 = (__m512h) __builtin_shuffle ((__m512) __T6,		\
## (__v16si) { 1, 0, 0, 0, 0, 0, 0, 0,			\
## 0, 0, 0, 0, 0, 0, 0, 0 });		\
## __m512h __T8 = _mm512_##op##_ph (__T6, __T7);			\
## __m512h __T9 = (__m512h) __builtin_shuffle (__T8,			\
## (__v32hi) { 1, 0, 0, 0, 0, 0, 0, 0,			\
## 0, 0, 0, 0, 0, 0, 0, 0,			\
## 0, 0, 0, 0, 0, 0, 0, 0,			\
## 0, 0, 0, 0, 0, 0, 0, 0 });		\
## __m512h __T10 = _mm512_##op##_ph (__T8, __T9);			\
## return __T10[0]

func mm512_reduce_min_ph*(a: M512h): Float16 {.importc: "_mm512_reduce_min_ph".}

func mm512_reduce_max_ph*(a: M512h): Float16 {.importc: "_mm512_reduce_max_ph".}

func mm512_mask_blend_ph*(u: MMask32, a: M512h, w: M512h): M512h {.importc: "_mm512_mask_blend_ph".}

func mm512_permutex2var_ph*(a: M512h, i: M512i, b: M512h): M512h {.importc: "_mm512_permutex2var_ph".}

func mm512_permutexvar_ph*(a: M512i, b: M512h): M512h {.importc: "_mm512_permutexvar_ph".}

# func mm512_set1_pch*(a: _Float16 _Complex): M512h {.importc: "_mm512_set1_pch".}

## [Macro Original]
## #define _mm512_mul_pch(A, B) _mm512_fmul_pch ((A), (B))

## [Macro Original]
## #define _mm512_mask_mul_pch(W, U, A, B)				      \
## _mm512_mask_fmul_pch ((W), (U), (A), (B))

## [Macro Original]
## #define _mm512_maskz_mul_pch(U, A, B) _mm512_maskz_fmul_pch ((U), (A), (B))

## [Macro Original]
## #define _mm512_mul_round_pch(A, B, R) _mm512_fmul_round_pch ((A), (B), (R))

## [Macro Original]
## #define _mm512_mask_mul_round_pch(W, U, A, B, R)		      \
## _mm512_mask_fmul_round_pch ((W), (U), (A), (B), (R))

## [Macro Original]
## #define _mm512_maskz_mul_round_pch(U, A, B, R)			      \
## _mm512_maskz_fmul_round_pch ((U), (A), (B), (R))

## [Macro Original]
## #define _mm512_cmul_pch(A, B) _mm512_fcmul_pch ((A), (B))

## [Macro Original]
## #define _mm512_mask_cmul_pch(W, U, A, B)			      \
## _mm512_mask_fcmul_pch ((W), (U), (A), (B))

## [Macro Original]
## #define _mm512_maskz_cmul_pch(U, A, B) _mm512_maskz_fcmul_pch ((U), (A), (B))

## [Macro Original]
## #define _mm512_cmul_round_pch(A, B, R) _mm512_fcmul_round_pch ((A), (B), (R))

## [Macro Original]
## #define _mm512_mask_cmul_round_pch(W, U, A, B, R)		      \
## _mm512_mask_fcmul_round_pch ((W), (U), (A), (B), (R))

## [Macro Original]
## #define _mm512_maskz_cmul_round_pch(U, A, B, R)			      \
## _mm512_maskz_fcmul_round_pch ((U), (A), (B), (R))