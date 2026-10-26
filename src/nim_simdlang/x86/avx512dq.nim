import avx512f

## [Macro Original]
## #define _AVX512DQINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512DQ__

func mm_reduce_sd*(a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_reduce_sd".}

func mm_reduce_round_sd*(a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_reduce_round_sd".}

func mm_mask_reduce_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_mask_reduce_sd".}

func mm_mask_reduce_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_mask_reduce_round_sd".}

func mm_maskz_reduce_sd*(u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_maskz_reduce_sd".}

func mm_maskz_reduce_round_sd*(u: MMask8, a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_maskz_reduce_round_sd".}

func mm_reduce_ss*(a: M128, b: M128, c: int32): M128 {.importc: "_mm_reduce_ss".}

func mm_reduce_round_ss*(a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_reduce_round_ss".}

func mm_mask_reduce_ss*(w: M128, u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_mask_reduce_ss".}

func mm_mask_reduce_round_ss*(w: M128, u: MMask8, a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_mask_reduce_round_ss".}

func mm_maskz_reduce_ss*(u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_maskz_reduce_ss".}

func mm_maskz_reduce_round_ss*(u: MMask8, a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_maskz_reduce_round_ss".}

func mm_range_sd*(a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_range_sd".}

func mm_mask_range_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_mask_range_sd".}

func mm_maskz_range_sd*(u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_maskz_range_sd".}

func mm_range_ss*(a: M128, b: M128, c: int32): M128 {.importc: "_mm_range_ss".}

func mm_mask_range_ss*(w: M128, u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_mask_range_ss".}

func mm_maskz_range_ss*(u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_maskz_range_ss".}

func mm_range_round_sd*(a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_range_round_sd".}

func mm_mask_range_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_mask_range_round_sd".}

func mm_maskz_range_round_sd*(u: MMask8, a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_maskz_range_round_sd".}

func mm_range_round_ss*(a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_range_round_ss".}

func mm_mask_range_round_ss*(w: M128, u: MMask8, a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_mask_range_round_ss".}

func mm_maskz_range_round_ss*(u: MMask8, a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_maskz_range_round_ss".}

func mm_fpclass_ss_mask*(a: M128, imm: int32): MMask8 {.importc: "_mm_fpclass_ss_mask".}

func mm_fpclass_sd_mask*(a: M128d, imm: int32): MMask8 {.importc: "_mm_fpclass_sd_mask".}

func mm_mask_fpclass_ss_mask*(u: MMask8, a: M128, imm: int32): MMask8 {.importc: "_mm_mask_fpclass_ss_mask".}

func mm_mask_fpclass_sd_mask*(u: MMask8, a: M128d, imm: int32): MMask8 {.importc: "_mm_mask_fpclass_sd_mask".}

## [Macro Original]
## #define _kshiftli_mask8(X, Y)                                           \
## ((__mmask8) __builtin_ia32_kshiftliqi ((__mmask8)(X), (__mmask8)(Y)))

## [Macro Original]
## #define _kshiftri_mask8(X, Y)                                           \
## ((__mmask8) __builtin_ia32_kshiftriqi ((__mmask8)(X), (__mmask8)(Y)))

## [Macro Original]
## #define _mm_range_sd(A, B, C)						 \
## ((__m128d) __builtin_ia32_rangesd128_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df) _mm_avx512_setzero_pd (), 	 \
## (__mmask8) -1, _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_range_sd(W, U, A, B, C)				 \
## ((__m128d) __builtin_ia32_rangesd128_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df)(__m128d)(W), 		 \
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_range_sd(U, A, B, C)					 \
## ((__m128d) __builtin_ia32_rangesd128_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df) _mm_avx512_setzero_pd (), 	 \
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_range_ss(A, B, C)						\
## ((__m128) __builtin_ia32_rangess128_mask_round ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf) _mm_avx512_setzero_ps (),		\
## (__mmask8) -1, _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_range_ss(W, U, A, B, C)				\
## ((__m128) __builtin_ia32_rangess128_mask_round ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf)(__m128)(W),			\
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_range_ss(U, A, B, C)					\
## ((__m128) __builtin_ia32_rangess128_mask_round ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf) _mm_avx512_setzero_ps (),		\
## (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_range_round_sd(A, B, C, R)					 \
## ((__m128d) __builtin_ia32_rangesd128_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df) _mm_avx512_setzero_pd (),		 \
## (__mmask8) -1, (R)))

## [Macro Original]
## #define _mm_mask_range_round_sd(W, U, A, B, C, R)			 \
## ((__m128d) __builtin_ia32_rangesd128_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df)(__m128d)(W),		 \
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm_maskz_range_round_sd(U, A, B, C, R)				 \
## ((__m128d) __builtin_ia32_rangesd128_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df) _mm_avx512_setzero_pd (),		 \
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm_range_round_ss(A, B, C, R)					\
## ((__m128) __builtin_ia32_rangess128_mask_round ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf) _mm_avx512_setzero_ps (),		\
## (__mmask8) -1, (R)))

## [Macro Original]
## #define _mm_mask_range_round_ss(W, U, A, B, C, R)			\
## ((__m128) __builtin_ia32_rangess128_mask_round ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf)(__m128)(W),			\
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm_maskz_range_round_ss(U, A, B, C, R)				\
## ((__m128) __builtin_ia32_rangess128_mask_round ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf) _mm_avx512_setzero_ps (),		\
## (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm_fpclass_ss_mask(X, C)					\
## ((__mmask8) __builtin_ia32_fpclassss_mask ((__v4sf) (__m128) (X),	\
## (int) (C), (__mmask8) (-1))) \
## 

## [Macro Original]
## #define _mm_fpclass_sd_mask(X, C)					\
## ((__mmask8) __builtin_ia32_fpclasssd_mask ((__v2df) (__m128d) (X),	\
## (int) (C), (__mmask8) (-1))) \
## 

## [Macro Original]
## #define _mm_mask_fpclass_ss_mask(U, X, C)				\
## ((__mmask8) __builtin_ia32_fpclassss_mask ((__v4sf) (__m128) (X),	\
## (int) (C), (__mmask8) (U)))

## [Macro Original]
## #define _mm_mask_fpclass_sd_mask(U, X, C)				\
## ((__mmask8) __builtin_ia32_fpclasssd_mask ((__v2df) (__m128d) (X),	\
## (int) (C), (__mmask8) (U)))

## [Macro Original]
## #define _mm_reduce_sd(A, B, C)						\
## ((__m128d) __builtin_ia32_reducesd_mask ((__v2df)(__m128d)(A),	\
## (__v2df)(__m128d)(B), (int)(C), (__v2df) _mm_avx512_setzero_pd (),		\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_reduce_sd(W, U, A, B, C)				\
## ((__m128d) __builtin_ia32_reducesd_mask ((__v2df)(__m128d)(A),	\
## (__v2df)(__m128d)(B), (int)(C), (__v2df)(__m128d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_reduce_sd(U, A, B, C)					\
## ((__m128d) __builtin_ia32_reducesd_mask ((__v2df)(__m128d)(A),	\
## (__v2df)(__m128d)(B), (int)(C), (__v2df) _mm_avx512_setzero_pd (),		\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_reduce_round_sd(A, B, C, R)				       \
## ((__m128d) __builtin_ia32_reducesd_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df) _mm_avx512_setzero_pd (), \
## (__mmask8)(-1), (int)(R)))

## [Macro Original]
## #define _mm_mask_reduce_round_sd(W, U, A, B, C, R)		       \
## ((__m128d) __builtin_ia32_reducesd_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df)(__m128d)(W),	       \
## (__mmask8)(U), (int)(R)))

## [Macro Original]
## #define _mm_maskz_reduce_round_sd(U, A, B, C, R)		       \
## ((__m128d) __builtin_ia32_reducesd_mask_round ((__v2df)(__m128d)(A), \
## (__v2df)(__m128d)(B), (int)(C), (__v2df) _mm_avx512_setzero_pd (),	       \
## (__mmask8)(U), (int)(R)))

## [Macro Original]
## #define _mm_reduce_ss(A, B, C)						\
## ((__m128) __builtin_ia32_reducess_mask ((__v4sf)(__m128)(A),		\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf) _mm_avx512_setzero_ps (),		\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_reduce_ss(W, U, A, B, C)				\
## ((__m128) __builtin_ia32_reducess_mask ((__v4sf)(__m128)(A),		\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf)(__m128)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_reduce_ss(U, A, B, C)					\
## ((__m128) __builtin_ia32_reducess_mask ((__v4sf)(__m128)(A),		\
## (__v4sf)(__m128)(B), (int)(C), (__v4sf) _mm_avx512_setzero_ps (),		\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_reduce_round_ss(A, B, C, R)				       \
## ((__m128) __builtin_ia32_reducess_mask_round ((__v4sf)(__m128)(A),   \
## (__v4sf)(__m128)(B), (int)(C), (__v4sf) _mm_avx512_setzero_ps (),  \
## (__mmask8)(-1), (int)(R)))

## [Macro Original]
## #define _mm_mask_reduce_round_ss(W, U, A, B, C, R)		       \
## ((__m128) __builtin_ia32_reducess_mask_round ((__v4sf)(__m128)(A),   \
## (__v4sf)(__m128)(B), (int)(C), (__v4sf)(__m128)(W),		       \
## (__mmask8)(U), (int)(R)))

## [Macro Original]
## #define _mm_maskz_reduce_round_ss(U, A, B, C, R)		       \
## ((__m128) __builtin_ia32_reducess_mask_round ((__v4sf)(__m128)(A),   \
## (__v4sf)(__m128)(B), (int)(C), (__v4sf) _mm_avx512_setzero_ps (),	       \
## (__mmask8)(U), (int)(R)))

func mm512_broadcast_f64x2*(a: M128d): M512d {.importc: "_mm512_broadcast_f64x2".}

func mm512_mask_broadcast_f64x2*(o: M512d, m: MMask8, a: M128d): M512d {.importc: "_mm512_mask_broadcast_f64x2".}

func mm512_maskz_broadcast_f64x2*(m: MMask8, a: M128d): M512d {.importc: "_mm512_maskz_broadcast_f64x2".}

func mm512_broadcast_i64x2*(a: M128i): M512i {.importc: "_mm512_broadcast_i64x2".}

func mm512_mask_broadcast_i64x2*(o: M512i, m: MMask8, a: M128i): M512i {.importc: "_mm512_mask_broadcast_i64x2".}

func mm512_maskz_broadcast_i64x2*(m: MMask8, a: M128i): M512i {.importc: "_mm512_maskz_broadcast_i64x2".}

func mm512_broadcast_f32x2*(a: M128): M512 {.importc: "_mm512_broadcast_f32x2".}

func mm512_mask_broadcast_f32x2*(o: M512, m: MMask16, a: M128): M512 {.importc: "_mm512_mask_broadcast_f32x2".}

func mm512_maskz_broadcast_f32x2*(m: MMask16, a: M128): M512 {.importc: "_mm512_maskz_broadcast_f32x2".}

func mm512_broadcast_i32x2*(a: M128i): M512i {.importc: "_mm512_broadcast_i32x2".}

func mm512_mask_broadcast_i32x2*(o: M512i, m: MMask16, a: M128i): M512i {.importc: "_mm512_mask_broadcast_i32x2".}

func mm512_maskz_broadcast_i32x2*(m: MMask16, a: M128i): M512i {.importc: "_mm512_maskz_broadcast_i32x2".}

func mm512_broadcast_f32x8*(a: M256): M512 {.importc: "_mm512_broadcast_f32x8".}

func mm512_mask_broadcast_f32x8*(o: M512, m: MMask16, a: M256): M512 {.importc: "_mm512_mask_broadcast_f32x8".}

func mm512_maskz_broadcast_f32x8*(m: MMask16, a: M256): M512 {.importc: "_mm512_maskz_broadcast_f32x8".}

func mm512_broadcast_i32x8*(a: M256i): M512i {.importc: "_mm512_broadcast_i32x8".}

func mm512_mask_broadcast_i32x8*(o: M512i, m: MMask16, a: M256i): M512i {.importc: "_mm512_mask_broadcast_i32x8".}

func mm512_maskz_broadcast_i32x8*(m: MMask16, a: M256i): M512i {.importc: "_mm512_maskz_broadcast_i32x8".}

func mm512_mullo_epi64*(a: M512i, b: M512i): M512i {.importc: "_mm512_mullo_epi64".}

func mm512_mask_mullo_epi64*(w: M512i, u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_mullo_epi64".}

func mm512_maskz_mullo_epi64*(u: MMask8, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_mullo_epi64".}

func mm512_xor_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_xor_pd".}

func mm512_mask_xor_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_xor_pd".}

func mm512_maskz_xor_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_xor_pd".}

func mm512_xor_ps*(a: M512, b: M512): M512 {.importc: "_mm512_xor_ps".}

func mm512_mask_xor_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_xor_ps".}

func mm512_maskz_xor_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_xor_ps".}

func mm512_or_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_or_pd".}

func mm512_mask_or_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_or_pd".}

func mm512_maskz_or_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_or_pd".}

func mm512_or_ps*(a: M512, b: M512): M512 {.importc: "_mm512_or_ps".}

func mm512_mask_or_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_or_ps".}

func mm512_maskz_or_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_or_ps".}

func mm512_and_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_and_pd".}

func mm512_mask_and_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_and_pd".}

func mm512_maskz_and_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_and_pd".}

func mm512_and_ps*(a: M512, b: M512): M512 {.importc: "_mm512_and_ps".}

func mm512_mask_and_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_and_ps".}

func mm512_maskz_and_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_and_ps".}

func mm512_andnot_pd*(a: M512d, b: M512d): M512d {.importc: "_mm512_andnot_pd".}

func mm512_mask_andnot_pd*(w: M512d, u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_mask_andnot_pd".}

func mm512_maskz_andnot_pd*(u: MMask8, a: M512d, b: M512d): M512d {.importc: "_mm512_maskz_andnot_pd".}

func mm512_andnot_ps*(a: M512, b: M512): M512 {.importc: "_mm512_andnot_ps".}

func mm512_mask_andnot_ps*(w: M512, u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_mask_andnot_ps".}

func mm512_maskz_andnot_ps*(u: MMask16, a: M512, b: M512): M512 {.importc: "_mm512_maskz_andnot_ps".}

func mm512_movepi32_mask*(a: M512i): MMask16 {.importc: "_mm512_movepi32_mask".}

func mm512_movepi64_mask*(a: M512i): MMask8 {.importc: "_mm512_movepi64_mask".}

func mm512_movm_epi32*(a: MMask16): M512i {.importc: "_mm512_movm_epi32".}

func mm512_movm_epi64*(a: MMask8): M512i {.importc: "_mm512_movm_epi64".}

func mm512_cvttpd_epi64*(a: M512d): M512i {.importc: "_mm512_cvttpd_epi64".}

func mm512_mask_cvttpd_epi64*(w: M512i, u: MMask8, a: M512d): M512i {.importc: "_mm512_mask_cvttpd_epi64".}

func mm512_maskz_cvttpd_epi64*(u: MMask8, a: M512d): M512i {.importc: "_mm512_maskz_cvttpd_epi64".}

func mm512_cvttpd_epu64*(a: M512d): M512i {.importc: "_mm512_cvttpd_epu64".}

func mm512_mask_cvttpd_epu64*(w: M512i, u: MMask8, a: M512d): M512i {.importc: "_mm512_mask_cvttpd_epu64".}

func mm512_maskz_cvttpd_epu64*(u: MMask8, a: M512d): M512i {.importc: "_mm512_maskz_cvttpd_epu64".}

func mm512_cvttps_epi64*(a: M256): M512i {.importc: "_mm512_cvttps_epi64".}

func mm512_mask_cvttps_epi64*(w: M512i, u: MMask8, a: M256): M512i {.importc: "_mm512_mask_cvttps_epi64".}

func mm512_maskz_cvttps_epi64*(u: MMask8, a: M256): M512i {.importc: "_mm512_maskz_cvttps_epi64".}

func mm512_cvttps_epu64*(a: M256): M512i {.importc: "_mm512_cvttps_epu64".}

func mm512_mask_cvttps_epu64*(w: M512i, u: MMask8, a: M256): M512i {.importc: "_mm512_mask_cvttps_epu64".}

func mm512_maskz_cvttps_epu64*(u: MMask8, a: M256): M512i {.importc: "_mm512_maskz_cvttps_epu64".}

func mm512_cvtpd_epi64*(a: M512d): M512i {.importc: "_mm512_cvtpd_epi64".}

func mm512_mask_cvtpd_epi64*(w: M512i, u: MMask8, a: M512d): M512i {.importc: "_mm512_mask_cvtpd_epi64".}

func mm512_maskz_cvtpd_epi64*(u: MMask8, a: M512d): M512i {.importc: "_mm512_maskz_cvtpd_epi64".}

func mm512_cvtpd_epu64*(a: M512d): M512i {.importc: "_mm512_cvtpd_epu64".}

func mm512_mask_cvtpd_epu64*(w: M512i, u: MMask8, a: M512d): M512i {.importc: "_mm512_mask_cvtpd_epu64".}

func mm512_maskz_cvtpd_epu64*(u: MMask8, a: M512d): M512i {.importc: "_mm512_maskz_cvtpd_epu64".}

func mm512_cvtps_epi64*(a: M256): M512i {.importc: "_mm512_cvtps_epi64".}

func mm512_mask_cvtps_epi64*(w: M512i, u: MMask8, a: M256): M512i {.importc: "_mm512_mask_cvtps_epi64".}

func mm512_maskz_cvtps_epi64*(u: MMask8, a: M256): M512i {.importc: "_mm512_maskz_cvtps_epi64".}

func mm512_cvtps_epu64*(a: M256): M512i {.importc: "_mm512_cvtps_epu64".}

func mm512_mask_cvtps_epu64*(w: M512i, u: MMask8, a: M256): M512i {.importc: "_mm512_mask_cvtps_epu64".}

func mm512_maskz_cvtps_epu64*(u: MMask8, a: M256): M512i {.importc: "_mm512_maskz_cvtps_epu64".}

func mm512_cvtepi64_ps*(a: M512i): M256 {.importc: "_mm512_cvtepi64_ps".}

func mm512_mask_cvtepi64_ps*(w: M256, u: MMask8, a: M512i): M256 {.importc: "_mm512_mask_cvtepi64_ps".}

func mm512_maskz_cvtepi64_ps*(u: MMask8, a: M512i): M256 {.importc: "_mm512_maskz_cvtepi64_ps".}

func mm512_cvtepu64_ps*(a: M512i): M256 {.importc: "_mm512_cvtepu64_ps".}

func mm512_mask_cvtepu64_ps*(w: M256, u: MMask8, a: M512i): M256 {.importc: "_mm512_mask_cvtepu64_ps".}

func mm512_maskz_cvtepu64_ps*(u: MMask8, a: M512i): M256 {.importc: "_mm512_maskz_cvtepu64_ps".}

func mm512_cvtepi64_pd*(a: M512i): M512d {.importc: "_mm512_cvtepi64_pd".}

func mm512_mask_cvtepi64_pd*(w: M512d, u: MMask8, a: M512i): M512d {.importc: "_mm512_mask_cvtepi64_pd".}

func mm512_maskz_cvtepi64_pd*(u: MMask8, a: M512i): M512d {.importc: "_mm512_maskz_cvtepi64_pd".}

func mm512_cvtepu64_pd*(a: M512i): M512d {.importc: "_mm512_cvtepu64_pd".}

func mm512_mask_cvtepu64_pd*(w: M512d, u: MMask8, a: M512i): M512d {.importc: "_mm512_mask_cvtepu64_pd".}

func mm512_maskz_cvtepu64_pd*(u: MMask8, a: M512i): M512d {.importc: "_mm512_maskz_cvtepu64_pd".}

func mm512_range_pd*(a: M512d, b: M512d, c: int32): M512d {.importc: "_mm512_range_pd".}

func mm512_mask_range_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, c: int32): M512d {.importc: "_mm512_mask_range_pd".}

func mm512_maskz_range_pd*(u: MMask8, a: M512d, b: M512d, c: int32): M512d {.importc: "_mm512_maskz_range_pd".}

func mm512_range_ps*(a: M512, b: M512, c: int32): M512 {.importc: "_mm512_range_ps".}

func mm512_mask_range_ps*(w: M512, u: MMask16, a: M512, b: M512, c: int32): M512 {.importc: "_mm512_mask_range_ps".}

func mm512_maskz_range_ps*(u: MMask16, a: M512, b: M512, c: int32): M512 {.importc: "_mm512_maskz_range_ps".}

func mm512_cvtt_roundpd_epi64*(a: M512d, r: int32): M512i {.importc: "_mm512_cvtt_roundpd_epi64".}

func mm512_mask_cvtt_roundpd_epi64*(w: M512i, u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_mask_cvtt_roundpd_epi64".}

func mm512_maskz_cvtt_roundpd_epi64*(u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_maskz_cvtt_roundpd_epi64".}

func mm512_cvtt_roundpd_epu64*(a: M512d, r: int32): M512i {.importc: "_mm512_cvtt_roundpd_epu64".}

func mm512_mask_cvtt_roundpd_epu64*(w: M512i, u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_mask_cvtt_roundpd_epu64".}

func mm512_maskz_cvtt_roundpd_epu64*(u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_maskz_cvtt_roundpd_epu64".}

func mm512_cvtt_roundps_epi64*(a: M256, r: int32): M512i {.importc: "_mm512_cvtt_roundps_epi64".}

func mm512_mask_cvtt_roundps_epi64*(w: M512i, u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_mask_cvtt_roundps_epi64".}

func mm512_maskz_cvtt_roundps_epi64*(u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_maskz_cvtt_roundps_epi64".}

func mm512_cvtt_roundps_epu64*(a: M256, r: int32): M512i {.importc: "_mm512_cvtt_roundps_epu64".}

func mm512_mask_cvtt_roundps_epu64*(w: M512i, u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_mask_cvtt_roundps_epu64".}

func mm512_maskz_cvtt_roundps_epu64*(u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_maskz_cvtt_roundps_epu64".}

func mm512_cvt_roundpd_epi64*(a: M512d, r: int32): M512i {.importc: "_mm512_cvt_roundpd_epi64".}

func mm512_mask_cvt_roundpd_epi64*(w: M512i, u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_mask_cvt_roundpd_epi64".}

func mm512_maskz_cvt_roundpd_epi64*(u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_maskz_cvt_roundpd_epi64".}

func mm512_cvt_roundpd_epu64*(a: M512d, r: int32): M512i {.importc: "_mm512_cvt_roundpd_epu64".}

func mm512_mask_cvt_roundpd_epu64*(w: M512i, u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_mask_cvt_roundpd_epu64".}

func mm512_maskz_cvt_roundpd_epu64*(u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_maskz_cvt_roundpd_epu64".}

func mm512_cvt_roundps_epi64*(a: M256, r: int32): M512i {.importc: "_mm512_cvt_roundps_epi64".}

func mm512_mask_cvt_roundps_epi64*(w: M512i, u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_mask_cvt_roundps_epi64".}

func mm512_maskz_cvt_roundps_epi64*(u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_maskz_cvt_roundps_epi64".}

func mm512_cvt_roundps_epu64*(a: M256, r: int32): M512i {.importc: "_mm512_cvt_roundps_epu64".}

func mm512_mask_cvt_roundps_epu64*(w: M512i, u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_mask_cvt_roundps_epu64".}

func mm512_maskz_cvt_roundps_epu64*(u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_maskz_cvt_roundps_epu64".}

func mm512_cvt_roundepi64_ps*(a: M512i, r: int32): M256 {.importc: "_mm512_cvt_roundepi64_ps".}

func mm512_mask_cvt_roundepi64_ps*(w: M256, u: MMask8, a: M512i, r: int32): M256 {.importc: "_mm512_mask_cvt_roundepi64_ps".}

func mm512_maskz_cvt_roundepi64_ps*(u: MMask8, a: M512i, r: int32): M256 {.importc: "_mm512_maskz_cvt_roundepi64_ps".}

func mm512_cvt_roundepu64_ps*(a: M512i, r: int32): M256 {.importc: "_mm512_cvt_roundepu64_ps".}

func mm512_mask_cvt_roundepu64_ps*(w: M256, u: MMask8, a: M512i, r: int32): M256 {.importc: "_mm512_mask_cvt_roundepu64_ps".}

func mm512_maskz_cvt_roundepu64_ps*(u: MMask8, a: M512i, r: int32): M256 {.importc: "_mm512_maskz_cvt_roundepu64_ps".}

func mm512_cvt_roundepi64_pd*(a: M512i, r: int32): M512d {.importc: "_mm512_cvt_roundepi64_pd".}

func mm512_mask_cvt_roundepi64_pd*(w: M512d, u: MMask8, a: M512i, r: int32): M512d {.importc: "_mm512_mask_cvt_roundepi64_pd".}

func mm512_maskz_cvt_roundepi64_pd*(u: MMask8, a: M512i, r: int32): M512d {.importc: "_mm512_maskz_cvt_roundepi64_pd".}

func mm512_cvt_roundepu64_pd*(a: M512i, r: int32): M512d {.importc: "_mm512_cvt_roundepu64_pd".}

func mm512_mask_cvt_roundepu64_pd*(w: M512d, u: MMask8, a: M512i, r: int32): M512d {.importc: "_mm512_mask_cvt_roundepu64_pd".}

func mm512_maskz_cvt_roundepu64_pd*(u: MMask8, a: M512i, r: int32): M512d {.importc: "_mm512_maskz_cvt_roundepu64_pd".}

func mm512_reduce_pd*(a: M512d, b: int32): M512d {.importc: "_mm512_reduce_pd".}

func mm512_reduce_round_pd*(a: M512d, b: int32, r: int32): M512d {.importc: "_mm512_reduce_round_pd".}

func mm512_mask_reduce_pd*(w: M512d, u: MMask8, a: M512d, b: int32): M512d {.importc: "_mm512_mask_reduce_pd".}

func mm512_mask_reduce_round_pd*(w: M512d, u: MMask8, a: M512d, b: int32, r: int32): M512d {.importc: "_mm512_mask_reduce_round_pd".}

func mm512_maskz_reduce_pd*(u: MMask8, a: M512d, b: int32): M512d {.importc: "_mm512_maskz_reduce_pd".}

func mm512_maskz_reduce_round_pd*(u: MMask8, a: M512d, b: int32, r: int32): M512d {.importc: "_mm512_maskz_reduce_round_pd".}

func mm512_reduce_ps*(a: M512, b: int32): M512 {.importc: "_mm512_reduce_ps".}

func mm512_reduce_round_ps*(a: M512, b: int32, r: int32): M512 {.importc: "_mm512_reduce_round_ps".}

func mm512_mask_reduce_ps*(w: M512, u: MMask16, a: M512, b: int32): M512 {.importc: "_mm512_mask_reduce_ps".}

func mm512_mask_reduce_round_ps*(w: M512, u: MMask16, a: M512, b: int32, r: int32): M512 {.importc: "_mm512_mask_reduce_round_ps".}

func mm512_maskz_reduce_ps*(u: MMask16, a: M512, b: int32): M512 {.importc: "_mm512_maskz_reduce_ps".}

func mm512_maskz_reduce_round_ps*(u: MMask16, a: M512, b: int32, r: int32): M512 {.importc: "_mm512_maskz_reduce_round_ps".}

func mm512_extractf32x8_ps*(a: M512, imm: int32): M256 {.importc: "_mm512_extractf32x8_ps".}

func mm512_mask_extractf32x8_ps*(w: M256, u: MMask8, a: M512, imm: int32): M256 {.importc: "_mm512_mask_extractf32x8_ps".}

func mm512_maskz_extractf32x8_ps*(u: MMask8, a: M512, imm: int32): M256 {.importc: "_mm512_maskz_extractf32x8_ps".}

func mm512_extractf64x2_pd*(a: M512d, imm: int32): M128d {.importc: "_mm512_extractf64x2_pd".}

func mm512_mask_extractf64x2_pd*(w: M128d, u: MMask8, a: M512d, imm: int32): M128d {.importc: "_mm512_mask_extractf64x2_pd".}

func mm512_maskz_extractf64x2_pd*(u: MMask8, a: M512d, imm: int32): M128d {.importc: "_mm512_maskz_extractf64x2_pd".}

func mm512_extracti32x8_epi32*(a: M512i, imm: int32): M256i {.importc: "_mm512_extracti32x8_epi32".}

func mm512_mask_extracti32x8_epi32*(w: M256i, u: MMask8, a: M512i, imm: int32): M256i {.importc: "_mm512_mask_extracti32x8_epi32".}

func mm512_maskz_extracti32x8_epi32*(u: MMask8, a: M512i, imm: int32): M256i {.importc: "_mm512_maskz_extracti32x8_epi32".}

func mm512_extracti64x2_epi64*(a: M512i, imm: int32): M128i {.importc: "_mm512_extracti64x2_epi64".}

func mm512_mask_extracti64x2_epi64*(w: M128i, u: MMask8, a: M512i, imm: int32): M128i {.importc: "_mm512_mask_extracti64x2_epi64".}

func mm512_maskz_extracti64x2_epi64*(u: MMask8, a: M512i, imm: int32): M128i {.importc: "_mm512_maskz_extracti64x2_epi64".}

func mm512_range_round_pd*(a: M512d, b: M512d, c: int32, r: int32): M512d {.importc: "_mm512_range_round_pd".}

func mm512_mask_range_round_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, c: int32, r: int32): M512d {.importc: "_mm512_mask_range_round_pd".}

func mm512_maskz_range_round_pd*(u: MMask8, a: M512d, b: M512d, c: int32, r: int32): M512d {.importc: "_mm512_maskz_range_round_pd".}

func mm512_range_round_ps*(a: M512, b: M512, c: int32, r: int32): M512 {.importc: "_mm512_range_round_ps".}

func mm512_mask_range_round_ps*(w: M512, u: MMask16, a: M512, b: M512, c: int32, r: int32): M512 {.importc: "_mm512_mask_range_round_ps".}

func mm512_maskz_range_round_ps*(u: MMask16, a: M512, b: M512, c: int32, r: int32): M512 {.importc: "_mm512_maskz_range_round_ps".}

func mm512_inserti32x8*(a: M512i, b: M256i, imm: int32): M512i {.importc: "_mm512_inserti32x8".}

func mm512_mask_inserti32x8*(w: M512i, u: MMask16, a: M512i, b: M256i, imm: int32): M512i {.importc: "_mm512_mask_inserti32x8".}

func mm512_maskz_inserti32x8*(u: MMask16, a: M512i, b: M256i, imm: int32): M512i {.importc: "_mm512_maskz_inserti32x8".}

func mm512_insertf32x8*(a: M512, b: M256, imm: int32): M512 {.importc: "_mm512_insertf32x8".}

func mm512_mask_insertf32x8*(w: M512, u: MMask16, a: M512, b: M256, imm: int32): M512 {.importc: "_mm512_mask_insertf32x8".}

func mm512_maskz_insertf32x8*(u: MMask16, a: M512, b: M256, imm: int32): M512 {.importc: "_mm512_maskz_insertf32x8".}

func mm512_inserti64x2*(a: M512i, b: M128i, imm: int32): M512i {.importc: "_mm512_inserti64x2".}

func mm512_mask_inserti64x2*(w: M512i, u: MMask8, a: M512i, b: M128i, imm: int32): M512i {.importc: "_mm512_mask_inserti64x2".}

func mm512_maskz_inserti64x2*(u: MMask8, a: M512i, b: M128i, imm: int32): M512i {.importc: "_mm512_maskz_inserti64x2".}

func mm512_insertf64x2*(a: M512d, b: M128d, imm: int32): M512d {.importc: "_mm512_insertf64x2".}

func mm512_mask_insertf64x2*(w: M512d, u: MMask8, a: M512d, b: M128d, imm: int32): M512d {.importc: "_mm512_mask_insertf64x2".}

func mm512_maskz_insertf64x2*(u: MMask8, a: M512d, b: M128d, imm: int32): M512d {.importc: "_mm512_maskz_insertf64x2".}

func mm512_mask_fpclass_pd_mask*(u: MMask8, a: M512d, imm: int32): MMask8 {.importc: "_mm512_mask_fpclass_pd_mask".}

func mm512_fpclass_pd_mask*(a: M512d, imm: int32): MMask8 {.importc: "_mm512_fpclass_pd_mask".}

func mm512_mask_fpclass_ps_mask*(u: MMask16, a: M512, imm: int32): MMask16 {.importc: "_mm512_mask_fpclass_ps_mask".}

func mm512_fpclass_ps_mask*(a: M512, imm: int32): MMask16 {.importc: "_mm512_fpclass_ps_mask".}

## [Macro Original]
## #define _mm512_cvtt_roundpd_epi64(A, B)		    \
## ((__m512i)__builtin_ia32_cvttpd2qq512_mask ((A), (__v8di)		\
## _mm512_setzero_si512 (),	\
## -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundpd_epi64(W, U, A, B)  \
## ((__m512i)__builtin_ia32_cvttpd2qq512_mask ((A), (__v8di)(W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundpd_epi64(U, A, B)    \
## ((__m512i)__builtin_ia32_cvttpd2qq512_mask ((A), (__v8di)_mm512_setzero_si512 (), (U), (B)))

## [Macro Original]
## #define _mm512_cvtt_roundpd_epu64(A, B)		    \
## ((__m512i)__builtin_ia32_cvttpd2uqq512_mask ((A), (__v8di)_mm512_setzero_si512 (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundpd_epu64(W, U, A, B)  \
## ((__m512i)__builtin_ia32_cvttpd2uqq512_mask ((A), (__v8di)(W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundpd_epu64(U, A, B)    \
## ((__m512i)__builtin_ia32_cvttpd2uqq512_mask ((A), (__v8di)_mm512_setzero_si512 (), (U), (B)))

## [Macro Original]
## #define _mm512_cvtt_roundps_epi64(A, B)		    \
## ((__m512i)__builtin_ia32_cvttps2qq512_mask ((A), (__v8di)_mm512_setzero_si512 (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundps_epi64(W, U, A, B)  \
## ((__m512i)__builtin_ia32_cvttps2qq512_mask ((A), (__v8di)(W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundps_epi64(U, A, B)    \
## ((__m512i)__builtin_ia32_cvttps2qq512_mask ((A), (__v8di)_mm512_setzero_si512 (), (U), (B)))

## [Macro Original]
## #define _mm512_cvtt_roundps_epu64(A, B)		    \
## ((__m512i)__builtin_ia32_cvttps2uqq512_mask ((A), (__v8di)_mm512_setzero_si512 (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvtt_roundps_epu64(W, U, A, B)  \
## ((__m512i)__builtin_ia32_cvttps2uqq512_mask ((A), (__v8di)(W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvtt_roundps_epu64(U, A, B)    \
## ((__m512i)__builtin_ia32_cvttps2uqq512_mask ((A), (__v8di)_mm512_setzero_si512 (), (U), (B)))

## [Macro Original]
## #define _mm512_cvt_roundpd_epi64(A, B)		    \
## ((__m512i)__builtin_ia32_cvtpd2qq512_mask ((A), (__v8di)_mm512_setzero_si512 (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundpd_epi64(W, U, A, B)   \
## ((__m512i)__builtin_ia32_cvtpd2qq512_mask ((A), (__v8di)(W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundpd_epi64(U, A, B)     \
## ((__m512i)__builtin_ia32_cvtpd2qq512_mask ((A), (__v8di)_mm512_setzero_si512 (), (U), (B)))

## [Macro Original]
## #define _mm512_cvt_roundpd_epu64(A, B)		    \
## ((__m512i)__builtin_ia32_cvtpd2uqq512_mask ((A), (__v8di)_mm512_setzero_si512 (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundpd_epu64(W, U, A, B)   \
## ((__m512i)__builtin_ia32_cvtpd2uqq512_mask ((A), (__v8di)(W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundpd_epu64(U, A, B)     \
## ((__m512i)__builtin_ia32_cvtpd2uqq512_mask ((A), (__v8di)_mm512_setzero_si512 (), (U), (B)))

## [Macro Original]
## #define _mm512_cvt_roundps_epi64(A, B)		    \
## ((__m512i)__builtin_ia32_cvtps2qq512_mask ((A), (__v8di)_mm512_setzero_si512 (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundps_epi64(W, U, A, B)   \
## ((__m512i)__builtin_ia32_cvtps2qq512_mask ((A), (__v8di)(W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundps_epi64(U, A, B)     \
## ((__m512i)__builtin_ia32_cvtps2qq512_mask ((A), (__v8di)_mm512_setzero_si512 (), (U), (B)))

## [Macro Original]
## #define _mm512_cvt_roundps_epu64(A, B)		    \
## ((__m512i)__builtin_ia32_cvtps2uqq512_mask ((A), (__v8di)_mm512_setzero_si512 (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundps_epu64(W, U, A, B)   \
## ((__m512i)__builtin_ia32_cvtps2uqq512_mask ((A), (__v8di)(W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundps_epu64(U, A, B)     \
## ((__m512i)__builtin_ia32_cvtps2uqq512_mask ((A), (__v8di)_mm512_setzero_si512 (), (U), (B)))

## [Macro Original]
## #define _mm512_cvt_roundepi64_ps(A, B)		    \
## ((__m256)__builtin_ia32_cvtqq2ps512_mask ((__v8di)(A), (__v8sf)_mm256_setzero_ps (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepi64_ps(W, U, A, B)   \
## ((__m256)__builtin_ia32_cvtqq2ps512_mask ((__v8di)(A), (W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepi64_ps(U, A, B)     \
## ((__m256)__builtin_ia32_cvtqq2ps512_mask ((__v8di)(A), (__v8sf)_mm256_setzero_ps (), (U), (B)))

## [Macro Original]
## #define _mm512_cvt_roundepu64_ps(A, B)		    \
## ((__m256)__builtin_ia32_cvtuqq2ps512_mask ((__v8di)(A), (__v8sf)_mm256_setzero_ps (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepu64_ps(W, U, A, B)   \
## ((__m256)__builtin_ia32_cvtuqq2ps512_mask ((__v8di)(A), (W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepu64_ps(U, A, B)     \
## ((__m256)__builtin_ia32_cvtuqq2ps512_mask ((__v8di)(A), (__v8sf)_mm256_setzero_ps (), (U), (B)))

## [Macro Original]
## #define _mm512_cvt_roundepi64_pd(A, B)		    \
## ((__m512d)__builtin_ia32_cvtqq2pd512_mask ((__v8di)(A), (__v8df)_mm512_setzero_pd (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepi64_pd(W, U, A, B)   \
## ((__m512d)__builtin_ia32_cvtqq2pd512_mask ((__v8di)(A), (W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepi64_pd(U, A, B)     \
## ((__m512d)__builtin_ia32_cvtqq2pd512_mask ((__v8di)(A), (__v8df)_mm512_setzero_pd (), (U), (B)))

## [Macro Original]
## #define _mm512_cvt_roundepu64_pd(A, B)		    \
## ((__m512d)__builtin_ia32_cvtuqq2pd512_mask ((__v8di)(A), (__v8df)_mm512_setzero_pd (), -1, (B)))

## [Macro Original]
## #define _mm512_mask_cvt_roundepu64_pd(W, U, A, B)   \
## ((__m512d)__builtin_ia32_cvtuqq2pd512_mask ((__v8di)(A), (W), (U), (B)))

## [Macro Original]
## #define _mm512_maskz_cvt_roundepu64_pd(U, A, B)     \
## ((__m512d)__builtin_ia32_cvtuqq2pd512_mask ((__v8di)(A), (__v8df)_mm512_setzero_pd (), (U), (B)))

## [Macro Original]
## #define _mm512_reduce_pd(A, B)						\
## ((__m512d) __builtin_ia32_reducepd512_mask ((__v8df)(__m512d)(A),	\
## (int)(B), (__v8df)_mm512_setzero_pd (), (__mmask8)-1))

## [Macro Original]
## #define _mm512_reduce_round_pd(A, B, R)					 \
## ((__m512d) __builtin_ia32_reducepd512_mask_round ((__v8df)(__m512d)(A),\
## (int)(B), (__v8df)_mm512_setzero_pd (), (__mmask8)-1, (R)))

## [Macro Original]
## #define _mm512_mask_reduce_pd(W, U, A, B)				\
## ((__m512d) __builtin_ia32_reducepd512_mask ((__v8df)(__m512d)(A),	\
## (int)(B), (__v8df)(__m512d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm512_mask_reduce_round_pd(W, U, A, B, R)			 \
## ((__m512d) __builtin_ia32_reducepd512_mask_round ((__v8df)(__m512d)(A),\
## (int)(B), (__v8df)(__m512d)(W), (U), (R)))

## [Macro Original]
## #define _mm512_maskz_reduce_pd(U, A, B)					\
## ((__m512d) __builtin_ia32_reducepd512_mask ((__v8df)(__m512d)(A),	\
## (int)(B), (__v8df)_mm512_setzero_pd (), (__mmask8)(U)))

## [Macro Original]
## #define _mm512_maskz_reduce_round_pd(U, A, B, R)			 \
## ((__m512d) __builtin_ia32_reducepd512_mask_round ((__v8df)(__m512d)(A),\
## (int)(B), (__v8df)_mm512_setzero_pd (), (U), (R)))

## [Macro Original]
## #define _mm512_reduce_ps(A, B)						\
## ((__m512) __builtin_ia32_reduceps512_mask ((__v16sf)(__m512)(A),	\
## (int)(B), (__v16sf)_mm512_setzero_ps (), (__mmask16)-1))

## [Macro Original]
## #define _mm512_reduce_round_ps(A, B, R)					\
## ((__m512) __builtin_ia32_reduceps512_mask_round ((__v16sf)(__m512)(A),\
## (int)(B), (__v16sf)_mm512_setzero_ps (), (__mmask16)-1, (R)))

## [Macro Original]
## #define _mm512_mask_reduce_ps(W, U, A, B)				\
## ((__m512) __builtin_ia32_reduceps512_mask ((__v16sf)(__m512)(A),	\
## (int)(B), (__v16sf)(__m512)(W), (__mmask16)(U)))

## [Macro Original]
## #define _mm512_mask_reduce_round_ps(W, U, A, B, R)			\
## ((__m512) __builtin_ia32_reduceps512_mask_round ((__v16sf)(__m512)(A),\
## (int)(B), (__v16sf)(__m512)(W), (U), (R)))

## [Macro Original]
## #define _mm512_maskz_reduce_ps(U, A, B)					\
## ((__m512) __builtin_ia32_reduceps512_mask ((__v16sf)(__m512)(A),	\
## (int)(B), (__v16sf)_mm512_setzero_ps (), (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_reduce_round_ps(U, A, B, R)			\
## ((__m512) __builtin_ia32_reduceps512_mask_round ((__v16sf)(__m512)(A),\
## (int)(B), (__v16sf)_mm512_setzero_ps (), (__mmask16)(U), (R)))

## [Macro Original]
## #define _mm512_extractf32x8_ps(X, C)                                    \
## ((__m256) __builtin_ia32_extractf32x8_mask ((__v16sf)(__m512) (X),    \
## (int) (C), (__v8sf)(__m256) _mm256_setzero_ps (), (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_extractf32x8_ps(W, U, X, C)                         \
## ((__m256) __builtin_ia32_extractf32x8_mask ((__v16sf)(__m512) (X),    \
## (int) (C), (__v8sf)(__m256) (W), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_maskz_extractf32x8_ps(U, X, C)                           \
## ((__m256) __builtin_ia32_extractf32x8_mask ((__v16sf)(__m512) (X),    \
## (int) (C), (__v8sf)(__m256) _mm256_setzero_ps (), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_extractf64x2_pd(X, C)                                    \
## ((__m128d) __builtin_ia32_extractf64x2_512_mask ((__v8df)(__m512d) (X),\
## (int) (C), (__v2df)(__m128d) _mm_setzero_pd (), (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_extractf64x2_pd(W, U, X, C)                         \
## ((__m128d) __builtin_ia32_extractf64x2_512_mask ((__v8df)(__m512d) (X),\
## (int) (C), (__v2df)(__m128d) (W), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_maskz_extractf64x2_pd(U, X, C)                           \
## ((__m128d) __builtin_ia32_extractf64x2_512_mask ((__v8df)(__m512d) (X),\
## (int) (C), (__v2df)(__m128d) _mm_setzero_pd (), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_extracti32x8_epi32(X, C)                                 \
## ((__m256i) __builtin_ia32_extracti32x8_mask ((__v16si)(__m512i) (X),  \
## (int) (C), (__v8si)(__m256i) _mm256_setzero_si256 (), (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_extracti32x8_epi32(W, U, X, C)                      \
## ((__m256i) __builtin_ia32_extracti32x8_mask ((__v16si)(__m512i) (X),  \
## (int) (C), (__v8si)(__m256i) (W), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_maskz_extracti32x8_epi32(U, X, C)                        \
## ((__m256i) __builtin_ia32_extracti32x8_mask ((__v16si)(__m512i) (X),  \
## (int) (C), (__v8si)(__m256i) _mm256_setzero_si256 (), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_extracti64x2_epi64(X, C)                                 \
## ((__m128i) __builtin_ia32_extracti64x2_512_mask ((__v8di)(__m512i) (X),\
## (int) (C), (__v2di)(__m128i) _mm_setzero_si128 (), (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_extracti64x2_epi64(W, U, X, C)                      \
## ((__m128i) __builtin_ia32_extracti64x2_512_mask ((__v8di)(__m512i) (X),\
## (int) (C), (__v2di)(__m128i) (W), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_maskz_extracti64x2_epi64(U, X, C)                        \
## ((__m128i) __builtin_ia32_extracti64x2_512_mask ((__v8di)(__m512i) (X),\
## (int) (C), (__v2di)(__m128i) _mm_setzero_si128 (), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_range_pd(A, B, C)					\
## ((__m512d) __builtin_ia32_rangepd512_mask ((__v8df)(__m512d)(A),	\
## (__v8df)(__m512d)(B), (int)(C),					\
## (__v8df)_mm512_setzero_pd (), (__mmask8)-1, _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_range_pd(W, U, A, B, C)				\
## ((__m512d) __builtin_ia32_rangepd512_mask ((__v8df)(__m512d)(A),	\
## (__v8df)(__m512d)(B), (int)(C),					\
## (__v8df)(__m512d)(W), (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_range_pd(U, A, B, C)				\
## ((__m512d) __builtin_ia32_rangepd512_mask ((__v8df)(__m512d)(A),	\
## (__v8df)(__m512d)(B), (int)(C),					\
## (__v8df)_mm512_setzero_pd (), (__mmask8)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_range_ps(A, B, C)					\
## ((__m512) __builtin_ia32_rangeps512_mask ((__v16sf)(__m512)(A),	\
## (__v16sf)(__m512)(B), (int)(C),					\
## (__v16sf)_mm512_setzero_ps (), (__mmask16)-1, _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_range_ps(W, U, A, B, C)				\
## ((__m512) __builtin_ia32_rangeps512_mask ((__v16sf)(__m512)(A),	\
## (__v16sf)(__m512)(B), (int)(C),					\
## (__v16sf)(__m512)(W), (__mmask16)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_range_ps(U, A, B, C)				\
## ((__m512) __builtin_ia32_rangeps512_mask ((__v16sf)(__m512)(A),	\
## (__v16sf)(__m512)(B), (int)(C),					\
## (__v16sf)_mm512_setzero_ps (), (__mmask16)(U), _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_range_round_pd(A, B, C, R)					\
## ((__m512d) __builtin_ia32_rangepd512_mask ((__v8df)(__m512d)(A),	\
## (__v8df)(__m512d)(B), (int)(C),					\
## (__v8df)_mm512_setzero_pd (), (__mmask8)-1, (R)))

## [Macro Original]
## #define _mm512_mask_range_round_pd(W, U, A, B, C, R)				\
## ((__m512d) __builtin_ia32_rangepd512_mask ((__v8df)(__m512d)(A),	\
## (__v8df)(__m512d)(B), (int)(C),					\
## (__v8df)(__m512d)(W), (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm512_maskz_range_round_pd(U, A, B, C, R)				\
## ((__m512d) __builtin_ia32_rangepd512_mask ((__v8df)(__m512d)(A),	\
## (__v8df)(__m512d)(B), (int)(C),					\
## (__v8df)_mm512_setzero_pd (), (__mmask8)(U), (R)))

## [Macro Original]
## #define _mm512_range_round_ps(A, B, C, R)					\
## ((__m512) __builtin_ia32_rangeps512_mask ((__v16sf)(__m512)(A),	\
## (__v16sf)(__m512)(B), (int)(C),					\
## (__v16sf)_mm512_setzero_ps (), (__mmask16)-1, (R)))

## [Macro Original]
## #define _mm512_mask_range_round_ps(W, U, A, B, C, R)				\
## ((__m512) __builtin_ia32_rangeps512_mask ((__v16sf)(__m512)(A),	\
## (__v16sf)(__m512)(B), (int)(C),					\
## (__v16sf)(__m512)(W), (__mmask16)(U), (R)))

## [Macro Original]
## #define _mm512_maskz_range_round_ps(U, A, B, C, R)				\
## ((__m512) __builtin_ia32_rangeps512_mask ((__v16sf)(__m512)(A),	\
## (__v16sf)(__m512)(B), (int)(C),					\
## (__v16sf)_mm512_setzero_ps (), (__mmask16)(U), (R)))

## [Macro Original]
## #define _mm512_insertf64x2(X, Y, C)                                     \
## ((__m512d) __builtin_ia32_insertf64x2_512_mask ((__v8df)(__m512d) (X),\
## (__v2df)(__m128d) (Y), (int) (C), (__v8df)(__m512d) (X),            \
## (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_insertf64x2(W, U, X, Y, C)                          \
## ((__m512d) __builtin_ia32_insertf64x2_512_mask ((__v8df)(__m512d) (X),\
## (__v2df)(__m128d) (Y), (int) (C), (__v8df)(__m512d) (W),            \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm512_maskz_insertf64x2(U, X, Y, C)                            \
## ((__m512d) __builtin_ia32_insertf64x2_512_mask ((__v8df)(__m512d) (X),\
## (__v2df)(__m128d) (Y), (int) (C),                                   \
## (__v8df)(__m512d) _mm512_setzero_pd (), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_inserti64x2(X, Y, C)                                     \
## ((__m512i) __builtin_ia32_inserti64x2_512_mask ((__v8di)(__m512i) (X),\
## (__v2di)(__m128i) (Y), (int) (C), (__v8di)(__m512i) (X), (__mmask8)-1))

## [Macro Original]
## #define _mm512_mask_inserti64x2(W, U, X, Y, C)                          \
## ((__m512i) __builtin_ia32_inserti64x2_512_mask ((__v8di)(__m512i) (X),\
## (__v2di)(__m128i) (Y), (int) (C), (__v8di)(__m512i) (W),            \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm512_maskz_inserti64x2(U, X, Y, C)                            \
## ((__m512i) __builtin_ia32_inserti64x2_512_mask ((__v8di)(__m512i) (X),\
## (__v2di)(__m128i) (Y), (int) (C),                                   \
## (__v8di)(__m512i) _mm512_setzero_si512 (), (__mmask8) (U)))

## [Macro Original]
## #define _mm512_insertf32x8(X, Y, C)                                     \
## ((__m512) __builtin_ia32_insertf32x8_mask ((__v16sf)(__m512) (X),     \
## (__v8sf)(__m256) (Y), (int) (C),\
## (__v16sf)(__m512)_mm512_setzero_ps (),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_insertf32x8(W, U, X, Y, C)                          \
## ((__m512) __builtin_ia32_insertf32x8_mask ((__v16sf)(__m512) (X),     \
## (__v8sf)(__m256) (Y), (int) (C),\
## (__v16sf)(__m512)(W),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_insertf32x8(U, X, Y, C)                            \
## ((__m512) __builtin_ia32_insertf32x8_mask ((__v16sf)(__m512) (X),     \
## (__v8sf)(__m256) (Y), (int) (C),\
## (__v16sf)(__m512)_mm512_setzero_ps (),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_inserti32x8(X, Y, C)                                     \
## ((__m512i) __builtin_ia32_inserti32x8_mask ((__v16si)(__m512i) (X),   \
## (__v8si)(__m256i) (Y), (int) (C),\
## (__v16si)(__m512i)_mm512_setzero_si512 (),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm512_mask_inserti32x8(W, U, X, Y, C)                          \
## ((__m512i) __builtin_ia32_inserti32x8_mask ((__v16si)(__m512i) (X),   \
## (__v8si)(__m256i) (Y), (int) (C),\
## (__v16si)(__m512i)(W),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_maskz_inserti32x8(U, X, Y, C)                            \
## ((__m512i) __builtin_ia32_inserti32x8_mask ((__v16si)(__m512i) (X),   \
## (__v8si)(__m256i) (Y), (int) (C),\
## (__v16si)(__m512i)_mm512_setzero_si512 (),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm512_mask_fpclass_pd_mask(u, X, C)                            \
## ((__mmask8) __builtin_ia32_fpclasspd512_mask ((__v8df) (__m512d) (X), \
## (int) (C), (__mmask8)(u)))

## [Macro Original]
## #define _mm512_mask_fpclass_ps_mask(u, x, c)				\
## ((__mmask16) __builtin_ia32_fpclassps512_mask ((__v16sf) (__m512) (x),\
## (int) (c),(__mmask16)(u)))

## [Macro Original]
## #define _mm512_fpclass_pd_mask(X, C)                                    \
## ((__mmask8) __builtin_ia32_fpclasspd512_mask ((__v8df) (__m512d) (X), \
## (int) (C), (__mmask8)-1))

## [Macro Original]
## #define _mm512_fpclass_ps_mask(x, c)                                    \
## ((__mmask16) __builtin_ia32_fpclassps512_mask ((__v16sf) (__m512) (x),\
## (int) (c),(__mmask16)-1))