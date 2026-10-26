import sse

type
  M128i* {.importc: "__m128i", header: "emmintrin.h", bycopy.} = object
  M128d* {.importc: "__m128d", header: "emmintrin.h", bycopy.} = object
  M128i_u* {.importc: "__m128i_u", header: "emmintrin.h", bycopy.} = object
  
## [Macro Original]
## #define _EMMINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_SSE2__

## [Macro Original]
## #define _MM_SHUFFLE2(fp1,fp0) \
## (((fp1) << 1) | (fp0))

func mm_set_sd*(f: float64): M128d {.importc: "_mm_set_sd".}

func mm_set1_pd*(f: float64): M128d {.importc: "_mm_set1_pd".}

func mm_set_pd1*(f: float64): M128d {.importc: "_mm_set_pd1".}

func mm_set_pd*(w: float64, x: float64): M128d {.importc: "_mm_set_pd".}

func mm_setr_pd*(w: float64, x: float64): M128d {.importc: "_mm_setr_pd".}

func mm_undefined_pd*(): M128d {.importc: "_mm_undefined_pd".}

func mm_setzero_pd*(): M128d {.importc: "_mm_setzero_pd".}

func mm_move_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_move_sd".}

func mm_load_pd*(p: ptr float64): M128d {.importc: "_mm_load_pd".}

func mm_loadu_pd*(p: ptr float64): M128d {.importc: "_mm_loadu_pd".}

func mm_load1_pd*(p: ptr float64): M128d {.importc: "_mm_load1_pd".}

func mm_load_sd*(p: ptr float64): M128d {.importc: "_mm_load_sd".}

func mm_load_pd1*(p: ptr float64): M128d {.importc: "_mm_load_pd1".}

func mm_loadr_pd*(p: ptr float64): M128d {.importc: "_mm_loadr_pd".}

func mm_store_pd*(p: ptr float64, a: M128d): void {.importc: "_mm_store_pd".}

func mm_storeu_pd*(p: ptr float64, a: M128d): void {.importc: "_mm_storeu_pd".}

func mm_store_sd*(p: ptr float64, a: M128d): void {.importc: "_mm_store_sd".}

func mm_cvtsd_f64*(a: M128d): float64 {.importc: "_mm_cvtsd_f64".}

func mm_storel_pd*(p: ptr float64, a: M128d): void {.importc: "_mm_storel_pd".}

func mm_storeh_pd*(p: ptr float64, a: M128d): void {.importc: "_mm_storeh_pd".}

func mm_store1_pd*(p: ptr float64, a: M128d): void {.importc: "_mm_store1_pd".}

func mm_store_pd1*(p: ptr float64, a: M128d): void {.importc: "_mm_store_pd1".}

func mm_storer_pd*(p: ptr float64, a: M128d): void {.importc: "_mm_storer_pd".}

func mm_cvtsi128_si32*(a: M128i): int32 {.importc: "_mm_cvtsi128_si32".}

func mm_cvtsi128_si64*(a: M128i): int64 {.importc: "_mm_cvtsi128_si64".}

func mm_cvtsi128_si64x*(a: M128i): int64 {.importc: "_mm_cvtsi128_si64x".}

func mm_add_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_add_pd".}

func mm_add_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_add_sd".}

func mm_sub_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_sub_pd".}

func mm_sub_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_sub_sd".}

func mm_mul_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_mul_pd".}

func mm_mul_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_mul_sd".}

func mm_div_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_div_pd".}

func mm_div_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_div_sd".}

func mm_sqrt_pd*(a: M128d): M128d {.importc: "_mm_sqrt_pd".}

func mm_sqrt_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_sqrt_sd".}

func mm_min_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_min_pd".}

func mm_min_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_min_sd".}

func mm_max_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_max_pd".}

func mm_max_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_max_sd".}

func mm_and_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_and_pd".}

func mm_andnot_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_andnot_pd".}

func mm_or_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_or_pd".}

func mm_xor_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_xor_pd".}

func mm_cmpeq_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpeq_pd".}

func mm_cmplt_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmplt_pd".}

func mm_cmple_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmple_pd".}

func mm_cmpgt_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpgt_pd".}

func mm_cmpge_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpge_pd".}

func mm_cmpneq_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpneq_pd".}

func mm_cmpnlt_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpnlt_pd".}

func mm_cmpnle_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpnle_pd".}

func mm_cmpngt_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpngt_pd".}

func mm_cmpnge_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpnge_pd".}

func mm_cmpord_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpord_pd".}

func mm_cmpunord_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpunord_pd".}

func mm_cmpeq_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpeq_sd".}

func mm_cmplt_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmplt_sd".}

func mm_cmple_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmple_sd".}

func mm_cmpgt_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpgt_sd".}

func mm_cmpge_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpge_sd".}

func mm_cmpneq_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpneq_sd".}

func mm_cmpnlt_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpnlt_sd".}

func mm_cmpnle_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpnle_sd".}

func mm_cmpngt_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpngt_sd".}

func mm_cmpnge_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpnge_sd".}

func mm_cmpord_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpord_sd".}

func mm_cmpunord_sd*(a: M128d, b: M128d): M128d {.importc: "_mm_cmpunord_sd".}

func mm_comieq_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_comieq_sd".}

func mm_comilt_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_comilt_sd".}

func mm_comile_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_comile_sd".}

func mm_comigt_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_comigt_sd".}

func mm_comige_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_comige_sd".}

func mm_comineq_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_comineq_sd".}

func mm_ucomieq_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_ucomieq_sd".}

func mm_ucomilt_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_ucomilt_sd".}

func mm_ucomile_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_ucomile_sd".}

func mm_ucomigt_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_ucomigt_sd".}

func mm_ucomige_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_ucomige_sd".}

func mm_ucomineq_sd*(a: M128d, b: M128d): int32 {.importc: "_mm_ucomineq_sd".}

func mm_set_epi64x*(q1: int64, q0: int64): M128i {.importc: "_mm_set_epi64x".}

func mm_set_epi64*(q1: M64, q0: M64): M128i {.importc: "_mm_set_epi64".}

func mm_set_epi32*(q3: int32, q2: int32, q1: int32, q0: int32): M128i {.importc: "_mm_set_epi32".}

func mm_set_epi16*(q7: int16, q6: int16, q5: int16, q4: int16, q3: int16, q2: int16, q1: int16, q0: int16): M128i {.importc: "_mm_set_epi16".}

func mm_set_epi8*(q15: int8, q14: int8, q13: int8, q12: int8, q11: int8, q10: int8, q09: int8, q08: int8, q07: int8, q06: int8, q05: int8, q04: int8, q03: int8, q02: int8, q01: int8, q00: int8): M128i {.importc: "_mm_set_epi8".}

func mm_set1_epi64x*(a: int64): M128i {.importc: "_mm_set1_epi64x".}

func mm_set1_epi64*(a: M64): M128i {.importc: "_mm_set1_epi64".}

func mm_set1_epi32*(a: int32): M128i {.importc: "_mm_set1_epi32".}

func mm_set1_epi16*(a: int16): M128i {.importc: "_mm_set1_epi16".}

func mm_set1_epi8*(a: int8): M128i {.importc: "_mm_set1_epi8".}

func mm_setr_epi64*(q0: M64, q1: M64): M128i {.importc: "_mm_setr_epi64".}

func mm_setr_epi32*(q0: int32, q1: int32, q2: int32, q3: int32): M128i {.importc: "_mm_setr_epi32".}

func mm_setr_epi16*(q0: int16, q1: int16, q2: int16, q3: int16, q4: int16, q5: int16, q6: int16, q7: int16): M128i {.importc: "_mm_setr_epi16".}

func mm_setr_epi8*(q00: int8, q01: int8, q02: int8, q03: int8, q04: int8, q05: int8, q06: int8, q07: int8, q08: int8, q09: int8, q10: int8, q11: int8, q12: int8, q13: int8, q14: int8, q15: int8): M128i {.importc: "_mm_setr_epi8".}

func mm_load_si128*(p: ptr M128i): M128i {.importc: "_mm_load_si128".}

func mm_loadu_si128*(p: ptr M128i): M128i {.importc: "_mm_loadu_si128".}

func mm_loadl_epi64*(p: ptr M128i): M128i {.importc: "_mm_loadl_epi64".}

func mm_loadu_si64*(p: pointer): M128i {.importc: "_mm_loadu_si64".}

func mm_loadu_si32*(p: pointer): M128i {.importc: "_mm_loadu_si32".}

func mm_loadu_si16*(p: pointer): M128i {.importc: "_mm_loadu_si16".}

func mm_store_si128*(p: ptr M128i, b: M128i): void {.importc: "_mm_store_si128".}

func mm_storeu_si128*(p: ptr M128i, b: M128i): void {.importc: "_mm_storeu_si128".}

func mm_storel_epi64*(p: ptr M128i, b: M128i): void {.importc: "_mm_storel_epi64".}

func mm_storeu_si64*(p: pointer, b: M128i): void {.importc: "_mm_storeu_si64".}

func mm_storeu_si32*(p: pointer, b: M128i): void {.importc: "_mm_storeu_si32".}

func mm_storeu_si16*(p: pointer, b: M128i): void {.importc: "_mm_storeu_si16".}

func mm_movepi64_pi64*(b: M128i): M64 {.importc: "_mm_movepi64_pi64".}

func mm_movpi64_epi64*(a: M64): M128i {.importc: "_mm_movpi64_epi64".}

func mm_move_epi64*(a: M128i): M128i {.importc: "_mm_move_epi64".}

func mm_undefined_si128*(): M128i {.importc: "_mm_undefined_si128".}

func mm_setzero_si128*(): M128i {.importc: "_mm_setzero_si128".}

func mm_cvtepi32_pd*(a: M128i): M128d {.importc: "_mm_cvtepi32_pd".}

func mm_cvtepi32_ps*(a: M128i): M128 {.importc: "_mm_cvtepi32_ps".}

func mm_cvtpd_epi32*(a: M128d): M128i {.importc: "_mm_cvtpd_epi32".}

func mm_cvtpd_pi32*(a: M128d): M64 {.importc: "_mm_cvtpd_pi32".}

func mm_cvtpd_ps*(a: M128d): M128 {.importc: "_mm_cvtpd_ps".}

func mm_cvttpd_epi32*(a: M128d): M128i {.importc: "_mm_cvttpd_epi32".}

func mm_cvttpd_pi32*(a: M128d): M64 {.importc: "_mm_cvttpd_pi32".}

func mm_cvtpi32_pd*(a: M64): M128d {.importc: "_mm_cvtpi32_pd".}

func mm_cvtps_epi32*(a: M128): M128i {.importc: "_mm_cvtps_epi32".}

func mm_cvttps_epi32*(a: M128): M128i {.importc: "_mm_cvttps_epi32".}

func mm_cvtps_pd*(a: M128): M128d {.importc: "_mm_cvtps_pd".}

func mm_cvtsd_si32*(a: M128d): int32 {.importc: "_mm_cvtsd_si32".}

func mm_cvtsd_si64*(a: M128d): int64 {.importc: "_mm_cvtsd_si64".}

func mm_cvtsd_si64x*(a: M128d): int64 {.importc: "_mm_cvtsd_si64x".}

func mm_cvttsd_si32*(a: M128d): int32 {.importc: "_mm_cvttsd_si32".}

func mm_cvttsd_si64*(a: M128d): int64 {.importc: "_mm_cvttsd_si64".}

func mm_cvttsd_si64x*(a: M128d): int64 {.importc: "_mm_cvttsd_si64x".}

func mm_cvtsd_ss*(a: M128, b: M128d): M128 {.importc: "_mm_cvtsd_ss".}

func mm_cvtsi32_sd*(a: M128d, b: int32): M128d {.importc: "_mm_cvtsi32_sd".}

func mm_cvtsi64_sd*(a: M128d, b: int64): M128d {.importc: "_mm_cvtsi64_sd".}

func mm_cvtsi64x_sd*(a: M128d, b: int64): M128d {.importc: "_mm_cvtsi64x_sd".}

func mm_cvtss_sd*(a: M128d, b: M128): M128d {.importc: "_mm_cvtss_sd".}

func mm_shuffle_pd*(a: M128d, b: M128d, mask: int32): M128d {.importc: "_mm_shuffle_pd".}

## [Macro Original]
## #define _mm_shuffle_pd(A, B, N)						\
## ((__m128d)__builtin_ia32_shufpd ((__v2df)(__m128d)(A),		\
## (__v2df)(__m128d)(B), (int)(N)))

func mm_unpackhi_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_unpackhi_pd".}

func mm_unpacklo_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_unpacklo_pd".}

func mm_loadh_pd*(a: M128d, b: ptr float64): M128d {.importc: "_mm_loadh_pd".}

func mm_loadl_pd*(a: M128d, b: ptr float64): M128d {.importc: "_mm_loadl_pd".}

func mm_movemask_pd*(a: M128d): int32 {.importc: "_mm_movemask_pd".}

func mm_packs_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_packs_epi16".}

func mm_packs_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_packs_epi32".}

func mm_packus_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_packus_epi16".}

func mm_unpackhi_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_unpackhi_epi8".}

func mm_unpackhi_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_unpackhi_epi16".}

func mm_unpackhi_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_unpackhi_epi32".}

func mm_unpackhi_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_unpackhi_epi64".}

func mm_unpacklo_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_unpacklo_epi8".}

func mm_unpacklo_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_unpacklo_epi16".}

func mm_unpacklo_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_unpacklo_epi32".}

func mm_unpacklo_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_unpacklo_epi64".}

func mm_add_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_add_epi8".}

func mm_add_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_add_epi16".}

func mm_add_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_add_epi32".}

func mm_add_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_add_epi64".}

func mm_adds_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_adds_epi8".}

func mm_adds_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_adds_epi16".}

func mm_adds_epu8*(a: M128i, b: M128i): M128i {.importc: "_mm_adds_epu8".}

func mm_adds_epu16*(a: M128i, b: M128i): M128i {.importc: "_mm_adds_epu16".}

func mm_sub_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_sub_epi8".}

func mm_sub_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_sub_epi16".}

func mm_sub_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_sub_epi32".}

func mm_sub_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_sub_epi64".}

func mm_subs_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_subs_epi8".}

func mm_subs_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_subs_epi16".}

func mm_subs_epu8*(a: M128i, b: M128i): M128i {.importc: "_mm_subs_epu8".}

func mm_subs_epu16*(a: M128i, b: M128i): M128i {.importc: "_mm_subs_epu16".}

func mm_madd_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_madd_epi16".}

func mm_mulhi_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_mulhi_epi16".}

func mm_mullo_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_mullo_epi16".}

func mm_mul_su32*(a: M64, b: M64): M64 {.importc: "_mm_mul_su32".}

func mm_mul_epu32*(a: M128i, b: M128i): M128i {.importc: "_mm_mul_epu32".}

func mm_slli_epi16*(a: M128i, b: int32): M128i {.importc: "_mm_slli_epi16".}

func mm_slli_epi32*(a: M128i, b: int32): M128i {.importc: "_mm_slli_epi32".}

func mm_slli_epi64*(a: M128i, b: int32): M128i {.importc: "_mm_slli_epi64".}

func mm_srai_epi16*(a: M128i, b: int32): M128i {.importc: "_mm_srai_epi16".}

func mm_srai_epi32*(a: M128i, b: int32): M128i {.importc: "_mm_srai_epi32".}

func mm_bsrli_si128*(a: M128i, n: int32): M128i {.importc: "_mm_bsrli_si128".}

func mm_bslli_si128*(a: M128i, n: int32): M128i {.importc: "_mm_bslli_si128".}

func mm_srli_si128*(a: M128i, n: int32): M128i {.importc: "_mm_srli_si128".}

func mm_slli_si128*(a: M128i, n: int32): M128i {.importc: "_mm_slli_si128".}

## [Macro Original]
## #define _mm_bsrli_si128(A, N) \
## ((__m128i)__builtin_ia32_psrldqi128 ((__m128i)(A), (int)(N) * 8))

## [Macro Original]
## #define _mm_bslli_si128(A, N) \
## ((__m128i)__builtin_ia32_pslldqi128 ((__m128i)(A), (int)(N) * 8))

## [Macro Original]
## #define _mm_srli_si128(A, N) \
## ((__m128i)__builtin_ia32_psrldqi128 ((__m128i)(A), (int)(N) * 8))

## [Macro Original]
## #define _mm_slli_si128(A, N) \
## ((__m128i)__builtin_ia32_pslldqi128 ((__m128i)(A), (int)(N) * 8))

func mm_srli_epi16*(a: M128i, b: int32): M128i {.importc: "_mm_srli_epi16".}

func mm_srli_epi32*(a: M128i, b: int32): M128i {.importc: "_mm_srli_epi32".}

func mm_srli_epi64*(a: M128i, b: int32): M128i {.importc: "_mm_srli_epi64".}

func mm_sll_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_sll_epi16".}

func mm_sll_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_sll_epi32".}

func mm_sll_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_sll_epi64".}

func mm_sra_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_sra_epi16".}

func mm_sra_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_sra_epi32".}

func mm_srl_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_srl_epi16".}

func mm_srl_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_srl_epi32".}

func mm_srl_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_srl_epi64".}

func mm_and_si128*(a: M128i, b: M128i): M128i {.importc: "_mm_and_si128".}

func mm_andnot_si128*(a: M128i, b: M128i): M128i {.importc: "_mm_andnot_si128".}

func mm_or_si128*(a: M128i, b: M128i): M128i {.importc: "_mm_or_si128".}

func mm_xor_si128*(a: M128i, b: M128i): M128i {.importc: "_mm_xor_si128".}

func mm_cmpeq_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_cmpeq_epi8".}

func mm_cmpeq_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_cmpeq_epi16".}

func mm_cmpeq_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_cmpeq_epi32".}

func mm_cmplt_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_cmplt_epi8".}

func mm_cmplt_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_cmplt_epi16".}

func mm_cmplt_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_cmplt_epi32".}

func mm_cmpgt_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_cmpgt_epi8".}

func mm_cmpgt_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_cmpgt_epi16".}

func mm_cmpgt_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_cmpgt_epi32".}

func mm_cmp_pd*(x: M128d, y: M128d, p: int32): M128d {.importc: "_mm_cmp_pd".}

func mm_cmp_sd*(x: M128d, y: M128d, p: int32): M128d {.importc: "_mm_cmp_sd".}

## [Macro Original]
## #define _mm_cmp_pd(X, Y, P)						\
## ((__m128d) __builtin_ia32_cmppd ((__v2df)(__m128d)(X),		\
## (__v2df)(__m128d)(Y), (int)(P)))

## [Macro Original]
## #define _mm_cmp_sd(X, Y, P)						\
## ((__m128d) __builtin_ia32_cmpsd ((__v2df)(__m128d)(X),		\
## (__v2df)(__m128d)(Y), (int)(P)))

func mm_extract_epi16*(a: M128i, n: int32): int32 {.importc: "_mm_extract_epi16".}

func mm_insert_epi16*(a: M128i, d: int32, n: int32): M128i {.importc: "_mm_insert_epi16".}

## [Macro Original]
## #define _mm_extract_epi16(A, N) \
## ((int) (unsigned short) __builtin_ia32_vec_ext_v8hi ((__v8hi)(__m128i)(A), (int)(N)))

## [Macro Original]
## #define _mm_insert_epi16(A, D, N)				\
## ((__m128i) __builtin_ia32_vec_set_v8hi ((__v8hi)(__m128i)(A),	\
## (int)(D), (int)(N)))

func mm_max_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_max_epi16".}

func mm_max_epu8*(a: M128i, b: M128i): M128i {.importc: "_mm_max_epu8".}

func mm_min_epi16*(a: M128i, b: M128i): M128i {.importc: "_mm_min_epi16".}

func mm_min_epu8*(a: M128i, b: M128i): M128i {.importc: "_mm_min_epu8".}

func mm_movemask_epi8*(a: M128i): int32 {.importc: "_mm_movemask_epi8".}

func mm_mulhi_epu16*(a: M128i, b: M128i): M128i {.importc: "_mm_mulhi_epu16".}

func mm_shufflehi_epi16*(a: M128i, mask: int32): M128i {.importc: "_mm_shufflehi_epi16".}

func mm_shufflelo_epi16*(a: M128i, mask: int32): M128i {.importc: "_mm_shufflelo_epi16".}

func mm_shuffle_epi32*(a: M128i, mask: int32): M128i {.importc: "_mm_shuffle_epi32".}

## [Macro Original]
## #define _mm_shufflehi_epi16(A, N) \
## ((__m128i)__builtin_ia32_pshufhw ((__v8hi)(__m128i)(A), (int)(N)))

## [Macro Original]
## #define _mm_shufflelo_epi16(A, N) \
## ((__m128i)__builtin_ia32_pshuflw ((__v8hi)(__m128i)(A), (int)(N)))

## [Macro Original]
## #define _mm_shuffle_epi32(A, N) \
## ((__m128i)__builtin_ia32_pshufd ((__v4si)(__m128i)(A), (int)(N)))

func mm_maskmoveu_si128*(a: M128i, b: M128i, c: ptr int8): void {.importc: "_mm_maskmoveu_si128".}

func mm_avg_epu8*(a: M128i, b: M128i): M128i {.importc: "_mm_avg_epu8".}

func mm_avg_epu16*(a: M128i, b: M128i): M128i {.importc: "_mm_avg_epu16".}

func mm_sad_epu8*(a: M128i, b: M128i): M128i {.importc: "_mm_sad_epu8".}

func mm_stream_si32*(a: ptr int32, b: int32): void {.importc: "_mm_stream_si32".}

func mm_stream_si64*(a: ptr int64, b: int64): void {.importc: "_mm_stream_si64".}

func mm_stream_si128*(a: ptr M128i, b: M128i): void {.importc: "_mm_stream_si128".}

func mm_stream_pd*(a: ptr float64, b: M128d): void {.importc: "_mm_stream_pd".}

func mm_clflush*(a: pointer): void {.importc: "_mm_clflush".}

func mm_lfence*(): void {.importc: "_mm_lfence".}

func mm_mfence*(): void {.importc: "_mm_mfence".}

func mm_cvtsi32_si128*(a: int32): M128i {.importc: "_mm_cvtsi32_si128".}

func mm_cvtsi64_si128*(a: int64): M128i {.importc: "_mm_cvtsi64_si128".}

func mm_cvtsi64x_si128*(a: int64): M128i {.importc: "_mm_cvtsi64x_si128".}

func mm_castpd_ps*(a: M128d): M128 {.importc: "_mm_castpd_ps".}

func mm_castpd_si128*(a: M128d): M128i {.importc: "_mm_castpd_si128".}

func mm_castps_pd*(a: M128): M128d {.importc: "_mm_castps_pd".}

func mm_castps_si128*(a: M128): M128i {.importc: "_mm_castps_si128".}

func mm_castsi128_ps*(a: M128i): M128 {.importc: "_mm_castsi128_ps".}

func mm_castsi128_pd*(a: M128i): M128d {.importc: "_mm_castsi128_pd".}
