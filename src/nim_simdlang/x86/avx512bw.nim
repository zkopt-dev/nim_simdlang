import avx512f
import sse
import sse2
import avx

## [Macro Original]
## #define _AVX512BWINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512BW__

func mm_avx512_set_epi32*(q3: int32, q2: int32, q1: int32, q0: int32): M128i {.importc: "_mm_avx512_set_epi32".}

func mm_avx512_set_epi16*(q7: int16, q6: int16, q5: int16, q4: int16, q3: int16, q2: int16, q1: int16, q0: int16): M128i {.importc: "_mm_avx512_set_epi16".}

func mm_avx512_set_epi8*(q15: int8, q14: int8, q13: int8, q12: int8, q11: int8, q10: int8, q09: int8, q08: int8, q07: int8, q06: int8, q05: int8, q04: int8, q03: int8, q02: int8, q01: int8, q00: int8): M128i {.importc: "_mm_avx512_set_epi8".}

func mm512_kunpackw*(a: MMask32, b: MMask32): MMask32 {.importc: "_mm512_kunpackw".}

## [Macro Original]
## #define _kshiftli_mask32(X, Y)							\
## ((__mmask32) __builtin_ia32_kshiftlisi ((__mmask32)(X), (__mmask8)(Y)))

## [Macro Original]
## #define _kshiftri_mask32(X, Y)							\
## ((__mmask32) __builtin_ia32_kshiftrisi ((__mmask32)(X), (__mmask8)(Y)))

func mm512_mask_mov_epi16*(w: M512i, u: MMask32, a: M512i): M512i {.importc: "_mm512_mask_mov_epi16".}

func mm512_maskz_mov_epi16*(u: MMask32, a: M512i): M512i {.importc: "_mm512_maskz_mov_epi16".}

func mm512_loadu_epi16*(p: pointer): M512i {.importc: "_mm512_loadu_epi16".}

func mm512_mask_loadu_epi16*(w: M512i, u: MMask32, p: pointer): M512i {.importc: "_mm512_mask_loadu_epi16".}

func mm512_maskz_loadu_epi16*(u: MMask32, p: pointer): M512i {.importc: "_mm512_maskz_loadu_epi16".}

func mm512_storeu_epi16*(p: pointer, a: M512i): void {.importc: "_mm512_storeu_epi16".}

func mm512_mask_storeu_epi16*(p: pointer, u: MMask32, a: M512i): void {.importc: "_mm512_mask_storeu_epi16".}

func mm512_mask_mov_epi8*(w: M512i, u: MMask64, a: M512i): M512i {.importc: "_mm512_mask_mov_epi8".}

func mm512_maskz_mov_epi8*(u: MMask64, a: M512i): M512i {.importc: "_mm512_maskz_mov_epi8".}

func mm512_kunpackd*(a: MMask64, b: MMask64): MMask64 {.importc: "_mm512_kunpackd".}

func mm512_loadu_epi8*(p: pointer): M512i {.importc: "_mm512_loadu_epi8".}

func mm512_mask_loadu_epi8*(w: M512i, u: MMask64, p: pointer): M512i {.importc: "_mm512_mask_loadu_epi8".}

func mm512_maskz_loadu_epi8*(u: MMask64, p: pointer): M512i {.importc: "_mm512_maskz_loadu_epi8".}

func mm512_storeu_epi8*(p: pointer, a: M512i): void {.importc: "_mm512_storeu_epi8".}

func mm512_mask_storeu_epi8*(p: pointer, u: MMask64, a: M512i): void {.importc: "_mm512_mask_storeu_epi8".}

func mm512_sad_epu8*(a: M512i, b: M512i): M512i {.importc: "_mm512_sad_epu8".}

func mm512_cvtepi16_epi8*(a: M512i): M256i {.importc: "_mm512_cvtepi16_epi8".}

func mm512_mask_cvtepi16_storeu_epi8*(p: pointer, m: MMask32, a: M512i): void {.importc: "_mm512_mask_cvtepi16_storeu_epi8".}

func mm512_mask_cvtepi16_epi8*(o: M256i, m: MMask32, a: M512i): M256i {.importc: "_mm512_mask_cvtepi16_epi8".}

func mm512_maskz_cvtepi16_epi8*(m: MMask32, a: M512i): M256i {.importc: "_mm512_maskz_cvtepi16_epi8".}

func mm512_cvtsepi16_epi8*(a: M512i): M256i {.importc: "_mm512_cvtsepi16_epi8".}

func mm512_mask_cvtsepi16_storeu_epi8*(p: pointer, m: MMask32, a: M512i): void {.importc: "_mm512_mask_cvtsepi16_storeu_epi8".}

func mm512_mask_cvtsepi16_epi8*(o: M256i, m: MMask32, a: M512i): M256i {.importc: "_mm512_mask_cvtsepi16_epi8".}

func mm512_maskz_cvtsepi16_epi8*(m: MMask32, a: M512i): M256i {.importc: "_mm512_maskz_cvtsepi16_epi8".}

func mm512_cvtusepi16_epi8*(a: M512i): M256i {.importc: "_mm512_cvtusepi16_epi8".}

func mm512_mask_cvtusepi16_epi8*(o: M256i, m: MMask32, a: M512i): M256i {.importc: "_mm512_mask_cvtusepi16_epi8".}

func mm512_mask_cvtusepi16_storeu_epi8*(p: pointer, m: MMask32, a: M512i): void {.importc: "_mm512_mask_cvtusepi16_storeu_epi8".}

func mm512_maskz_cvtusepi16_epi8*(m: MMask32, a: M512i): M256i {.importc: "_mm512_maskz_cvtusepi16_epi8".}

func mm512_broadcastb_epi8*(a: M128i): M512i {.importc: "_mm512_broadcastb_epi8".}

func mm512_mask_broadcastb_epi8*(o: M512i, m: MMask64, a: M128i): M512i {.importc: "_mm512_mask_broadcastb_epi8".}

func mm512_maskz_broadcastb_epi8*(m: MMask64, a: M128i): M512i {.importc: "_mm512_maskz_broadcastb_epi8".}

func mm512_mask_set1_epi8*(o: M512i, m: MMask64, a: int8): M512i {.importc: "_mm512_mask_set1_epi8".}

func mm512_maskz_set1_epi8*(m: MMask64, a: int8): M512i {.importc: "_mm512_maskz_set1_epi8".}

func mm512_broadcastw_epi16*(a: M128i): M512i {.importc: "_mm512_broadcastw_epi16".}

func mm512_mask_broadcastw_epi16*(o: M512i, m: MMask32, a: M128i): M512i {.importc: "_mm512_mask_broadcastw_epi16".}

func mm512_maskz_broadcastw_epi16*(m: MMask32, a: M128i): M512i {.importc: "_mm512_maskz_broadcastw_epi16".}

func mm512_mask_set1_epi16*(o: M512i, m: MMask32, a: int16): M512i {.importc: "_mm512_mask_set1_epi16".}

func mm512_maskz_set1_epi16*(m: MMask32, a: int16): M512i {.importc: "_mm512_maskz_set1_epi16".}

func mm512_mulhrs_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_mulhrs_epi16".}

func mm512_mask_mulhrs_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_mulhrs_epi16".}

func mm512_maskz_mulhrs_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_mulhrs_epi16".}

func mm512_mulhi_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_mulhi_epi16".}

func mm512_mask_mulhi_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_mulhi_epi16".}

func mm512_maskz_mulhi_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_mulhi_epi16".}

func mm512_mulhi_epu16*(a: M512i, b: M512i): M512i {.importc: "_mm512_mulhi_epu16".}

func mm512_mask_mulhi_epu16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_mulhi_epu16".}

func mm512_maskz_mulhi_epu16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_mulhi_epu16".}

func mm512_mullo_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_mullo_epi16".}

func mm512_mask_mullo_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_mullo_epi16".}

func mm512_maskz_mullo_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_mullo_epi16".}

func mm512_cvtepi8_epi16*(a: M256i): M512i {.importc: "_mm512_cvtepi8_epi16".}

func mm512_mask_cvtepi8_epi16*(w: M512i, u: MMask32, a: M256i): M512i {.importc: "_mm512_mask_cvtepi8_epi16".}

func mm512_maskz_cvtepi8_epi16*(u: MMask32, a: M256i): M512i {.importc: "_mm512_maskz_cvtepi8_epi16".}

func mm512_cvtepu8_epi16*(a: M256i): M512i {.importc: "_mm512_cvtepu8_epi16".}

func mm512_mask_cvtepu8_epi16*(w: M512i, u: MMask32, a: M256i): M512i {.importc: "_mm512_mask_cvtepu8_epi16".}

func mm512_maskz_cvtepu8_epi16*(u: MMask32, a: M256i): M512i {.importc: "_mm512_maskz_cvtepu8_epi16".}

func mm512_permutexvar_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_permutexvar_epi16".}

func mm512_maskz_permutexvar_epi16*(m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_permutexvar_epi16".}

func mm512_mask_permutexvar_epi16*(w: M512i, m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_permutexvar_epi16".}

func mm512_permutex2var_epi16*(a: M512i, i: M512i, b: M512i): M512i {.importc: "_mm512_permutex2var_epi16".}

func mm512_mask_permutex2var_epi16*(a: M512i, u: MMask32, i: M512i, b: M512i): M512i {.importc: "_mm512_mask_permutex2var_epi16".}

func mm512_mask2_permutex2var_epi16*(a: M512i, i: M512i, u: MMask32, b: M512i): M512i {.importc: "_mm512_mask2_permutex2var_epi16".}

func mm512_maskz_permutex2var_epi16*(u: MMask32, a: M512i, i: M512i, b: M512i): M512i {.importc: "_mm512_maskz_permutex2var_epi16".}

func mm512_avg_epu8*(a: M512i, b: M512i): M512i {.importc: "_mm512_avg_epu8".}

func mm512_mask_avg_epu8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_avg_epu8".}

func mm512_maskz_avg_epu8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_avg_epu8".}

func mm512_add_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_add_epi8".}

func mm512_mask_add_epi8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_add_epi8".}

func mm512_maskz_add_epi8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_add_epi8".}

func mm512_sub_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_sub_epi8".}

func mm512_mask_sub_epi8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_sub_epi8".}

func mm512_maskz_sub_epi8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_sub_epi8".}

func mm512_avg_epu16*(a: M512i, b: M512i): M512i {.importc: "_mm512_avg_epu16".}

func mm512_mask_avg_epu16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_avg_epu16".}

func mm512_maskz_avg_epu16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_avg_epu16".}

func mm512_subs_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_subs_epi8".}

func mm512_mask_subs_epi8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_subs_epi8".}

func mm512_maskz_subs_epi8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_subs_epi8".}

func mm512_subs_epu8*(a: M512i, b: M512i): M512i {.importc: "_mm512_subs_epu8".}

func mm512_mask_subs_epu8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_subs_epu8".}

func mm512_maskz_subs_epu8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_subs_epu8".}

func mm512_adds_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_adds_epi8".}

func mm512_mask_adds_epi8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_adds_epi8".}

func mm512_maskz_adds_epi8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_adds_epi8".}

func mm512_adds_epu8*(a: M512i, b: M512i): M512i {.importc: "_mm512_adds_epu8".}

func mm512_mask_adds_epu8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_adds_epu8".}

func mm512_maskz_adds_epu8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_adds_epu8".}

func mm512_sub_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_sub_epi16".}

func mm512_mask_sub_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_sub_epi16".}

func mm512_maskz_sub_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_sub_epi16".}

func mm512_subs_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_subs_epi16".}

func mm512_mask_subs_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_subs_epi16".}

func mm512_maskz_subs_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_subs_epi16".}

func mm512_subs_epu16*(a: M512i, b: M512i): M512i {.importc: "_mm512_subs_epu16".}

func mm512_mask_subs_epu16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_subs_epu16".}

func mm512_maskz_subs_epu16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_subs_epu16".}

func mm512_add_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_add_epi16".}

func mm512_mask_add_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_add_epi16".}

func mm512_maskz_add_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_add_epi16".}

func mm512_adds_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_adds_epi16".}

func mm512_mask_adds_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_adds_epi16".}

func mm512_maskz_adds_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_adds_epi16".}

func mm512_adds_epu16*(a: M512i, b: M512i): M512i {.importc: "_mm512_adds_epu16".}

func mm512_mask_adds_epu16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_adds_epu16".}

func mm512_maskz_adds_epu16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_adds_epu16".}

func mm512_srl_epi16*(a: M512i, b: M128i): M512i {.importc: "_mm512_srl_epi16".}

func mm512_mask_srl_epi16*(w: M512i, u: MMask32, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_srl_epi16".}

func mm512_maskz_srl_epi16*(u: MMask32, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_srl_epi16".}

func mm512_packs_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_packs_epi16".}

func mm512_sll_epi16*(a: M512i, b: M128i): M512i {.importc: "_mm512_sll_epi16".}

func mm512_mask_sll_epi16*(w: M512i, u: MMask32, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_sll_epi16".}

func mm512_maskz_sll_epi16*(u: MMask32, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_sll_epi16".}

func mm512_maddubs_epi16*(x: M512i, y: M512i): M512i {.importc: "_mm512_maddubs_epi16".}

func mm512_mask_maddubs_epi16*(w: M512i, u: MMask32, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_maddubs_epi16".}

func mm512_maskz_maddubs_epi16*(u: MMask32, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_maddubs_epi16".}

func mm512_madd_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_madd_epi16".}

func mm512_mask_madd_epi16*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_madd_epi16".}

func mm512_maskz_madd_epi16*(u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_madd_epi16".}

func mm512_unpackhi_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_unpackhi_epi8".}

func mm512_mask_unpackhi_epi8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_unpackhi_epi8".}

func mm512_maskz_unpackhi_epi8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_unpackhi_epi8".}

func mm512_unpackhi_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_unpackhi_epi16".}

func mm512_mask_unpackhi_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_unpackhi_epi16".}

func mm512_maskz_unpackhi_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_unpackhi_epi16".}

func mm512_unpacklo_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_unpacklo_epi8".}

func mm512_mask_unpacklo_epi8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_unpacklo_epi8".}

func mm512_maskz_unpacklo_epi8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_unpacklo_epi8".}

func mm512_unpacklo_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_unpacklo_epi16".}

func mm512_mask_unpacklo_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_unpacklo_epi16".}

func mm512_maskz_unpacklo_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_unpacklo_epi16".}

func mm512_cmpeq_epu8_mask*(a: M512i, b: M512i): MMask64 {.importc: "_mm512_cmpeq_epu8_mask".}

func mm512_cmpeq_epi8_mask*(a: M512i, b: M512i): MMask64 {.importc: "_mm512_cmpeq_epi8_mask".}

func mm512_mask_cmpeq_epu8_mask*(u: MMask64, a: M512i, b: M512i): MMask64 {.importc: "_mm512_mask_cmpeq_epu8_mask".}

func mm512_mask_cmpeq_epi8_mask*(u: MMask64, a: M512i, b: M512i): MMask64 {.importc: "_mm512_mask_cmpeq_epi8_mask".}

func mm512_cmpeq_epu16_mask*(a: M512i, b: M512i): MMask32 {.importc: "_mm512_cmpeq_epu16_mask".}

func mm512_cmpeq_epi16_mask*(a: M512i, b: M512i): MMask32 {.importc: "_mm512_cmpeq_epi16_mask".}

func mm512_mask_cmpeq_epu16_mask*(u: MMask32, a: M512i, b: M512i): MMask32 {.importc: "_mm512_mask_cmpeq_epu16_mask".}

func mm512_mask_cmpeq_epi16_mask*(u: MMask32, a: M512i, b: M512i): MMask32 {.importc: "_mm512_mask_cmpeq_epi16_mask".}

func mm512_cmpgt_epu8_mask*(a: M512i, b: M512i): MMask64 {.importc: "_mm512_cmpgt_epu8_mask".}

func mm512_cmpgt_epi8_mask*(a: M512i, b: M512i): MMask64 {.importc: "_mm512_cmpgt_epi8_mask".}

func mm512_mask_cmpgt_epu8_mask*(u: MMask64, a: M512i, b: M512i): MMask64 {.importc: "_mm512_mask_cmpgt_epu8_mask".}

func mm512_mask_cmpgt_epi8_mask*(u: MMask64, a: M512i, b: M512i): MMask64 {.importc: "_mm512_mask_cmpgt_epi8_mask".}

func mm512_cmpgt_epu16_mask*(a: M512i, b: M512i): MMask32 {.importc: "_mm512_cmpgt_epu16_mask".}

func mm512_cmpgt_epi16_mask*(a: M512i, b: M512i): MMask32 {.importc: "_mm512_cmpgt_epi16_mask".}

func mm512_mask_cmpgt_epu16_mask*(u: MMask32, a: M512i, b: M512i): MMask32 {.importc: "_mm512_mask_cmpgt_epu16_mask".}

func mm512_mask_cmpgt_epi16_mask*(u: MMask32, a: M512i, b: M512i): MMask32 {.importc: "_mm512_mask_cmpgt_epi16_mask".}

func mm512_movepi8_mask*(a: M512i): MMask64 {.importc: "_mm512_movepi8_mask".}

func mm512_movepi16_mask*(a: M512i): MMask32 {.importc: "_mm512_movepi16_mask".}

func mm512_movm_epi8*(a: MMask64): M512i {.importc: "_mm512_movm_epi8".}

func mm512_movm_epi16*(a: MMask32): M512i {.importc: "_mm512_movm_epi16".}

func mm512_test_epi8_mask*(a: M512i, b: M512i): MMask64 {.importc: "_mm512_test_epi8_mask".}

func mm512_mask_test_epi8_mask*(u: MMask64, a: M512i, b: M512i): MMask64 {.importc: "_mm512_mask_test_epi8_mask".}

func mm512_test_epi16_mask*(a: M512i, b: M512i): MMask32 {.importc: "_mm512_test_epi16_mask".}

func mm512_mask_test_epi16_mask*(u: MMask32, a: M512i, b: M512i): MMask32 {.importc: "_mm512_mask_test_epi16_mask".}

func mm512_testn_epi8_mask*(a: M512i, b: M512i): MMask64 {.importc: "_mm512_testn_epi8_mask".}

func mm512_mask_testn_epi8_mask*(u: MMask64, a: M512i, b: M512i): MMask64 {.importc: "_mm512_mask_testn_epi8_mask".}

func mm512_testn_epi16_mask*(a: M512i, b: M512i): MMask32 {.importc: "_mm512_testn_epi16_mask".}

func mm512_mask_testn_epi16_mask*(u: MMask32, a: M512i, b: M512i): MMask32 {.importc: "_mm512_mask_testn_epi16_mask".}

func mm512_shuffle_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_shuffle_epi8".}

func mm512_mask_shuffle_epi8*(w: M512i, u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_shuffle_epi8".}

func mm512_maskz_shuffle_epi8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_shuffle_epi8".}

func mm512_min_epu16*(a: M512i, b: M512i): M512i {.importc: "_mm512_min_epu16".}

func mm512_maskz_min_epu16*(m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_min_epu16".}

func mm512_mask_min_epu16*(w: M512i, m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_min_epu16".}

func mm512_min_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_min_epi16".}

func mm512_maskz_min_epi16*(m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_min_epi16".}

func mm512_mask_min_epi16*(w: M512i, m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_min_epi16".}

func mm512_max_epu8*(a: M512i, b: M512i): M512i {.importc: "_mm512_max_epu8".}

func mm512_maskz_max_epu8*(m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_max_epu8".}

func mm512_mask_max_epu8*(w: M512i, m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_max_epu8".}

func mm512_max_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_max_epi8".}

func mm512_maskz_max_epi8*(m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_max_epi8".}

func mm512_mask_max_epi8*(w: M512i, m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_max_epi8".}

func mm512_min_epu8*(a: M512i, b: M512i): M512i {.importc: "_mm512_min_epu8".}

func mm512_maskz_min_epu8*(m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_min_epu8".}

func mm512_mask_min_epu8*(w: M512i, m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_min_epu8".}

func mm512_min_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_min_epi8".}

func mm512_maskz_min_epi8*(m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_min_epi8".}

func mm512_mask_min_epi8*(w: M512i, m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_min_epi8".}

func mm512_max_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_max_epi16".}

func mm512_maskz_max_epi16*(m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_max_epi16".}

func mm512_mask_max_epi16*(w: M512i, m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_max_epi16".}

func mm512_max_epu16*(a: M512i, b: M512i): M512i {.importc: "_mm512_max_epu16".}

func mm512_maskz_max_epu16*(m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_max_epu16".}

func mm512_mask_max_epu16*(w: M512i, m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_max_epu16".}

func mm512_sra_epi16*(a: M512i, b: M128i): M512i {.importc: "_mm512_sra_epi16".}

func mm512_mask_sra_epi16*(w: M512i, u: MMask32, a: M512i, b: M128i): M512i {.importc: "_mm512_mask_sra_epi16".}

func mm512_maskz_sra_epi16*(u: MMask32, a: M512i, b: M128i): M512i {.importc: "_mm512_maskz_sra_epi16".}

func mm512_srav_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_srav_epi16".}

func mm512_mask_srav_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_srav_epi16".}

func mm512_maskz_srav_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_srav_epi16".}

func mm512_srlv_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_srlv_epi16".}

func mm512_mask_srlv_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_srlv_epi16".}

func mm512_maskz_srlv_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_srlv_epi16".}

func mm512_sllv_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_sllv_epi16".}

func mm512_mask_sllv_epi16*(w: M512i, u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_sllv_epi16".}

func mm512_maskz_sllv_epi16*(u: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_sllv_epi16".}

func mm512_mask_packs_epi16*(w: M512i, m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_packs_epi16".}

func mm512_maskz_packs_epi16*(m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_packs_epi16".}

func mm512_packus_epi16*(a: M512i, b: M512i): M512i {.importc: "_mm512_packus_epi16".}

func mm512_mask_packus_epi16*(w: M512i, m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_packus_epi16".}

func mm512_maskz_packus_epi16*(m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_packus_epi16".}

func mm512_abs_epi8*(a: M512i): M512i {.importc: "_mm512_abs_epi8".}

func mm512_mask_abs_epi8*(w: M512i, u: MMask64, a: M512i): M512i {.importc: "_mm512_mask_abs_epi8".}

func mm512_maskz_abs_epi8*(u: MMask64, a: M512i): M512i {.importc: "_mm512_maskz_abs_epi8".}

func mm512_abs_epi16*(a: M512i): M512i {.importc: "_mm512_abs_epi16".}

func mm512_mask_abs_epi16*(w: M512i, u: MMask32, a: M512i): M512i {.importc: "_mm512_mask_abs_epi16".}

func mm512_maskz_abs_epi16*(u: MMask32, a: M512i): M512i {.importc: "_mm512_maskz_abs_epi16".}

func mm512_mask_cmpneq_epu8_mask*(m: MMask64, x: M512i, y: M512i): MMask64 {.importc: "_mm512_mask_cmpneq_epu8_mask".}

func mm512_mask_cmplt_epu8_mask*(m: MMask64, x: M512i, y: M512i): MMask64 {.importc: "_mm512_mask_cmplt_epu8_mask".}

func mm512_mask_cmpge_epu8_mask*(m: MMask64, x: M512i, y: M512i): MMask64 {.importc: "_mm512_mask_cmpge_epu8_mask".}

func mm512_mask_cmple_epu8_mask*(m: MMask64, x: M512i, y: M512i): MMask64 {.importc: "_mm512_mask_cmple_epu8_mask".}

func mm512_mask_cmpneq_epu16_mask*(m: MMask32, x: M512i, y: M512i): MMask32 {.importc: "_mm512_mask_cmpneq_epu16_mask".}

func mm512_mask_cmplt_epu16_mask*(m: MMask32, x: M512i, y: M512i): MMask32 {.importc: "_mm512_mask_cmplt_epu16_mask".}

func mm512_mask_cmpge_epu16_mask*(m: MMask32, x: M512i, y: M512i): MMask32 {.importc: "_mm512_mask_cmpge_epu16_mask".}

func mm512_mask_cmple_epu16_mask*(m: MMask32, x: M512i, y: M512i): MMask32 {.importc: "_mm512_mask_cmple_epu16_mask".}

func mm512_mask_cmpneq_epi8_mask*(m: MMask64, x: M512i, y: M512i): MMask64 {.importc: "_mm512_mask_cmpneq_epi8_mask".}

func mm512_mask_cmplt_epi8_mask*(m: MMask64, x: M512i, y: M512i): MMask64 {.importc: "_mm512_mask_cmplt_epi8_mask".}

func mm512_mask_cmpge_epi8_mask*(m: MMask64, x: M512i, y: M512i): MMask64 {.importc: "_mm512_mask_cmpge_epi8_mask".}

func mm512_mask_cmple_epi8_mask*(m: MMask64, x: M512i, y: M512i): MMask64 {.importc: "_mm512_mask_cmple_epi8_mask".}

func mm512_mask_cmpneq_epi16_mask*(m: MMask32, x: M512i, y: M512i): MMask32 {.importc: "_mm512_mask_cmpneq_epi16_mask".}

func mm512_mask_cmplt_epi16_mask*(m: MMask32, x: M512i, y: M512i): MMask32 {.importc: "_mm512_mask_cmplt_epi16_mask".}

func mm512_mask_cmpge_epi16_mask*(m: MMask32, x: M512i, y: M512i): MMask32 {.importc: "_mm512_mask_cmpge_epi16_mask".}

func mm512_mask_cmple_epi16_mask*(m: MMask32, x: M512i, y: M512i): MMask32 {.importc: "_mm512_mask_cmple_epi16_mask".}

func mm512_cmpneq_epu8_mask*(x: M512i, y: M512i): MMask64 {.importc: "_mm512_cmpneq_epu8_mask".}

func mm512_cmplt_epu8_mask*(x: M512i, y: M512i): MMask64 {.importc: "_mm512_cmplt_epu8_mask".}

func mm512_cmpge_epu8_mask*(x: M512i, y: M512i): MMask64 {.importc: "_mm512_cmpge_epu8_mask".}

func mm512_cmple_epu8_mask*(x: M512i, y: M512i): MMask64 {.importc: "_mm512_cmple_epu8_mask".}

func mm512_cmpneq_epu16_mask*(x: M512i, y: M512i): MMask32 {.importc: "_mm512_cmpneq_epu16_mask".}

func mm512_cmplt_epu16_mask*(x: M512i, y: M512i): MMask32 {.importc: "_mm512_cmplt_epu16_mask".}

func mm512_cmpge_epu16_mask*(x: M512i, y: M512i): MMask32 {.importc: "_mm512_cmpge_epu16_mask".}

func mm512_cmple_epu16_mask*(x: M512i, y: M512i): MMask32 {.importc: "_mm512_cmple_epu16_mask".}

func mm512_cmpneq_epi8_mask*(x: M512i, y: M512i): MMask64 {.importc: "_mm512_cmpneq_epi8_mask".}

func mm512_cmplt_epi8_mask*(x: M512i, y: M512i): MMask64 {.importc: "_mm512_cmplt_epi8_mask".}

func mm512_cmpge_epi8_mask*(x: M512i, y: M512i): MMask64 {.importc: "_mm512_cmpge_epi8_mask".}

func mm512_cmple_epi8_mask*(x: M512i, y: M512i): MMask64 {.importc: "_mm512_cmple_epi8_mask".}

func mm512_cmpneq_epi16_mask*(x: M512i, y: M512i): MMask32 {.importc: "_mm512_cmpneq_epi16_mask".}

func mm512_cmplt_epi16_mask*(x: M512i, y: M512i): MMask32 {.importc: "_mm512_cmplt_epi16_mask".}

func mm512_cmpge_epi16_mask*(x: M512i, y: M512i): MMask32 {.importc: "_mm512_cmpge_epi16_mask".}

func mm512_cmple_epi16_mask*(x: M512i, y: M512i): MMask32 {.importc: "_mm512_cmple_epi16_mask".}

func mm512_packs_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_packs_epi32".}

func mm512_maskz_packs_epi32*(m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_packs_epi32".}

func mm512_mask_packs_epi32*(w: M512i, m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_packs_epi32".}

func mm512_packus_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_packus_epi32".}

func mm512_maskz_packus_epi32*(m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_packus_epi32".}

func mm512_mask_packus_epi32*(w: M512i, m: MMask32, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_packus_epi32".}

func mm512_alignr_epi8*(a: M512i, b: M512i, n: int32): M512i {.importc: "_mm512_alignr_epi8".}

func mm512_mask_alignr_epi8*(w: M512i, u: MMask64, a: M512i, b: M512i, n: int32): M512i {.importc: "_mm512_mask_alignr_epi8".}

func mm512_maskz_alignr_epi8*(u: MMask64, a: M512i, b: M512i, n: int32): M512i {.importc: "_mm512_maskz_alignr_epi8".}

func mm512_dbsad_epu8*(a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_dbsad_epu8".}

func mm512_mask_dbsad_epu8*(w: M512i, u: MMask32, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_mask_dbsad_epu8".}

func mm512_maskz_dbsad_epu8*(u: MMask32, a: M512i, b: M512i, imm: int32): M512i {.importc: "_mm512_maskz_dbsad_epu8".}

func mm512_srli_epi16*(a: M512i, imm: uint32): M512i {.importc: "_mm512_srli_epi16".}

func mm512_mask_srli_epi16*(w: M512i, u: MMask32, a: M512i, imm: uint32): M512i {.importc: "_mm512_mask_srli_epi16".}

func mm512_maskz_srli_epi16*(u: MMask32, a: M512i, imm: int32): M512i {.importc: "_mm512_maskz_srli_epi16".}

func mm512_slli_epi16*(a: M512i, b: uint32): M512i {.importc: "_mm512_slli_epi16".}

func mm512_mask_slli_epi16*(w: M512i, u: MMask32, a: M512i, b: uint32): M512i {.importc: "_mm512_mask_slli_epi16".}

func mm512_maskz_slli_epi16*(u: MMask32, a: M512i, b: uint32): M512i {.importc: "_mm512_maskz_slli_epi16".}

func mm512_shufflehi_epi16*(a: M512i, imm: int32): M512i {.importc: "_mm512_shufflehi_epi16".}

func mm512_mask_shufflehi_epi16*(w: M512i, u: MMask32, a: M512i, imm: int32): M512i {.importc: "_mm512_mask_shufflehi_epi16".}

func mm512_maskz_shufflehi_epi16*(u: MMask32, a: M512i, imm: int32): M512i {.importc: "_mm512_maskz_shufflehi_epi16".}

func mm512_shufflelo_epi16*(a: M512i, imm: int32): M512i {.importc: "_mm512_shufflelo_epi16".}

func mm512_mask_shufflelo_epi16*(w: M512i, u: MMask32, a: M512i, imm: int32): M512i {.importc: "_mm512_mask_shufflelo_epi16".}

func mm512_maskz_shufflelo_epi16*(u: MMask32, a: M512i, imm: int32): M512i {.importc: "_mm512_maskz_shufflelo_epi16".}

func mm512_srai_epi16*(a: M512i, imm: uint32): M512i {.importc: "_mm512_srai_epi16".}

func mm512_mask_srai_epi16*(w: M512i, u: MMask32, a: M512i, imm: uint32): M512i {.importc: "_mm512_mask_srai_epi16".}

func mm512_maskz_srai_epi16*(u: MMask32, a: M512i, imm: uint32): M512i {.importc: "_mm512_maskz_srai_epi16".}

func mm512_mask_blend_epi16*(u: MMask32, a: M512i, w: M512i): M512i {.importc: "_mm512_mask_blend_epi16".}

func mm512_mask_blend_epi8*(u: MMask64, a: M512i, w: M512i): M512i {.importc: "_mm512_mask_blend_epi8".}

func mm512_mask_cmp_epi16_mask*(u: MMask32, x: M512i, y: M512i, p: int32): MMask32 {.importc: "_mm512_mask_cmp_epi16_mask".}

func mm512_cmp_epi16_mask*(x: M512i, y: M512i, p: int32): MMask32 {.importc: "_mm512_cmp_epi16_mask".}

func mm512_mask_cmp_epi8_mask*(u: MMask64, x: M512i, y: M512i, p: int32): MMask64 {.importc: "_mm512_mask_cmp_epi8_mask".}

func mm512_cmp_epi8_mask*(x: M512i, y: M512i, p: int32): MMask64 {.importc: "_mm512_cmp_epi8_mask".}

func mm512_mask_cmp_epu16_mask*(u: MMask32, x: M512i, y: M512i, p: int32): MMask32 {.importc: "_mm512_mask_cmp_epu16_mask".}

func mm512_cmp_epu16_mask*(x: M512i, y: M512i, p: int32): MMask32 {.importc: "_mm512_cmp_epu16_mask".}

func mm512_mask_cmp_epu8_mask*(u: MMask64, x: M512i, y: M512i, p: int32): MMask64 {.importc: "_mm512_mask_cmp_epu8_mask".}

func mm512_cmp_epu8_mask*(x: M512i, y: M512i, p: int32): MMask64 {.importc: "_mm512_cmp_epu8_mask".}

func mm512_bslli_epi128*(a: M512i, n: int32): M512i {.importc: "_mm512_bslli_epi128".}

func mm512_bsrli_epi128*(a: M512i, n: int32): M512i {.importc: "_mm512_bsrli_epi128".}

## [Macro Original]
## #define _kshiftli_mask64(X, Y)							\
## ((__mmask64) __builtin_ia32_kshiftlidi ((__mmask64)(X), (__mmask8)(Y)))

## [Macro Original]
## #define _kshiftri_mask64(X, Y)							\
## ((__mmask64) __builtin_ia32_kshiftridi ((__mmask64)(X), (__mmask8)(Y)))

## [Macro Original]
## #define _mm512_alignr_epi8(X, Y, N)						    \
## ((__m512i) __builtin_ia32_palignr512 ((__v8di)(__m512i)(X),			    \
## (__v8di)(__m512i)(Y),			    \
## (int)((N) * 8)))

## [Macro Original]
## #define _mm512_mask_alignr_epi8(W, U, X, Y, N)					    \
## ((__m512i) __builtin_ia32_palignr512_mask ((__v8di)(__m512i)(X),		    \
## (__v8di)(__m512i)(Y), (int)((N) * 8),   \
## (__v8di)(__m512i)(W), (__mmask64)(U)))

## [Macro Original]
## #define _mm512_maskz_alignr_epi8(U, X, Y, N)					    \
## ((__m512i) __builtin_ia32_palignr512_mask ((__v8di)(__m512i)(X),		    \
## (__v8di)(__m512i)(Y), (int)((N) * 8),  \
## (__v8di)(__m512i)			    \
## _mm512_setzero_si512 (),		    \
## (__mmask64)(U)))

## [Macro Original]
## #define _mm512_dbsad_epu8(X, Y, C)                                                  \
## ((__m512i) __builtin_ia32_dbpsadbw512_mask ((__v64qi)(__m512i) (X),               \
## (__v64qi)(__m512i) (Y), (int) (C),    \
## (__v32hi)(__m512i)		    \
## _mm512_setzero_si512 (),		    \
## (__mmask32)-1))

## [Macro Original]
## #define _mm512_mask_dbsad_epu8(W, U, X, Y, C)                                       \
## ((__m512i) __builtin_ia32_dbpsadbw512_mask ((__v64qi)(__m512i) (X),               \
## (__v64qi)(__m512i) (Y), (int) (C),    \
## (__v32hi)(__m512i)(W),                \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm512_maskz_dbsad_epu8(U, X, Y, C)                                         \
## ((__m512i) __builtin_ia32_dbpsadbw512_mask ((__v64qi)(__m512i) (X),               \
## (__v64qi)(__m512i) (Y), (int) (C),    \
## (__v32hi)(__m512i)		    \
## _mm512_setzero_si512 (),		    \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm512_srli_epi16(A, B)                                         \
## ((__m512i) __builtin_ia32_psrlwi512_mask ((__v32hi)(__m512i)(A),      \
## (unsigned int)(B), (__v32hi)_mm512_setzero_si512 (), (__mmask32)-1))

## [Macro Original]
## #define _mm512_mask_srli_epi16(W, U, A, B)                              \
## ((__m512i) __builtin_ia32_psrlwi512_mask ((__v32hi)(__m512i)(A),      \
## (unsigned int)(B), (__v32hi)(__m512i)(W), (__mmask32)(U)))

## [Macro Original]
## #define _mm512_maskz_srli_epi16(U, A, B)                                \
## ((__m512i) __builtin_ia32_psrlwi512_mask ((__v32hi)(__m512i)(A),      \
## (int)(B), (__v32hi)_mm512_setzero_si512 (), (__mmask32)(U)))

## [Macro Original]
## #define _mm512_slli_epi16(X, C)						    \
## ((__m512i)__builtin_ia32_psllwi512_mask ((__v32hi)(__m512i)(X),	    \
## (unsigned int)(C),							    \
## (__v32hi)(__m512i)_mm512_setzero_si512 (),				    \
## (__mmask32)-1))

## [Macro Original]
## #define _mm512_mask_slli_epi16(W, U, X, C)				    \
## ((__m512i)__builtin_ia32_psllwi512_mask ((__v32hi)(__m512i)(X),	    \
## (unsigned int)(C),							    \
## (__v32hi)(__m512i)(W),						    \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm512_maskz_slli_epi16(U, X, C)				    \
## ((__m512i)__builtin_ia32_psllwi512_mask ((__v32hi)(__m512i)(X),	    \
## (unsigned int)(C),							    \
## (__v32hi)(__m512i)_mm512_setzero_si512 (),				    \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm512_shufflehi_epi16(A, B)                                                \
## ((__m512i) __builtin_ia32_pshufhw512_mask ((__v32hi)(__m512i)(A), (int)(B),       \
## (__v32hi)(__m512i)			    \
## _mm512_setzero_si512 (),		    \
## (__mmask32)-1))

## [Macro Original]
## #define _mm512_mask_shufflehi_epi16(W, U, A, B)                                     \
## ((__m512i) __builtin_ia32_pshufhw512_mask ((__v32hi)(__m512i)(A), (int)(B),       \
## (__v32hi)(__m512i)(W),                 \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm512_maskz_shufflehi_epi16(U, A, B)                                       \
## ((__m512i) __builtin_ia32_pshufhw512_mask ((__v32hi)(__m512i)(A), (int)(B),       \
## (__v32hi)(__m512i)			    \
## _mm512_setzero_si512 (),		    \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm512_shufflelo_epi16(A, B)                                                \
## ((__m512i) __builtin_ia32_pshuflw512_mask ((__v32hi)(__m512i)(A), (int)(B),       \
## (__v32hi)(__m512i)			    \
## _mm512_setzero_si512 (),		    \
## (__mmask32)-1))

## [Macro Original]
## #define _mm512_mask_shufflelo_epi16(W, U, A, B)                                     \
## ((__m512i) __builtin_ia32_pshuflw512_mask ((__v32hi)(__m512i)(A), (int)(B),       \
## (__v32hi)(__m512i)(W),                 \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm512_maskz_shufflelo_epi16(U, A, B)                                       \
## ((__m512i) __builtin_ia32_pshuflw512_mask ((__v32hi)(__m512i)(A), (int)(B),       \
## (__v32hi)(__m512i)			    \
## _mm512_setzero_si512 (),		    \
## (__mmask32)(U)))

## [Macro Original]
## #define _mm512_srai_epi16(A, B)                                         \
## ((__m512i) __builtin_ia32_psrawi512_mask ((__v32hi)(__m512i)(A),      \
## (unsigned int)(B), (__v32hi)_mm512_setzero_si512 (), (__mmask32)-1))

## [Macro Original]
## #define _mm512_mask_srai_epi16(W, U, A, B)                              \
## ((__m512i) __builtin_ia32_psrawi512_mask ((__v32hi)(__m512i)(A),      \
## (unsigned int)(B), (__v32hi)(__m512i)(W), (__mmask32)(U)))

## [Macro Original]
## #define _mm512_maskz_srai_epi16(U, A, B)                                \
## ((__m512i) __builtin_ia32_psrawi512_mask ((__v32hi)(__m512i)(A),      \
## (unsigned int)(B), (__v32hi)_mm512_setzero_si512 (), (__mmask32)(U)))

## [Macro Original]
## #define _mm512_mask_blend_epi16(__U, __A, __W)			      \
## ((__m512i) __builtin_ia32_blendmw_512_mask ((__v32hi) (__A),	      \
## (__v32hi) (__W),  \
## (__mmask32) (__U)))

## [Macro Original]
## #define _mm512_mask_blend_epi8(__U, __A, __W)			      \
## ((__m512i) __builtin_ia32_blendmb_512_mask ((__v64qi) (__A),	      \
## (__v64qi) (__W),  \
## (__mmask64) (__U)))

## [Macro Original]
## #define _mm512_cmp_epi16_mask(X, Y, P)				\
## ((__mmask32) __builtin_ia32_cmpw512_mask ((__v32hi)(__m512i)(X),	\
## (__v32hi)(__m512i)(Y), (int)(P),\
## (__mmask32)(-1)))

## [Macro Original]
## #define _mm512_cmp_epi8_mask(X, Y, P)				\
## ((__mmask64) __builtin_ia32_cmpb512_mask ((__v64qi)(__m512i)(X),	\
## (__v64qi)(__m512i)(Y), (int)(P),\
## (__mmask64)(-1)))

## [Macro Original]
## #define _mm512_cmp_epu16_mask(X, Y, P)				\
## ((__mmask32) __builtin_ia32_ucmpw512_mask ((__v32hi)(__m512i)(X),	\
## (__v32hi)(__m512i)(Y), (int)(P),\
## (__mmask32)(-1)))

## [Macro Original]
## #define _mm512_cmp_epu8_mask(X, Y, P)				\
## ((__mmask64) __builtin_ia32_ucmpb512_mask ((__v64qi)(__m512i)(X),	\
## (__v64qi)(__m512i)(Y), (int)(P),\
## (__mmask64)(-1)))

## [Macro Original]
## #define _mm512_mask_cmp_epi16_mask(M, X, Y, P)				\
## ((__mmask32) __builtin_ia32_cmpw512_mask ((__v32hi)(__m512i)(X),	\
## (__v32hi)(__m512i)(Y), (int)(P),\
## (__mmask32)(M)))

## [Macro Original]
## #define _mm512_mask_cmp_epi8_mask(M, X, Y, P)				\
## ((__mmask64) __builtin_ia32_cmpb512_mask ((__v64qi)(__m512i)(X),	\
## (__v64qi)(__m512i)(Y), (int)(P),\
## (__mmask64)(M)))

## [Macro Original]
## #define _mm512_mask_cmp_epu16_mask(M, X, Y, P)				\
## ((__mmask32) __builtin_ia32_ucmpw512_mask ((__v32hi)(__m512i)(X),	\
## (__v32hi)(__m512i)(Y), (int)(P),\
## (__mmask32)(M)))

## [Macro Original]
## #define _mm512_mask_cmp_epu8_mask(M, X, Y, P)				\
## ((__mmask64) __builtin_ia32_ucmpb512_mask ((__v64qi)(__m512i)(X),	\
## (__v64qi)(__m512i)(Y), (int)(P),\
## (__mmask64)(M)))

## [Macro Original]
## #define _mm512_bslli_epi128(A, N)                                         \
## ((__m512i)__builtin_ia32_pslldq512 ((__m512i)(A), (int)(N) * 8))

## [Macro Original]
## #define _mm512_bsrli_epi128(A, N)                                         \
## ((__m512i)__builtin_ia32_psrldq512 ((__m512i)(A), (int)(N) * 8))
