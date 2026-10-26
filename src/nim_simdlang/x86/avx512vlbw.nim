import avx512f

## [Macro Original]
## #define _AVX512VLBWINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VLBW__

func mm_avx512_set1_epi32*(a: int32): M128i {.importc: "_mm_avx512_set1_epi32".}

func mm_avx512_set1_epi16*(a: int16): M128i {.importc: "_mm_avx512_set1_epi16".}

func mm_avx512_set1_epi8*(a: int8): M128i {.importc: "_mm_avx512_set1_epi8".}

func mm256_avx512_set_epi16*(q15: int16, q14: int16, q13: int16, q12: int16, q11: int16, q10: int16, q09: int16, q08: int16, q07: int16, q06: int16, q05: int16, q04: int16, q03: int16, q02: int16, q01: int16, q00: int16): M256i {.importc: "_mm256_avx512_set_epi16".}

func mm256_avx512_set_epi8*(q31: int8, q30: int8, q29: int8, q28: int8, q27: int8, q26: int8, q25: int8, q24: int8, q23: int8, q22: int8, q21: int8, q20: int8, q19: int8, q18: int8, q17: int8, q16: int8, q15: int8, q14: int8, q13: int8, q12: int8, q11: int8, q10: int8, q09: int8, q08: int8, q07: int8, q06: int8, q05: int8, q04: int8, q03: int8, q02: int8, q01: int8, q00: int8): M256i {.importc: "_mm256_avx512_set_epi8".}

func mm256_avx512_set1_epi16*(a: int16): M256i {.importc: "_mm256_avx512_set1_epi16".}

func mm256_avx512_set1_epi32*(a: int32): M256i {.importc: "_mm256_avx512_set1_epi32".}

func mm256_avx512_set1_epi8*(a: int8): M256i {.importc: "_mm256_avx512_set1_epi8".}

func mm_avx512_max_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_avx512_max_epi16".}

func mm_avx512_min_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_avx512_min_epi16".}

func mm_avx512_max_epu16*(x: M128i, y: M128i): M128i {.importc: "_mm_avx512_max_epu16".}

func mm_avx512_min_epu16*(x: M128i, y: M128i): M128i {.importc: "_mm_avx512_min_epu16".}

func mm_avx512_max_epi8*(x: M128i, y: M128i): M128i {.importc: "_mm_avx512_max_epi8".}

func mm_avx512_min_epi8*(x: M128i, y: M128i): M128i {.importc: "_mm_avx512_min_epi8".}

func mm_avx512_max_epu8*(a: M128i, b: M128i): M128i {.importc: "_mm_avx512_max_epu8".}

func mm_avx512_min_epu8*(a: M128i, b: M128i): M128i {.importc: "_mm_avx512_min_epu8".}

func mm256_mask_mov_epi8*(w: M256i, u: MMask32, a: M256i): M256i {.importc: "_mm256_mask_mov_epi8".}

func mm256_avx512_max_epi16*(a: M256i, b: M256i): M256i {.importc: "_mm256_avx512_max_epi16".}

func mm256_avx512_min_epi16*(a: M256i, b: M256i): M256i {.importc: "_mm256_avx512_min_epi16".}

func mm256_avx512_max_epu16*(a: M256i, b: M256i): M256i {.importc: "_mm256_avx512_max_epu16".}

func mm256_avx512_min_epu16*(a: M256i, b: M256i): M256i {.importc: "_mm256_avx512_min_epu16".}

func mm256_avx512_insertf128_ps*(x: M256, y: M128, o: int32): M256 {.importc: "_mm256_avx512_insertf128_ps".}

func mm256_avx512_extractf128_pd*(x: M256d, n: int32): M128d {.importc: "_mm256_avx512_extractf128_pd".}

func mm256_avx512_extracti128_si256*(x: M256i, m: int32): M128i {.importc: "_mm256_avx512_extracti128_si256".}

## [Macro Original]
## #define _mm256_avx512_insertf128_ps(X, Y, O)					\
## ((__m256) __builtin_ia32_vinsertf128_ps256 ((__v8sf)(__m256)(X),	\
## (__v4sf)(__m128)(Y),  	\
## (int)(O)))

## [Macro Original]
## #define _mm256_avx512_extractf128_pd(X, N)					\
## ((__m128d) __builtin_ia32_vextractf128_pd256 ((__v4df)(__m256d)(X),	\
## (int)(N)))

## [Macro Original]
## #define _mm256_avx512_extracti128_si256(X, M)				\
## ((__m128i) __builtin_ia32_extract128i256 ((__v4di)(__m256i)(X), (int)(M)))

## [Macro Original]
## #define _MM256_AVX512_REDUCE_OPERATOR_BASIC_EPI16(op) \
## __v8hi __T1 = (__v8hi)_mm256_avx512_extracti128_si256 (__W, 0); \
## __v8hi __T2 = (__v8hi)_mm256_avx512_extracti128_si256 (__W, 1); \
## __v8hi __T3 = __T1 op __T2; \
## __v8hi __T4 = __builtin_shufflevector (__T3, __T3, 4, 5, 6, 7, 4, 5, 6, 7); \
## __v8hi __T5 = __T3 op __T4; \
## __v8hi __T6 = __builtin_shufflevector (__T5, __T5, 2, 3, 2, 3, 4, 5, 6, 7); \
## __v8hi __T7 = __T5 op __T6; \
## __v8hi __T8 = __builtin_shufflevector (__T7, __T7, 1, 1, 2, 3, 4, 5, 6, 7); \
## __v8hi __T9 = __T7 op __T8; \
## return __T9[0]

## [Macro Original]
## #define _MM256_AVX512_REDUCE_OPERATOR_MAX_MIN_EP16(op) \
## __m128i __T1 = _mm256_avx512_extracti128_si256 (__V, 0); \
## __m128i __T2 = _mm256_avx512_extracti128_si256 (__V, 1); \
## __m128i __T3 = _mm_avx512_##op (__T1, __T2); \
## __m128i __T4 = (__m128i)__builtin_shufflevector ((__v8hi)__T3, \
## (__v8hi)__T3, 4, 5, 6, 7, 4, 5, 6, 7); \
## __m128i __T5 = _mm_avx512_##op (__T3, __T4); \
## __m128i __T6 = (__m128i)__builtin_shufflevector ((__v8hi)__T5, \
## (__v8hi)__T5, 2, 3, 2, 3, 4, 5, 6, 7); \
## __m128i __T7 = _mm_avx512_##op (__T5, __T6); \
## __m128i __T8 = (__m128i)__builtin_shufflevector ((__v8hi)__T7, \
## (__v8hi)__T7, 1, 1, 2, 3, 4, 5, 6, 7); \
## __v8hi __T9 = (__v8hi)_mm_avx512_##op (__T7, __T8); \
## return __T9[0]

## [Macro Original]
## #define _MM256_AVX512_REDUCE_OPERATOR_BASIC_EPI8(op) \
## __v16qi __T1 = (__v16qi)_mm256_avx512_extracti128_si256 (__W, 0); \
## __v16qi __T2 = (__v16qi)_mm256_avx512_extracti128_si256 (__W, 1); \
## __v16qi __T3 = __T1 op __T2; \
## __v16qi __T4 = __builtin_shufflevector (__T3, __T3, \
## 8, 9, 10, 11, 12, 13, 14, 15, 8, 9, 10, 11, 12, 13, 14, 15); \
## __v16qi __T5 = __T3 op __T4; \
## __v16qi __T6 = __builtin_shufflevector (__T5, __T5, \
## 4, 5, 6, 7, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15); \
## __v16qi __T7 = __T5 op __T6; \
## __v16qi __T8 = __builtin_shufflevector (__T7, __T7, \
## 2, 3, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15); \
## __v16qi __T9 = __T7 op __T8; \
## __v16qi __T10 = __builtin_shufflevector (__T9, __T9, \
## 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15); \
## __v16qi __T11 = __T9 op __T10; \
## return __T11[0]

## [Macro Original]
## #define _MM256_AVX512_REDUCE_OPERATOR_MAX_MIN_EP8(op) \
## __m128i __T1 = _mm256_avx512_extracti128_si256 (__V, 0); \
## __m128i __T2 = _mm256_avx512_extracti128_si256 (__V, 1); \
## __m128i __T3 = _mm_avx512_##op (__T1, __T2); \
## __m128i __T4 = (__m128i)__builtin_shufflevector ((__v16qi)__T3, \
## (__v16qi)__T3, \
## 8, 9, 10, 11, 12, 13, 14, 15, 8, 9, 10, 11, 12, 13, 14, 15); \
## __m128i __T5 = _mm_avx512_##op (__T3, __T4); \
## __m128i __T6 = (__m128i)__builtin_shufflevector ((__v16qi)__T5, \
## (__v16qi)__T5, \
## 4, 5, 6, 7, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15); \
## __m128i __T7 = _mm_avx512_##op (__T5, __T6); \
## __m128i __T8 = (__m128i)__builtin_shufflevector ((__v16qi)__T7, \
## (__v16qi)__T5, \
## 2, 3, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15); \
## __m128i __T9 = _mm_avx512_##op (__T7, __T8); \
## __m128i __T10 = (__m128i)__builtin_shufflevector ((__v16qi)__T9, \
## (__v16qi)__T9, \
## 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15); \
## __v16qi __T11 = (__v16qi)_mm_avx512_##op (__T9, __T10); \
## return __T11[0]

func mm256_maskz_mov_epi8*(u: MMask32, a: M256i): M256i {.importc: "_mm256_maskz_mov_epi8".}

func mm_mask_mov_epi8*(w: M128i, u: MMask16, a: M128i): M128i {.importc: "_mm_mask_mov_epi8".}

func mm_maskz_mov_epi8*(u: MMask16, a: M128i): M128i {.importc: "_mm_maskz_mov_epi8".}

func mm256_storeu_epi8*(p: pointer, a: M256i): void {.importc: "_mm256_storeu_epi8".}

func mm256_mask_storeu_epi8*(p: pointer, u: MMask32, a: M256i): void {.importc: "_mm256_mask_storeu_epi8".}

func mm_storeu_epi8*(p: pointer, a: M128i): void {.importc: "_mm_storeu_epi8".}

func mm_mask_storeu_epi8*(p: pointer, u: MMask16, a: M128i): void {.importc: "_mm_mask_storeu_epi8".}

func mm256_loadu_epi16*(p: pointer): M256i {.importc: "_mm256_loadu_epi16".}

func mm256_mask_loadu_epi16*(w: M256i, u: MMask16, p: pointer): M256i {.importc: "_mm256_mask_loadu_epi16".}

func mm256_maskz_loadu_epi16*(u: MMask16, p: pointer): M256i {.importc: "_mm256_maskz_loadu_epi16".}

func mm_loadu_epi16*(p: pointer): M128i {.importc: "_mm_loadu_epi16".}

func mm_mask_loadu_epi16*(w: M128i, u: MMask8, p: pointer): M128i {.importc: "_mm_mask_loadu_epi16".}

func mm_maskz_loadu_epi16*(u: MMask8, p: pointer): M128i {.importc: "_mm_maskz_loadu_epi16".}

func mm256_mask_mov_epi16*(w: M256i, u: MMask16, a: M256i): M256i {.importc: "_mm256_mask_mov_epi16".}

func mm256_maskz_mov_epi16*(u: MMask16, a: M256i): M256i {.importc: "_mm256_maskz_mov_epi16".}

func mm_mask_mov_epi16*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_mov_epi16".}

func mm_maskz_mov_epi16*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_mov_epi16".}

func mm256_loadu_epi8*(p: pointer): M256i {.importc: "_mm256_loadu_epi8".}

func mm256_mask_loadu_epi8*(w: M256i, u: MMask32, p: pointer): M256i {.importc: "_mm256_mask_loadu_epi8".}

func mm256_maskz_loadu_epi8*(u: MMask32, p: pointer): M256i {.importc: "_mm256_maskz_loadu_epi8".}

func mm_loadu_epi8*(p: pointer): M128i {.importc: "_mm_loadu_epi8".}

func mm_mask_loadu_epi8*(w: M128i, u: MMask16, p: pointer): M128i {.importc: "_mm_mask_loadu_epi8".}

func mm_maskz_loadu_epi8*(u: MMask16, p: pointer): M128i {.importc: "_mm_maskz_loadu_epi8".}

func mm_mask_blend_epi16*(u: MMask8, a: M128i, w: M128i): M128i {.importc: "_mm_mask_blend_epi16".}

func mm_mask_blend_epi8*(u: MMask16, a: M128i, w: M128i): M128i {.importc: "_mm_mask_blend_epi8".}

func mm256_mask_blend_epi16*(u: MMask16, a: M256i, w: M256i): M256i {.importc: "_mm256_mask_blend_epi16".}

func mm256_mask_blend_epi8*(u: MMask32, a: M256i, w: M256i): M256i {.importc: "_mm256_mask_blend_epi8".}

func mm256_cvtepi16_epi8*(a: M256i): M128i {.importc: "_mm256_cvtepi16_epi8".}

func mm256_mask_cvtepi16_storeu_epi8*(p: pointer, m: MMask16, a: M256i): void {.importc: "_mm256_mask_cvtepi16_storeu_epi8".}

func mm256_mask_cvtepi16_epi8*(o: M128i, m: MMask16, a: M256i): M128i {.importc: "_mm256_mask_cvtepi16_epi8".}

func mm256_maskz_cvtepi16_epi8*(m: MMask16, a: M256i): M128i {.importc: "_mm256_maskz_cvtepi16_epi8".}

func mm_cvtsepi16_epi8*(a: M128i): M128i {.importc: "_mm_cvtsepi16_epi8".}

func mm_mask_cvtsepi16_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtsepi16_storeu_epi8".}

func mm_mask_cvtsepi16_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtsepi16_epi8".}

func mm_maskz_cvtsepi16_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtsepi16_epi8".}

func mm256_cvtsepi16_epi8*(a: M256i): M128i {.importc: "_mm256_cvtsepi16_epi8".}

func mm256_mask_cvtsepi16_storeu_epi8*(p: pointer, m: MMask16, a: M256i): void {.importc: "_mm256_mask_cvtsepi16_storeu_epi8".}

func mm256_mask_cvtsepi16_epi8*(o: M128i, m: MMask16, a: M256i): M128i {.importc: "_mm256_mask_cvtsepi16_epi8".}

func mm256_maskz_cvtsepi16_epi8*(m: MMask16, a: M256i): M128i {.importc: "_mm256_maskz_cvtsepi16_epi8".}

func mm_cvtusepi16_epi8*(a: M128i): M128i {.importc: "_mm_cvtusepi16_epi8".}

func mm_mask_cvtusepi16_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtusepi16_storeu_epi8".}

func mm_mask_cvtusepi16_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtusepi16_epi8".}

func mm_maskz_cvtusepi16_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtusepi16_epi8".}

func mm256_cvtusepi16_epi8*(a: M256i): M128i {.importc: "_mm256_cvtusepi16_epi8".}

func mm256_mask_cvtusepi16_storeu_epi8*(p: pointer, m: MMask16, a: M256i): void {.importc: "_mm256_mask_cvtusepi16_storeu_epi8".}

func mm256_mask_cvtusepi16_epi8*(o: M128i, m: MMask16, a: M256i): M128i {.importc: "_mm256_mask_cvtusepi16_epi8".}

func mm256_maskz_cvtusepi16_epi8*(m: MMask16, a: M256i): M128i {.importc: "_mm256_maskz_cvtusepi16_epi8".}

func mm256_mask_broadcastb_epi8*(o: M256i, m: MMask32, a: M128i): M256i {.importc: "_mm256_mask_broadcastb_epi8".}

func mm256_maskz_broadcastb_epi8*(m: MMask32, a: M128i): M256i {.importc: "_mm256_maskz_broadcastb_epi8".}

func mm256_mask_set1_epi8*(o: M256i, m: MMask32, a: int8): M256i {.importc: "_mm256_mask_set1_epi8".}

func mm256_maskz_set1_epi8*(m: MMask32, a: int8): M256i {.importc: "_mm256_maskz_set1_epi8".}

func mm_mask_broadcastb_epi8*(o: M128i, m: MMask16, a: M128i): M128i {.importc: "_mm_mask_broadcastb_epi8".}

func mm_maskz_broadcastb_epi8*(m: MMask16, a: M128i): M128i {.importc: "_mm_maskz_broadcastb_epi8".}

func mm_mask_set1_epi8*(o: M128i, m: MMask16, a: int8): M128i {.importc: "_mm_mask_set1_epi8".}

func mm_maskz_set1_epi8*(m: MMask16, a: int8): M128i {.importc: "_mm_maskz_set1_epi8".}

func mm256_mask_broadcastw_epi16*(o: M256i, m: MMask16, a: M128i): M256i {.importc: "_mm256_mask_broadcastw_epi16".}

func mm256_maskz_broadcastw_epi16*(m: MMask16, a: M128i): M256i {.importc: "_mm256_maskz_broadcastw_epi16".}

func mm256_mask_set1_epi16*(o: M256i, m: MMask16, a: int16): M256i {.importc: "_mm256_mask_set1_epi16".}

func mm256_maskz_set1_epi16*(m: MMask16, a: int16): M256i {.importc: "_mm256_maskz_set1_epi16".}

func mm_mask_broadcastw_epi16*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_broadcastw_epi16".}

func mm_maskz_broadcastw_epi16*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_broadcastw_epi16".}

func mm_mask_set1_epi16*(o: M128i, m: MMask8, a: int16): M128i {.importc: "_mm_mask_set1_epi16".}

func mm_maskz_set1_epi16*(m: MMask8, a: int16): M128i {.importc: "_mm_maskz_set1_epi16".}

func mm256_permutexvar_epi16*(a: M256i, b: M256i): M256i {.importc: "_mm256_permutexvar_epi16".}

func mm256_maskz_permutexvar_epi16*(m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_permutexvar_epi16".}

func mm256_mask_permutexvar_epi16*(w: M256i, m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_permutexvar_epi16".}

func mm_permutexvar_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_permutexvar_epi16".}

func mm_maskz_permutexvar_epi16*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_permutexvar_epi16".}

func mm_mask_permutexvar_epi16*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_permutexvar_epi16".}

func mm256_permutex2var_epi16*(a: M256i, i: M256i, b: M256i): M256i {.importc: "_mm256_permutex2var_epi16".}

func mm256_mask_permutex2var_epi16*(a: M256i, u: MMask16, i: M256i, b: M256i): M256i {.importc: "_mm256_mask_permutex2var_epi16".}

func mm256_mask2_permutex2var_epi16*(a: M256i, i: M256i, u: MMask16, b: M256i): M256i {.importc: "_mm256_mask2_permutex2var_epi16".}

func mm256_maskz_permutex2var_epi16*(u: MMask16, a: M256i, i: M256i, b: M256i): M256i {.importc: "_mm256_maskz_permutex2var_epi16".}

func mm_permutex2var_epi16*(a: M128i, i: M128i, b: M128i): M128i {.importc: "_mm_permutex2var_epi16".}

func mm_mask_permutex2var_epi16*(a: M128i, u: MMask8, i: M128i, b: M128i): M128i {.importc: "_mm_mask_permutex2var_epi16".}

func mm_mask2_permutex2var_epi16*(a: M128i, i: M128i, u: MMask8, b: M128i): M128i {.importc: "_mm_mask2_permutex2var_epi16".}

func mm_maskz_permutex2var_epi16*(u: MMask8, a: M128i, i: M128i, b: M128i): M128i {.importc: "_mm_maskz_permutex2var_epi16".}

func mm256_mask_maddubs_epi16*(w: M256i, u: MMask16, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_maddubs_epi16".}

func mm256_maskz_maddubs_epi16*(u: MMask16, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_maddubs_epi16".}

func mm_mask_maddubs_epi16*(w: M128i, u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_maddubs_epi16".}

func mm_maskz_maddubs_epi16*(u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_maddubs_epi16".}

func mm256_mask_madd_epi16*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_madd_epi16".}

func mm256_maskz_madd_epi16*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_madd_epi16".}

func mm_mask_madd_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_madd_epi16".}

func mm_maskz_madd_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_madd_epi16".}

func mm_movepi8_mask*(a: M128i): MMask16 {.importc: "_mm_movepi8_mask".}

func mm256_movepi8_mask*(a: M256i): MMask32 {.importc: "_mm256_movepi8_mask".}

func mm_movepi16_mask*(a: M128i): MMask8 {.importc: "_mm_movepi16_mask".}

func mm256_movepi16_mask*(a: M256i): MMask16 {.importc: "_mm256_movepi16_mask".}

func mm_movm_epi8*(a: MMask16): M128i {.importc: "_mm_movm_epi8".}

func mm256_movm_epi8*(a: MMask32): M256i {.importc: "_mm256_movm_epi8".}

func mm_movm_epi16*(a: MMask8): M128i {.importc: "_mm_movm_epi16".}

func mm256_movm_epi16*(a: MMask16): M256i {.importc: "_mm256_movm_epi16".}

func mm_test_epi8_mask*(a: M128i, b: M128i): MMask16 {.importc: "_mm_test_epi8_mask".}

func mm_mask_test_epi8_mask*(u: MMask16, a: M128i, b: M128i): MMask16 {.importc: "_mm_mask_test_epi8_mask".}

func mm256_test_epi8_mask*(a: M256i, b: M256i): MMask32 {.importc: "_mm256_test_epi8_mask".}

func mm256_mask_test_epi8_mask*(u: MMask32, a: M256i, b: M256i): MMask32 {.importc: "_mm256_mask_test_epi8_mask".}

func mm_test_epi16_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_test_epi16_mask".}

func mm_mask_test_epi16_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_test_epi16_mask".}

func mm256_test_epi16_mask*(a: M256i, b: M256i): MMask16 {.importc: "_mm256_test_epi16_mask".}

func mm256_mask_test_epi16_mask*(u: MMask16, a: M256i, b: M256i): MMask16 {.importc: "_mm256_mask_test_epi16_mask".}

func mm256_maskz_min_epu16*(m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_min_epu16".}

func mm256_mask_min_epu16*(w: M256i, m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_min_epu16".}

func mm_maskz_min_epu16*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_min_epu16".}

func mm_mask_min_epu16*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_min_epu16".}

func mm256_maskz_min_epi16*(m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_min_epi16".}

func mm256_mask_min_epi16*(w: M256i, m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_min_epi16".}

func mm256_maskz_max_epu8*(m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_max_epu8".}

func mm256_mask_max_epu8*(w: M256i, m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_max_epu8".}

func mm_maskz_max_epu8*(m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_max_epu8".}

func mm_mask_max_epu8*(w: M128i, m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_max_epu8".}

func mm256_maskz_max_epi8*(m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_max_epi8".}

func mm256_mask_max_epi8*(w: M256i, m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_max_epi8".}

func mm_maskz_max_epi8*(m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_max_epi8".}

func mm_mask_max_epi8*(w: M128i, m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_max_epi8".}

func mm256_maskz_min_epu8*(m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_min_epu8".}

func mm256_mask_min_epu8*(w: M256i, m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_min_epu8".}

func mm_maskz_min_epu8*(m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_min_epu8".}

func mm_mask_min_epu8*(w: M128i, m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_min_epu8".}

func mm256_maskz_min_epi8*(m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_min_epi8".}

func mm256_mask_min_epi8*(w: M256i, m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_min_epi8".}

func mm_maskz_min_epi8*(m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_min_epi8".}

func mm_mask_min_epi8*(w: M128i, m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_min_epi8".}

func mm256_maskz_max_epi16*(m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_max_epi16".}

func mm256_mask_max_epi16*(w: M256i, m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_max_epi16".}

func mm_maskz_max_epi16*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_max_epi16".}

func mm_mask_max_epi16*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_max_epi16".}

func mm256_maskz_max_epu16*(m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_max_epu16".}

func mm256_mask_max_epu16*(w: M256i, m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_max_epu16".}

func mm_maskz_max_epu16*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_max_epu16".}

func mm_mask_max_epu16*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_max_epu16".}

func mm_maskz_min_epi16*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_min_epi16".}

func mm_mask_min_epi16*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_min_epi16".}

func mm256_mask_alignr_epi8*(w: M256i, u: MMask32, a: M256i, b: M256i, n: int32): M256i {.importc: "_mm256_mask_alignr_epi8".}

func mm256_maskz_alignr_epi8*(u: MMask32, a: M256i, b: M256i, n: int32): M256i {.importc: "_mm256_maskz_alignr_epi8".}

func mm_mask_alignr_epi8*(w: M128i, u: MMask16, a: M128i, b: M128i, n: int32): M128i {.importc: "_mm_mask_alignr_epi8".}

func mm_maskz_alignr_epi8*(u: MMask16, a: M128i, b: M128i, n: int32): M128i {.importc: "_mm_maskz_alignr_epi8".}

func mm256_dbsad_epu8*(a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_dbsad_epu8".}

func mm256_mask_dbsad_epu8*(w: M256i, u: MMask16, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_mask_dbsad_epu8".}

func mm256_maskz_dbsad_epu8*(u: MMask16, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_maskz_dbsad_epu8".}

func mm_dbsad_epu8*(a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_dbsad_epu8".}

func mm_mask_dbsad_epu8*(w: M128i, u: MMask8, a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_mask_dbsad_epu8".}

func mm_maskz_dbsad_epu8*(u: MMask8, a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_maskz_dbsad_epu8".}

func mm_mask_cmp_epi16_mask*(u: MMask8, x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_mask_cmp_epi16_mask".}

func mm_cmp_epi16_mask*(x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_cmp_epi16_mask".}

func mm256_mask_cmp_epi16_mask*(u: MMask16, x: M256i, y: M256i, p: int32): MMask16 {.importc: "_mm256_mask_cmp_epi16_mask".}

func mm256_cmp_epi16_mask*(x: M256i, y: M256i, p: int32): MMask16 {.importc: "_mm256_cmp_epi16_mask".}

func mm_mask_cmp_epi8_mask*(u: MMask16, x: M128i, y: M128i, p: int32): MMask16 {.importc: "_mm_mask_cmp_epi8_mask".}

func mm_cmp_epi8_mask*(x: M128i, y: M128i, p: int32): MMask16 {.importc: "_mm_cmp_epi8_mask".}

func mm256_mask_cmp_epi8_mask*(u: MMask32, x: M256i, y: M256i, p: int32): MMask32 {.importc: "_mm256_mask_cmp_epi8_mask".}

func mm256_cmp_epi8_mask*(x: M256i, y: M256i, p: int32): MMask32 {.importc: "_mm256_cmp_epi8_mask".}

func mm_mask_cmp_epu16_mask*(u: MMask8, x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_mask_cmp_epu16_mask".}

func mm_cmp_epu16_mask*(x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_cmp_epu16_mask".}

func mm256_mask_cmp_epu16_mask*(u: MMask16, x: M256i, y: M256i, p: int32): MMask16 {.importc: "_mm256_mask_cmp_epu16_mask".}

func mm256_cmp_epu16_mask*(x: M256i, y: M256i, p: int32): MMask16 {.importc: "_mm256_cmp_epu16_mask".}

func mm_mask_cmp_epu8_mask*(u: MMask16, x: M128i, y: M128i, p: int32): MMask16 {.importc: "_mm_mask_cmp_epu8_mask".}

func mm_cmp_epu8_mask*(x: M128i, y: M128i, p: int32): MMask16 {.importc: "_mm_cmp_epu8_mask".}

func mm256_mask_cmp_epu8_mask*(u: MMask32, x: M256i, y: M256i, p: int32): MMask32 {.importc: "_mm256_mask_cmp_epu8_mask".}

func mm256_cmp_epu8_mask*(x: M256i, y: M256i, p: int32): MMask32 {.importc: "_mm256_cmp_epu8_mask".}

func mm256_mask_srli_epi16*(w: M256i, u: MMask16, a: M256i, imm: int32): M256i {.importc: "_mm256_mask_srli_epi16".}

func mm256_maskz_srli_epi16*(u: MMask16, a: M256i, imm: int32): M256i {.importc: "_mm256_maskz_srli_epi16".}

func mm_mask_srli_epi16*(w: M128i, u: MMask8, a: M128i, imm: int32): M128i {.importc: "_mm_mask_srli_epi16".}

func mm_maskz_srli_epi16*(u: MMask8, a: M128i, imm: int32): M128i {.importc: "_mm_maskz_srli_epi16".}

func mm256_mask_shufflehi_epi16*(w: M256i, u: MMask16, a: M256i, imm: int32): M256i {.importc: "_mm256_mask_shufflehi_epi16".}

func mm256_maskz_shufflehi_epi16*(u: MMask16, a: M256i, imm: int32): M256i {.importc: "_mm256_maskz_shufflehi_epi16".}

func mm_mask_shufflehi_epi16*(w: M128i, u: MMask8, a: M128i, imm: int32): M128i {.importc: "_mm_mask_shufflehi_epi16".}

func mm_maskz_shufflehi_epi16*(u: MMask8, a: M128i, imm: int32): M128i {.importc: "_mm_maskz_shufflehi_epi16".}

func mm256_mask_shufflelo_epi16*(w: M256i, u: MMask16, a: M256i, imm: int32): M256i {.importc: "_mm256_mask_shufflelo_epi16".}

func mm256_maskz_shufflelo_epi16*(u: MMask16, a: M256i, imm: int32): M256i {.importc: "_mm256_maskz_shufflelo_epi16".}

func mm_mask_shufflelo_epi16*(w: M128i, u: MMask8, a: M128i, imm: int32): M128i {.importc: "_mm_mask_shufflelo_epi16".}

func mm_maskz_shufflelo_epi16*(u: MMask8, a: M128i, imm: int32): M128i {.importc: "_mm_maskz_shufflelo_epi16".}

func mm256_mask_srai_epi16*(w: M256i, u: MMask16, a: M256i, imm: uint32): M256i {.importc: "_mm256_mask_srai_epi16".}

func mm256_maskz_srai_epi16*(u: MMask16, a: M256i, imm: uint32): M256i {.importc: "_mm256_maskz_srai_epi16".}

func mm_mask_srai_epi16*(w: M128i, u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_mask_srai_epi16".}

func mm_maskz_srai_epi16*(u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_maskz_srai_epi16".}

func mm256_mask_slli_epi16*(w: M256i, u: MMask16, a: M256i, b: uint32): M256i {.importc: "_mm256_mask_slli_epi16".}

func mm256_maskz_slli_epi16*(u: MMask16, a: M256i, b: uint32): M256i {.importc: "_mm256_maskz_slli_epi16".}

func mm_mask_slli_epi16*(w: M128i, u: MMask8, a: M128i, b: uint32): M128i {.importc: "_mm_mask_slli_epi16".}

func mm_maskz_slli_epi16*(u: MMask8, a: M128i, b: uint32): M128i {.importc: "_mm_maskz_slli_epi16".}

## [Macro Original]
## #define _mm256_mask_alignr_epi8(W, U, X, Y, N)					    \
## ((__m256i) __builtin_ia32_palignr256_mask ((__v4di)(__m256i)(X),		    \
## (__v4di)(__m256i)(Y), (int)((N) * 8),   \
## (__v4di)(__m256i)(W), (__mmask32)(U)))

## [Macro Original]
## #define _mm256_mask_srli_epi16(W, U, A, B)                              \
## ((__m256i) __builtin_ia32_psrlwi256_mask ((__v16hi)(__m256i)(A),      \
## (int)(B), (__v16hi)(__m256i)(W), (__mmask16)(U)))

## [Macro Original]
## #define _mm256_maskz_srli_epi16(U, A, B)                                \
## ((__m256i) __builtin_ia32_psrlwi256_mask ((__v16hi)(__m256i)(A),      \
## (int)(B), (__v16hi)_mm256_avx512_setzero_si256 (), (__mmask16)(U)))

## [Macro Original]
## #define _mm_mask_srli_epi16(W, U, A, B)                                 \
## ((__m128i) __builtin_ia32_psrlwi128_mask ((__v8hi)(__m128i)(A),       \
## (int)(B), (__v8hi)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_srli_epi16(U, A, B)                                   \
## ((__m128i) __builtin_ia32_psrlwi128_mask ((__v8hi)(__m128i)(A),       \
## (int)(B), (__v8hi)_mm_avx512_setzero_si128 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_srai_epi16(W, U, A, B)                              \
## ((__m256i) __builtin_ia32_psrawi256_mask ((__v16hi)(__m256i)(A),      \
## (unsigned int)(B), (__v16hi)(__m256i)(W), (__mmask16)(U)))

## [Macro Original]
## #define _mm256_maskz_srai_epi16(U, A, B)                                \
## ((__m256i) __builtin_ia32_psrawi256_mask ((__v16hi)(__m256i)(A),      \
## (unsigned int)(B), (__v16hi)_mm256_avx512_setzero_si256 (), (__mmask16)(U)))

## [Macro Original]
## #define _mm_mask_srai_epi16(W, U, A, B)                                 \
## ((__m128i) __builtin_ia32_psrawi128_mask ((__v8hi)(__m128i)(A),       \
## (unsigned int)(B), (__v8hi)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_srai_epi16(U, A, B)                                   \
## ((__m128i) __builtin_ia32_psrawi128_mask ((__v8hi)(__m128i)(A),       \
## (unsigned int)(B), (__v8hi)_mm_avx512_setzero_si128(), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_shufflehi_epi16(W, U, A, B)                                     \
## ((__m256i) __builtin_ia32_pshufhw256_mask ((__v16hi)(__m256i)(A), (int)(B),       \
## (__v16hi)(__m256i)(W),                 \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm256_maskz_shufflehi_epi16(U, A, B)                                       \
## ((__m256i) __builtin_ia32_pshufhw256_mask ((__v16hi)(__m256i)(A), (int)(B),       \
## (__v16hi)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm_mask_shufflehi_epi16(W, U, A, B)                                        \
## ((__m128i) __builtin_ia32_pshufhw128_mask ((__v8hi)(__m128i)(A), (int)(B),        \
## (__v8hi)(__m128i)(W),                  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_shufflehi_epi16(U, A, B)                                          \
## ((__m128i) __builtin_ia32_pshufhw128_mask ((__v8hi)(__m128i)(A), (int)(B),        \
## (__v8hi)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_shufflelo_epi16(W, U, A, B)                                     \
## ((__m256i) __builtin_ia32_pshuflw256_mask ((__v16hi)(__m256i)(A), (int)(B),       \
## (__v16hi)(__m256i)(W),                 \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm256_maskz_shufflelo_epi16(U, A, B)                                       \
## ((__m256i) __builtin_ia32_pshuflw256_mask ((__v16hi)(__m256i)(A), (int)(B),       \
## (__v16hi)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm_mask_shufflelo_epi16(W, U, A, B)                                        \
## ((__m128i) __builtin_ia32_pshuflw128_mask ((__v8hi)(__m128i)(A), (int)(B),        \
## (__v8hi)(__m128i)(W),                  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_shufflelo_epi16(U, A, B)                                          \
## ((__m128i) __builtin_ia32_pshuflw128_mask ((__v8hi)(__m128i)(A), (int)(B),        \
## (__v8hi)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_alignr_epi8(U, X, Y, N)					    \
## ((__m256i) __builtin_ia32_palignr256_mask ((__v4di)(__m256i)(X),		    \
## (__v4di)(__m256i)(Y), (int)((N) * 8),   \
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),   \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm_mask_alignr_epi8(W, U, X, Y, N)					    \
## ((__m128i) __builtin_ia32_palignr128_mask ((__v2di)(__m128i)(X),		    \
## (__v2di)(__m128i)(Y), (int)((N) * 8),   \
## (__v2di)(__m128i)(W), (__mmask16)(U)))

## [Macro Original]
## #define _mm_maskz_alignr_epi8(U, X, Y, N)					    \
## ((__m128i) __builtin_ia32_palignr128_mask ((__v2di)(__m128i)(X),		    \
## (__v2di)(__m128i)(Y), (int)((N) * 8),   \
## (__v2di)(__m128i)_mm_avx512_setzero_si128 (),  \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm_mask_slli_epi16(W, U, X, C)					\
## ((__m128i)__builtin_ia32_psllwi128_mask ((__v8hi)(__m128i)(X),	\
## (unsigned int)(C),							\
## (__v8hi)(__m128i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_slli_epi16(U, X, C)					\
## ((__m128i)__builtin_ia32_psllwi128_mask ((__v8hi)(__m128i)(X),	\
## (unsigned int)(C),							\
## (__v8hi)(__m128i)_mm_avx512_setzero_si128 (),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_dbsad_epu8(X, Y, C)                                                  \
## ((__m256i) __builtin_ia32_dbpsadbw256_mask ((__v32qi)(__m256i) (X),               \
## (__v32qi)(__m256i) (Y), (int) (C),    \
## (__v16hi)(__m256i)_mm256_avx512_setzero_si256(),\
## (__mmask16)-1))

## [Macro Original]
## #define _mm256_mask_slli_epi16(W, U, X, C)				\
## ((__m256i)__builtin_ia32_psllwi256_mask ((__v16hi)(__m256i)(X),	\
## (unsigned int)(C),							\
## (__v16hi)(__m256i)(W),						\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm256_maskz_slli_epi16(U, X, C)				\
## ((__m256i)__builtin_ia32_psllwi256_mask ((__v16hi)(__m256i)(X),	\
## (unsigned int)(C),							\
## (__v16hi)(__m256i)_mm256_avx512_setzero_si256 (),				\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm256_mask_dbsad_epu8(W, U, X, Y, C)                                       \
## ((__m256i) __builtin_ia32_dbpsadbw256_mask ((__v32qi)(__m256i) (X),               \
## (__v32qi)(__m256i) (Y), (int) (C),    \
## (__v16hi)(__m256i)(W),                \
## (__mmask16)(U)))

## [Macro Original]
## #define _mm256_maskz_dbsad_epu8(U, X, Y, C)                                         \
## ((__m256i) __builtin_ia32_dbpsadbw256_mask ((__v32qi)(__m256i) (X),               \
## (__v32qi)(__m256i) (Y), (int) (C),    \
## (__v16hi)(__m256i)_mm256_avx512_setzero_si256(),\
## (__mmask16)(U)))

## [Macro Original]
## #define _mm_dbsad_epu8(X, Y, C)                                                     \
## ((__m128i) __builtin_ia32_dbpsadbw128_mask ((__v16qi)(__m128i) (X),               \
## (__v16qi)(__m128i) (Y), (int) (C),    \
## (__v8hi)(__m128i)_mm_avx512_setzero_si128(), \
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_dbsad_epu8(W, U, X, Y, C)                                          \
## ((__m128i) __builtin_ia32_dbpsadbw128_mask ((__v16qi)(__m128i) (X),               \
## (__v16qi)(__m128i) (Y), (int) (C),    \
## (__v8hi)(__m128i)(W),                 \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_dbsad_epu8(U, X, Y, C)                                            \
## ((__m128i) __builtin_ia32_dbpsadbw128_mask ((__v16qi)(__m128i) (X),               \
## (__v16qi)(__m128i) (Y), (int) (C),    \
## (__v8hi)(__m128i)_mm_avx512_setzero_si128(), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_cmp_epi16_mask(X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpw128_mask ((__v8hi)(__m128i)(X),	\
## (__v8hi)(__m128i)(Y), (int)(P),\
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm_cmp_epi8_mask(X, Y, P)				\
## ((__mmask16) __builtin_ia32_cmpb128_mask ((__v16qi)(__m128i)(X),	\
## (__v16qi)(__m128i)(Y), (int)(P),\
## (__mmask16)(-1)))

## [Macro Original]
## #define _mm256_cmp_epi16_mask(X, Y, P)				\
## ((__mmask16) __builtin_ia32_cmpw256_mask ((__v16hi)(__m256i)(X),	\
## (__v16hi)(__m256i)(Y), (int)(P),\
## (__mmask16)(-1)))

## [Macro Original]
## #define _mm256_cmp_epi8_mask(X, Y, P)				\
## ((__mmask32) __builtin_ia32_cmpb256_mask ((__v32qi)(__m256i)(X),	\
## (__v32qi)(__m256i)(Y), (int)(P),\
## (__mmask32)(-1)))

## [Macro Original]
## #define _mm_cmp_epu16_mask(X, Y, P)				\
## ((__mmask8) __builtin_ia32_ucmpw128_mask ((__v8hi)(__m128i)(X),	\
## (__v8hi)(__m128i)(Y), (int)(P),\
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm_cmp_epu8_mask(X, Y, P)				\
## ((__mmask16) __builtin_ia32_ucmpb128_mask ((__v16qi)(__m128i)(X),	\
## (__v16qi)(__m128i)(Y), (int)(P),\
## (__mmask16)(-1)))

## [Macro Original]
## #define _mm256_cmp_epu16_mask(X, Y, P)				\
## ((__mmask16) __builtin_ia32_ucmpw256_mask ((__v16hi)(__m256i)(X),	\
## (__v16hi)(__m256i)(Y), (int)(P),\
## (__mmask16)(-1)))

## [Macro Original]
## #define _mm256_cmp_epu8_mask(X, Y, P)				\
## ((__mmask32) __builtin_ia32_ucmpb256_mask ((__v32qi)(__m256i)(X),	\
## (__v32qi)(__m256i)(Y), (int)(P),\
## (__mmask32)-1))

## [Macro Original]
## #define _mm_mask_cmp_epi16_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpw128_mask ((__v8hi)(__m128i)(X),	\
## (__v8hi)(__m128i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm_mask_cmp_epi8_mask(M, X, Y, P)				\
## ((__mmask16) __builtin_ia32_cmpb128_mask ((__v16qi)(__m128i)(X),	\
## (__v16qi)(__m128i)(Y), (int)(P),\
## (__mmask16)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_epi16_mask(M, X, Y, P)				\
## ((__mmask16) __builtin_ia32_cmpw256_mask ((__v16hi)(__m256i)(X),	\
## (__v16hi)(__m256i)(Y), (int)(P),\
## (__mmask16)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_epi8_mask(M, X, Y, P)				\
## ((__mmask32) __builtin_ia32_cmpb256_mask ((__v32qi)(__m256i)(X),	\
## (__v32qi)(__m256i)(Y), (int)(P),\
## (__mmask32)(M)))

## [Macro Original]
## #define _mm_mask_cmp_epu16_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_ucmpw128_mask ((__v8hi)(__m128i)(X),	\
## (__v8hi)(__m128i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm_mask_cmp_epu8_mask(M, X, Y, P)				\
## ((__mmask16) __builtin_ia32_ucmpb128_mask ((__v16qi)(__m128i)(X),	\
## (__v16qi)(__m128i)(Y), (int)(P),\
## (__mmask16)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_epu16_mask(M, X, Y, P)				\
## ((__mmask16) __builtin_ia32_ucmpw256_mask ((__v16hi)(__m256i)(X),	\
## (__v16hi)(__m256i)(Y), (int)(P),\
## (__mmask16)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_epu8_mask(M, X, Y, P)				\
## ((__mmask32) __builtin_ia32_ucmpb256_mask ((__v32qi)(__m256i)(X),	\
## (__v32qi)(__m256i)(Y), (int)(P),\
## (__mmask32)(M)))

func mm256_cmpneq_epi8_mask*(x: M256i, y: M256i): MMask32 {.importc: "_mm256_cmpneq_epi8_mask".}

func mm256_cmplt_epi8_mask*(x: M256i, y: M256i): MMask32 {.importc: "_mm256_cmplt_epi8_mask".}

func mm256_cmpge_epi8_mask*(x: M256i, y: M256i): MMask32 {.importc: "_mm256_cmpge_epi8_mask".}

func mm256_cmple_epi8_mask*(x: M256i, y: M256i): MMask32 {.importc: "_mm256_cmple_epi8_mask".}

func mm256_cmpneq_epi16_mask*(x: M256i, y: M256i): MMask16 {.importc: "_mm256_cmpneq_epi16_mask".}

func mm256_cmplt_epi16_mask*(x: M256i, y: M256i): MMask16 {.importc: "_mm256_cmplt_epi16_mask".}

func mm256_cmpge_epi16_mask*(x: M256i, y: M256i): MMask16 {.importc: "_mm256_cmpge_epi16_mask".}

func mm256_cmple_epi16_mask*(x: M256i, y: M256i): MMask16 {.importc: "_mm256_cmple_epi16_mask".}

func mm_cmpneq_epu8_mask*(x: M128i, y: M128i): MMask16 {.importc: "_mm_cmpneq_epu8_mask".}

func mm_cmplt_epu8_mask*(x: M128i, y: M128i): MMask16 {.importc: "_mm_cmplt_epu8_mask".}

func mm_cmpge_epu8_mask*(x: M128i, y: M128i): MMask16 {.importc: "_mm_cmpge_epu8_mask".}

func mm_cmple_epu8_mask*(x: M128i, y: M128i): MMask16 {.importc: "_mm_cmple_epu8_mask".}

func mm_cmpneq_epu16_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpneq_epu16_mask".}

func mm_cmplt_epu16_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmplt_epu16_mask".}

func mm_cmpge_epu16_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpge_epu16_mask".}

func mm_cmple_epu16_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmple_epu16_mask".}

func mm_cmpneq_epi8_mask*(x: M128i, y: M128i): MMask16 {.importc: "_mm_cmpneq_epi8_mask".}

func mm_cmplt_epi8_mask*(x: M128i, y: M128i): MMask16 {.importc: "_mm_cmplt_epi8_mask".}

func mm_cmpge_epi8_mask*(x: M128i, y: M128i): MMask16 {.importc: "_mm_cmpge_epi8_mask".}

func mm_cmple_epi8_mask*(x: M128i, y: M128i): MMask16 {.importc: "_mm_cmple_epi8_mask".}

func mm_cmpneq_epi16_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpneq_epi16_mask".}

func mm_cmplt_epi16_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmplt_epi16_mask".}

func mm_cmpge_epi16_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpge_epi16_mask".}

func mm_cmple_epi16_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmple_epi16_mask".}

func mm256_mask_mulhrs_epi16*(w: M256i, u: MMask16, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_mulhrs_epi16".}

func mm256_maskz_mulhrs_epi16*(u: MMask16, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_mulhrs_epi16".}

func mm256_mask_mulhi_epu16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_mulhi_epu16".}

func mm256_maskz_mulhi_epu16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_mulhi_epu16".}

func mm256_mask_mulhi_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_mulhi_epi16".}

func mm256_maskz_mulhi_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_mulhi_epi16".}

func mm_mask_mulhi_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_mulhi_epi16".}

func mm_maskz_mulhi_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_mulhi_epi16".}

func mm_mask_mulhi_epu16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_mulhi_epu16".}

func mm_maskz_mulhi_epu16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_mulhi_epu16".}

func mm_mask_mulhrs_epi16*(w: M128i, u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_mulhrs_epi16".}

func mm_maskz_mulhrs_epi16*(u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_mulhrs_epi16".}

func mm256_mask_mullo_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_mullo_epi16".}

func mm256_maskz_mullo_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_mullo_epi16".}

func mm_mask_mullo_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_mullo_epi16".}

func mm_maskz_mullo_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_mullo_epi16".}

func mm256_mask_cvtepi8_epi16*(w: M256i, u: MMask16, a: M128i): M256i {.importc: "_mm256_mask_cvtepi8_epi16".}

func mm256_maskz_cvtepi8_epi16*(u: MMask16, a: M128i): M256i {.importc: "_mm256_maskz_cvtepi8_epi16".}

func mm_mask_cvtepi8_epi16*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi8_epi16".}

func mm_maskz_cvtepi8_epi16*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi8_epi16".}

func mm256_mask_cvtepu8_epi16*(w: M256i, u: MMask16, a: M128i): M256i {.importc: "_mm256_mask_cvtepu8_epi16".}

func mm256_maskz_cvtepu8_epi16*(u: MMask16, a: M128i): M256i {.importc: "_mm256_maskz_cvtepu8_epi16".}

func mm_mask_cvtepu8_epi16*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepu8_epi16".}

func mm_maskz_cvtepu8_epi16*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepu8_epi16".}

func mm256_mask_avg_epu8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_avg_epu8".}

func mm256_maskz_avg_epu8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_avg_epu8".}

func mm_mask_avg_epu8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_avg_epu8".}

func mm_maskz_avg_epu8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_avg_epu8".}

func mm256_mask_avg_epu16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_avg_epu16".}

func mm256_maskz_avg_epu16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_avg_epu16".}

func mm_mask_avg_epu16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_avg_epu16".}

func mm_maskz_avg_epu16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_avg_epu16".}

func mm256_mask_add_epi8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_add_epi8".}

func mm256_maskz_add_epi8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_add_epi8".}

func mm256_mask_add_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_add_epi16".}

func mm256_maskz_add_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_add_epi16".}

func mm256_mask_adds_epi8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_adds_epi8".}

func mm256_maskz_adds_epi8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_adds_epi8".}

func mm256_mask_adds_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_adds_epi16".}

func mm256_maskz_adds_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_adds_epi16".}

func mm256_mask_adds_epu8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_adds_epu8".}

func mm256_maskz_adds_epu8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_adds_epu8".}

func mm256_mask_adds_epu16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_adds_epu16".}

func mm256_maskz_adds_epu16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_adds_epu16".}

func mm256_mask_sub_epi8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_sub_epi8".}

func mm256_maskz_sub_epi8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_sub_epi8".}

func mm256_mask_sub_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_sub_epi16".}

func mm256_maskz_sub_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_sub_epi16".}

func mm256_mask_subs_epi8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_subs_epi8".}

func mm256_maskz_subs_epi8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_subs_epi8".}

func mm256_mask_subs_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_subs_epi16".}

func mm256_maskz_subs_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_subs_epi16".}

func mm256_mask_subs_epu8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_subs_epu8".}

func mm256_maskz_subs_epu8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_subs_epu8".}

func mm256_mask_subs_epu16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_subs_epu16".}

func mm256_maskz_subs_epu16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_subs_epu16".}

func mm_mask_add_epi8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_add_epi8".}

func mm_maskz_add_epi8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_add_epi8".}

func mm_mask_add_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_add_epi16".}

func mm_maskz_add_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_add_epi16".}

func mm256_mask_unpackhi_epi8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_unpackhi_epi8".}

func mm256_maskz_unpackhi_epi8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_unpackhi_epi8".}

func mm_mask_unpackhi_epi8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_unpackhi_epi8".}

func mm_maskz_unpackhi_epi8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_unpackhi_epi8".}

func mm256_mask_unpackhi_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_unpackhi_epi16".}

func mm256_maskz_unpackhi_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_unpackhi_epi16".}

func mm_mask_unpackhi_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_unpackhi_epi16".}

func mm_maskz_unpackhi_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_unpackhi_epi16".}

func mm256_mask_unpacklo_epi8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_unpacklo_epi8".}

func mm256_maskz_unpacklo_epi8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_unpacklo_epi8".}

func mm_mask_unpacklo_epi8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_unpacklo_epi8".}

func mm_maskz_unpacklo_epi8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_unpacklo_epi8".}

func mm256_mask_unpacklo_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_unpacklo_epi16".}

func mm256_maskz_unpacklo_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_unpacklo_epi16".}

func mm_mask_unpacklo_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_unpacklo_epi16".}

func mm_maskz_unpacklo_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_unpacklo_epi16".}

func mm_cmpeq_epi8_mask*(a: M128i, b: M128i): MMask16 {.importc: "_mm_cmpeq_epi8_mask".}

func mm_cmpeq_epu8_mask*(a: M128i, b: M128i): MMask16 {.importc: "_mm_cmpeq_epu8_mask".}

func mm_mask_cmpeq_epu8_mask*(u: MMask16, a: M128i, b: M128i): MMask16 {.importc: "_mm_mask_cmpeq_epu8_mask".}

func mm_mask_cmpeq_epi8_mask*(u: MMask16, a: M128i, b: M128i): MMask16 {.importc: "_mm_mask_cmpeq_epi8_mask".}

func mm256_cmpeq_epu8_mask*(a: M256i, b: M256i): MMask32 {.importc: "_mm256_cmpeq_epu8_mask".}

func mm256_cmpeq_epi8_mask*(a: M256i, b: M256i): MMask32 {.importc: "_mm256_cmpeq_epi8_mask".}

func mm256_mask_cmpeq_epu8_mask*(u: MMask32, a: M256i, b: M256i): MMask32 {.importc: "_mm256_mask_cmpeq_epu8_mask".}

func mm256_mask_cmpeq_epi8_mask*(u: MMask32, a: M256i, b: M256i): MMask32 {.importc: "_mm256_mask_cmpeq_epi8_mask".}

func mm_cmpeq_epu16_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpeq_epu16_mask".}

func mm_cmpeq_epi16_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpeq_epi16_mask".}

func mm_mask_cmpeq_epu16_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpeq_epu16_mask".}

func mm_mask_cmpeq_epi16_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpeq_epi16_mask".}

func mm256_cmpeq_epu16_mask*(a: M256i, b: M256i): MMask16 {.importc: "_mm256_cmpeq_epu16_mask".}

func mm256_cmpeq_epi16_mask*(a: M256i, b: M256i): MMask16 {.importc: "_mm256_cmpeq_epi16_mask".}

func mm256_mask_cmpeq_epu16_mask*(u: MMask16, a: M256i, b: M256i): MMask16 {.importc: "_mm256_mask_cmpeq_epu16_mask".}

func mm256_mask_cmpeq_epi16_mask*(u: MMask16, a: M256i, b: M256i): MMask16 {.importc: "_mm256_mask_cmpeq_epi16_mask".}

func mm_cmpgt_epu8_mask*(a: M128i, b: M128i): MMask16 {.importc: "_mm_cmpgt_epu8_mask".}

func mm_cmpgt_epi8_mask*(a: M128i, b: M128i): MMask16 {.importc: "_mm_cmpgt_epi8_mask".}

func mm_mask_cmpgt_epu8_mask*(u: MMask16, a: M128i, b: M128i): MMask16 {.importc: "_mm_mask_cmpgt_epu8_mask".}

func mm_mask_cmpgt_epi8_mask*(u: MMask16, a: M128i, b: M128i): MMask16 {.importc: "_mm_mask_cmpgt_epi8_mask".}

func mm256_cmpgt_epu8_mask*(a: M256i, b: M256i): MMask32 {.importc: "_mm256_cmpgt_epu8_mask".}

func mm256_cmpgt_epi8_mask*(a: M256i, b: M256i): MMask32 {.importc: "_mm256_cmpgt_epi8_mask".}

func mm256_mask_cmpgt_epu8_mask*(u: MMask32, a: M256i, b: M256i): MMask32 {.importc: "_mm256_mask_cmpgt_epu8_mask".}

func mm256_mask_cmpgt_epi8_mask*(u: MMask32, a: M256i, b: M256i): MMask32 {.importc: "_mm256_mask_cmpgt_epi8_mask".}

func mm_cmpgt_epu16_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpgt_epu16_mask".}

func mm_cmpgt_epi16_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpgt_epi16_mask".}

func mm_mask_cmpgt_epu16_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpgt_epu16_mask".}

func mm_mask_cmpgt_epi16_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpgt_epi16_mask".}

func mm256_cmpgt_epu16_mask*(a: M256i, b: M256i): MMask16 {.importc: "_mm256_cmpgt_epu16_mask".}

func mm256_cmpgt_epi16_mask*(a: M256i, b: M256i): MMask16 {.importc: "_mm256_cmpgt_epi16_mask".}

func mm256_mask_cmpgt_epu16_mask*(u: MMask16, a: M256i, b: M256i): MMask16 {.importc: "_mm256_mask_cmpgt_epu16_mask".}

func mm256_mask_cmpgt_epi16_mask*(u: MMask16, a: M256i, b: M256i): MMask16 {.importc: "_mm256_mask_cmpgt_epi16_mask".}

func mm_testn_epi8_mask*(a: M128i, b: M128i): MMask16 {.importc: "_mm_testn_epi8_mask".}

func mm_mask_testn_epi8_mask*(u: MMask16, a: M128i, b: M128i): MMask16 {.importc: "_mm_mask_testn_epi8_mask".}

func mm256_testn_epi8_mask*(a: M256i, b: M256i): MMask32 {.importc: "_mm256_testn_epi8_mask".}

func mm256_mask_testn_epi8_mask*(u: MMask32, a: M256i, b: M256i): MMask32 {.importc: "_mm256_mask_testn_epi8_mask".}

func mm_testn_epi16_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_testn_epi16_mask".}

func mm_mask_testn_epi16_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_testn_epi16_mask".}

func mm256_testn_epi16_mask*(a: M256i, b: M256i): MMask16 {.importc: "_mm256_testn_epi16_mask".}

func mm256_mask_testn_epi16_mask*(u: MMask16, a: M256i, b: M256i): MMask16 {.importc: "_mm256_mask_testn_epi16_mask".}

func mm256_mask_shuffle_epi8*(w: M256i, u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_shuffle_epi8".}

func mm256_maskz_shuffle_epi8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_shuffle_epi8".}

func mm_mask_shuffle_epi8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_shuffle_epi8".}

func mm_maskz_shuffle_epi8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_shuffle_epi8".}

func mm256_maskz_packs_epi16*(m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_packs_epi16".}

func mm256_mask_packs_epi16*(w: M256i, m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_packs_epi16".}

func mm_maskz_packs_epi16*(m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_packs_epi16".}

func mm_mask_packs_epi16*(w: M128i, m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_packs_epi16".}

func mm256_maskz_packus_epi16*(m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_packus_epi16".}

func mm256_mask_packus_epi16*(w: M256i, m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_packus_epi16".}

func mm_maskz_packus_epi16*(m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_packus_epi16".}

func mm_mask_packus_epi16*(w: M128i, m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_packus_epi16".}

func mm256_mask_abs_epi8*(w: M256i, u: MMask32, a: M256i): M256i {.importc: "_mm256_mask_abs_epi8".}

func mm256_maskz_abs_epi8*(u: MMask32, a: M256i): M256i {.importc: "_mm256_maskz_abs_epi8".}

func mm_mask_abs_epi8*(w: M128i, u: MMask16, a: M128i): M128i {.importc: "_mm_mask_abs_epi8".}

func mm_maskz_abs_epi8*(u: MMask16, a: M128i): M128i {.importc: "_mm_maskz_abs_epi8".}

func mm256_mask_abs_epi16*(w: M256i, u: MMask16, a: M256i): M256i {.importc: "_mm256_mask_abs_epi16".}

func mm256_maskz_abs_epi16*(u: MMask16, a: M256i): M256i {.importc: "_mm256_maskz_abs_epi16".}

func mm_mask_abs_epi16*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_abs_epi16".}

func mm_maskz_abs_epi16*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_abs_epi16".}

func mm256_cmpneq_epu8_mask*(x: M256i, y: M256i): MMask32 {.importc: "_mm256_cmpneq_epu8_mask".}

func mm256_cmplt_epu8_mask*(x: M256i, y: M256i): MMask32 {.importc: "_mm256_cmplt_epu8_mask".}

func mm256_cmpge_epu8_mask*(x: M256i, y: M256i): MMask32 {.importc: "_mm256_cmpge_epu8_mask".}

func mm256_cmple_epu8_mask*(x: M256i, y: M256i): MMask32 {.importc: "_mm256_cmple_epu8_mask".}

func mm256_cmpneq_epu16_mask*(x: M256i, y: M256i): MMask16 {.importc: "_mm256_cmpneq_epu16_mask".}

func mm256_cmplt_epu16_mask*(x: M256i, y: M256i): MMask16 {.importc: "_mm256_cmplt_epu16_mask".}

func mm256_cmpge_epu16_mask*(x: M256i, y: M256i): MMask16 {.importc: "_mm256_cmpge_epu16_mask".}

func mm256_cmple_epu16_mask*(x: M256i, y: M256i): MMask16 {.importc: "_mm256_cmple_epu16_mask".}

func mm256_storeu_epi16*(p: pointer, a: M256i): void {.importc: "_mm256_storeu_epi16".}

func mm256_mask_storeu_epi16*(p: pointer, u: MMask16, a: M256i): void {.importc: "_mm256_mask_storeu_epi16".}

func mm_storeu_epi16*(p: pointer, a: M128i): void {.importc: "_mm_storeu_epi16".}

func mm_mask_storeu_epi16*(p: pointer, u: MMask8, a: M128i): void {.importc: "_mm_mask_storeu_epi16".}

func mm_mask_adds_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_adds_epi16".}

func mm_mask_subs_epi8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_subs_epi8".}

func mm_maskz_subs_epi8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_subs_epi8".}

func mm_mask_subs_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_subs_epi16".}

func mm_maskz_subs_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_subs_epi16".}

func mm_mask_subs_epu8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_subs_epu8".}

func mm_maskz_subs_epu8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_subs_epu8".}

func mm_mask_subs_epu16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_subs_epu16".}

func mm_maskz_subs_epu16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_subs_epu16".}

func mm256_mask_srl_epi16*(w: M256i, u: MMask16, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_srl_epi16".}

func mm256_maskz_srl_epi16*(u: MMask16, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_srl_epi16".}

func mm_mask_srl_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_srl_epi16".}

func mm_maskz_srl_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_srl_epi16".}

func mm256_mask_sra_epi16*(w: M256i, u: MMask16, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_sra_epi16".}

func mm256_maskz_sra_epi16*(u: MMask16, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_sra_epi16".}

func mm_mask_sra_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sra_epi16".}

func mm_maskz_sra_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sra_epi16".}

func mm_maskz_adds_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_adds_epi16".}

func mm_mask_adds_epu8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_adds_epu8".}

func mm_maskz_adds_epu8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_adds_epu8".}

func mm_mask_adds_epu16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_adds_epu16".}

func mm_maskz_adds_epu16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_adds_epu16".}

func mm_mask_sub_epi8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sub_epi8".}

func mm_maskz_sub_epi8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sub_epi8".}

func mm_mask_sub_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sub_epi16".}

func mm_maskz_sub_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sub_epi16".}

func mm_mask_adds_epi8*(w: M128i, u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_adds_epi8".}

func mm_maskz_adds_epi8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_adds_epi8".}

func mm_cvtepi16_epi8*(a: M128i): M128i {.importc: "_mm_cvtepi16_epi8".}

func mm_mask_cvtepi16_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtepi16_storeu_epi8".}

func mm_mask_cvtepi16_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi16_epi8".}

func mm_maskz_cvtepi16_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi16_epi8".}

func mm256_srav_epi16*(a: M256i, b: M256i): M256i {.importc: "_mm256_srav_epi16".}

func mm256_mask_srav_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_srav_epi16".}

func mm256_maskz_srav_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_srav_epi16".}

func mm_srav_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_srav_epi16".}

func mm_mask_srav_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_srav_epi16".}

func mm_maskz_srav_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_srav_epi16".}

func mm256_srlv_epi16*(a: M256i, b: M256i): M256i {.importc: "_mm256_srlv_epi16".}

func mm256_mask_srlv_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_srlv_epi16".}

func mm256_maskz_srlv_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_srlv_epi16".}

func mm_srlv_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_srlv_epi16".}

func mm_mask_srlv_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_srlv_epi16".}

func mm_maskz_srlv_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_srlv_epi16".}

func mm256_sllv_epi16*(a: M256i, b: M256i): M256i {.importc: "_mm256_sllv_epi16".}

func mm256_mask_sllv_epi16*(w: M256i, u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_sllv_epi16".}

func mm256_maskz_sllv_epi16*(u: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_sllv_epi16".}

func mm_sllv_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_sllv_epi16".}

func mm_mask_sllv_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sllv_epi16".}

func mm_maskz_sllv_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sllv_epi16".}

func mm_mask_sll_epi16*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sll_epi16".}

func mm_maskz_sll_epi16*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sll_epi16".}

func mm256_mask_sll_epi16*(w: M256i, u: MMask16, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_sll_epi16".}

func mm256_maskz_sll_epi16*(u: MMask16, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_sll_epi16".}

func mm256_maskz_packus_epi32*(m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_packus_epi32".}

func mm256_mask_packus_epi32*(w: M256i, m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_packus_epi32".}

func mm_maskz_packus_epi32*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_packus_epi32".}

func mm_mask_packus_epi32*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_packus_epi32".}

func mm256_maskz_packs_epi32*(m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_packs_epi32".}

func mm256_mask_packs_epi32*(w: M256i, m: MMask16, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_packs_epi32".}

func mm_maskz_packs_epi32*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_packs_epi32".}

func mm_mask_packs_epi32*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_packs_epi32".}

func mm_mask_cmpneq_epu8_mask*(m: MMask16, x: M128i, y: M128i): MMask16 {.importc: "_mm_mask_cmpneq_epu8_mask".}

func mm_mask_cmplt_epu8_mask*(m: MMask16, x: M128i, y: M128i): MMask16 {.importc: "_mm_mask_cmplt_epu8_mask".}

func mm_mask_cmpge_epu8_mask*(m: MMask16, x: M128i, y: M128i): MMask16 {.importc: "_mm_mask_cmpge_epu8_mask".}

func mm_mask_cmple_epu8_mask*(m: MMask16, x: M128i, y: M128i): MMask16 {.importc: "_mm_mask_cmple_epu8_mask".}

func mm_mask_cmpneq_epu16_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpneq_epu16_mask".}

func mm_mask_cmplt_epu16_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmplt_epu16_mask".}

func mm_mask_cmpge_epu16_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpge_epu16_mask".}

func mm_mask_cmple_epu16_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmple_epu16_mask".}

func mm_mask_cmpneq_epi8_mask*(m: MMask16, x: M128i, y: M128i): MMask16 {.importc: "_mm_mask_cmpneq_epi8_mask".}

func mm_mask_cmplt_epi8_mask*(m: MMask16, x: M128i, y: M128i): MMask16 {.importc: "_mm_mask_cmplt_epi8_mask".}

func mm_mask_cmpge_epi8_mask*(m: MMask16, x: M128i, y: M128i): MMask16 {.importc: "_mm_mask_cmpge_epi8_mask".}

func mm_mask_cmple_epi8_mask*(m: MMask16, x: M128i, y: M128i): MMask16 {.importc: "_mm_mask_cmple_epi8_mask".}

func mm_mask_cmpneq_epi16_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpneq_epi16_mask".}

func mm_mask_cmplt_epi16_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmplt_epi16_mask".}

func mm_mask_cmpge_epi16_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpge_epi16_mask".}

func mm_mask_cmple_epi16_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmple_epi16_mask".}

func mm256_mask_cmpneq_epu8_mask*(m: MMask32, x: M256i, y: M256i): MMask32 {.importc: "_mm256_mask_cmpneq_epu8_mask".}

func mm256_mask_cmplt_epu8_mask*(m: MMask32, x: M256i, y: M256i): MMask32 {.importc: "_mm256_mask_cmplt_epu8_mask".}

func mm256_mask_cmpge_epu8_mask*(m: MMask32, x: M256i, y: M256i): MMask32 {.importc: "_mm256_mask_cmpge_epu8_mask".}

func mm256_mask_cmple_epu8_mask*(m: MMask32, x: M256i, y: M256i): MMask32 {.importc: "_mm256_mask_cmple_epu8_mask".}

func mm256_mask_cmpneq_epu16_mask*(m: MMask16, x: M256i, y: M256i): MMask16 {.importc: "_mm256_mask_cmpneq_epu16_mask".}

func mm256_mask_cmplt_epu16_mask*(m: MMask16, x: M256i, y: M256i): MMask16 {.importc: "_mm256_mask_cmplt_epu16_mask".}

func mm256_mask_cmpge_epu16_mask*(m: MMask16, x: M256i, y: M256i): MMask16 {.importc: "_mm256_mask_cmpge_epu16_mask".}

func mm256_mask_cmple_epu16_mask*(m: MMask16, x: M256i, y: M256i): MMask16 {.importc: "_mm256_mask_cmple_epu16_mask".}

func mm256_mask_cmpneq_epi8_mask*(m: MMask32, x: M256i, y: M256i): MMask32 {.importc: "_mm256_mask_cmpneq_epi8_mask".}

func mm256_mask_cmplt_epi8_mask*(m: MMask32, x: M256i, y: M256i): MMask32 {.importc: "_mm256_mask_cmplt_epi8_mask".}

func mm256_mask_cmpge_epi8_mask*(m: MMask32, x: M256i, y: M256i): MMask32 {.importc: "_mm256_mask_cmpge_epi8_mask".}

func mm256_mask_cmple_epi8_mask*(m: MMask32, x: M256i, y: M256i): MMask32 {.importc: "_mm256_mask_cmple_epi8_mask".}

func mm256_mask_cmpneq_epi16_mask*(m: MMask16, x: M256i, y: M256i): MMask16 {.importc: "_mm256_mask_cmpneq_epi16_mask".}

func mm256_mask_cmplt_epi16_mask*(m: MMask16, x: M256i, y: M256i): MMask16 {.importc: "_mm256_mask_cmplt_epi16_mask".}

func mm256_mask_cmpge_epi16_mask*(m: MMask16, x: M256i, y: M256i): MMask16 {.importc: "_mm256_mask_cmpge_epi16_mask".}

func mm256_mask_cmple_epi16_mask*(m: MMask16, x: M256i, y: M256i): MMask16 {.importc: "_mm256_mask_cmple_epi16_mask".}

func mm_mask_reduce_add_epi16*(m: MMask8, w: M128i): int16 {.importc: "_mm_mask_reduce_add_epi16".}

func mm_mask_reduce_mul_epi16*(m: MMask8, w: M128i): int16 {.importc: "_mm_mask_reduce_mul_epi16".}

func mm_mask_reduce_and_epi16*(m: MMask8, w: M128i): int16 {.importc: "_mm_mask_reduce_and_epi16".}

func mm_mask_reduce_or_epi16*(m: MMask8, w: M128i): int16 {.importc: "_mm_mask_reduce_or_epi16".}

func mm_mask_reduce_max_epi16*(m: MMask16, v: M128i): int16 {.importc: "_mm_mask_reduce_max_epi16".}

func mm_mask_reduce_max_epu16*(m: MMask16, v: M128i): uint16 {.importc: "_mm_mask_reduce_max_epu16".}

func mm_mask_reduce_min_epi16*(m: MMask16, v: M128i): int16 {.importc: "_mm_mask_reduce_min_epi16".}

func mm_mask_reduce_min_epu16*(m: MMask16, v: M128i): uint16 {.importc: "_mm_mask_reduce_min_epu16".}

func mm256_mask_reduce_add_epi16*(m: MMask16, w: M256i): int16 {.importc: "_mm256_mask_reduce_add_epi16".}

func mm256_mask_reduce_mul_epi16*(m: MMask16, w: M256i): int16 {.importc: "_mm256_mask_reduce_mul_epi16".}

func mm256_mask_reduce_and_epi16*(m: MMask16, w: M256i): int16 {.importc: "_mm256_mask_reduce_and_epi16".}

func mm256_mask_reduce_or_epi16*(m: MMask16, w: M256i): int16 {.importc: "_mm256_mask_reduce_or_epi16".}

func mm256_mask_reduce_max_epi16*(m: MMask16, v: M256i): int16 {.importc: "_mm256_mask_reduce_max_epi16".}

func mm256_mask_reduce_max_epu16*(m: MMask16, v: M256i): uint16 {.importc: "_mm256_mask_reduce_max_epu16".}

func mm256_mask_reduce_min_epi16*(m: MMask16, v: M256i): int16 {.importc: "_mm256_mask_reduce_min_epi16".}

func mm256_mask_reduce_min_epu16*(m: MMask16, v: M256i): uint16 {.importc: "_mm256_mask_reduce_min_epu16".}

func mm_mask_reduce_add_epi8*(m: MMask16, w: M128i): int8 {.importc: "_mm_mask_reduce_add_epi8".}

func mm_mask_reduce_mul_epi8*(m: MMask16, w: M128i): int8 {.importc: "_mm_mask_reduce_mul_epi8".}

func mm_mask_reduce_and_epi8*(m: MMask16, w: M128i): int8 {.importc: "_mm_mask_reduce_and_epi8".}

func mm_mask_reduce_or_epi8*(m: MMask16, w: M128i): int8 {.importc: "_mm_mask_reduce_or_epi8".}

func mm_mask_reduce_max_epi8*(m: MMask16, v: M128i): int8 {.importc: "_mm_mask_reduce_max_epi8".}

func mm_mask_reduce_max_epu8*(m: MMask16, v: M128i): uint8 {.importc: "_mm_mask_reduce_max_epu8".}

func mm_mask_reduce_min_epi8*(m: MMask16, v: M128i): int8 {.importc: "_mm_mask_reduce_min_epi8".}

func mm_mask_reduce_min_epu8*(m: MMask16, v: M128i): uint8 {.importc: "_mm_mask_reduce_min_epu8".}

func mm256_mask_reduce_add_epi8*(m: MMask32, w: M256i): int8 {.importc: "_mm256_mask_reduce_add_epi8".}

func mm256_mask_reduce_mul_epi8*(m: MMask32, w: M256i): int8 {.importc: "_mm256_mask_reduce_mul_epi8".}

func mm256_mask_reduce_and_epi8*(m: MMask32, w: M256i): int8 {.importc: "_mm256_mask_reduce_and_epi8".}

func mm256_mask_reduce_or_epi8*(m: MMask32, w: M256i): int8 {.importc: "_mm256_mask_reduce_or_epi8".}

func mm256_mask_reduce_max_epi8*(m: MMask32, v: M256i): int8 {.importc: "_mm256_mask_reduce_max_epi8".}

func mm256_mask_reduce_max_epu8*(m: MMask32, v: M256i): uint8 {.importc: "_mm256_mask_reduce_max_epu8".}

func mm256_mask_reduce_min_epi8*(m: MMask32, v: M256i): int8 {.importc: "_mm256_mask_reduce_min_epi8".}

func mm256_mask_reduce_min_epu8*(m: MMask32, v: M256i): uint8 {.importc: "_mm256_mask_reduce_min_epu8".}