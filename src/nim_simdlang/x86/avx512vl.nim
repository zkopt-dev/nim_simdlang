import avx512f
import avx
import sse
import sse2


## [Macro Original]
## #define _AVX512VLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VL__

func mm_avx512_undefined_si128*(): M128i {.importc: "_mm_avx512_undefined_si128".}

func mm256_avx512_undefined_ps*(): M256 {.importc: "_mm256_avx512_undefined_ps".}

func mm256_avx512_undefined_pd*(): M256d {.importc: "_mm256_avx512_undefined_pd".}

func mm256_avx512_undefined_si256*(): M256i {.importc: "_mm256_avx512_undefined_si256".}

func mm_avx512_setzero_si128*(): M128i {.importc: "_mm_avx512_setzero_si128".}

func mm256_avx512_setzero_ps*(): M256 {.importc: "_mm256_avx512_setzero_ps".}

func mm256_avx512_setzero_pd*(): M256d {.importc: "_mm256_avx512_setzero_pd".}

func mm256_avx512_setzero_si256*(): M256i {.importc: "_mm256_avx512_setzero_si256".}

func mm256_mask_mov_pd*(w: M256d, u: MMask8, a: M256d): M256d {.importc: "_mm256_mask_mov_pd".}

func mm256_maskz_mov_pd*(u: MMask8, a: M256d): M256d {.importc: "_mm256_maskz_mov_pd".}

func mm_mask_mov_pd*(w: M128d, u: MMask8, a: M128d): M128d {.importc: "_mm_mask_mov_pd".}

func mm_maskz_mov_pd*(u: MMask8, a: M128d): M128d {.importc: "_mm_maskz_mov_pd".}

func mm256_mask_load_pd*(w: M256d, u: MMask8, p: pointer): M256d {.importc: "_mm256_mask_load_pd".}

func mm256_maskz_load_pd*(u: MMask8, p: pointer): M256d {.importc: "_mm256_maskz_load_pd".}

func mm_mask_load_pd*(w: M128d, u: MMask8, p: pointer): M128d {.importc: "_mm_mask_load_pd".}

func mm_maskz_load_pd*(u: MMask8, p: pointer): M128d {.importc: "_mm_maskz_load_pd".}

func mm256_mask_store_pd*(p: pointer, u: MMask8, a: M256d): void {.importc: "_mm256_mask_store_pd".}

func mm_mask_store_pd*(p: pointer, u: MMask8, a: M128d): void {.importc: "_mm_mask_store_pd".}

func mm256_mask_mov_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_mov_ps".}

func mm256_maskz_mov_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_mov_ps".}

func mm_mask_mov_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_mov_ps".}

func mm_maskz_mov_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_mov_ps".}

func mm256_mask_load_ps*(w: M256, u: MMask8, p: pointer): M256 {.importc: "_mm256_mask_load_ps".}

func mm256_maskz_load_ps*(u: MMask8, p: pointer): M256 {.importc: "_mm256_maskz_load_ps".}

func mm_mask_load_ps*(w: M128, u: MMask8, p: pointer): M128 {.importc: "_mm_mask_load_ps".}

func mm_maskz_load_ps*(u: MMask8, p: pointer): M128 {.importc: "_mm_maskz_load_ps".}

func mm256_mask_store_ps*(p: pointer, u: MMask8, a: M256): void {.importc: "_mm256_mask_store_ps".}

func mm_mask_store_ps*(p: pointer, u: MMask8, a: M128): void {.importc: "_mm_mask_store_ps".}

func mm256_mask_mov_epi64*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_mov_epi64".}

func mm256_maskz_mov_epi64*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_mov_epi64".}

func mm_mask_mov_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_mov_epi64".}

func mm_maskz_mov_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_mov_epi64".}

func mm256_load_epi64*(p: pointer): M256i {.importc: "_mm256_load_epi64".}

func mm256_mask_load_epi64*(w: M256i, u: MMask8, p: pointer): M256i {.importc: "_mm256_mask_load_epi64".}

func mm256_maskz_load_epi64*(u: MMask8, p: pointer): M256i {.importc: "_mm256_maskz_load_epi64".}

func mm_load_epi64*(p: pointer): M128i {.importc: "_mm_load_epi64".}

func mm_mask_load_epi64*(w: M128i, u: MMask8, p: pointer): M128i {.importc: "_mm_mask_load_epi64".}

func mm_maskz_load_epi64*(u: MMask8, p: pointer): M128i {.importc: "_mm_maskz_load_epi64".}

func mm256_mask_store_epi64*(p: pointer, u: MMask8, a: M256i): void {.importc: "_mm256_mask_store_epi64".}

func mm_mask_store_epi64*(p: pointer, u: MMask8, a: M128i): void {.importc: "_mm_mask_store_epi64".}

func mm256_mask_mov_epi32*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_mov_epi32".}

func mm256_maskz_mov_epi32*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_mov_epi32".}

func mm_mask_mov_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_mov_epi32".}

func mm_maskz_mov_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_mov_epi32".}

func mm256_load_epi32*(p: pointer): M256i {.importc: "_mm256_load_epi32".}

func mm256_mask_load_epi32*(w: M256i, u: MMask8, p: pointer): M256i {.importc: "_mm256_mask_load_epi32".}

func mm256_maskz_load_epi32*(u: MMask8, p: pointer): M256i {.importc: "_mm256_maskz_load_epi32".}

func mm_load_epi32*(p: pointer): M128i {.importc: "_mm_load_epi32".}

func mm_mask_load_epi32*(w: M128i, u: MMask8, p: pointer): M128i {.importc: "_mm_mask_load_epi32".}

func mm_maskz_load_epi32*(u: MMask8, p: pointer): M128i {.importc: "_mm_maskz_load_epi32".}

func mm256_store_epi32*(p: pointer, a: M256i): void {.importc: "_mm256_store_epi32".}

func mm256_mask_store_epi32*(p: pointer, u: MMask8, a: M256i): void {.importc: "_mm256_mask_store_epi32".}

func mm_store_epi32*(p: pointer, a: M128i): void {.importc: "_mm_store_epi32".}

func mm_mask_store_epi32*(p: pointer, u: MMask8, a: M128i): void {.importc: "_mm_mask_store_epi32".}

func mm_mask_add_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_add_pd".}

func mm_maskz_add_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_add_pd".}

func mm256_mask_add_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_add_pd".}

func mm256_maskz_add_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_add_pd".}

func mm_mask_add_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_add_ps".}

func mm_maskz_add_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_add_ps".}

func mm256_mask_add_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_add_ps".}

func mm256_maskz_add_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_add_ps".}

func mm_mask_sub_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_sub_pd".}

func mm_maskz_sub_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_sub_pd".}

func mm256_mask_sub_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_sub_pd".}

func mm256_maskz_sub_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_sub_pd".}

func mm_mask_sub_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_sub_ps".}

func mm_maskz_sub_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_sub_ps".}

func mm256_mask_sub_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_sub_ps".}

func mm256_maskz_sub_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_sub_ps".}

func mm256_store_epi64*(p: pointer, a: M256i): void {.importc: "_mm256_store_epi64".}

func mm_store_epi64*(p: pointer, a: M128i): void {.importc: "_mm_store_epi64".}

func mm256_mask_loadu_pd*(w: M256d, u: MMask8, p: pointer): M256d {.importc: "_mm256_mask_loadu_pd".}

func mm256_maskz_loadu_pd*(u: MMask8, p: pointer): M256d {.importc: "_mm256_maskz_loadu_pd".}

func mm_mask_loadu_pd*(w: M128d, u: MMask8, p: pointer): M128d {.importc: "_mm_mask_loadu_pd".}

func mm_maskz_loadu_pd*(u: MMask8, p: pointer): M128d {.importc: "_mm_maskz_loadu_pd".}

func mm256_mask_storeu_pd*(p: pointer, u: MMask8, a: M256d): void {.importc: "_mm256_mask_storeu_pd".}

func mm_mask_storeu_pd*(p: pointer, u: MMask8, a: M128d): void {.importc: "_mm_mask_storeu_pd".}

func mm256_mask_loadu_ps*(w: M256, u: MMask8, p: pointer): M256 {.importc: "_mm256_mask_loadu_ps".}

func mm256_maskz_loadu_ps*(u: MMask8, p: pointer): M256 {.importc: "_mm256_maskz_loadu_ps".}

func mm_mask_loadu_ps*(w: M128, u: MMask8, p: pointer): M128 {.importc: "_mm_mask_loadu_ps".}

func mm_maskz_loadu_ps*(u: MMask8, p: pointer): M128 {.importc: "_mm_maskz_loadu_ps".}

func mm256_mask_storeu_ps*(p: pointer, u: MMask8, a: M256): void {.importc: "_mm256_mask_storeu_ps".}

func mm_mask_storeu_ps*(p: pointer, u: MMask8, a: M128): void {.importc: "_mm_mask_storeu_ps".}

func mm256_loadu_epi64*(p: pointer): M256i {.importc: "_mm256_loadu_epi64".}

func mm256_mask_loadu_epi64*(w: M256i, u: MMask8, p: pointer): M256i {.importc: "_mm256_mask_loadu_epi64".}

func mm256_maskz_loadu_epi64*(u: MMask8, p: pointer): M256i {.importc: "_mm256_maskz_loadu_epi64".}

func mm_loadu_epi64*(p: pointer): M128i {.importc: "_mm_loadu_epi64".}

func mm_mask_loadu_epi64*(w: M128i, u: MMask8, p: pointer): M128i {.importc: "_mm_mask_loadu_epi64".}

func mm_maskz_loadu_epi64*(u: MMask8, p: pointer): M128i {.importc: "_mm_maskz_loadu_epi64".}

func mm256_storeu_epi64*(p: pointer, a: M256i): void {.importc: "_mm256_storeu_epi64".}

func mm256_mask_storeu_epi64*(p: pointer, u: MMask8, a: M256i): void {.importc: "_mm256_mask_storeu_epi64".}

func mm_storeu_epi64*(p: pointer, a: M128i): void {.importc: "_mm_storeu_epi64".}

func mm_mask_storeu_epi64*(p: pointer, u: MMask8, a: M128i): void {.importc: "_mm_mask_storeu_epi64".}

func mm256_loadu_epi32*(p: pointer): M256i {.importc: "_mm256_loadu_epi32".}

func mm256_mask_loadu_epi32*(w: M256i, u: MMask8, p: pointer): M256i {.importc: "_mm256_mask_loadu_epi32".}

func mm256_maskz_loadu_epi32*(u: MMask8, p: pointer): M256i {.importc: "_mm256_maskz_loadu_epi32".}

func mm_loadu_epi32*(p: pointer): M128i {.importc: "_mm_loadu_epi32".}

func mm_mask_loadu_epi32*(w: M128i, u: MMask8, p: pointer): M128i {.importc: "_mm_mask_loadu_epi32".}

func mm_maskz_loadu_epi32*(u: MMask8, p: pointer): M128i {.importc: "_mm_maskz_loadu_epi32".}

func mm256_storeu_epi32*(p: pointer, a: M256i): void {.importc: "_mm256_storeu_epi32".}

func mm256_mask_storeu_epi32*(p: pointer, u: MMask8, a: M256i): void {.importc: "_mm256_mask_storeu_epi32".}

func mm_storeu_epi32*(p: pointer, a: M128i): void {.importc: "_mm_storeu_epi32".}

func mm_mask_storeu_epi32*(p: pointer, u: MMask8, a: M128i): void {.importc: "_mm_mask_storeu_epi32".}

func mm256_mask_blend_pd*(u: MMask8, a: M256d, w: M256d): M256d {.importc: "_mm256_mask_blend_pd".}

func mm256_mask_blend_ps*(u: MMask8, a: M256, w: M256): M256 {.importc: "_mm256_mask_blend_ps".}

func mm256_mask_blend_epi64*(u: MMask8, a: M256i, w: M256i): M256i {.importc: "_mm256_mask_blend_epi64".}

func mm256_mask_blend_epi32*(u: MMask8, a: M256i, w: M256i): M256i {.importc: "_mm256_mask_blend_epi32".}

func mm_mask_blend_pd*(u: MMask8, a: M128d, w: M128d): M128d {.importc: "_mm_mask_blend_pd".}

func mm_mask_blend_ps*(u: MMask8, a: M128, w: M128): M128 {.importc: "_mm_mask_blend_ps".}

func mm_mask_blend_epi64*(u: MMask8, a: M128i, w: M128i): M128i {.importc: "_mm_mask_blend_epi64".}

func mm_mask_blend_epi32*(u: MMask8, a: M128i, w: M128i): M128i {.importc: "_mm_mask_blend_epi32".}

func mm256_mask_abs_epi32*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_abs_epi32".}

func mm256_maskz_abs_epi32*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_abs_epi32".}

func mm_mask_abs_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_abs_epi32".}

func mm_maskz_abs_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_abs_epi32".}

func mm256_abs_epi64*(a: M256i): M256i {.importc: "_mm256_abs_epi64".}

func mm256_mask_abs_epi64*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_abs_epi64".}

func mm256_maskz_abs_epi64*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_abs_epi64".}

func mm_abs_epi64*(a: M128i): M128i {.importc: "_mm_abs_epi64".}

func mm_mask_abs_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_abs_epi64".}

func mm_maskz_abs_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_abs_epi64".}

func mm256_cvtpd_epu32*(a: M256d): M128i {.importc: "_mm256_cvtpd_epu32".}

func mm256_mask_cvtpd_epu32*(w: M128i, u: MMask8, a: M256d): M128i {.importc: "_mm256_mask_cvtpd_epu32".}

func mm256_maskz_cvtpd_epu32*(u: MMask8, a: M256d): M128i {.importc: "_mm256_maskz_cvtpd_epu32".}

func mm_cvtpd_epu32*(a: M128d): M128i {.importc: "_mm_cvtpd_epu32".}

func mm_mask_cvtpd_epu32*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvtpd_epu32".}

func mm_maskz_cvtpd_epu32*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvtpd_epu32".}

func mm256_mask_cvttps_epi32*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_cvttps_epi32".}

func mm256_maskz_cvttps_epi32*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_cvttps_epi32".}

func mm_mask_cvttps_epi32*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvttps_epi32".}

func mm_maskz_cvttps_epi32*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvttps_epi32".}

func mm256_cvttps_epu32*(a: M256): M256i {.importc: "_mm256_cvttps_epu32".}

func mm256_mask_cvttps_epu32*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_cvttps_epu32".}

func mm256_maskz_cvttps_epu32*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_cvttps_epu32".}

func mm_cvttps_epu32*(a: M128): M128i {.importc: "_mm_cvttps_epu32".}

func mm_mask_cvttps_epu32*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvttps_epu32".}

func mm_maskz_cvttps_epu32*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvttps_epu32".}

func mm256_mask_cvttpd_epi32*(w: M128i, u: MMask8, a: M256d): M128i {.importc: "_mm256_mask_cvttpd_epi32".}

func mm256_maskz_cvttpd_epi32*(u: MMask8, a: M256d): M128i {.importc: "_mm256_maskz_cvttpd_epi32".}

func mm_mask_cvttpd_epi32*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvttpd_epi32".}

func mm_maskz_cvttpd_epi32*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvttpd_epi32".}

func mm256_cvttpd_epu32*(a: M256d): M128i {.importc: "_mm256_cvttpd_epu32".}

func mm256_mask_cvttpd_epu32*(w: M128i, u: MMask8, a: M256d): M128i {.importc: "_mm256_mask_cvttpd_epu32".}

func mm256_maskz_cvttpd_epu32*(u: MMask8, a: M256d): M128i {.importc: "_mm256_maskz_cvttpd_epu32".}

func mm_cvttpd_epu32*(a: M128d): M128i {.importc: "_mm_cvttpd_epu32".}

func mm_mask_cvttpd_epu32*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvttpd_epu32".}

func mm_maskz_cvttpd_epu32*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvttpd_epu32".}

func mm256_mask_cvtpd_epi32*(w: M128i, u: MMask8, a: M256d): M128i {.importc: "_mm256_mask_cvtpd_epi32".}

func mm256_maskz_cvtpd_epi32*(u: MMask8, a: M256d): M128i {.importc: "_mm256_maskz_cvtpd_epi32".}

func mm_mask_cvtpd_epi32*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvtpd_epi32".}

func mm_maskz_cvtpd_epi32*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvtpd_epi32".}

func mm256_mask_cvtepi32_pd*(w: M256d, u: MMask8, a: M128i): M256d {.importc: "_mm256_mask_cvtepi32_pd".}

func mm256_maskz_cvtepi32_pd*(u: MMask8, a: M128i): M256d {.importc: "_mm256_maskz_cvtepi32_pd".}

func mm_mask_cvtepi32_pd*(w: M128d, u: MMask8, a: M128i): M128d {.importc: "_mm_mask_cvtepi32_pd".}

func mm_maskz_cvtepi32_pd*(u: MMask8, a: M128i): M128d {.importc: "_mm_maskz_cvtepi32_pd".}

func mm256_cvtepu32_pd*(a: M128i): M256d {.importc: "_mm256_cvtepu32_pd".}

func mm256_mask_cvtepu32_pd*(w: M256d, u: MMask8, a: M128i): M256d {.importc: "_mm256_mask_cvtepu32_pd".}

func mm256_maskz_cvtepu32_pd*(u: MMask8, a: M128i): M256d {.importc: "_mm256_maskz_cvtepu32_pd".}

func mm_cvtepu32_pd*(a: M128i): M128d {.importc: "_mm_cvtepu32_pd".}

func mm_mask_cvtepu32_pd*(w: M128d, u: MMask8, a: M128i): M128d {.importc: "_mm_mask_cvtepu32_pd".}

func mm_maskz_cvtepu32_pd*(u: MMask8, a: M128i): M128d {.importc: "_mm_maskz_cvtepu32_pd".}

func mm256_mask_cvtepi32_ps*(w: M256, u: MMask8, a: M256i): M256 {.importc: "_mm256_mask_cvtepi32_ps".}

func mm256_maskz_cvtepi32_ps*(u: MMask8, a: M256i): M256 {.importc: "_mm256_maskz_cvtepi32_ps".}

func mm_mask_cvtepi32_ps*(w: M128, u: MMask8, a: M128i): M128 {.importc: "_mm_mask_cvtepi32_ps".}

func mm_maskz_cvtepi32_ps*(u: MMask8, a: M128i): M128 {.importc: "_mm_maskz_cvtepi32_ps".}

func mm256_cvtepu32_ps*(a: M256i): M256 {.importc: "_mm256_cvtepu32_ps".}

func mm256_mask_cvtepu32_ps*(w: M256, u: MMask8, a: M256i): M256 {.importc: "_mm256_mask_cvtepu32_ps".}

func mm256_maskz_cvtepu32_ps*(u: MMask8, a: M256i): M256 {.importc: "_mm256_maskz_cvtepu32_ps".}

func mm_cvtepu32_ps*(a: M128i): M128 {.importc: "_mm_cvtepu32_ps".}

func mm_mask_cvtepu32_ps*(w: M128, u: MMask8, a: M128i): M128 {.importc: "_mm_mask_cvtepu32_ps".}

func mm_maskz_cvtepu32_ps*(u: MMask8, a: M128i): M128 {.importc: "_mm_maskz_cvtepu32_ps".}

func mm256_mask_cvtps_pd*(w: M256d, u: MMask8, a: M128): M256d {.importc: "_mm256_mask_cvtps_pd".}

func mm256_maskz_cvtps_pd*(u: MMask8, a: M128): M256d {.importc: "_mm256_maskz_cvtps_pd".}

func mm_mask_cvtps_pd*(w: M128d, u: MMask8, a: M128): M128d {.importc: "_mm_mask_cvtps_pd".}

func mm_maskz_cvtps_pd*(u: MMask8, a: M128): M128d {.importc: "_mm_maskz_cvtps_pd".}

func mm_cvtepi32_epi8*(a: M128i): M128i {.importc: "_mm_cvtepi32_epi8".}

func mm_mask_cvtepi32_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtepi32_storeu_epi8".}

func mm_mask_cvtepi32_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi32_epi8".}

func mm_maskz_cvtepi32_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi32_epi8".}

func mm256_cvtepi32_epi8*(a: M256i): M128i {.importc: "_mm256_cvtepi32_epi8".}

func mm256_mask_cvtepi32_epi8*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtepi32_epi8".}

func mm256_mask_cvtepi32_storeu_epi8*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtepi32_storeu_epi8".}

func mm256_maskz_cvtepi32_epi8*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtepi32_epi8".}

func mm_cvtsepi32_epi8*(a: M128i): M128i {.importc: "_mm_cvtsepi32_epi8".}

func mm_mask_cvtsepi32_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtsepi32_storeu_epi8".}

func mm_mask_cvtsepi32_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtsepi32_epi8".}

func mm_maskz_cvtsepi32_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtsepi32_epi8".}

func mm256_cvtsepi32_epi8*(a: M256i): M128i {.importc: "_mm256_cvtsepi32_epi8".}

func mm256_mask_cvtsepi32_storeu_epi8*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtsepi32_storeu_epi8".}

func mm256_mask_cvtsepi32_epi8*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtsepi32_epi8".}

func mm256_maskz_cvtsepi32_epi8*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtsepi32_epi8".}

func mm_cvtusepi32_epi8*(a: M128i): M128i {.importc: "_mm_cvtusepi32_epi8".}

func mm_mask_cvtusepi32_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtusepi32_storeu_epi8".}

func mm_mask_cvtusepi32_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtusepi32_epi8".}

func mm_maskz_cvtusepi32_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtusepi32_epi8".}

func mm256_cvtusepi32_epi8*(a: M256i): M128i {.importc: "_mm256_cvtusepi32_epi8".}

func mm256_mask_cvtusepi32_storeu_epi8*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtusepi32_storeu_epi8".}

func mm256_mask_cvtusepi32_epi8*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtusepi32_epi8".}

func mm256_maskz_cvtusepi32_epi8*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtusepi32_epi8".}

func mm_cvtepi32_epi16*(a: M128i): M128i {.importc: "_mm_cvtepi32_epi16".}

func mm_mask_cvtepi32_storeu_epi16*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtepi32_storeu_epi16".}

func mm_mask_cvtepi32_epi16*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi32_epi16".}

func mm_maskz_cvtepi32_epi16*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi32_epi16".}

func mm256_cvtepi32_epi16*(a: M256i): M128i {.importc: "_mm256_cvtepi32_epi16".}

func mm256_mask_cvtepi32_storeu_epi16*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtepi32_storeu_epi16".}

func mm256_mask_cvtepi32_epi16*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtepi32_epi16".}

func mm256_maskz_cvtepi32_epi16*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtepi32_epi16".}

func mm_cvtsepi32_epi16*(a: M128i): M128i {.importc: "_mm_cvtsepi32_epi16".}

func mm_mask_cvtsepi32_storeu_epi16*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtsepi32_storeu_epi16".}

func mm_mask_cvtsepi32_epi16*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtsepi32_epi16".}

func mm_maskz_cvtsepi32_epi16*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtsepi32_epi16".}

func mm256_cvtsepi32_epi16*(a: M256i): M128i {.importc: "_mm256_cvtsepi32_epi16".}

func mm256_mask_cvtsepi32_storeu_epi16*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtsepi32_storeu_epi16".}

func mm256_mask_cvtsepi32_epi16*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtsepi32_epi16".}

func mm256_maskz_cvtsepi32_epi16*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtsepi32_epi16".}

func mm_cvtusepi32_epi16*(a: M128i): M128i {.importc: "_mm_cvtusepi32_epi16".}

func mm_mask_cvtusepi32_storeu_epi16*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtusepi32_storeu_epi16".}

func mm_mask_cvtusepi32_epi16*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtusepi32_epi16".}

func mm_maskz_cvtusepi32_epi16*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtusepi32_epi16".}

func mm256_cvtusepi32_epi16*(a: M256i): M128i {.importc: "_mm256_cvtusepi32_epi16".}

func mm256_mask_cvtusepi32_storeu_epi16*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtusepi32_storeu_epi16".}

func mm256_mask_cvtusepi32_epi16*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtusepi32_epi16".}

func mm256_maskz_cvtusepi32_epi16*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtusepi32_epi16".}

func mm_cvtepi64_epi8*(a: M128i): M128i {.importc: "_mm_cvtepi64_epi8".}

func mm_mask_cvtepi64_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtepi64_storeu_epi8".}

func mm_mask_cvtepi64_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi64_epi8".}

func mm_maskz_cvtepi64_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi64_epi8".}

func mm256_cvtepi64_epi8*(a: M256i): M128i {.importc: "_mm256_cvtepi64_epi8".}

func mm256_mask_cvtepi64_storeu_epi8*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtepi64_storeu_epi8".}

func mm256_mask_cvtepi64_epi8*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtepi64_epi8".}

func mm256_maskz_cvtepi64_epi8*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtepi64_epi8".}

func mm_cvtsepi64_epi8*(a: M128i): M128i {.importc: "_mm_cvtsepi64_epi8".}

func mm_mask_cvtsepi64_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtsepi64_storeu_epi8".}

func mm_mask_cvtsepi64_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtsepi64_epi8".}

func mm_maskz_cvtsepi64_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtsepi64_epi8".}

func mm256_cvtsepi64_epi8*(a: M256i): M128i {.importc: "_mm256_cvtsepi64_epi8".}

func mm256_mask_cvtsepi64_storeu_epi8*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtsepi64_storeu_epi8".}

func mm256_mask_cvtsepi64_epi8*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtsepi64_epi8".}

func mm256_maskz_cvtsepi64_epi8*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtsepi64_epi8".}

func mm_cvtusepi64_epi8*(a: M128i): M128i {.importc: "_mm_cvtusepi64_epi8".}

func mm_mask_cvtusepi64_storeu_epi8*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtusepi64_storeu_epi8".}

func mm_mask_cvtusepi64_epi8*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtusepi64_epi8".}

func mm_maskz_cvtusepi64_epi8*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtusepi64_epi8".}

func mm256_cvtusepi64_epi8*(a: M256i): M128i {.importc: "_mm256_cvtusepi64_epi8".}

func mm256_mask_cvtusepi64_storeu_epi8*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtusepi64_storeu_epi8".}

func mm256_mask_cvtusepi64_epi8*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtusepi64_epi8".}

func mm256_maskz_cvtusepi64_epi8*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtusepi64_epi8".}

func mm_cvtepi64_epi16*(a: M128i): M128i {.importc: "_mm_cvtepi64_epi16".}

func mm_mask_cvtepi64_storeu_epi16*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtepi64_storeu_epi16".}

func mm_mask_cvtepi64_epi16*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi64_epi16".}

func mm_maskz_cvtepi64_epi16*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi64_epi16".}

func mm256_cvtepi64_epi16*(a: M256i): M128i {.importc: "_mm256_cvtepi64_epi16".}

func mm256_mask_cvtepi64_storeu_epi16*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtepi64_storeu_epi16".}

func mm256_mask_cvtepi64_epi16*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtepi64_epi16".}

func mm256_maskz_cvtepi64_epi16*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtepi64_epi16".}

func mm_cvtsepi64_epi16*(a: M128i): M128i {.importc: "_mm_cvtsepi64_epi16".}

func mm_mask_cvtsepi64_storeu_epi16*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtsepi64_storeu_epi16".}

func mm_mask_cvtsepi64_epi16*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtsepi64_epi16".}

func mm_maskz_cvtsepi64_epi16*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtsepi64_epi16".}

func mm256_cvtsepi64_epi16*(a: M256i): M128i {.importc: "_mm256_cvtsepi64_epi16".}

func mm256_mask_cvtsepi64_storeu_epi16*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtsepi64_storeu_epi16".}

func mm256_mask_cvtsepi64_epi16*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtsepi64_epi16".}

func mm256_maskz_cvtsepi64_epi16*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtsepi64_epi16".}

func mm_cvtusepi64_epi16*(a: M128i): M128i {.importc: "_mm_cvtusepi64_epi16".}

func mm_mask_cvtusepi64_storeu_epi16*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtusepi64_storeu_epi16".}

func mm_mask_cvtusepi64_epi16*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtusepi64_epi16".}

func mm_maskz_cvtusepi64_epi16*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtusepi64_epi16".}

func mm256_cvtusepi64_epi16*(a: M256i): M128i {.importc: "_mm256_cvtusepi64_epi16".}

func mm256_mask_cvtusepi64_storeu_epi16*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtusepi64_storeu_epi16".}

func mm256_mask_cvtusepi64_epi16*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtusepi64_epi16".}

func mm256_maskz_cvtusepi64_epi16*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtusepi64_epi16".}

func mm_cvtepi64_epi32*(a: M128i): M128i {.importc: "_mm_cvtepi64_epi32".}

func mm_mask_cvtepi64_storeu_epi32*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtepi64_storeu_epi32".}

func mm_mask_cvtepi64_epi32*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi64_epi32".}

func mm_maskz_cvtepi64_epi32*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi64_epi32".}

func mm256_cvtepi64_epi32*(a: M256i): M128i {.importc: "_mm256_cvtepi64_epi32".}

func mm256_mask_cvtepi64_storeu_epi32*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtepi64_storeu_epi32".}

func mm256_mask_cvtepi64_epi32*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtepi64_epi32".}

func mm256_maskz_cvtepi64_epi32*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtepi64_epi32".}

func mm_cvtsepi64_epi32*(a: M128i): M128i {.importc: "_mm_cvtsepi64_epi32".}

func mm_mask_cvtsepi64_storeu_epi32*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtsepi64_storeu_epi32".}

func mm_mask_cvtsepi64_epi32*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtsepi64_epi32".}

func mm_maskz_cvtsepi64_epi32*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtsepi64_epi32".}

func mm256_cvtsepi64_epi32*(a: M256i): M128i {.importc: "_mm256_cvtsepi64_epi32".}

func mm256_mask_cvtsepi64_storeu_epi32*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtsepi64_storeu_epi32".}

func mm256_mask_cvtsepi64_epi32*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtsepi64_epi32".}

func mm256_maskz_cvtsepi64_epi32*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtsepi64_epi32".}

func mm_cvtusepi64_epi32*(a: M128i): M128i {.importc: "_mm_cvtusepi64_epi32".}

func mm_mask_cvtusepi64_storeu_epi32*(p: pointer, m: MMask8, a: M128i): void {.importc: "_mm_mask_cvtusepi64_storeu_epi32".}

func mm_mask_cvtusepi64_epi32*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtusepi64_epi32".}

func mm_maskz_cvtusepi64_epi32*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtusepi64_epi32".}

func mm256_cvtusepi64_epi32*(a: M256i): M128i {.importc: "_mm256_cvtusepi64_epi32".}

func mm256_mask_cvtusepi64_storeu_epi32*(p: pointer, m: MMask8, a: M256i): void {.importc: "_mm256_mask_cvtusepi64_storeu_epi32".}

func mm256_mask_cvtusepi64_epi32*(o: M128i, m: MMask8, a: M256i): M128i {.importc: "_mm256_mask_cvtusepi64_epi32".}

func mm256_maskz_cvtusepi64_epi32*(m: MMask8, a: M256i): M128i {.importc: "_mm256_maskz_cvtusepi64_epi32".}

func mm256_mask_broadcastss_ps*(o: M256, m: MMask8, a: M128): M256 {.importc: "_mm256_mask_broadcastss_ps".}

func mm256_maskz_broadcastss_ps*(m: MMask8, a: M128): M256 {.importc: "_mm256_maskz_broadcastss_ps".}

func mm_mask_broadcastss_ps*(o: M128, m: MMask8, a: M128): M128 {.importc: "_mm_mask_broadcastss_ps".}

func mm_maskz_broadcastss_ps*(m: MMask8, a: M128): M128 {.importc: "_mm_maskz_broadcastss_ps".}

func mm256_mask_broadcastsd_pd*(o: M256d, m: MMask8, a: M128d): M256d {.importc: "_mm256_mask_broadcastsd_pd".}

func mm256_maskz_broadcastsd_pd*(m: MMask8, a: M128d): M256d {.importc: "_mm256_maskz_broadcastsd_pd".}

func mm256_mask_broadcastd_epi32*(o: M256i, m: MMask8, a: M128i): M256i {.importc: "_mm256_mask_broadcastd_epi32".}

func mm256_maskz_broadcastd_epi32*(m: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_broadcastd_epi32".}

func mm256_mask_set1_epi32*(o: M256i, m: MMask8, a: int32): M256i {.importc: "_mm256_mask_set1_epi32".}

func mm256_maskz_set1_epi32*(m: MMask8, a: int32): M256i {.importc: "_mm256_maskz_set1_epi32".}

func mm_mask_broadcastd_epi32*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_broadcastd_epi32".}

func mm_maskz_broadcastd_epi32*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_broadcastd_epi32".}

func mm_mask_set1_epi32*(o: M128i, m: MMask8, a: int32): M128i {.importc: "_mm_mask_set1_epi32".}

func mm_maskz_set1_epi32*(m: MMask8, a: int32): M128i {.importc: "_mm_maskz_set1_epi32".}

func mm256_mask_broadcastq_epi64*(o: M256i, m: MMask8, a: M128i): M256i {.importc: "_mm256_mask_broadcastq_epi64".}

func mm256_maskz_broadcastq_epi64*(m: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_broadcastq_epi64".}

func mm256_mask_set1_epi64*(o: M256i, m: MMask8, a: int64): M256i {.importc: "_mm256_mask_set1_epi64".}

func mm256_maskz_set1_epi64*(m: MMask8, a: int64): M256i {.importc: "_mm256_maskz_set1_epi64".}

func mm_mask_broadcastq_epi64*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_broadcastq_epi64".}

func mm_maskz_broadcastq_epi64*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_broadcastq_epi64".}

func mm_mask_set1_epi64*(o: M128i, m: MMask8, a: int64): M128i {.importc: "_mm_mask_set1_epi64".}

func mm_maskz_set1_epi64*(m: MMask8, a: int64): M128i {.importc: "_mm_maskz_set1_epi64".}

func mm256_broadcast_f32x4*(a: M128): M256 {.importc: "_mm256_broadcast_f32x4".}

func mm256_mask_broadcast_f32x4*(o: M256, m: MMask8, a: M128): M256 {.importc: "_mm256_mask_broadcast_f32x4".}

func mm256_maskz_broadcast_f32x4*(m: MMask8, a: M128): M256 {.importc: "_mm256_maskz_broadcast_f32x4".}

func mm256_broadcast_i32x4*(a: M128i): M256i {.importc: "_mm256_broadcast_i32x4".}

func mm256_mask_broadcast_i32x4*(o: M256i, m: MMask8, a: M128i): M256i {.importc: "_mm256_mask_broadcast_i32x4".}

func mm256_maskz_broadcast_i32x4*(m: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_broadcast_i32x4".}

func mm256_mask_cvtepi8_epi32*(w: M256i, u: MMask8, a: M128i): M256i {.importc: "_mm256_mask_cvtepi8_epi32".}

func mm256_maskz_cvtepi8_epi32*(u: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_cvtepi8_epi32".}

func mm_mask_cvtepi8_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi8_epi32".}

func mm_maskz_cvtepi8_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi8_epi32".}

func mm256_mask_cvtepi8_epi64*(w: M256i, u: MMask8, a: M128i): M256i {.importc: "_mm256_mask_cvtepi8_epi64".}

func mm256_maskz_cvtepi8_epi64*(u: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_cvtepi8_epi64".}

func mm_mask_cvtepi8_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi8_epi64".}

func mm_maskz_cvtepi8_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi8_epi64".}

func mm256_mask_cvtepi16_epi32*(w: M256i, u: MMask8, a: M128i): M256i {.importc: "_mm256_mask_cvtepi16_epi32".}

func mm256_maskz_cvtepi16_epi32*(u: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_cvtepi16_epi32".}

func mm_mask_cvtepi16_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi16_epi32".}

func mm_maskz_cvtepi16_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi16_epi32".}

func mm256_mask_cvtepi16_epi64*(w: M256i, u: MMask8, a: M128i): M256i {.importc: "_mm256_mask_cvtepi16_epi64".}

func mm256_maskz_cvtepi16_epi64*(u: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_cvtepi16_epi64".}

func mm_mask_cvtepi16_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepi16_epi64".}

func mm_maskz_cvtepi16_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepi16_epi64".}

func mm256_mask_cvtepi32_epi64*(w: M256i, u: MMask8, x: M128i): M256i {.importc: "_mm256_mask_cvtepi32_epi64".}

func mm256_maskz_cvtepi32_epi64*(u: MMask8, x: M128i): M256i {.importc: "_mm256_maskz_cvtepi32_epi64".}

func mm_mask_cvtepi32_epi64*(w: M128i, u: MMask8, x: M128i): M128i {.importc: "_mm_mask_cvtepi32_epi64".}

func mm_maskz_cvtepi32_epi64*(u: MMask8, x: M128i): M128i {.importc: "_mm_maskz_cvtepi32_epi64".}

func mm256_mask_cvtepu8_epi32*(w: M256i, u: MMask8, a: M128i): M256i {.importc: "_mm256_mask_cvtepu8_epi32".}

func mm256_maskz_cvtepu8_epi32*(u: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_cvtepu8_epi32".}

func mm_mask_cvtepu8_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepu8_epi32".}

func mm_maskz_cvtepu8_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepu8_epi32".}

func mm256_mask_cvtepu8_epi64*(w: M256i, u: MMask8, a: M128i): M256i {.importc: "_mm256_mask_cvtepu8_epi64".}

func mm256_maskz_cvtepu8_epi64*(u: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_cvtepu8_epi64".}

func mm_mask_cvtepu8_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepu8_epi64".}

func mm_maskz_cvtepu8_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepu8_epi64".}

func mm256_mask_cvtepu16_epi32*(w: M256i, u: MMask8, a: M128i): M256i {.importc: "_mm256_mask_cvtepu16_epi32".}

func mm256_maskz_cvtepu16_epi32*(u: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_cvtepu16_epi32".}

func mm_mask_cvtepu16_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepu16_epi32".}

func mm_maskz_cvtepu16_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepu16_epi32".}

func mm256_mask_cvtepu16_epi64*(w: M256i, u: MMask8, a: M128i): M256i {.importc: "_mm256_mask_cvtepu16_epi64".}

func mm256_maskz_cvtepu16_epi64*(u: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_cvtepu16_epi64".}

func mm_mask_cvtepu16_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_cvtepu16_epi64".}

func mm_maskz_cvtepu16_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_cvtepu16_epi64".}

func mm256_mask_cvtepu32_epi64*(w: M256i, u: MMask8, x: M128i): M256i {.importc: "_mm256_mask_cvtepu32_epi64".}

func mm256_maskz_cvtepu32_epi64*(u: MMask8, x: M128i): M256i {.importc: "_mm256_maskz_cvtepu32_epi64".}

func mm_mask_cvtepu32_epi64*(w: M128i, u: MMask8, x: M128i): M128i {.importc: "_mm_mask_cvtepu32_epi64".}

func mm_maskz_cvtepu32_epi64*(u: MMask8, x: M128i): M128i {.importc: "_mm_maskz_cvtepu32_epi64".}

func mm256_rcp14_pd*(a: M256d): M256d {.importc: "_mm256_rcp14_pd".}

func mm256_mask_rcp14_pd*(w: M256d, u: MMask8, a: M256d): M256d {.importc: "_mm256_mask_rcp14_pd".}

func mm256_maskz_rcp14_pd*(u: MMask8, a: M256d): M256d {.importc: "_mm256_maskz_rcp14_pd".}

func mm_rcp14_pd*(a: M128d): M128d {.importc: "_mm_rcp14_pd".}

func mm_mask_rcp14_pd*(w: M128d, u: MMask8, a: M128d): M128d {.importc: "_mm_mask_rcp14_pd".}

func mm_maskz_rcp14_pd*(u: MMask8, a: M128d): M128d {.importc: "_mm_maskz_rcp14_pd".}

func mm256_rcp14_ps*(a: M256): M256 {.importc: "_mm256_rcp14_ps".}

func mm256_mask_rcp14_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_rcp14_ps".}

func mm256_maskz_rcp14_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_rcp14_ps".}

func mm_rcp14_ps*(a: M128): M128 {.importc: "_mm_rcp14_ps".}

func mm_mask_rcp14_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_rcp14_ps".}

func mm_maskz_rcp14_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_rcp14_ps".}

func mm256_rsqrt14_pd*(a: M256d): M256d {.importc: "_mm256_rsqrt14_pd".}

func mm256_mask_rsqrt14_pd*(w: M256d, u: MMask8, a: M256d): M256d {.importc: "_mm256_mask_rsqrt14_pd".}

func mm256_maskz_rsqrt14_pd*(u: MMask8, a: M256d): M256d {.importc: "_mm256_maskz_rsqrt14_pd".}

func mm_rsqrt14_pd*(a: M128d): M128d {.importc: "_mm_rsqrt14_pd".}

func mm_mask_rsqrt14_pd*(w: M128d, u: MMask8, a: M128d): M128d {.importc: "_mm_mask_rsqrt14_pd".}

func mm_maskz_rsqrt14_pd*(u: MMask8, a: M128d): M128d {.importc: "_mm_maskz_rsqrt14_pd".}

func mm256_rsqrt14_ps*(a: M256): M256 {.importc: "_mm256_rsqrt14_ps".}

func mm256_mask_rsqrt14_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_rsqrt14_ps".}

func mm256_maskz_rsqrt14_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_rsqrt14_ps".}

func mm_rsqrt14_ps*(a: M128): M128 {.importc: "_mm_rsqrt14_ps".}

func mm_mask_rsqrt14_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_rsqrt14_ps".}

func mm_maskz_rsqrt14_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_rsqrt14_ps".}

func mm256_mask_sqrt_pd*(w: M256d, u: MMask8, a: M256d): M256d {.importc: "_mm256_mask_sqrt_pd".}

func mm256_maskz_sqrt_pd*(u: MMask8, a: M256d): M256d {.importc: "_mm256_maskz_sqrt_pd".}

func mm_mask_sqrt_pd*(w: M128d, u: MMask8, a: M128d): M128d {.importc: "_mm_mask_sqrt_pd".}

func mm_maskz_sqrt_pd*(u: MMask8, a: M128d): M128d {.importc: "_mm_maskz_sqrt_pd".}

func mm256_mask_sqrt_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_sqrt_ps".}

func mm256_maskz_sqrt_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_sqrt_ps".}

func mm_mask_sqrt_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_sqrt_ps".}

func mm_maskz_sqrt_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_sqrt_ps".}

func mm256_mask_add_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_add_epi32".}

func mm256_maskz_add_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_add_epi32".}

func mm256_mask_add_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_add_epi64".}

func mm256_maskz_add_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_add_epi64".}

func mm256_mask_sub_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_sub_epi32".}

func mm256_maskz_sub_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_sub_epi32".}

func mm256_mask_sub_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_sub_epi64".}

func mm256_maskz_sub_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_sub_epi64".}

func mm_mask_add_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_add_epi32".}

func mm_maskz_add_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_add_epi32".}

func mm_mask_add_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_add_epi64".}

func mm_maskz_add_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_add_epi64".}

func mm_mask_sub_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sub_epi32".}

func mm_maskz_sub_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sub_epi32".}

func mm_mask_sub_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sub_epi64".}

func mm_maskz_sub_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sub_epi64".}

func mm256_getexp_ps*(a: M256): M256 {.importc: "_mm256_getexp_ps".}

func mm256_mask_getexp_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_getexp_ps".}

func mm256_maskz_getexp_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_getexp_ps".}

func mm256_getexp_pd*(a: M256d): M256d {.importc: "_mm256_getexp_pd".}

func mm256_mask_getexp_pd*(w: M256d, u: MMask8, a: M256d): M256d {.importc: "_mm256_mask_getexp_pd".}

func mm256_maskz_getexp_pd*(u: MMask8, a: M256d): M256d {.importc: "_mm256_maskz_getexp_pd".}

func mm_getexp_ps*(a: M128): M128 {.importc: "_mm_getexp_ps".}

func mm_mask_getexp_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_getexp_ps".}

func mm_maskz_getexp_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_getexp_ps".}

func mm_getexp_pd*(a: M128d): M128d {.importc: "_mm_getexp_pd".}

func mm_mask_getexp_pd*(w: M128d, u: MMask8, a: M128d): M128d {.importc: "_mm_mask_getexp_pd".}

func mm_maskz_getexp_pd*(u: MMask8, a: M128d): M128d {.importc: "_mm_maskz_getexp_pd".}

func mm256_mask_srl_epi32*(w: M256i, u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_srl_epi32".}

func mm256_maskz_srl_epi32*(u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_srl_epi32".}

func mm_mask_srl_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_srl_epi32".}

func mm_maskz_srl_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_srl_epi32".}

func mm256_mask_srl_epi64*(w: M256i, u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_srl_epi64".}

func mm256_maskz_srl_epi64*(u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_srl_epi64".}

func mm_mask_srl_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_srl_epi64".}

func mm_maskz_srl_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_srl_epi64".}

func mm256_mask_and_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_and_epi32".}

func mm256_maskz_and_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_and_epi32".}

func mm256_scalef_pd*(a: M256d, b: M256d): M256d {.importc: "_mm256_scalef_pd".}

func mm256_mask_scalef_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_scalef_pd".}

func mm256_maskz_scalef_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_scalef_pd".}

func mm256_scalef_ps*(a: M256, b: M256): M256 {.importc: "_mm256_scalef_ps".}

func mm256_mask_scalef_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_scalef_ps".}

func mm256_maskz_scalef_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_scalef_ps".}

func mm_scalef_pd*(a: M128d, b: M128d): M128d {.importc: "_mm_scalef_pd".}

func mm_mask_scalef_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_scalef_pd".}

func mm_maskz_scalef_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_scalef_pd".}

func mm_scalef_ps*(a: M128, b: M128): M128 {.importc: "_mm_scalef_ps".}

func mm_mask_scalef_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_scalef_ps".}

func mm_maskz_scalef_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_scalef_ps".}

func mm256_mask_fmadd_pd*(a: M256d, u: MMask8, b: M256d, c: M256d): M256d {.importc: "_mm256_mask_fmadd_pd".}

func mm256_mask3_fmadd_pd*(a: M256d, b: M256d, c: M256d, u: MMask8): M256d {.importc: "_mm256_mask3_fmadd_pd".}

func mm256_maskz_fmadd_pd*(u: MMask8, a: M256d, b: M256d, c: M256d): M256d {.importc: "_mm256_maskz_fmadd_pd".}

func mm_mask_fmadd_pd*(a: M128d, u: MMask8, b: M128d, c: M128d): M128d {.importc: "_mm_mask_fmadd_pd".}

func mm_mask3_fmadd_pd*(a: M128d, b: M128d, c: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fmadd_pd".}

func mm_maskz_fmadd_pd*(u: MMask8, a: M128d, b: M128d, c: M128d): M128d {.importc: "_mm_maskz_fmadd_pd".}

func mm256_mask_fmadd_ps*(a: M256, u: MMask8, b: M256, c: M256): M256 {.importc: "_mm256_mask_fmadd_ps".}

func mm256_mask3_fmadd_ps*(a: M256, b: M256, c: M256, u: MMask8): M256 {.importc: "_mm256_mask3_fmadd_ps".}

func mm256_maskz_fmadd_ps*(u: MMask8, a: M256, b: M256, c: M256): M256 {.importc: "_mm256_maskz_fmadd_ps".}

func mm_mask_fmadd_ps*(a: M128, u: MMask8, b: M128, c: M128): M128 {.importc: "_mm_mask_fmadd_ps".}

func mm_mask3_fmadd_ps*(a: M128, b: M128, c: M128, u: MMask8): M128 {.importc: "_mm_mask3_fmadd_ps".}

func mm_maskz_fmadd_ps*(u: MMask8, a: M128, b: M128, c: M128): M128 {.importc: "_mm_maskz_fmadd_ps".}

func mm256_mask_fmsub_pd*(a: M256d, u: MMask8, b: M256d, c: M256d): M256d {.importc: "_mm256_mask_fmsub_pd".}

func mm256_mask3_fmsub_pd*(a: M256d, b: M256d, c: M256d, u: MMask8): M256d {.importc: "_mm256_mask3_fmsub_pd".}

func mm256_maskz_fmsub_pd*(u: MMask8, a: M256d, b: M256d, c: M256d): M256d {.importc: "_mm256_maskz_fmsub_pd".}

func mm_mask_fmsub_pd*(a: M128d, u: MMask8, b: M128d, c: M128d): M128d {.importc: "_mm_mask_fmsub_pd".}

func mm_mask3_fmsub_pd*(a: M128d, b: M128d, c: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fmsub_pd".}

func mm_maskz_fmsub_pd*(u: MMask8, a: M128d, b: M128d, c: M128d): M128d {.importc: "_mm_maskz_fmsub_pd".}

func mm256_mask_fmsub_ps*(a: M256, u: MMask8, b: M256, c: M256): M256 {.importc: "_mm256_mask_fmsub_ps".}

func mm256_mask3_fmsub_ps*(a: M256, b: M256, c: M256, u: MMask8): M256 {.importc: "_mm256_mask3_fmsub_ps".}

func mm256_maskz_fmsub_ps*(u: MMask8, a: M256, b: M256, c: M256): M256 {.importc: "_mm256_maskz_fmsub_ps".}

func mm_mask_fmsub_ps*(a: M128, u: MMask8, b: M128, c: M128): M128 {.importc: "_mm_mask_fmsub_ps".}

func mm_mask3_fmsub_ps*(a: M128, b: M128, c: M128, u: MMask8): M128 {.importc: "_mm_mask3_fmsub_ps".}

func mm_maskz_fmsub_ps*(u: MMask8, a: M128, b: M128, c: M128): M128 {.importc: "_mm_maskz_fmsub_ps".}

func mm256_mask_fmaddsub_pd*(a: M256d, u: MMask8, b: M256d, c: M256d): M256d {.importc: "_mm256_mask_fmaddsub_pd".}

func mm256_mask3_fmaddsub_pd*(a: M256d, b: M256d, c: M256d, u: MMask8): M256d {.importc: "_mm256_mask3_fmaddsub_pd".}

func mm256_maskz_fmaddsub_pd*(u: MMask8, a: M256d, b: M256d, c: M256d): M256d {.importc: "_mm256_maskz_fmaddsub_pd".}

func mm_mask_fmaddsub_pd*(a: M128d, u: MMask8, b: M128d, c: M128d): M128d {.importc: "_mm_mask_fmaddsub_pd".}

func mm_mask3_fmaddsub_pd*(a: M128d, b: M128d, c: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fmaddsub_pd".}

func mm_maskz_fmaddsub_pd*(u: MMask8, a: M128d, b: M128d, c: M128d): M128d {.importc: "_mm_maskz_fmaddsub_pd".}

func mm256_mask_fmaddsub_ps*(a: M256, u: MMask8, b: M256, c: M256): M256 {.importc: "_mm256_mask_fmaddsub_ps".}

func mm256_mask3_fmaddsub_ps*(a: M256, b: M256, c: M256, u: MMask8): M256 {.importc: "_mm256_mask3_fmaddsub_ps".}

func mm256_maskz_fmaddsub_ps*(u: MMask8, a: M256, b: M256, c: M256): M256 {.importc: "_mm256_maskz_fmaddsub_ps".}

func mm_mask_fmaddsub_ps*(a: M128, u: MMask8, b: M128, c: M128): M128 {.importc: "_mm_mask_fmaddsub_ps".}

func mm_mask3_fmaddsub_ps*(a: M128, b: M128, c: M128, u: MMask8): M128 {.importc: "_mm_mask3_fmaddsub_ps".}

func mm_maskz_fmaddsub_ps*(u: MMask8, a: M128, b: M128, c: M128): M128 {.importc: "_mm_maskz_fmaddsub_ps".}

func mm256_mask_fmsubadd_pd*(a: M256d, u: MMask8, b: M256d, c: M256d): M256d {.importc: "_mm256_mask_fmsubadd_pd".}

func mm256_mask3_fmsubadd_pd*(a: M256d, b: M256d, c: M256d, u: MMask8): M256d {.importc: "_mm256_mask3_fmsubadd_pd".}

func mm256_maskz_fmsubadd_pd*(u: MMask8, a: M256d, b: M256d, c: M256d): M256d {.importc: "_mm256_maskz_fmsubadd_pd".}

func mm_mask_fmsubadd_pd*(a: M128d, u: MMask8, b: M128d, c: M128d): M128d {.importc: "_mm_mask_fmsubadd_pd".}

func mm_mask3_fmsubadd_pd*(a: M128d, b: M128d, c: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fmsubadd_pd".}

func mm_maskz_fmsubadd_pd*(u: MMask8, a: M128d, b: M128d, c: M128d): M128d {.importc: "_mm_maskz_fmsubadd_pd".}

func mm256_mask_fmsubadd_ps*(a: M256, u: MMask8, b: M256, c: M256): M256 {.importc: "_mm256_mask_fmsubadd_ps".}

func mm256_mask3_fmsubadd_ps*(a: M256, b: M256, c: M256, u: MMask8): M256 {.importc: "_mm256_mask3_fmsubadd_ps".}

func mm256_maskz_fmsubadd_ps*(u: MMask8, a: M256, b: M256, c: M256): M256 {.importc: "_mm256_maskz_fmsubadd_ps".}

func mm_mask_fmsubadd_ps*(a: M128, u: MMask8, b: M128, c: M128): M128 {.importc: "_mm_mask_fmsubadd_ps".}

func mm_mask3_fmsubadd_ps*(a: M128, b: M128, c: M128, u: MMask8): M128 {.importc: "_mm_mask3_fmsubadd_ps".}

func mm_maskz_fmsubadd_ps*(u: MMask8, a: M128, b: M128, c: M128): M128 {.importc: "_mm_maskz_fmsubadd_ps".}

func mm256_mask_fnmadd_pd*(a: M256d, u: MMask8, b: M256d, c: M256d): M256d {.importc: "_mm256_mask_fnmadd_pd".}

func mm256_mask3_fnmadd_pd*(a: M256d, b: M256d, c: M256d, u: MMask8): M256d {.importc: "_mm256_mask3_fnmadd_pd".}

func mm256_maskz_fnmadd_pd*(u: MMask8, a: M256d, b: M256d, c: M256d): M256d {.importc: "_mm256_maskz_fnmadd_pd".}

func mm_mask_fnmadd_pd*(a: M128d, u: MMask8, b: M128d, c: M128d): M128d {.importc: "_mm_mask_fnmadd_pd".}

func mm_mask3_fnmadd_pd*(a: M128d, b: M128d, c: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fnmadd_pd".}

func mm_maskz_fnmadd_pd*(u: MMask8, a: M128d, b: M128d, c: M128d): M128d {.importc: "_mm_maskz_fnmadd_pd".}

func mm256_mask_fnmadd_ps*(a: M256, u: MMask8, b: M256, c: M256): M256 {.importc: "_mm256_mask_fnmadd_ps".}

func mm256_mask3_fnmadd_ps*(a: M256, b: M256, c: M256, u: MMask8): M256 {.importc: "_mm256_mask3_fnmadd_ps".}

func mm256_maskz_fnmadd_ps*(u: MMask8, a: M256, b: M256, c: M256): M256 {.importc: "_mm256_maskz_fnmadd_ps".}

func mm_mask_fnmadd_ps*(a: M128, u: MMask8, b: M128, c: M128): M128 {.importc: "_mm_mask_fnmadd_ps".}

func mm_mask3_fnmadd_ps*(a: M128, b: M128, c: M128, u: MMask8): M128 {.importc: "_mm_mask3_fnmadd_ps".}

func mm_maskz_fnmadd_ps*(u: MMask8, a: M128, b: M128, c: M128): M128 {.importc: "_mm_maskz_fnmadd_ps".}

func mm256_mask_fnmsub_pd*(a: M256d, u: MMask8, b: M256d, c: M256d): M256d {.importc: "_mm256_mask_fnmsub_pd".}

func mm256_mask3_fnmsub_pd*(a: M256d, b: M256d, c: M256d, u: MMask8): M256d {.importc: "_mm256_mask3_fnmsub_pd".}

func mm256_maskz_fnmsub_pd*(u: MMask8, a: M256d, b: M256d, c: M256d): M256d {.importc: "_mm256_maskz_fnmsub_pd".}

func mm_mask_fnmsub_pd*(a: M128d, u: MMask8, b: M128d, c: M128d): M128d {.importc: "_mm_mask_fnmsub_pd".}

func mm_mask3_fnmsub_pd*(a: M128d, b: M128d, c: M128d, u: MMask8): M128d {.importc: "_mm_mask3_fnmsub_pd".}

func mm_maskz_fnmsub_pd*(u: MMask8, a: M128d, b: M128d, c: M128d): M128d {.importc: "_mm_maskz_fnmsub_pd".}

func mm256_mask_fnmsub_ps*(a: M256, u: MMask8, b: M256, c: M256): M256 {.importc: "_mm256_mask_fnmsub_ps".}

func mm256_mask3_fnmsub_ps*(a: M256, b: M256, c: M256, u: MMask8): M256 {.importc: "_mm256_mask3_fnmsub_ps".}

func mm256_maskz_fnmsub_ps*(u: MMask8, a: M256, b: M256, c: M256): M256 {.importc: "_mm256_maskz_fnmsub_ps".}

func mm_mask_fnmsub_ps*(a: M128, u: MMask8, b: M128, c: M128): M128 {.importc: "_mm_mask_fnmsub_ps".}

func mm_mask3_fnmsub_ps*(a: M128, b: M128, c: M128, u: MMask8): M128 {.importc: "_mm_mask3_fnmsub_ps".}

func mm_maskz_fnmsub_ps*(u: MMask8, a: M128, b: M128, c: M128): M128 {.importc: "_mm_maskz_fnmsub_ps".}

func mm_mask_and_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_and_epi32".}

func mm_maskz_and_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_and_epi32".}

func mm256_mask_andnot_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_andnot_epi32".}

func mm256_maskz_andnot_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_andnot_epi32".}

func mm_mask_andnot_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_andnot_epi32".}

func mm_maskz_andnot_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_andnot_epi32".}

func mm256_mask_or_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_or_epi32".}

func mm256_maskz_or_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_or_epi32".}

func mm256_or_epi32*(a: M256i, b: M256i): M256i {.importc: "_mm256_or_epi32".}

func mm_mask_or_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_or_epi32".}

func mm_maskz_or_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_or_epi32".}

func mm_or_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_or_epi32".}

func mm256_mask_xor_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_xor_epi32".}

func mm256_maskz_xor_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_xor_epi32".}

func mm256_xor_epi32*(a: M256i, b: M256i): M256i {.importc: "_mm256_xor_epi32".}

func mm_mask_xor_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_xor_epi32".}

func mm_maskz_xor_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_xor_epi32".}

func mm_xor_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_xor_epi32".}

func mm_mask_cvtpd_ps*(w: M128, u: MMask8, a: M128d): M128 {.importc: "_mm_mask_cvtpd_ps".}

func mm_maskz_cvtpd_ps*(u: MMask8, a: M128d): M128 {.importc: "_mm_maskz_cvtpd_ps".}

func mm256_mask_cvtpd_ps*(w: M128, u: MMask8, a: M256d): M128 {.importc: "_mm256_mask_cvtpd_ps".}

func mm256_maskz_cvtpd_ps*(u: MMask8, a: M256d): M128 {.importc: "_mm256_maskz_cvtpd_ps".}

func mm256_mask_cvtps_epi32*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_cvtps_epi32".}

func mm256_maskz_cvtps_epi32*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_cvtps_epi32".}

func mm_mask_cvtps_epi32*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvtps_epi32".}

func mm_maskz_cvtps_epi32*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvtps_epi32".}

func mm256_cvtps_epu32*(a: M256): M256i {.importc: "_mm256_cvtps_epu32".}

func mm256_mask_cvtps_epu32*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_cvtps_epu32".}

func mm256_maskz_cvtps_epu32*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_cvtps_epu32".}

func mm_cvtps_epu32*(a: M128): M128i {.importc: "_mm_cvtps_epu32".}

func mm_mask_cvtps_epu32*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvtps_epu32".}

func mm_maskz_cvtps_epu32*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvtps_epu32".}

func mm256_mask_movedup_pd*(w: M256d, u: MMask8, a: M256d): M256d {.importc: "_mm256_mask_movedup_pd".}

func mm256_maskz_movedup_pd*(u: MMask8, a: M256d): M256d {.importc: "_mm256_maskz_movedup_pd".}

func mm_mask_movedup_pd*(w: M128d, u: MMask8, a: M128d): M128d {.importc: "_mm_mask_movedup_pd".}

func mm_maskz_movedup_pd*(u: MMask8, a: M128d): M128d {.importc: "_mm_maskz_movedup_pd".}

func mm256_mask_movehdup_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_movehdup_ps".}

func mm256_maskz_movehdup_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_movehdup_ps".}

func mm_mask_movehdup_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_movehdup_ps".}

func mm_maskz_movehdup_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_movehdup_ps".}

func mm256_mask_moveldup_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_moveldup_ps".}

func mm256_maskz_moveldup_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_moveldup_ps".}

func mm_mask_moveldup_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_moveldup_ps".}

func mm_maskz_moveldup_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_moveldup_ps".}

func mm_mask_unpackhi_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_unpackhi_epi32".}

func mm_maskz_unpackhi_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_unpackhi_epi32".}

func mm256_mask_unpackhi_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_unpackhi_epi32".}

func mm256_maskz_unpackhi_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_unpackhi_epi32".}

func mm_mask_unpackhi_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_unpackhi_epi64".}

func mm_maskz_unpackhi_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_unpackhi_epi64".}

func mm256_mask_unpackhi_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_unpackhi_epi64".}

func mm256_maskz_unpackhi_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_unpackhi_epi64".}

func mm_mask_unpacklo_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_unpacklo_epi32".}

func mm_maskz_unpacklo_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_unpacklo_epi32".}

func mm256_mask_unpacklo_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_unpacklo_epi32".}

func mm256_maskz_unpacklo_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_unpacklo_epi32".}

func mm_mask_unpacklo_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_unpacklo_epi64".}

func mm_maskz_unpacklo_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_unpacklo_epi64".}

func mm256_mask_unpacklo_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_unpacklo_epi64".}

func mm256_maskz_unpacklo_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_unpacklo_epi64".}

func mm_cmpeq_epu32_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpeq_epu32_mask".}

func mm_cmpeq_epi32_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpeq_epi32_mask".}

func mm_mask_cmpeq_epu32_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpeq_epu32_mask".}

func mm_mask_cmpeq_epi32_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpeq_epi32_mask".}

func mm256_cmpeq_epu32_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_cmpeq_epu32_mask".}

func mm256_cmpeq_epi32_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_cmpeq_epi32_mask".}

func mm256_mask_cmpeq_epu32_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_cmpeq_epu32_mask".}

func mm256_mask_cmpeq_epi32_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_cmpeq_epi32_mask".}

func mm_cmpeq_epu64_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpeq_epu64_mask".}

func mm_cmpeq_epi64_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpeq_epi64_mask".}

func mm_mask_cmpeq_epu64_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpeq_epu64_mask".}

func mm_mask_cmpeq_epi64_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpeq_epi64_mask".}

func mm256_cmpeq_epu64_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_cmpeq_epu64_mask".}

func mm256_cmpeq_epi64_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_cmpeq_epi64_mask".}

func mm256_mask_cmpeq_epu64_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_cmpeq_epu64_mask".}

func mm256_mask_cmpeq_epi64_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_cmpeq_epi64_mask".}

func mm_cmpgt_epu32_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpgt_epu32_mask".}

func mm_cmpgt_epi32_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpgt_epi32_mask".}

func mm_mask_cmpgt_epu32_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpgt_epu32_mask".}

func mm_mask_cmpgt_epi32_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpgt_epi32_mask".}

func mm256_cmpgt_epu32_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_cmpgt_epu32_mask".}

func mm256_cmpgt_epi32_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_cmpgt_epi32_mask".}

func mm256_mask_cmpgt_epu32_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_cmpgt_epu32_mask".}

func mm256_mask_cmpgt_epi32_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_cmpgt_epi32_mask".}

func mm_cmpgt_epu64_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpgt_epu64_mask".}

func mm_cmpgt_epi64_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_cmpgt_epi64_mask".}

func mm_mask_cmpgt_epu64_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpgt_epu64_mask".}

func mm_mask_cmpgt_epi64_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_cmpgt_epi64_mask".}

func mm256_cmpgt_epu64_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_cmpgt_epu64_mask".}

func mm256_cmpgt_epi64_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_cmpgt_epi64_mask".}

func mm256_mask_cmpgt_epu64_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_cmpgt_epu64_mask".}

func mm256_mask_cmpgt_epi64_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_cmpgt_epi64_mask".}

func mm_test_epi32_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_test_epi32_mask".}

func mm_mask_test_epi32_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_test_epi32_mask".}

func mm256_test_epi32_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_test_epi32_mask".}

func mm256_mask_test_epi32_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_test_epi32_mask".}

func mm_test_epi64_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_test_epi64_mask".}

func mm_mask_test_epi64_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_test_epi64_mask".}

func mm256_test_epi64_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_test_epi64_mask".}

func mm256_mask_test_epi64_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_test_epi64_mask".}

func mm_testn_epi32_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_testn_epi32_mask".}

func mm_mask_testn_epi32_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_testn_epi32_mask".}

func mm256_testn_epi32_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_testn_epi32_mask".}

func mm256_mask_testn_epi32_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_testn_epi32_mask".}

func mm_testn_epi64_mask*(a: M128i, b: M128i): MMask8 {.importc: "_mm_testn_epi64_mask".}

func mm_mask_testn_epi64_mask*(u: MMask8, a: M128i, b: M128i): MMask8 {.importc: "_mm_mask_testn_epi64_mask".}

func mm256_testn_epi64_mask*(a: M256i, b: M256i): MMask8 {.importc: "_mm256_testn_epi64_mask".}

func mm256_mask_testn_epi64_mask*(u: MMask8, a: M256i, b: M256i): MMask8 {.importc: "_mm256_mask_testn_epi64_mask".}

func mm256_mask_compress_pd*(w: M256d, u: MMask8, a: M256d): M256d {.importc: "_mm256_mask_compress_pd".}

func mm256_maskz_compress_pd*(u: MMask8, a: M256d): M256d {.importc: "_mm256_maskz_compress_pd".}

func mm256_mask_compressstoreu_pd*(p: pointer, u: MMask8, a: M256d): void {.importc: "_mm256_mask_compressstoreu_pd".}

func mm_mask_compress_pd*(w: M128d, u: MMask8, a: M128d): M128d {.importc: "_mm_mask_compress_pd".}

func mm_maskz_compress_pd*(u: MMask8, a: M128d): M128d {.importc: "_mm_maskz_compress_pd".}

func mm_mask_compressstoreu_pd*(p: pointer, u: MMask8, a: M128d): void {.importc: "_mm_mask_compressstoreu_pd".}

func mm256_mask_compress_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_compress_ps".}

func mm256_maskz_compress_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_compress_ps".}

func mm256_mask_compressstoreu_ps*(p: pointer, u: MMask8, a: M256): void {.importc: "_mm256_mask_compressstoreu_ps".}

func mm_mask_compress_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_compress_ps".}

func mm_maskz_compress_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_compress_ps".}

func mm_mask_compressstoreu_ps*(p: pointer, u: MMask8, a: M128): void {.importc: "_mm_mask_compressstoreu_ps".}

func mm256_mask_compress_epi64*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_compress_epi64".}

func mm256_maskz_compress_epi64*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_compress_epi64".}

func mm256_mask_compressstoreu_epi64*(p: pointer, u: MMask8, a: M256i): void {.importc: "_mm256_mask_compressstoreu_epi64".}

func mm_mask_compress_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_compress_epi64".}

func mm_maskz_compress_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_compress_epi64".}

func mm_mask_compressstoreu_epi64*(p: pointer, u: MMask8, a: M128i): void {.importc: "_mm_mask_compressstoreu_epi64".}

func mm256_mask_compress_epi32*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_compress_epi32".}

func mm256_maskz_compress_epi32*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_compress_epi32".}

func mm256_mask_compressstoreu_epi32*(p: pointer, u: MMask8, a: M256i): void {.importc: "_mm256_mask_compressstoreu_epi32".}

func mm_mask_compress_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_compress_epi32".}

func mm_maskz_compress_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_compress_epi32".}

func mm_mask_compressstoreu_epi32*(p: pointer, u: MMask8, a: M128i): void {.importc: "_mm_mask_compressstoreu_epi32".}

func mm256_mask_expand_pd*(w: M256d, u: MMask8, a: M256d): M256d {.importc: "_mm256_mask_expand_pd".}

func mm256_maskz_expand_pd*(u: MMask8, a: M256d): M256d {.importc: "_mm256_maskz_expand_pd".}

func mm256_mask_expandloadu_pd*(w: M256d, u: MMask8, p: pointer): M256d {.importc: "_mm256_mask_expandloadu_pd".}

func mm256_maskz_expandloadu_pd*(u: MMask8, p: pointer): M256d {.importc: "_mm256_maskz_expandloadu_pd".}

func mm_mask_expand_pd*(w: M128d, u: MMask8, a: M128d): M128d {.importc: "_mm_mask_expand_pd".}

func mm_maskz_expand_pd*(u: MMask8, a: M128d): M128d {.importc: "_mm_maskz_expand_pd".}

func mm_mask_expandloadu_pd*(w: M128d, u: MMask8, p: pointer): M128d {.importc: "_mm_mask_expandloadu_pd".}

func mm_maskz_expandloadu_pd*(u: MMask8, p: pointer): M128d {.importc: "_mm_maskz_expandloadu_pd".}

func mm256_mask_expand_ps*(w: M256, u: MMask8, a: M256): M256 {.importc: "_mm256_mask_expand_ps".}

func mm256_maskz_expand_ps*(u: MMask8, a: M256): M256 {.importc: "_mm256_maskz_expand_ps".}

func mm256_mask_expandloadu_ps*(w: M256, u: MMask8, p: pointer): M256 {.importc: "_mm256_mask_expandloadu_ps".}

func mm256_maskz_expandloadu_ps*(u: MMask8, p: pointer): M256 {.importc: "_mm256_maskz_expandloadu_ps".}

func mm_mask_expand_ps*(w: M128, u: MMask8, a: M128): M128 {.importc: "_mm_mask_expand_ps".}

func mm_maskz_expand_ps*(u: MMask8, a: M128): M128 {.importc: "_mm_maskz_expand_ps".}

func mm_mask_expandloadu_ps*(w: M128, u: MMask8, p: pointer): M128 {.importc: "_mm_mask_expandloadu_ps".}

func mm_maskz_expandloadu_ps*(u: MMask8, p: pointer): M128 {.importc: "_mm_maskz_expandloadu_ps".}

func mm256_mask_expand_epi64*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_expand_epi64".}

func mm256_maskz_expand_epi64*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_expand_epi64".}

func mm256_mask_expandloadu_epi64*(w: M256i, u: MMask8, p: pointer): M256i {.importc: "_mm256_mask_expandloadu_epi64".}

func mm256_maskz_expandloadu_epi64*(u: MMask8, p: pointer): M256i {.importc: "_mm256_maskz_expandloadu_epi64".}

func mm_mask_expand_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_expand_epi64".}

func mm_maskz_expand_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_expand_epi64".}

func mm_mask_expandloadu_epi64*(w: M128i, u: MMask8, p: pointer): M128i {.importc: "_mm_mask_expandloadu_epi64".}

func mm_maskz_expandloadu_epi64*(u: MMask8, p: pointer): M128i {.importc: "_mm_maskz_expandloadu_epi64".}

func mm256_mask_expand_epi32*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_expand_epi32".}

func mm256_maskz_expand_epi32*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_expand_epi32".}

func mm256_mask_expandloadu_epi32*(w: M256i, u: MMask8, p: pointer): M256i {.importc: "_mm256_mask_expandloadu_epi32".}

func mm256_maskz_expandloadu_epi32*(u: MMask8, p: pointer): M256i {.importc: "_mm256_maskz_expandloadu_epi32".}

func mm_mask_expand_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_expand_epi32".}

func mm_maskz_expand_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_expand_epi32".}

func mm_mask_expandloadu_epi32*(w: M128i, u: MMask8, p: pointer): M128i {.importc: "_mm_mask_expandloadu_epi32".}

func mm_maskz_expandloadu_epi32*(u: MMask8, p: pointer): M128i {.importc: "_mm_maskz_expandloadu_epi32".}

func mm256_permutex2var_pd*(a: M256d, i: M256i, b: M256d): M256d {.importc: "_mm256_permutex2var_pd".}

func mm256_mask_permutex2var_pd*(a: M256d, u: MMask8, i: M256i, b: M256d): M256d {.importc: "_mm256_mask_permutex2var_pd".}

func mm256_mask2_permutex2var_pd*(a: M256d, i: M256i, u: MMask8, b: M256d): M256d {.importc: "_mm256_mask2_permutex2var_pd".}

func mm256_maskz_permutex2var_pd*(u: MMask8, a: M256d, i: M256i, b: M256d): M256d {.importc: "_mm256_maskz_permutex2var_pd".}

func mm256_permutex2var_ps*(a: M256, i: M256i, b: M256): M256 {.importc: "_mm256_permutex2var_ps".}

func mm256_mask_permutex2var_ps*(a: M256, u: MMask8, i: M256i, b: M256): M256 {.importc: "_mm256_mask_permutex2var_ps".}

func mm256_mask2_permutex2var_ps*(a: M256, i: M256i, u: MMask8, b: M256): M256 {.importc: "_mm256_mask2_permutex2var_ps".}

func mm256_maskz_permutex2var_ps*(u: MMask8, a: M256, i: M256i, b: M256): M256 {.importc: "_mm256_maskz_permutex2var_ps".}

func mm_permutex2var_epi64*(a: M128i, i: M128i, b: M128i): M128i {.importc: "_mm_permutex2var_epi64".}

func mm_mask_permutex2var_epi64*(a: M128i, u: MMask8, i: M128i, b: M128i): M128i {.importc: "_mm_mask_permutex2var_epi64".}

func mm_mask2_permutex2var_epi64*(a: M128i, i: M128i, u: MMask8, b: M128i): M128i {.importc: "_mm_mask2_permutex2var_epi64".}

func mm_maskz_permutex2var_epi64*(u: MMask8, a: M128i, i: M128i, b: M128i): M128i {.importc: "_mm_maskz_permutex2var_epi64".}

func mm_permutex2var_epi32*(a: M128i, i: M128i, b: M128i): M128i {.importc: "_mm_permutex2var_epi32".}

func mm_mask_permutex2var_epi32*(a: M128i, u: MMask8, i: M128i, b: M128i): M128i {.importc: "_mm_mask_permutex2var_epi32".}

func mm_mask2_permutex2var_epi32*(a: M128i, i: M128i, u: MMask8, b: M128i): M128i {.importc: "_mm_mask2_permutex2var_epi32".}

func mm_maskz_permutex2var_epi32*(u: MMask8, a: M128i, i: M128i, b: M128i): M128i {.importc: "_mm_maskz_permutex2var_epi32".}

func mm256_permutex2var_epi64*(a: M256i, i: M256i, b: M256i): M256i {.importc: "_mm256_permutex2var_epi64".}

func mm256_mask_permutex2var_epi64*(a: M256i, u: MMask8, i: M256i, b: M256i): M256i {.importc: "_mm256_mask_permutex2var_epi64".}

func mm256_mask2_permutex2var_epi64*(a: M256i, i: M256i, u: MMask8, b: M256i): M256i {.importc: "_mm256_mask2_permutex2var_epi64".}

func mm256_maskz_permutex2var_epi64*(u: MMask8, a: M256i, i: M256i, b: M256i): M256i {.importc: "_mm256_maskz_permutex2var_epi64".}

func mm256_permutex2var_epi32*(a: M256i, i: M256i, b: M256i): M256i {.importc: "_mm256_permutex2var_epi32".}

func mm256_mask_permutex2var_epi32*(a: M256i, u: MMask8, i: M256i, b: M256i): M256i {.importc: "_mm256_mask_permutex2var_epi32".}

func mm256_mask2_permutex2var_epi32*(a: M256i, i: M256i, u: MMask8, b: M256i): M256i {.importc: "_mm256_mask2_permutex2var_epi32".}

func mm256_maskz_permutex2var_epi32*(u: MMask8, a: M256i, i: M256i, b: M256i): M256i {.importc: "_mm256_maskz_permutex2var_epi32".}

func mm_permutex2var_pd*(a: M128d, i: M128i, b: M128d): M128d {.importc: "_mm_permutex2var_pd".}

func mm_mask_permutex2var_pd*(a: M128d, u: MMask8, i: M128i, b: M128d): M128d {.importc: "_mm_mask_permutex2var_pd".}

func mm_mask2_permutex2var_pd*(a: M128d, i: M128i, u: MMask8, b: M128d): M128d {.importc: "_mm_mask2_permutex2var_pd".}

func mm_maskz_permutex2var_pd*(u: MMask8, a: M128d, i: M128i, b: M128d): M128d {.importc: "_mm_maskz_permutex2var_pd".}

func mm_permutex2var_ps*(a: M128, i: M128i, b: M128): M128 {.importc: "_mm_permutex2var_ps".}

func mm_mask_permutex2var_ps*(a: M128, u: MMask8, i: M128i, b: M128): M128 {.importc: "_mm_mask_permutex2var_ps".}

func mm_mask2_permutex2var_ps*(a: M128, i: M128i, u: MMask8, b: M128): M128 {.importc: "_mm_mask2_permutex2var_ps".}

func mm_maskz_permutex2var_ps*(u: MMask8, a: M128, i: M128i, b: M128): M128 {.importc: "_mm_maskz_permutex2var_ps".}

func mm_srav_epi64*(x: M128i, y: M128i): M128i {.importc: "_mm_srav_epi64".}

func mm_mask_srav_epi64*(w: M128i, u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_srav_epi64".}

func mm_maskz_srav_epi64*(u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_srav_epi64".}

func mm256_mask_sllv_epi32*(w: M256i, u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_sllv_epi32".}

func mm256_maskz_sllv_epi32*(u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_sllv_epi32".}

func mm_mask_sllv_epi32*(w: M128i, u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_sllv_epi32".}

func mm_maskz_sllv_epi32*(u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_sllv_epi32".}

func mm256_mask_sllv_epi64*(w: M256i, u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_sllv_epi64".}

func mm256_maskz_sllv_epi64*(u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_sllv_epi64".}

func mm_mask_sllv_epi64*(w: M128i, u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_sllv_epi64".}

func mm_maskz_sllv_epi64*(u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_sllv_epi64".}

func mm256_mask_srav_epi32*(w: M256i, u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_srav_epi32".}

func mm256_maskz_srav_epi32*(u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_srav_epi32".}

func mm_mask_srav_epi32*(w: M128i, u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_srav_epi32".}

func mm_maskz_srav_epi32*(u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_srav_epi32".}

func mm256_mask_srlv_epi32*(w: M256i, u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_srlv_epi32".}

func mm256_maskz_srlv_epi32*(u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_srlv_epi32".}

func mm_mask_srlv_epi32*(w: M128i, u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_srlv_epi32".}

func mm_maskz_srlv_epi32*(u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_srlv_epi32".}

func mm256_mask_srlv_epi64*(w: M256i, u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_srlv_epi64".}

func mm256_maskz_srlv_epi64*(u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_srlv_epi64".}

func mm_mask_srlv_epi64*(w: M128i, u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_srlv_epi64".}

func mm_maskz_srlv_epi64*(u: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_srlv_epi64".}

func mm256_rolv_epi32*(a: M256i, b: M256i): M256i {.importc: "_mm256_rolv_epi32".}

func mm256_mask_rolv_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_rolv_epi32".}

func mm256_maskz_rolv_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_rolv_epi32".}

func mm_rolv_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_rolv_epi32".}

func mm_mask_rolv_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_rolv_epi32".}

func mm_maskz_rolv_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_rolv_epi32".}

func mm256_rorv_epi32*(a: M256i, b: M256i): M256i {.importc: "_mm256_rorv_epi32".}

func mm256_mask_rorv_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_rorv_epi32".}

func mm256_maskz_rorv_epi32*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_rorv_epi32".}

func mm_rorv_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_rorv_epi32".}

func mm_mask_rorv_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_rorv_epi32".}

func mm_maskz_rorv_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_rorv_epi32".}

func mm256_rolv_epi64*(a: M256i, b: M256i): M256i {.importc: "_mm256_rolv_epi64".}

func mm256_mask_rolv_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_rolv_epi64".}

func mm256_maskz_rolv_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_rolv_epi64".}

func mm_rolv_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_rolv_epi64".}

func mm_mask_rolv_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_rolv_epi64".}

func mm_maskz_rolv_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_rolv_epi64".}

func mm256_rorv_epi64*(a: M256i, b: M256i): M256i {.importc: "_mm256_rorv_epi64".}

func mm256_mask_rorv_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_rorv_epi64".}

func mm256_maskz_rorv_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_rorv_epi64".}

func mm_rorv_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_rorv_epi64".}

func mm_mask_rorv_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_rorv_epi64".}

func mm_maskz_rorv_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_rorv_epi64".}

func mm256_srav_epi64*(x: M256i, y: M256i): M256i {.importc: "_mm256_srav_epi64".}

func mm256_mask_srav_epi64*(w: M256i, u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_srav_epi64".}

func mm256_maskz_srav_epi64*(u: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_srav_epi64".}

func mm256_mask_and_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_and_epi64".}

func mm256_maskz_and_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_and_epi64".}

func mm_mask_and_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_and_epi64".}

func mm_maskz_and_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_and_epi64".}

func mm256_mask_andnot_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_andnot_epi64".}

func mm256_maskz_andnot_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_andnot_epi64".}

func mm_mask_andnot_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_andnot_epi64".}

func mm_maskz_andnot_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_andnot_epi64".}

func mm256_mask_or_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_or_epi64".}

func mm256_maskz_or_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_or_epi64".}

func mm256_or_epi64*(a: M256i, b: M256i): M256i {.importc: "_mm256_or_epi64".}

func mm_mask_or_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_or_epi64".}

func mm_maskz_or_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_or_epi64".}

func mm_or_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_or_epi64".}

func mm256_mask_xor_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_xor_epi64".}

func mm256_maskz_xor_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_xor_epi64".}

func mm256_xor_epi64*(a: M256i, b: M256i): M256i {.importc: "_mm256_xor_epi64".}

func mm_mask_xor_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_xor_epi64".}

func mm_maskz_xor_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_xor_epi64".}

func mm_xor_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_xor_epi64".}

func mm256_mask_max_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_max_pd".}

func mm256_maskz_max_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_max_pd".}

func mm256_mask_max_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_max_ps".}

func mm256_maskz_max_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_max_ps".}

func mm_mask_div_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_div_ps".}

func mm_maskz_div_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_div_ps".}

func mm_mask_div_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_div_pd".}

func mm_maskz_div_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_div_pd".}

func mm256_mask_min_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_min_pd".}

func mm256_mask_div_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_div_pd".}

func mm256_maskz_min_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_min_pd".}

func mm256_mask_min_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_min_ps".}

func mm256_maskz_div_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_div_pd".}

func mm256_mask_div_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_div_ps".}

func mm256_maskz_min_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_min_ps".}

func mm256_maskz_div_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_div_ps".}

func mm_mask_min_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_min_ps".}

func mm_mask_mul_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_mul_ps".}

func mm_maskz_min_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_min_ps".}

func mm_maskz_mul_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_mul_ps".}

func mm_mask_max_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_max_ps".}

func mm_maskz_max_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_max_ps".}

func mm_mask_min_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_min_pd".}

func mm_maskz_min_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_min_pd".}

func mm_mask_max_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_max_pd".}

func mm_maskz_max_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_max_pd".}

func mm_mask_mul_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_mul_pd".}

func mm_maskz_mul_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_mul_pd".}

func mm256_mask_mul_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_mul_ps".}

func mm256_maskz_mul_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_mul_ps".}

func mm256_mask_mul_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_mul_pd".}

func mm256_maskz_mul_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_mul_pd".}

func mm256_maskz_max_epi64*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_max_epi64".}

func mm256_mask_max_epi64*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_max_epi64".}

func mm256_min_epi64*(a: M256i, b: M256i): M256i {.importc: "_mm256_min_epi64".}

func mm256_mask_min_epi64*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_min_epi64".}

func mm256_maskz_min_epi64*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_min_epi64".}

func mm256_maskz_max_epu64*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_max_epu64".}

func mm256_max_epi64*(a: M256i, b: M256i): M256i {.importc: "_mm256_max_epi64".}

func mm256_max_epu64*(a: M256i, b: M256i): M256i {.importc: "_mm256_max_epu64".}

func mm256_mask_max_epu64*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_max_epu64".}

func mm256_min_epu64*(a: M256i, b: M256i): M256i {.importc: "_mm256_min_epu64".}

func mm256_mask_min_epu64*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_min_epu64".}

func mm256_maskz_min_epu64*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_min_epu64".}

func mm256_maskz_max_epi32*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_max_epi32".}

func mm256_mask_max_epi32*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_max_epi32".}

func mm256_maskz_min_epi32*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_min_epi32".}

func mm256_mask_min_epi32*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_min_epi32".}

func mm256_maskz_max_epu32*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_max_epu32".}

func mm256_mask_max_epu32*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_max_epu32".}

func mm256_maskz_min_epu32*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_min_epu32".}

func mm256_mask_min_epu32*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_min_epu32".}

func mm_maskz_max_epi64*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_max_epi64".}

func mm_mask_max_epi64*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_max_epi64".}

func mm_min_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_min_epi64".}

func mm_mask_min_epi64*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_min_epi64".}

func mm_maskz_min_epi64*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_min_epi64".}

func mm_maskz_max_epu64*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_max_epu64".}

func mm_max_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_max_epi64".}

func mm_max_epu64*(a: M128i, b: M128i): M128i {.importc: "_mm_max_epu64".}

func mm_mask_max_epu64*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_max_epu64".}

func mm_min_epu64*(a: M128i, b: M128i): M128i {.importc: "_mm_min_epu64".}

func mm_mask_min_epu64*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_min_epu64".}

func mm_maskz_min_epu64*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_min_epu64".}

func mm_maskz_max_epi32*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_max_epi32".}

func mm_mask_max_epi32*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_max_epi32".}

func mm_maskz_min_epi32*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_min_epi32".}

func mm_mask_min_epi32*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_min_epi32".}

func mm_maskz_max_epu32*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_max_epu32".}

func mm_mask_max_epu32*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_max_epu32".}

func mm_maskz_min_epu32*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_min_epu32".}

func mm_mask_min_epu32*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_min_epu32".}

func mm256_mask_unpacklo_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_unpacklo_pd".}

func mm256_maskz_unpacklo_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_unpacklo_pd".}

func mm_mask_unpacklo_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_unpacklo_pd".}

func mm_maskz_unpacklo_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_unpacklo_pd".}

func mm256_mask_unpacklo_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_unpacklo_ps".}

func mm256_mask_unpackhi_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_unpackhi_pd".}

func mm256_maskz_unpackhi_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_unpackhi_pd".}

func mm_mask_unpackhi_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_unpackhi_pd".}

func mm_maskz_unpackhi_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_unpackhi_pd".}

func mm256_mask_unpackhi_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_unpackhi_ps".}

func mm256_maskz_unpackhi_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_unpackhi_ps".}

func mm_mask_unpackhi_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_unpackhi_ps".}

func mm_maskz_unpackhi_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_unpackhi_ps".}

func mm_mask_cvtph_ps*(w: M128, u: MMask8, a: M128i): M128 {.importc: "_mm_mask_cvtph_ps".}

func mm_maskz_cvtph_ps*(u: MMask8, a: M128i): M128 {.importc: "_mm_maskz_cvtph_ps".}

func mm256_maskz_unpacklo_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_unpacklo_ps".}

func mm256_mask_cvtph_ps*(w: M256, u: MMask8, a: M128i): M256 {.importc: "_mm256_mask_cvtph_ps".}

func mm256_maskz_cvtph_ps*(u: MMask8, a: M128i): M256 {.importc: "_mm256_maskz_cvtph_ps".}

func mm_mask_unpacklo_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_unpacklo_ps".}

func mm_maskz_unpacklo_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_unpacklo_ps".}

func mm256_mask_sra_epi32*(w: M256i, u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_sra_epi32".}

func mm256_maskz_sra_epi32*(u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_sra_epi32".}

func mm_mask_sra_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sra_epi32".}

func mm_maskz_sra_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sra_epi32".}

func mm256_sra_epi64*(a: M256i, b: M128i): M256i {.importc: "_mm256_sra_epi64".}

func mm256_mask_sra_epi64*(w: M256i, u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_sra_epi64".}

func mm256_maskz_sra_epi64*(u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_sra_epi64".}

func mm_sra_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_sra_epi64".}

func mm_mask_sra_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sra_epi64".}

func mm_maskz_sra_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sra_epi64".}

func mm_mask_sll_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sll_epi32".}

func mm_maskz_sll_epi32*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sll_epi32".}

func mm_mask_sll_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_sll_epi64".}

func mm_maskz_sll_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_sll_epi64".}

func mm256_mask_sll_epi32*(w: M256i, u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_sll_epi32".}

func mm256_maskz_sll_epi32*(u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_sll_epi32".}

func mm256_mask_sll_epi64*(w: M256i, u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_mask_sll_epi64".}

func mm256_maskz_sll_epi64*(u: MMask8, a: M256i, b: M128i): M256i {.importc: "_mm256_maskz_sll_epi64".}

func mm256_mask_permutexvar_ps*(w: M256, u: MMask8, x: M256i, y: M256): M256 {.importc: "_mm256_mask_permutexvar_ps".}

func mm256_maskz_permutexvar_ps*(u: MMask8, x: M256i, y: M256): M256 {.importc: "_mm256_maskz_permutexvar_ps".}

func mm256_permutexvar_pd*(x: M256i, y: M256d): M256d {.importc: "_mm256_permutexvar_pd".}

func mm256_mask_permutexvar_pd*(w: M256d, u: MMask8, x: M256i, y: M256d): M256d {.importc: "_mm256_mask_permutexvar_pd".}

func mm256_maskz_permutexvar_pd*(u: MMask8, x: M256i, y: M256d): M256d {.importc: "_mm256_maskz_permutexvar_pd".}

func mm256_mask_permutevar_pd*(w: M256d, u: MMask8, a: M256d, c: M256i): M256d {.importc: "_mm256_mask_permutevar_pd".}

func mm256_maskz_permutevar_pd*(u: MMask8, a: M256d, c: M256i): M256d {.importc: "_mm256_maskz_permutevar_pd".}

func mm256_mask_permutevar_ps*(w: M256, u: MMask8, a: M256, c: M256i): M256 {.importc: "_mm256_mask_permutevar_ps".}

func mm256_maskz_permutevar_ps*(u: MMask8, a: M256, c: M256i): M256 {.importc: "_mm256_maskz_permutevar_ps".}

func mm_mask_permutevar_pd*(w: M128d, u: MMask8, a: M128d, c: M128i): M128d {.importc: "_mm_mask_permutevar_pd".}

func mm_maskz_permutevar_pd*(u: MMask8, a: M128d, c: M128i): M128d {.importc: "_mm_maskz_permutevar_pd".}

func mm_mask_permutevar_ps*(w: M128, u: MMask8, a: M128, c: M128i): M128 {.importc: "_mm_mask_permutevar_ps".}

func mm_maskz_permutevar_ps*(u: MMask8, a: M128, c: M128i): M128 {.importc: "_mm_maskz_permutevar_ps".}

func mm256_maskz_mullo_epi32*(m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_mullo_epi32".}

func mm256_maskz_permutexvar_epi64*(m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_permutexvar_epi64".}

func mm256_mask_mullo_epi32*(w: M256i, m: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_mullo_epi32".}

func mm_maskz_mullo_epi32*(m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_mullo_epi32".}

func mm_mask_mullo_epi32*(w: M128i, m: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_mullo_epi32".}

func mm256_mask_mul_epi32*(w: M256i, m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_mul_epi32".}

func mm256_maskz_mul_epi32*(m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_mul_epi32".}

func mm_mask_mul_epi32*(w: M128i, m: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_mul_epi32".}

func mm_maskz_mul_epi32*(m: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_mul_epi32".}

func mm256_permutexvar_epi64*(x: M256i, y: M256i): M256i {.importc: "_mm256_permutexvar_epi64".}

func mm256_mask_permutexvar_epi64*(w: M256i, m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_permutexvar_epi64".}

func mm256_mask_mul_epu32*(w: M256i, m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_mul_epu32".}

func mm256_maskz_permutexvar_epi32*(m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_permutexvar_epi32".}

func mm256_maskz_mul_epu32*(m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_mul_epu32".}

func mm_mask_mul_epu32*(w: M128i, m: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_mul_epu32".}

func mm_maskz_mul_epu32*(m: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_mul_epu32".}

func mm256_permutexvar_epi32*(x: M256i, y: M256i): M256i {.importc: "_mm256_permutexvar_epi32".}

func mm256_mask_permutexvar_epi32*(w: M256i, m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_permutexvar_epi32".}

func mm256_mask_cmpneq_epu32_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmpneq_epu32_mask".}

func mm256_cmpneq_epu32_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmpneq_epu32_mask".}

func mm256_mask_cmplt_epu32_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmplt_epu32_mask".}

func mm256_cmplt_epu32_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmplt_epu32_mask".}

func mm256_mask_cmpge_epu32_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmpge_epu32_mask".}

func mm256_cmpge_epu32_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmpge_epu32_mask".}

func mm256_mask_cmple_epu32_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmple_epu32_mask".}

func mm256_cmple_epu32_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmple_epu32_mask".}

func mm256_mask_cmpneq_epu64_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmpneq_epu64_mask".}

func mm256_cmpneq_epu64_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmpneq_epu64_mask".}

func mm256_mask_cmplt_epu64_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmplt_epu64_mask".}

func mm256_cmplt_epu64_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmplt_epu64_mask".}

func mm256_mask_cmpge_epu64_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmpge_epu64_mask".}

func mm256_cmpge_epu64_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmpge_epu64_mask".}

func mm256_mask_cmple_epu64_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmple_epu64_mask".}

func mm256_cmple_epu64_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmple_epu64_mask".}

func mm256_mask_cmpneq_epi32_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmpneq_epi32_mask".}

func mm256_cmpneq_epi32_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmpneq_epi32_mask".}

func mm256_mask_cmplt_epi32_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmplt_epi32_mask".}

func mm256_cmplt_epi32_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmplt_epi32_mask".}

func mm256_mask_cmpge_epi32_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmpge_epi32_mask".}

func mm256_cmpge_epi32_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmpge_epi32_mask".}

func mm256_mask_cmple_epi32_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmple_epi32_mask".}

func mm256_cmple_epi32_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmple_epi32_mask".}

func mm256_mask_cmpneq_epi64_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmpneq_epi64_mask".}

func mm256_cmpneq_epi64_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmpneq_epi64_mask".}

func mm256_mask_cmplt_epi64_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmplt_epi64_mask".}

func mm256_cmplt_epi64_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmplt_epi64_mask".}

func mm256_mask_cmpge_epi64_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmpge_epi64_mask".}

func mm256_cmpge_epi64_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmpge_epi64_mask".}

func mm256_mask_cmple_epi64_mask*(m: MMask8, x: M256i, y: M256i): MMask8 {.importc: "_mm256_mask_cmple_epi64_mask".}

func mm256_cmple_epi64_mask*(x: M256i, y: M256i): MMask8 {.importc: "_mm256_cmple_epi64_mask".}

func mm_mask_cmpneq_epu32_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpneq_epu32_mask".}

func mm_cmpneq_epu32_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpneq_epu32_mask".}

func mm_mask_cmplt_epu32_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmplt_epu32_mask".}

func mm_cmplt_epu32_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmplt_epu32_mask".}

func mm_mask_cmpge_epu32_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpge_epu32_mask".}

func mm_cmpge_epu32_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpge_epu32_mask".}

func mm_mask_cmple_epu32_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmple_epu32_mask".}

func mm_cmple_epu32_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmple_epu32_mask".}

func mm_mask_cmpneq_epu64_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpneq_epu64_mask".}

func mm_cmpneq_epu64_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpneq_epu64_mask".}

func mm_mask_cmplt_epu64_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmplt_epu64_mask".}

func mm_cmplt_epu64_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmplt_epu64_mask".}

func mm_mask_cmpge_epu64_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpge_epu64_mask".}

func mm_cmpge_epu64_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpge_epu64_mask".}

func mm_mask_cmple_epu64_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmple_epu64_mask".}

func mm_cmple_epu64_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmple_epu64_mask".}

func mm_mask_cmpneq_epi32_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpneq_epi32_mask".}

func mm_cmpneq_epi32_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpneq_epi32_mask".}

func mm_mask_cmplt_epi32_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmplt_epi32_mask".}

func mm_cmplt_epi32_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmplt_epi32_mask".}

func mm_mask_cmpge_epi32_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpge_epi32_mask".}

func mm_cmpge_epi32_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpge_epi32_mask".}

func mm_mask_cmple_epi32_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmple_epi32_mask".}

func mm_cmple_epi32_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmple_epi32_mask".}

func mm_mask_cmpneq_epi64_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpneq_epi64_mask".}

func mm_cmpneq_epi64_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpneq_epi64_mask".}

func mm_mask_cmplt_epi64_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmplt_epi64_mask".}

func mm_cmplt_epi64_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmplt_epi64_mask".}

func mm_mask_cmpge_epi64_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmpge_epi64_mask".}

func mm_cmpge_epi64_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmpge_epi64_mask".}

func mm_mask_cmple_epi64_mask*(m: MMask8, x: M128i, y: M128i): MMask8 {.importc: "_mm_mask_cmple_epi64_mask".}

func mm_cmple_epi64_mask*(x: M128i, y: M128i): MMask8 {.importc: "_mm_cmple_epi64_mask".}

func mm256_permutex_epi64*(x: M256i, i: int32): M256i {.importc: "_mm256_permutex_epi64".}

func mm256_mask_permutex_epi64*(w: M256i, m: MMask8, x: M256i, i: int32): M256i {.importc: "_mm256_mask_permutex_epi64".}

func mm256_maskz_permutex_epi64*(m: MMask8, x: M256i, i: int32): M256i {.importc: "_mm256_maskz_permutex_epi64".}

func mm256_mask_shuffle_pd*(w: M256d, u: MMask8, a: M256d, b: M256d, imm: int32): M256d {.importc: "_mm256_mask_shuffle_pd".}

func mm256_maskz_shuffle_pd*(u: MMask8, a: M256d, b: M256d, imm: int32): M256d {.importc: "_mm256_maskz_shuffle_pd".}

func mm_mask_shuffle_pd*(w: M128d, u: MMask8, a: M128d, b: M128d, imm: int32): M128d {.importc: "_mm_mask_shuffle_pd".}

func mm_maskz_shuffle_pd*(u: MMask8, a: M128d, b: M128d, imm: int32): M128d {.importc: "_mm_maskz_shuffle_pd".}

func mm256_mask_shuffle_ps*(w: M256, u: MMask8, a: M256, b: M256, imm: int32): M256 {.importc: "_mm256_mask_shuffle_ps".}

func mm256_maskz_shuffle_ps*(u: MMask8, a: M256, b: M256, imm: int32): M256 {.importc: "_mm256_maskz_shuffle_ps".}

func mm_mask_shuffle_ps*(w: M128, u: MMask8, a: M128, b: M128, imm: int32): M128 {.importc: "_mm_mask_shuffle_ps".}

func mm_maskz_shuffle_ps*(u: MMask8, a: M128, b: M128, imm: int32): M128 {.importc: "_mm_maskz_shuffle_ps".}

func mm256_inserti32x4*(a: M256i, b: M128i, imm: int32): M256i {.importc: "_mm256_inserti32x4".}

func mm256_mask_inserti32x4*(w: M256i, u: MMask8, a: M256i, b: M128i, imm: int32): M256i {.importc: "_mm256_mask_inserti32x4".}

func mm256_maskz_inserti32x4*(u: MMask8, a: M256i, b: M128i, imm: int32): M256i {.importc: "_mm256_maskz_inserti32x4".}

func mm256_insertf32x4*(a: M256, b: M128, imm: int32): M256 {.importc: "_mm256_insertf32x4".}

func mm256_mask_insertf32x4*(w: M256, u: MMask8, a: M256, b: M128, imm: int32): M256 {.importc: "_mm256_mask_insertf32x4".}

func mm256_maskz_insertf32x4*(u: MMask8, a: M256, b: M128, imm: int32): M256 {.importc: "_mm256_maskz_insertf32x4".}

func mm256_extracti32x4_epi32*(a: M256i, imm: int32): M128i {.importc: "_mm256_extracti32x4_epi32".}

func mm256_mask_extracti32x4_epi32*(w: M128i, u: MMask8, a: M256i, imm: int32): M128i {.importc: "_mm256_mask_extracti32x4_epi32".}

func mm256_maskz_extracti32x4_epi32*(u: MMask8, a: M256i, imm: int32): M128i {.importc: "_mm256_maskz_extracti32x4_epi32".}

func mm256_extractf32x4_ps*(a: M256, imm: int32): M128 {.importc: "_mm256_extractf32x4_ps".}

func mm256_mask_extractf32x4_ps*(w: M128, u: MMask8, a: M256, imm: int32): M128 {.importc: "_mm256_mask_extractf32x4_ps".}

func mm256_maskz_extractf32x4_ps*(u: MMask8, a: M256, imm: int32): M128 {.importc: "_mm256_maskz_extractf32x4_ps".}

func mm256_shuffle_i64x2*(a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_shuffle_i64x2".}

func mm256_mask_shuffle_i64x2*(w: M256i, u: MMask8, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_mask_shuffle_i64x2".}

func mm256_maskz_shuffle_i64x2*(u: MMask8, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_maskz_shuffle_i64x2".}

func mm256_shuffle_i32x4*(a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_shuffle_i32x4".}

func mm256_mask_shuffle_i32x4*(w: M256i, u: MMask8, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_mask_shuffle_i32x4".}

func mm256_maskz_shuffle_i32x4*(u: MMask8, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_maskz_shuffle_i32x4".}

func mm256_shuffle_f64x2*(a: M256d, b: M256d, imm: int32): M256d {.importc: "_mm256_shuffle_f64x2".}

func mm256_mask_shuffle_f64x2*(w: M256d, u: MMask8, a: M256d, b: M256d, imm: int32): M256d {.importc: "_mm256_mask_shuffle_f64x2".}

func mm256_maskz_shuffle_f64x2*(u: MMask8, a: M256d, b: M256d, imm: int32): M256d {.importc: "_mm256_maskz_shuffle_f64x2".}

func mm256_shuffle_f32x4*(a: M256, b: M256, imm: int32): M256 {.importc: "_mm256_shuffle_f32x4".}

func mm256_mask_shuffle_f32x4*(w: M256, u: MMask8, a: M256, b: M256, imm: int32): M256 {.importc: "_mm256_mask_shuffle_f32x4".}

func mm256_maskz_shuffle_f32x4*(u: MMask8, a: M256, b: M256, imm: int32): M256 {.importc: "_mm256_maskz_shuffle_f32x4".}

func mm256_fixupimm_pd*(a: M256d, b: M256d, c: M256i, imm: int32): M256d {.importc: "_mm256_fixupimm_pd".}

func mm256_mask_fixupimm_pd*(a: M256d, u: MMask8, b: M256d, c: M256i, imm: int32): M256d {.importc: "_mm256_mask_fixupimm_pd".}

func mm256_maskz_fixupimm_pd*(u: MMask8, a: M256d, b: M256d, c: M256i, imm: int32): M256d {.importc: "_mm256_maskz_fixupimm_pd".}

func mm256_fixupimm_ps*(a: M256, b: M256, c: M256i, imm: int32): M256 {.importc: "_mm256_fixupimm_ps".}

func mm256_mask_fixupimm_ps*(a: M256, u: MMask8, b: M256, c: M256i, imm: int32): M256 {.importc: "_mm256_mask_fixupimm_ps".}

func mm256_maskz_fixupimm_ps*(u: MMask8, a: M256, b: M256, c: M256i, imm: int32): M256 {.importc: "_mm256_maskz_fixupimm_ps".}

func mm_fixupimm_pd*(a: M128d, b: M128d, c: M128i, imm: int32): M128d {.importc: "_mm_fixupimm_pd".}

func mm_mask_fixupimm_pd*(a: M128d, u: MMask8, b: M128d, c: M128i, imm: int32): M128d {.importc: "_mm_mask_fixupimm_pd".}

func mm_maskz_fixupimm_pd*(u: MMask8, a: M128d, b: M128d, c: M128i, imm: int32): M128d {.importc: "_mm_maskz_fixupimm_pd".}

func mm_fixupimm_ps*(a: M128, b: M128, c: M128i, imm: int32): M128 {.importc: "_mm_fixupimm_ps".}

func mm_mask_fixupimm_ps*(a: M128, u: MMask8, b: M128, c: M128i, imm: int32): M128 {.importc: "_mm_mask_fixupimm_ps".}

func mm_maskz_fixupimm_ps*(u: MMask8, a: M128, b: M128, c: M128i, imm: int32): M128 {.importc: "_mm_maskz_fixupimm_ps".}

func mm256_mask_srli_epi32*(w: M256i, u: MMask8, a: M256i, imm: uint32): M256i {.importc: "_mm256_mask_srli_epi32".}

func mm256_maskz_srli_epi32*(u: MMask8, a: M256i, imm: uint32): M256i {.importc: "_mm256_maskz_srli_epi32".}

func mm_mask_srli_epi32*(w: M128i, u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_mask_srli_epi32".}

func mm_maskz_srli_epi32*(u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_maskz_srli_epi32".}

func mm256_mask_srli_epi64*(w: M256i, u: MMask8, a: M256i, imm: uint32): M256i {.importc: "_mm256_mask_srli_epi64".}

func mm256_maskz_srli_epi64*(u: MMask8, a: M256i, imm: uint32): M256i {.importc: "_mm256_maskz_srli_epi64".}

func mm_mask_srli_epi64*(w: M128i, u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_mask_srli_epi64".}

func mm_maskz_srli_epi64*(u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_maskz_srli_epi64".}

func mm256_ternarylogic_epi64*(a: M256i, b: M256i, c: M256i, imm: int32): M256i {.importc: "_mm256_ternarylogic_epi64".}

func mm256_mask_ternarylogic_epi64*(a: M256i, u: MMask8, b: M256i, c: M256i, imm: int32): M256i {.importc: "_mm256_mask_ternarylogic_epi64".}

func mm256_maskz_ternarylogic_epi64*(u: MMask8, a: M256i, b: M256i, c: M256i, imm: int32): M256i {.importc: "_mm256_maskz_ternarylogic_epi64".}

func mm256_ternarylogic_epi32*(a: M256i, b: M256i, c: M256i, imm: int32): M256i {.importc: "_mm256_ternarylogic_epi32".}

func mm256_mask_ternarylogic_epi32*(a: M256i, u: MMask8, b: M256i, c: M256i, imm: int32): M256i {.importc: "_mm256_mask_ternarylogic_epi32".}

func mm256_maskz_ternarylogic_epi32*(u: MMask8, a: M256i, b: M256i, c: M256i, imm: int32): M256i {.importc: "_mm256_maskz_ternarylogic_epi32".}

func mm_ternarylogic_epi64*(a: M128i, b: M128i, c: M128i, imm: int32): M128i {.importc: "_mm_ternarylogic_epi64".}

func mm_mask_ternarylogic_epi64*(a: M128i, u: MMask8, b: M128i, c: M128i, imm: int32): M128i {.importc: "_mm_mask_ternarylogic_epi64".}

func mm_maskz_ternarylogic_epi64*(u: MMask8, a: M128i, b: M128i, c: M128i, imm: int32): M128i {.importc: "_mm_maskz_ternarylogic_epi64".}

func mm_ternarylogic_epi32*(a: M128i, b: M128i, c: M128i, imm: int32): M128i {.importc: "_mm_ternarylogic_epi32".}

func mm_mask_ternarylogic_epi32*(a: M128i, u: MMask8, b: M128i, c: M128i, imm: int32): M128i {.importc: "_mm_mask_ternarylogic_epi32".}

func mm_maskz_ternarylogic_epi32*(u: MMask8, a: M128i, b: M128i, c: M128i, imm: int32): M128i {.importc: "_mm_maskz_ternarylogic_epi32".}

func mm256_roundscale_ps*(a: M256, imm: int32): M256 {.importc: "_mm256_roundscale_ps".}

func mm256_mask_roundscale_ps*(w: M256, u: MMask8, a: M256, imm: int32): M256 {.importc: "_mm256_mask_roundscale_ps".}

func mm256_maskz_roundscale_ps*(u: MMask8, a: M256, imm: int32): M256 {.importc: "_mm256_maskz_roundscale_ps".}

func mm256_roundscale_pd*(a: M256d, imm: int32): M256d {.importc: "_mm256_roundscale_pd".}

func mm256_mask_roundscale_pd*(w: M256d, u: MMask8, a: M256d, imm: int32): M256d {.importc: "_mm256_mask_roundscale_pd".}

func mm256_maskz_roundscale_pd*(u: MMask8, a: M256d, imm: int32): M256d {.importc: "_mm256_maskz_roundscale_pd".}

func mm_roundscale_ps*(a: M128, imm: int32): M128 {.importc: "_mm_roundscale_ps".}

func mm_mask_roundscale_ps*(w: M128, u: MMask8, a: M128, imm: int32): M128 {.importc: "_mm_mask_roundscale_ps".}

func mm_maskz_roundscale_ps*(u: MMask8, a: M128, imm: int32): M128 {.importc: "_mm_maskz_roundscale_ps".}

func mm_roundscale_pd*(a: M128d, imm: int32): M128d {.importc: "_mm_roundscale_pd".}

func mm_mask_roundscale_pd*(w: M128d, u: MMask8, a: M128d, imm: int32): M128d {.importc: "_mm_mask_roundscale_pd".}

func mm_maskz_roundscale_pd*(u: MMask8, a: M128d, imm: int32): M128d {.importc: "_mm_maskz_roundscale_pd".}

func mm256_getmant_ps*(a: M256, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256 {.importc: "_mm256_getmant_ps".}

func mm256_mask_getmant_ps*(w: M256, u: MMask8, a: M256, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256 {.importc: "_mm256_mask_getmant_ps".}

func mm256_maskz_getmant_ps*(u: MMask8, a: M256, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256 {.importc: "_mm256_maskz_getmant_ps".}

func mm_getmant_ps*(a: M128, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128 {.importc: "_mm_getmant_ps".}

func mm_mask_getmant_ps*(w: M128, u: MMask8, a: M128, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128 {.importc: "_mm_mask_getmant_ps".}

func mm_maskz_getmant_ps*(u: MMask8, a: M128, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128 {.importc: "_mm_maskz_getmant_ps".}

func mm256_getmant_pd*(a: M256d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256d {.importc: "_mm256_getmant_pd".}

func mm256_mask_getmant_pd*(w: M256d, u: MMask8, a: M256d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256d {.importc: "_mm256_mask_getmant_pd".}

func mm256_maskz_getmant_pd*(u: MMask8, a: M256d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M256d {.importc: "_mm256_maskz_getmant_pd".}

func mm_getmant_pd*(a: M128d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128d {.importc: "_mm_getmant_pd".}

func mm_mask_getmant_pd*(w: M128d, u: MMask8, a: M128d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128d {.importc: "_mm_mask_getmant_pd".}

func mm_maskz_getmant_pd*(u: MMask8, a: M128d, b: MM_MANTISSA_NORM_ENUM, c: MM_MANTISSA_SIGN_ENUM): M128d {.importc: "_mm_maskz_getmant_pd".}

func mm256mmask_i32gather_ps*(v1_old: M256, mask: MMask8, index: M256i, address: pointer, scale: int32): M256 {.importc: "_mm256_mmask_i32gather_ps".}

func mmmmask_i32gather_ps*(v1_old: M128, mask: MMask8, index: M128i, address: pointer, scale: int32): M128 {.importc: "_mm_mmask_i32gather_ps".}

func mm256mmask_i32gather_pd*(v1_old: M256d, mask: MMask8, index: M128i, address: pointer, scale: int32): M256d {.importc: "_mm256_mmask_i32gather_pd".}

func mmmmask_i32gather_pd*(v1_old: M128d, mask: MMask8, index: M128i, address: pointer, scale: int32): M128d {.importc: "_mm_mmask_i32gather_pd".}

func mm256mmask_i64gather_ps*(v1_old: M128, mask: MMask8, index: M256i, address: pointer, scale: int32): M128 {.importc: "_mm256_mmask_i64gather_ps".}

func mmmmask_i64gather_ps*(v1_old: M128, mask: MMask8, index: M128i, address: pointer, scale: int32): M128 {.importc: "_mm_mmask_i64gather_ps".}

func mm256mmask_i64gather_pd*(v1_old: M256d, mask: MMask8, index: M256i, address: pointer, scale: int32): M256d {.importc: "_mm256_mmask_i64gather_pd".}

func mmmmask_i64gather_pd*(v1_old: M128d, mask: MMask8, index: M128i, address: pointer, scale: int32): M128d {.importc: "_mm_mmask_i64gather_pd".}

func mm256mmask_i32gather_epi32*(v1_old: M256i, mask: MMask8, index: M256i, address: pointer, scale: int32): M256i {.importc: "_mm256_mmask_i32gather_epi32".}

func mmmmask_i32gather_epi32*(v1_old: M128i, mask: MMask8, index: M128i, address: pointer, scale: int32): M128i {.importc: "_mm_mmask_i32gather_epi32".}

func mm256mmask_i32gather_epi64*(v1_old: M256i, mask: MMask8, index: M128i, address: pointer, scale: int32): M256i {.importc: "_mm256_mmask_i32gather_epi64".}

func mmmmask_i32gather_epi64*(v1_old: M128i, mask: MMask8, index: M128i, address: pointer, scale: int32): M128i {.importc: "_mm_mmask_i32gather_epi64".}

func mm256mmask_i64gather_epi32*(v1_old: M128i, mask: MMask8, index: M256i, address: pointer, scale: int32): M128i {.importc: "_mm256_mmask_i64gather_epi32".}

func mmmmask_i64gather_epi32*(v1_old: M128i, mask: MMask8, index: M128i, address: pointer, scale: int32): M128i {.importc: "_mm_mmask_i64gather_epi32".}

func mm256mmask_i64gather_epi64*(v1_old: M256i, mask: MMask8, index: M256i, address: pointer, scale: int32): M256i {.importc: "_mm256_mmask_i64gather_epi64".}

func mmmmask_i64gather_epi64*(v1_old: M128i, mask: MMask8, index: M128i, address: pointer, scale: int32): M128i {.importc: "_mm_mmask_i64gather_epi64".}

func mm256_i32scatter_ps*(address: pointer, index: M256i, v1: M256, scale: int32): void {.importc: "_mm256_i32scatter_ps".}

func mm256_mask_i32scatter_ps*(address: pointer, mask: MMask8, index: M256i, v1: M256, scale: int32): void {.importc: "_mm256_mask_i32scatter_ps".}

func mm_i32scatter_ps*(address: pointer, index: M128i, v1: M128, scale: int32): void {.importc: "_mm_i32scatter_ps".}

func mm_mask_i32scatter_ps*(address: pointer, mask: MMask8, index: M128i, v1: M128, scale: int32): void {.importc: "_mm_mask_i32scatter_ps".}

func mm256_i32scatter_pd*(address: pointer, index: M128i, v1: M256d, scale: int32): void {.importc: "_mm256_i32scatter_pd".}

func mm256_mask_i32scatter_pd*(address: pointer, mask: MMask8, index: M128i, v1: M256d, scale: int32): void {.importc: "_mm256_mask_i32scatter_pd".}

func mm_i32scatter_pd*(address: pointer, index: M128i, v1: M128d, scale: int32): void {.importc: "_mm_i32scatter_pd".}

func mm_mask_i32scatter_pd*(address: pointer, mask: MMask8, index: M128i, v1: M128d, scale: int32): void {.importc: "_mm_mask_i32scatter_pd".}

func mm256_i64scatter_ps*(address: pointer, index: M256i, v1: M128, scale: int32): void {.importc: "_mm256_i64scatter_ps".}

func mm256_mask_i64scatter_ps*(address: pointer, mask: MMask8, index: M256i, v1: M128, scale: int32): void {.importc: "_mm256_mask_i64scatter_ps".}

func mm_i64scatter_ps*(address: pointer, index: M128i, v1: M128, scale: int32): void {.importc: "_mm_i64scatter_ps".}

func mm_mask_i64scatter_ps*(address: pointer, mask: MMask8, index: M128i, v1: M128, scale: int32): void {.importc: "_mm_mask_i64scatter_ps".}

func mm256_i64scatter_pd*(address: pointer, index: M256i, v1: M256d, scale: int32): void {.importc: "_mm256_i64scatter_pd".}

func mm256_mask_i64scatter_pd*(address: pointer, mask: MMask8, index: M256i, v1: M256d, scale: int32): void {.importc: "_mm256_mask_i64scatter_pd".}

func mm_i64scatter_pd*(address: pointer, index: M128i, v1: M128d, scale: int32): void {.importc: "_mm_i64scatter_pd".}

func mm_mask_i64scatter_pd*(address: pointer, mask: MMask8, index: M128i, v1: M128d, scale: int32): void {.importc: "_mm_mask_i64scatter_pd".}

func mm256_i32scatter_epi32*(address: pointer, index: M256i, v1: M256i, scale: int32): void {.importc: "_mm256_i32scatter_epi32".}

func mm256_mask_i32scatter_epi32*(address: pointer, mask: MMask8, index: M256i, v1: M256i, scale: int32): void {.importc: "_mm256_mask_i32scatter_epi32".}

func mm_i32scatter_epi32*(address: pointer, index: M128i, v1: M128i, scale: int32): void {.importc: "_mm_i32scatter_epi32".}

func mm_mask_i32scatter_epi32*(address: pointer, mask: MMask8, index: M128i, v1: M128i, scale: int32): void {.importc: "_mm_mask_i32scatter_epi32".}

func mm256_i32scatter_epi64*(address: pointer, index: M128i, v1: M256i, scale: int32): void {.importc: "_mm256_i32scatter_epi64".}

func mm256_mask_i32scatter_epi64*(address: pointer, mask: MMask8, index: M128i, v1: M256i, scale: int32): void {.importc: "_mm256_mask_i32scatter_epi64".}

func mm_i32scatter_epi64*(address: pointer, index: M128i, v1: M128i, scale: int32): void {.importc: "_mm_i32scatter_epi64".}

func mm_mask_i32scatter_epi64*(address: pointer, mask: MMask8, index: M128i, v1: M128i, scale: int32): void {.importc: "_mm_mask_i32scatter_epi64".}

func mm256_i64scatter_epi32*(address: pointer, index: M256i, v1: M128i, scale: int32): void {.importc: "_mm256_i64scatter_epi32".}

func mm256_mask_i64scatter_epi32*(address: pointer, mask: MMask8, index: M256i, v1: M128i, scale: int32): void {.importc: "_mm256_mask_i64scatter_epi32".}

func mm_i64scatter_epi32*(address: pointer, index: M128i, v1: M128i, scale: int32): void {.importc: "_mm_i64scatter_epi32".}

func mm_mask_i64scatter_epi32*(address: pointer, mask: MMask8, index: M128i, v1: M128i, scale: int32): void {.importc: "_mm_mask_i64scatter_epi32".}

func mm256_i64scatter_epi64*(address: pointer, index: M256i, v1: M256i, scale: int32): void {.importc: "_mm256_i64scatter_epi64".}

func mm256_mask_i64scatter_epi64*(address: pointer, mask: MMask8, index: M256i, v1: M256i, scale: int32): void {.importc: "_mm256_mask_i64scatter_epi64".}

func mm_i64scatter_epi64*(address: pointer, index: M128i, v1: M128i, scale: int32): void {.importc: "_mm_i64scatter_epi64".}

func mm_mask_i64scatter_epi64*(address: pointer, mask: MMask8, index: M128i, v1: M128i, scale: int32): void {.importc: "_mm_mask_i64scatter_epi64".}

func mm256_mask_shuffle_epi32*(w: M256i, u: MMask8, a: M256i, mask: MM_PERM_ENUM): M256i {.importc: "_mm256_mask_shuffle_epi32".}

func mm256_maskz_shuffle_epi32*(u: MMask8, a: M256i, mask: MM_PERM_ENUM): M256i {.importc: "_mm256_maskz_shuffle_epi32".}

func mm_mask_shuffle_epi32*(w: M128i, u: MMask8, a: M128i, mask: MM_PERM_ENUM): M128i {.importc: "_mm_mask_shuffle_epi32".}

func mm_maskz_shuffle_epi32*(u: MMask8, a: M128i, mask: MM_PERM_ENUM): M128i {.importc: "_mm_maskz_shuffle_epi32".}

func mm256_rol_epi32*(a: M256i, b: int32): M256i {.importc: "_mm256_rol_epi32".}

func mm256_mask_rol_epi32*(w: M256i, u: MMask8, a: M256i, b: int32): M256i {.importc: "_mm256_mask_rol_epi32".}

func mm256_maskz_rol_epi32*(u: MMask8, a: M256i, b: int32): M256i {.importc: "_mm256_maskz_rol_epi32".}

func mm_rol_epi32*(a: M128i, b: int32): M128i {.importc: "_mm_rol_epi32".}

func mm_mask_rol_epi32*(w: M128i, u: MMask8, a: M128i, b: int32): M128i {.importc: "_mm_mask_rol_epi32".}

func mm_maskz_rol_epi32*(u: MMask8, a: M128i, b: int32): M128i {.importc: "_mm_maskz_rol_epi32".}

func mm256_ror_epi32*(a: M256i, b: int32): M256i {.importc: "_mm256_ror_epi32".}

func mm256_mask_ror_epi32*(w: M256i, u: MMask8, a: M256i, b: int32): M256i {.importc: "_mm256_mask_ror_epi32".}

func mm256_maskz_ror_epi32*(u: MMask8, a: M256i, b: int32): M256i {.importc: "_mm256_maskz_ror_epi32".}

func mm_ror_epi32*(a: M128i, b: int32): M128i {.importc: "_mm_ror_epi32".}

func mm_mask_ror_epi32*(w: M128i, u: MMask8, a: M128i, b: int32): M128i {.importc: "_mm_mask_ror_epi32".}

func mm_maskz_ror_epi32*(u: MMask8, a: M128i, b: int32): M128i {.importc: "_mm_maskz_ror_epi32".}

func mm256_rol_epi64*(a: M256i, b: int32): M256i {.importc: "_mm256_rol_epi64".}

func mm256_mask_rol_epi64*(w: M256i, u: MMask8, a: M256i, b: int32): M256i {.importc: "_mm256_mask_rol_epi64".}

func mm256_maskz_rol_epi64*(u: MMask8, a: M256i, b: int32): M256i {.importc: "_mm256_maskz_rol_epi64".}

func mm_rol_epi64*(a: M128i, b: int32): M128i {.importc: "_mm_rol_epi64".}

func mm_mask_rol_epi64*(w: M128i, u: MMask8, a: M128i, b: int32): M128i {.importc: "_mm_mask_rol_epi64".}

func mm_maskz_rol_epi64*(u: MMask8, a: M128i, b: int32): M128i {.importc: "_mm_maskz_rol_epi64".}

func mm256_ror_epi64*(a: M256i, b: int32): M256i {.importc: "_mm256_ror_epi64".}

func mm256_mask_ror_epi64*(w: M256i, u: MMask8, a: M256i, b: int32): M256i {.importc: "_mm256_mask_ror_epi64".}

func mm256_maskz_ror_epi64*(u: MMask8, a: M256i, b: int32): M256i {.importc: "_mm256_maskz_ror_epi64".}

func mm_ror_epi64*(a: M128i, b: int32): M128i {.importc: "_mm_ror_epi64".}

func mm_mask_ror_epi64*(w: M128i, u: MMask8, a: M128i, b: int32): M128i {.importc: "_mm_mask_ror_epi64".}

func mm_maskz_ror_epi64*(u: MMask8, a: M128i, b: int32): M128i {.importc: "_mm_maskz_ror_epi64".}

func mm_alignr_epi32*(a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_alignr_epi32".}

func mm_mask_alignr_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_mask_alignr_epi32".}

func mm_maskz_alignr_epi32*(u: MMask8, a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_maskz_alignr_epi32".}

func mm_alignr_epi64*(a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_alignr_epi64".}

func mm_mask_alignr_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_mask_alignr_epi64".}

func mm_maskz_alignr_epi64*(u: MMask8, a: M128i, b: M128i, imm: int32): M128i {.importc: "_mm_maskz_alignr_epi64".}

func mm256_alignr_epi32*(a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_alignr_epi32".}

func mm256_mask_alignr_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_mask_alignr_epi32".}

func mm256_maskz_alignr_epi32*(u: MMask8, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_maskz_alignr_epi32".}

func mm256_alignr_epi64*(a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_alignr_epi64".}

func mm256_mask_alignr_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_mask_alignr_epi64".}

func mm256_maskz_alignr_epi64*(u: MMask8, a: M256i, b: M256i, imm: int32): M256i {.importc: "_mm256_maskz_alignr_epi64".}

func mm_mask_cvtps_ph*(w: M128i, u: MMask8, a: M128, i: int32): M128i {.importc: "_mm_mask_cvtps_ph".}

func mm_maskz_cvtps_ph*(u: MMask8, a: M128, i: int32): M128i {.importc: "_mm_maskz_cvtps_ph".}

func mm256_mask_cvtps_ph*(w: M128i, u: MMask8, a: M256, i: int32): M128i {.importc: "_mm256_mask_cvtps_ph".}

func mm256_maskz_cvtps_ph*(u: MMask8, a: M256, i: int32): M128i {.importc: "_mm256_maskz_cvtps_ph".}

func mm256_mask_srai_epi32*(w: M256i, u: MMask8, a: M256i, imm: uint32): M256i {.importc: "_mm256_mask_srai_epi32".}

func mm256_maskz_srai_epi32*(u: MMask8, a: M256i, imm: uint32): M256i {.importc: "_mm256_maskz_srai_epi32".}

func mm_mask_srai_epi32*(w: M128i, u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_mask_srai_epi32".}

func mm_maskz_srai_epi32*(u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_maskz_srai_epi32".}

func mm256_srai_epi64*(a: M256i, imm: uint32): M256i {.importc: "_mm256_srai_epi64".}

func mm256_mask_srai_epi64*(w: M256i, u: MMask8, a: M256i, imm: uint32): M256i {.importc: "_mm256_mask_srai_epi64".}

func mm256_maskz_srai_epi64*(u: MMask8, a: M256i, imm: uint32): M256i {.importc: "_mm256_maskz_srai_epi64".}

func mm_srai_epi64*(a: M128i, imm: uint32): M128i {.importc: "_mm_srai_epi64".}

func mm_mask_srai_epi64*(w: M128i, u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_mask_srai_epi64".}

func mm_maskz_srai_epi64*(u: MMask8, a: M128i, imm: uint32): M128i {.importc: "_mm_maskz_srai_epi64".}

func mm_mask_slli_epi32*(w: M128i, u: MMask8, a: M128i, b: uint32): M128i {.importc: "_mm_mask_slli_epi32".}

func mm_maskz_slli_epi32*(u: MMask8, a: M128i, b: uint32): M128i {.importc: "_mm_maskz_slli_epi32".}

func mm_mask_slli_epi64*(w: M128i, u: MMask8, a: M128i, b: uint32): M128i {.importc: "_mm_mask_slli_epi64".}

func mm_maskz_slli_epi64*(u: MMask8, a: M128i, b: uint32): M128i {.importc: "_mm_maskz_slli_epi64".}

func mm256_mask_slli_epi32*(w: M256i, u: MMask8, a: M256i, b: uint32): M256i {.importc: "_mm256_mask_slli_epi32".}

func mm256_maskz_slli_epi32*(u: MMask8, a: M256i, b: uint32): M256i {.importc: "_mm256_maskz_slli_epi32".}

func mm256_mask_slli_epi64*(w: M256i, u: MMask8, a: M256i, b: uint32): M256i {.importc: "_mm256_mask_slli_epi64".}

func mm256_maskz_slli_epi64*(u: MMask8, a: M256i, b: uint32): M256i {.importc: "_mm256_maskz_slli_epi64".}

func mm256_mask_permutex_pd*(w: M256d, u: MMask8, x: M256d, imm: int32): M256d {.importc: "_mm256_mask_permutex_pd".}

func mm256_maskz_permutex_pd*(u: MMask8, x: M256d, imm: int32): M256d {.importc: "_mm256_maskz_permutex_pd".}

func mm256_mask_permute_pd*(w: M256d, u: MMask8, x: M256d, c: int32): M256d {.importc: "_mm256_mask_permute_pd".}

func mm256_maskz_permute_pd*(u: MMask8, x: M256d, c: int32): M256d {.importc: "_mm256_maskz_permute_pd".}

func mm_mask_permute_pd*(w: M128d, u: MMask8, x: M128d, c: int32): M128d {.importc: "_mm_mask_permute_pd".}

func mm_maskz_permute_pd*(u: MMask8, x: M128d, c: int32): M128d {.importc: "_mm_maskz_permute_pd".}

func mm256_mask_permute_ps*(w: M256, u: MMask8, x: M256, c: int32): M256 {.importc: "_mm256_mask_permute_ps".}

func mm256_maskz_permute_ps*(u: MMask8, x: M256, c: int32): M256 {.importc: "_mm256_maskz_permute_ps".}

func mm_mask_permute_ps*(w: M128, u: MMask8, x: M128, c: int32): M128 {.importc: "_mm_mask_permute_ps".}

func mm_maskz_permute_ps*(u: MMask8, x: M128, c: int32): M128 {.importc: "_mm_maskz_permute_ps".}

func mm256_cmp_epi64_mask*(x: M256i, y: M256i, p: int32): MMask8 {.importc: "_mm256_cmp_epi64_mask".}

func mm256_cmp_epi32_mask*(x: M256i, y: M256i, p: int32): MMask8 {.importc: "_mm256_cmp_epi32_mask".}

func mm256_cmp_epu64_mask*(x: M256i, y: M256i, p: int32): MMask8 {.importc: "_mm256_cmp_epu64_mask".}

func mm256_cmp_epu32_mask*(x: M256i, y: M256i, p: int32): MMask8 {.importc: "_mm256_cmp_epu32_mask".}

func mm256_cmp_pd_mask*(x: M256d, y: M256d, p: int32): MMask8 {.importc: "_mm256_cmp_pd_mask".}

func mm256_cmp_ps_mask*(x: M256, y: M256, p: int32): MMask8 {.importc: "_mm256_cmp_ps_mask".}

func mm256_mask_cmp_epi64_mask*(u: MMask8, x: M256i, y: M256i, p: int32): MMask8 {.importc: "_mm256_mask_cmp_epi64_mask".}

func mm256_mask_cmp_epi32_mask*(u: MMask8, x: M256i, y: M256i, p: int32): MMask8 {.importc: "_mm256_mask_cmp_epi32_mask".}

func mm256_mask_cmp_epu64_mask*(u: MMask8, x: M256i, y: M256i, p: int32): MMask8 {.importc: "_mm256_mask_cmp_epu64_mask".}

func mm256_mask_cmp_epu32_mask*(u: MMask8, x: M256i, y: M256i, p: int32): MMask8 {.importc: "_mm256_mask_cmp_epu32_mask".}

func mm256_mask_cmp_pd_mask*(u: MMask8, x: M256d, y: M256d, p: int32): MMask8 {.importc: "_mm256_mask_cmp_pd_mask".}

func mm256_mask_cmp_ps_mask*(u: MMask8, x: M256, y: M256, p: int32): MMask8 {.importc: "_mm256_mask_cmp_ps_mask".}

func mm_cmp_epi64_mask*(x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_cmp_epi64_mask".}

func mm_cmp_epi32_mask*(x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_cmp_epi32_mask".}

func mm_cmp_epu64_mask*(x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_cmp_epu64_mask".}

func mm_cmp_epu32_mask*(x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_cmp_epu32_mask".}

func mm_cmp_pd_mask*(x: M128d, y: M128d, p: int32): MMask8 {.importc: "_mm_cmp_pd_mask".}

func mm_cmp_ps_mask*(x: M128, y: M128, p: int32): MMask8 {.importc: "_mm_cmp_ps_mask".}

func mm_mask_cmp_epi64_mask*(u: MMask8, x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_mask_cmp_epi64_mask".}

func mm_mask_cmp_epi32_mask*(u: MMask8, x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_mask_cmp_epi32_mask".}

func mm_mask_cmp_epu64_mask*(u: MMask8, x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_mask_cmp_epu64_mask".}

func mm_mask_cmp_epu32_mask*(u: MMask8, x: M128i, y: M128i, p: int32): MMask8 {.importc: "_mm_mask_cmp_epu32_mask".}

func mm_mask_cmp_pd_mask*(u: MMask8, x: M128d, y: M128d, p: int32): MMask8 {.importc: "_mm_mask_cmp_pd_mask".}

func mm_mask_cmp_ps_mask*(u: MMask8, x: M128, y: M128, p: int32): MMask8 {.importc: "_mm_mask_cmp_ps_mask".}

func mm256_permutex_pd*(x: M256d, m: int32): M256d {.importc: "_mm256_permutex_pd".}

## [Macro Original]
## #define _mm256_permutex_pd(X, M)						\
## ((__m256d) __builtin_ia32_permdf256_mask ((__v4df)(__m256d)(X), (int)(M),	\
## (__v4df)(__m256d)			\
## _mm256_avx512_undefined_pd (),		\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_permutex_epi64(X, I)               \
## ((__m256i) __builtin_ia32_permdi256_mask ((__v4di)(__m256i)(X), \
## (int)(I),		\
## (__v4di)(__m256i)	\
## (_mm256_avx512_setzero_si256 ()),\
## (__mmask8) -1))

## [Macro Original]
## #define _mm256_maskz_permutex_epi64(M, X, I)                    \
## ((__m256i) __builtin_ia32_permdi256_mask ((__v4di)(__m256i)(X),    \
## (int)(I),                \
## (__v4di)(__m256i)        \
## (_mm256_avx512_setzero_si256 ()),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm256_mask_permutex_epi64(W, M, X, I)               \
## ((__m256i) __builtin_ia32_permdi256_mask ((__v4di)(__m256i)(X), \
## (int)(I),             \
## (__v4di)(__m256i)(W), \
## (__mmask8)(M)))

## [Macro Original]
## #define _mm256_insertf32x4(X, Y, C)                                     \
## ((__m256) __builtin_ia32_insertf32x4_256_mask ((__v8sf)(__m256) (X),  \
## (__v4sf)(__m128) (Y), (int) (C),					\
## (__v8sf)(__m256)_mm256_avx512_setzero_ps (),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_insertf32x4(W, U, X, Y, C)                          \
## ((__m256) __builtin_ia32_insertf32x4_256_mask ((__v8sf)(__m256) (X),  \
## (__v4sf)(__m128) (Y), (int) (C),					\
## (__v8sf)(__m256)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_insertf32x4(U, X, Y, C)                            \
## ((__m256) __builtin_ia32_insertf32x4_256_mask ((__v8sf)(__m256) (X),	\
## (__v4sf)(__m128) (Y), (int) (C),					\
## (__v8sf)(__m256)_mm256_avx512_setzero_ps (),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_inserti32x4(X, Y, C)                                     \
## ((__m256i) __builtin_ia32_inserti32x4_256_mask ((__v8si)(__m256i) (X),\
## (__v4si)(__m128i) (Y), (int) (C),					\
## (__v8si)(__m256i)_mm256_avx512_setzero_si256 (),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_inserti32x4(W, U, X, Y, C)                          \
## ((__m256i) __builtin_ia32_inserti32x4_256_mask ((__v8si)(__m256i) (X),\
## (__v4si)(__m128i) (Y), (int) (C),					\
## (__v8si)(__m256i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_inserti32x4(U, X, Y, C)                            \
## ((__m256i) __builtin_ia32_inserti32x4_256_mask ((__v8si)(__m256i) (X),\
## (__v4si)(__m128i) (Y), (int) (C),					\
## (__v8si)(__m256i)_mm256_avx512_setzero_si256 (),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_extractf32x4_ps(X, C)                                    \
## ((__m128) __builtin_ia32_extractf32x4_256_mask ((__v8sf)(__m256) (X), \
## (int) (C),								\
## (__v4sf)(__m128)_mm_avx512_setzero_ps (),					\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_extractf32x4_ps(W, U, X, C)                         \
## ((__m128) __builtin_ia32_extractf32x4_256_mask ((__v8sf)(__m256) (X), \
## (int) (C),								\
## (__v4sf)(__m128)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_extractf32x4_ps(U, X, C)                           \
## ((__m128) __builtin_ia32_extractf32x4_256_mask ((__v8sf)(__m256) (X), \
## (int) (C),								\
## (__v4sf)(__m128)_mm_avx512_setzero_ps (),					\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_extracti32x4_epi32(X, C)                                 \
## ((__m128i) __builtin_ia32_extracti32x4_256_mask ((__v8si)(__m256i) (X),\
## (int) (C), (__v4si)(__m128i)_mm_avx512_setzero_si128 (), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_extracti32x4_epi32(W, U, X, C)                      \
## ((__m128i) __builtin_ia32_extracti32x4_256_mask ((__v8si)(__m256i) (X),\
## (int) (C), (__v4si)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_extracti32x4_epi32(U, X, C)                        \
## ((__m128i) __builtin_ia32_extracti32x4_256_mask ((__v8si)(__m256i) (X),\
## (int) (C), (__v4si)(__m128i)_mm_avx512_setzero_si128 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_shuffle_i64x2(X, Y, C)                                                   \
## ((__m256i)  __builtin_ia32_shuf_i64x2_256_mask ((__v4di)(__m256i)(X),                 \
## (__v4di)(__m256i)(Y), (int)(C),       \
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_shuffle_i64x2(W, U, X, Y, C)                                        \
## ((__m256i)  __builtin_ia32_shuf_i64x2_256_mask ((__v4di)(__m256i)(X),                 \
## (__v4di)(__m256i)(Y), (int)(C),       \
## (__v4di)(__m256i)(W),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_shuffle_i64x2(U, X, Y, C)                                          \
## ((__m256i)  __builtin_ia32_shuf_i64x2_256_mask ((__v4di)(__m256i)(X),                 \
## (__v4di)(__m256i)(Y), (int)(C),       \
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_shuffle_i32x4(X, Y, C)                                                   \
## ((__m256i)  __builtin_ia32_shuf_i32x4_256_mask ((__v8si)(__m256i)(X),                 \
## (__v8si)(__m256i)(Y), (int)(C),       \
## (__v8si)(__m256i)			\
## _mm256_avx512_setzero_si256 (),		\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_shuffle_i32x4(W, U, X, Y, C)                                        \
## ((__m256i)  __builtin_ia32_shuf_i32x4_256_mask ((__v8si)(__m256i)(X),                 \
## (__v8si)(__m256i)(Y), (int)(C),       \
## (__v8si)(__m256i)(W),                 \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_shuffle_i32x4(U, X, Y, C)                                          \
## ((__m256i)  __builtin_ia32_shuf_i32x4_256_mask ((__v8si)(__m256i)(X),                 \
## (__v8si)(__m256i)(Y), (int)(C),       \
## (__v8si)(__m256i)			\
## _mm256_avx512_setzero_si256 (),		\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_shuffle_f64x2(X, Y, C)                                                   \
## ((__m256d)  __builtin_ia32_shuf_f64x2_256_mask ((__v4df)(__m256d)(X),                 \
## (__v4df)(__m256d)(Y), (int)(C),       \
## (__v4df)(__m256d)_mm256_avx512_setzero_pd (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_shuffle_f64x2(W, U, X, Y, C)                                        \
## ((__m256d)  __builtin_ia32_shuf_f64x2_256_mask ((__v4df)(__m256d)(X),                 \
## (__v4df)(__m256d)(Y), (int)(C),       \
## (__v4df)(__m256d)(W),                 \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_shuffle_f64x2(U, X, Y, C)                                          \
## ((__m256d)  __builtin_ia32_shuf_f64x2_256_mask ((__v4df)(__m256d)(X),                 \
## (__v4df)(__m256d)(Y), (int)(C),       \
## (__v4df)(__m256d)_mm256_avx512_setzero_pd( ),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_shuffle_f32x4(X, Y, C)                                                   \
## ((__m256)  __builtin_ia32_shuf_f32x4_256_mask ((__v8sf)(__m256)(X),                   \
## (__v8sf)(__m256)(Y), (int)(C),         \
## (__v8sf)(__m256)_mm256_avx512_setzero_ps (),  \
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_shuffle_f32x4(W, U, X, Y, C)                                        \
## ((__m256)  __builtin_ia32_shuf_f32x4_256_mask ((__v8sf)(__m256)(X),                   \
## (__v8sf)(__m256)(Y), (int)(C),         \
## (__v8sf)(__m256)(W),                   \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_shuffle_f32x4(U, X, Y, C)                                          \
## ((__m256)  __builtin_ia32_shuf_f32x4_256_mask ((__v8sf)(__m256)(X),                   \
## (__v8sf)(__m256)(Y), (int)(C),         \
## (__v8sf)(__m256)_mm256_avx512_setzero_ps (),  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_shuffle_pd(W, U, A, B, C)                                   \
## ((__m256d)__builtin_ia32_shufpd256_mask ((__v4df)(__m256d)(A),                \
## (__v4df)(__m256d)(B), (int)(C),      \
## (__v4df)(__m256d)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_shuffle_pd(U, A, B, C)                                     \
## ((__m256d)__builtin_ia32_shufpd256_mask ((__v4df)(__m256d)(A),                \
## (__v4df)(__m256d)(B), (int)(C),      \
## (__v4df)(__m256d)			\
## _mm256_avx512_setzero_pd (),		\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_shuffle_pd(W, U, A, B, C)                                      \
## ((__m128d)__builtin_ia32_shufpd128_mask ((__v2df)(__m128d)(A),                \
## (__v2df)(__m128d)(B), (int)(C),      \
## (__v2df)(__m128d)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_shuffle_pd(U, A, B, C)                                        \
## ((__m128d)__builtin_ia32_shufpd128_mask ((__v2df)(__m128d)(A),                \
## (__v2df)(__m128d)(B), (int)(C),      \
## (__v2df)(__m128d)_mm_avx512_setzero_pd (),  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_shuffle_ps(W, U, A, B, C)                                   \
## ((__m256) __builtin_ia32_shufps256_mask ((__v8sf)(__m256)(A),                 \
## (__v8sf)(__m256)(B), (int)(C),       \
## (__v8sf)(__m256)(W),                 \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_shuffle_ps(U, A, B, C)                                     \
## ((__m256) __builtin_ia32_shufps256_mask ((__v8sf)(__m256)(A),                 \
## (__v8sf)(__m256)(B), (int)(C),       \
## (__v8sf)(__m256)_mm256_avx512_setzero_ps (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_shuffle_ps(W, U, A, B, C)                                      \
## ((__m128) __builtin_ia32_shufps128_mask ((__v4sf)(__m128)(A),                 \
## (__v4sf)(__m128)(B), (int)(C),       \
## (__v4sf)(__m128)(W),                 \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_shuffle_ps(U, A, B, C)                                        \
## ((__m128) __builtin_ia32_shufps128_mask ((__v4sf)(__m128)(A),                 \
## (__v4sf)(__m128)(B), (int)(C),       \
## (__v4sf)(__m128)_mm_avx512_setzero_ps (),   \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_fixupimm_pd(X, Y, Z, C)                                          \
## ((__m256d)__builtin_ia32_fixupimmpd256_mask ((__v4df)(__m256d)(X),		\
## (__v4df)(__m256d)(Y),		\
## (__v4di)(__m256i)(Z), (int)(C),	\
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm256_mask_fixupimm_pd(X, U, Y, Z, C)                                  \
## ((__m256d)__builtin_ia32_fixupimmpd256_mask ((__v4df)(__m256d)(X),           \
## (__v4df)(__m256d)(Y),           \
## (__v4di)(__m256i)(Z), (int)(C), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_fixupimm_pd(U, X, Y, Z, C)                                 \
## ((__m256d)__builtin_ia32_fixupimmpd256_maskz ((__v4df)(__m256d)(X),          \
## (__v4df)(__m256d)(Y),          \
## (__v4di)(__m256i)(Z), (int)(C),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_fixupimm_ps(X, Y, Z, C)						\
## ((__m256)__builtin_ia32_fixupimmps256_mask ((__v8sf)(__m256)(X),		\
## (__v8sf)(__m256)(Y),		\
## (__v8si)(__m256i)(Z), (int)(C),	\
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm256_mask_fixupimm_ps(X, U, Y, Z, C)                                  \
## ((__m256)__builtin_ia32_fixupimmps256_mask ((__v8sf)(__m256)(X),            \
## (__v8sf)(__m256)(Y),            \
## (__v8si)(__m256i)(Z), (int)(C), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_fixupimm_ps(U, X, Y, Z, C)                                 \
## ((__m256)__builtin_ia32_fixupimmps256_maskz ((__v8sf)(__m256)(X),           \
## (__v8sf)(__m256)(Y),           \
## (__v8si)(__m256i)(Z), (int)(C),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_fixupimm_pd(X, Y, Z, C)						\
## ((__m128d)__builtin_ia32_fixupimmpd128_mask ((__v2df)(__m128d)(X),		\
## (__v2df)(__m128d)(Y),		\
## (__v2di)(__m128i)(Z), (int)(C), 	\
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm_mask_fixupimm_pd(X, U, Y, Z, C)                                       \
## ((__m128d)__builtin_ia32_fixupimmpd128_mask ((__v2df)(__m128d)(X),           \
## (__v2df)(__m128d)(Y),           \
## (__v2di)(__m128i)(Z), (int)(C), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_fixupimm_pd(U, X, Y, Z, C)                                      \
## ((__m128d)__builtin_ia32_fixupimmpd128_maskz ((__v2df)(__m128d)(X),          \
## (__v2df)(__m128d)(Y),          \
## (__v2di)(__m128i)(Z), (int)(C),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_fixupimm_ps(X, Y, Z, C)						\
## ((__m128)__builtin_ia32_fixupimmps128_mask ((__v4sf)(__m128)(X),		\
## (__v4sf)(__m128)(Y),		\
## (__v4si)(__m128i)(Z), (int)(C), 	\
## (__mmask8)(-1)))

## [Macro Original]
## #define _mm_mask_fixupimm_ps(X, U, Y, Z, C)                                      \
## ((__m128)__builtin_ia32_fixupimmps128_mask ((__v4sf)(__m128)(X),           \
## (__v4sf)(__m128)(Y),           \
## (__v4si)(__m128i)(Z), (int)(C),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_fixupimm_ps(U, X, Y, Z, C)                                      \
## ((__m128)__builtin_ia32_fixupimmps128_maskz ((__v4sf)(__m128)(X),           \
## (__v4sf)(__m128)(Y),           \
## (__v4si)(__m128i)(Z), (int)(C),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_srli_epi32(W, U, A, B)				\
## ((__m256i) __builtin_ia32_psrldi256_mask ((__v8si)(__m256i)(A),	\
## (unsigned int)(B), (__v8si)(__m256i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_srli_epi32(U, A, B)				\
## ((__m256i) __builtin_ia32_psrldi256_mask ((__v8si)(__m256i)(A),	\
## (unsigned int)(B), (__v8si)_mm256_avx512_setzero_si256 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_srli_epi32(W, U, A, B)                                 \
## ((__m128i) __builtin_ia32_psrldi128_mask ((__v4si)(__m128i)(A),       \
## (unsigned int)(B), (__v4si)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_srli_epi32(U, A, B)                                   \
## ((__m128i) __builtin_ia32_psrldi128_mask ((__v4si)(__m128i)(A),       \
## (unsigned int)(B), (__v4si)_mm_avx512_setzero_si128 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_srli_epi64(W, U, A, B)				\
## ((__m256i) __builtin_ia32_psrlqi256_mask ((__v4di)(__m256i)(A),	\
## (unsigned int)(B), (__v4di)(__m256i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_srli_epi64(U, A, B)				\
## ((__m256i) __builtin_ia32_psrlqi256_mask ((__v4di)(__m256i)(A),	\
## (unsigned int)(B), (__v4di)_mm256_avx512_setzero_si256 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_srli_epi64(W, U, A, B)                                 \
## ((__m128i) __builtin_ia32_psrlqi128_mask ((__v2di)(__m128i)(A),       \
## (unsigned int)(B), (__v2di)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_srli_epi64(U, A, B)                                   \
## ((__m128i) __builtin_ia32_psrlqi128_mask ((__v2di)(__m128i)(A),       \
## (unsigned int)(B), (__v2di)_mm_avx512_setzero_si128 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_slli_epi32(W, U, X, C)				\
## ((__m256i)__builtin_ia32_pslldi256_mask ((__v8si)(__m256i)(X),	\
## (unsigned int)(C),							\
## (__v8si)(__m256i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_slli_epi32(U, X, C)				\
## ((__m256i)__builtin_ia32_pslldi256_mask ((__v8si)(__m256i)(X),	\
## (unsigned int)(C),							\
## (__v8si)(__m256i)_mm256_avx512_setzero_si256 (),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_slli_epi64(W, U, X, C)				\
## ((__m256i)__builtin_ia32_psllqi256_mask ((__v4di)(__m256i)(X),	\
## (unsigned int)(C),							\
## (__v4di)(__m256i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_slli_epi64(U, X, C)				\
## ((__m256i)__builtin_ia32_psllqi256_mask ((__v4di)(__m256i)(X),	\
## (unsigned int)(C),							\
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_slli_epi32(W, U, X, C)					\
## ((__m128i)__builtin_ia32_pslldi128_mask ((__v4si)(__m128i)(X),	\
## (unsigned int)(C),							\
## (__v4si)(__m128i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_slli_epi32(U, X, C)					\
## ((__m128i)__builtin_ia32_pslldi128_mask ((__v4si)(__m128i)(X),	\
## (unsigned int)(C),							\
## (__v4si)(__m128i)_mm_avx512_setzero_si128 (),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_slli_epi64(W, U, X, C)					\
## ((__m128i)__builtin_ia32_psllqi128_mask ((__v2di)(__m128i)(X),	\
## (unsigned int)(C),							\
## (__v2di)(__m128i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_slli_epi64(U, X, C)					\
## ((__m128i)__builtin_ia32_psllqi128_mask ((__v2di)(__m128i)(X),	\
## (unsigned int)(C),							\
## (__v2di)(__m128i)_mm_avx512_setzero_si128 (),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_ternarylogic_epi64(A, B, C, I)			\
## ((__m256i)							\
## __builtin_ia32_pternlogq256_mask ((__v4di) (__m256i) (A),	\
## (__v4di) (__m256i) (B),	\
## (__v4di) (__m256i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) -1))

## [Macro Original]
## #define _mm256_mask_ternarylogic_epi64(A, U, B, C, I)		\
## ((__m256i)							\
## __builtin_ia32_pternlogq256_mask ((__v4di) (__m256i) (A),	\
## (__v4di) (__m256i) (B),	\
## (__v4di) (__m256i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_maskz_ternarylogic_epi64(U, A, B, C, I)		\
## ((__m256i)							\
## __builtin_ia32_pternlogq256_maskz ((__v4di) (__m256i) (A),	\
## (__v4di) (__m256i) (B),	\
## (__v4di) (__m256i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_ternarylogic_epi32(A, B, C, I)			\
## ((__m256i)							\
## __builtin_ia32_pternlogd256_mask ((__v8si) (__m256i) (A),	\
## (__v8si) (__m256i) (B),	\
## (__v8si) (__m256i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) -1))

## [Macro Original]
## #define _mm256_mask_ternarylogic_epi32(A, U, B, C, I)		\
## ((__m256i)							\
## __builtin_ia32_pternlogd256_mask ((__v8si) (__m256i) (A),	\
## (__v8si) (__m256i) (B),	\
## (__v8si) (__m256i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_maskz_ternarylogic_epi32(U, A, B, C, I)		\
## ((__m256i)							\
## __builtin_ia32_pternlogd256_maskz ((__v8si) (__m256i) (A),	\
## (__v8si) (__m256i) (B),	\
## (__v8si) (__m256i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm_ternarylogic_epi64(A, B, C, I)			\
## ((__m128i)							\
## __builtin_ia32_pternlogq128_mask ((__v2di) (__m128i) (A),	\
## (__v2di) (__m128i) (B),	\
## (__v2di) (__m128i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) -1))

## [Macro Original]
## #define _mm_mask_ternarylogic_epi64(A, U, B, C, I)		\
## ((__m128i)							\
## __builtin_ia32_pternlogq128_mask ((__v2di) (__m128i) (A),	\
## (__v2di) (__m128i) (B),	\
## (__v2di) (__m128i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm_maskz_ternarylogic_epi64(U, A, B, C, I)		\
## ((__m128i)							\
## __builtin_ia32_pternlogq128_maskz ((__v2di) (__m128i) (A),	\
## (__v2di) (__m128i) (B),	\
## (__v2di) (__m128i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm_ternarylogic_epi32(A, B, C, I)			\
## ((__m128i)							\
## __builtin_ia32_pternlogd128_mask ((__v4si) (__m128i) (A),	\
## (__v4si) (__m128i) (B),	\
## (__v4si) (__m128i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) -1))

## [Macro Original]
## #define _mm_mask_ternarylogic_epi32(A, U, B, C, I)		\
## ((__m128i)							\
## __builtin_ia32_pternlogd128_mask ((__v4si) (__m128i) (A),	\
## (__v4si) (__m128i) (B),	\
## (__v4si) (__m128i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm_maskz_ternarylogic_epi32(U, A, B, C, I)		\
## ((__m128i)							\
## __builtin_ia32_pternlogd128_maskz ((__v4si) (__m128i) (A),	\
## (__v4si) (__m128i) (B),	\
## (__v4si) (__m128i) (C),	\
## (unsigned char) (I),	\
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_roundscale_ps(A, B)				        \
## ((__m256) __builtin_ia32_rndscaleps_256_mask ((__v8sf)(__m256)(A),    \
## (int)(B), (__v8sf)(__m256)_mm256_avx512_setzero_ps (), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_roundscale_ps(W, U, A, B)			        \
## ((__m256) __builtin_ia32_rndscaleps_256_mask ((__v8sf)(__m256)(A),    \
## (int)(B), (__v8sf)(__m256)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_roundscale_ps(U, A, B)			        \
## ((__m256) __builtin_ia32_rndscaleps_256_mask ((__v8sf)(__m256)(A),    \
## (int)(B), (__v8sf)(__m256)_mm256_avx512_setzero_ps (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_roundscale_pd(A, B)				        \
## ((__m256d) __builtin_ia32_rndscalepd_256_mask ((__v4df)(__m256d)(A),  \
## (int)(B), (__v4df)(__m256d)_mm256_avx512_setzero_pd (), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_roundscale_pd(W, U, A, B)			        \
## ((__m256d) __builtin_ia32_rndscalepd_256_mask ((__v4df)(__m256d)(A),  \
## (int)(B), (__v4df)(__m256d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_roundscale_pd(U, A, B)			        \
## ((__m256d) __builtin_ia32_rndscalepd_256_mask ((__v4df)(__m256d)(A),  \
## (int)(B), (__v4df)(__m256d)_mm256_avx512_setzero_pd (), (__mmask8)(U)))

## [Macro Original]
## #define _mm_roundscale_ps(A, B)					        \
## ((__m128) __builtin_ia32_rndscaleps_128_mask ((__v4sf)(__m128)(A),    \
## (int)(B), (__v4sf)(__m128)_mm_avx512_setzero_ps (), (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_roundscale_ps(W, U, A, B)			        \
## ((__m128) __builtin_ia32_rndscaleps_128_mask ((__v4sf)(__m128)(A),    \
## (int)(B), (__v4sf)(__m128)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_roundscale_ps(U, A, B)			        \
## ((__m128) __builtin_ia32_rndscaleps_128_mask ((__v4sf)(__m128)(A),    \
## (int)(B), (__v4sf)(__m128)_mm_avx512_setzero_ps (), (__mmask8)(U)))

## [Macro Original]
## #define _mm_roundscale_pd(A, B)					        \
## ((__m128d) __builtin_ia32_rndscalepd_128_mask ((__v2df)(__m128d)(A),  \
## (int)(B), (__v2df)(__m128d)_mm_avx512_setzero_pd (), (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_roundscale_pd(W, U, A, B)			        \
## ((__m128d) __builtin_ia32_rndscalepd_128_mask ((__v2df)(__m128d)(A),  \
## (int)(B), (__v2df)(__m128d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_roundscale_pd(U, A, B)			        \
## ((__m128d) __builtin_ia32_rndscalepd_128_mask ((__v2df)(__m128d)(A),  \
## (int)(B), (__v2df)(__m128d)_mm_avx512_setzero_pd (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_getmant_ps(X, B, C)                                              \
## ((__m256) __builtin_ia32_getmantps256_mask ((__v8sf)(__m256) (X),             \
## (int)(((C)<<2) | (B)),                 \
## (__v8sf)(__m256)_mm256_avx512_setzero_ps (),  \
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_getmant_ps(W, U, X, B, C)                                   \
## ((__m256) __builtin_ia32_getmantps256_mask ((__v8sf)(__m256) (X),             \
## (int)(((C)<<2) | (B)),                 \
## (__v8sf)(__m256)(W),                   \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_getmant_ps(U, X, B, C)                                     \
## ((__m256) __builtin_ia32_getmantps256_mask ((__v8sf)(__m256) (X),             \
## (int)(((C)<<2) | (B)),                 \
## (__v8sf)(__m256)_mm256_avx512_setzero_ps (),  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_getmant_ps(X, B, C)                                                 \
## ((__m128) __builtin_ia32_getmantps128_mask ((__v4sf)(__m128) (X),             \
## (int)(((C)<<2) | (B)),                 \
## (__v4sf)(__m128)_mm_avx512_setzero_ps (),     \
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_getmant_ps(W, U, X, B, C)                                      \
## ((__m128) __builtin_ia32_getmantps128_mask ((__v4sf)(__m128) (X),             \
## (int)(((C)<<2) | (B)),                 \
## (__v4sf)(__m128)(W),                   \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_getmant_ps(U, X, B, C)                                        \
## ((__m128) __builtin_ia32_getmantps128_mask ((__v4sf)(__m128) (X),             \
## (int)(((C)<<2) | (B)),                 \
## (__v4sf)(__m128)_mm_avx512_setzero_ps (),     \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_getmant_pd(X, B, C)                                              \
## ((__m256d) __builtin_ia32_getmantpd256_mask ((__v4df)(__m256d) (X),           \
## (int)(((C)<<2) | (B)),                 \
## (__v4df)(__m256d)_mm256_avx512_setzero_pd (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_getmant_pd(W, U, X, B, C)                                   \
## ((__m256d) __builtin_ia32_getmantpd256_mask ((__v4df)(__m256d) (X),           \
## (int)(((C)<<2) | (B)),                 \
## (__v4df)(__m256d)(W),                 \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_getmant_pd(U, X, B, C)                                     \
## ((__m256d) __builtin_ia32_getmantpd256_mask ((__v4df)(__m256d) (X),           \
## (int)(((C)<<2) | (B)),                 \
## (__v4df)(__m256d)_mm256_avx512_setzero_pd (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_getmant_pd(X, B, C)                                                 \
## ((__m128d) __builtin_ia32_getmantpd128_mask ((__v2df)(__m128d) (X),           \
## (int)(((C)<<2) | (B)),                 \
## (__v2df)(__m128d)_mm_avx512_setzero_pd (),   \
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_getmant_pd(W, U, X, B, C)                                      \
## ((__m128d) __builtin_ia32_getmantpd128_mask ((__v2df)(__m128d) (X),           \
## (int)(((C)<<2) | (B)),                 \
## (__v2df)(__m128d)(W),                 \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_getmant_pd(U, X, B, C)                                        \
## ((__m128d) __builtin_ia32_getmantpd128_mask ((__v2df)(__m128d) (X),           \
## (int)(((C)<<2) | (B)),                 \
## (__v2df)(__m128d)_mm_avx512_setzero_pd (),   \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mmask_i32gather_ps(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m256) __builtin_ia32_gather3siv8sf ((__v8sf)(__m256) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v8si)(__m256i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm_mmask_i32gather_ps(V1OLD, MASK, INDEX, ADDR, SCALE)		\
## (__m128) __builtin_ia32_gather3siv4sf ((__v4sf)(__m128) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v4si)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm256_mmask_i32gather_pd(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m256d) __builtin_ia32_gather3siv4df ((__v4df)(__m256d) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v4si)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm_mmask_i32gather_pd(V1OLD, MASK, INDEX, ADDR, SCALE)		\
## (__m128d) __builtin_ia32_gather3siv2df ((__v2df)(__m128d) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v4si)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm256_mmask_i64gather_ps(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m128) __builtin_ia32_gather3div8sf ((__v4sf)(__m128) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v4di)(__m256i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm_mmask_i64gather_ps(V1OLD, MASK, INDEX, ADDR, SCALE)		\
## (__m128) __builtin_ia32_gather3div4sf ((__v4sf)(__m128) (V1OLD),	\
## (void const *) (ADDR),		\
## (__v2di)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm256_mmask_i64gather_pd(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m256d) __builtin_ia32_gather3div4df ((__v4df)(__m256d) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v4di)(__m256i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm_mmask_i64gather_pd(V1OLD, MASK, INDEX, ADDR, SCALE)		\
## (__m128d) __builtin_ia32_gather3div2df ((__v2df)(__m128d) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v2di)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm256_mmask_i32gather_epi32(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m256i) __builtin_ia32_gather3siv8si ((__v8si)(__m256i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v8si)(__m256i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm_mmask_i32gather_epi32(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m128i) __builtin_ia32_gather3siv4si ((__v4si)(__m128i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v4si)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm256_mmask_i32gather_epi64(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m256i) __builtin_ia32_gather3siv4di ((__v4di)(__m256i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v4si)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm_mmask_i32gather_epi64(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m128i) __builtin_ia32_gather3siv2di ((__v2di)(__m128i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v4si)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm256_mmask_i64gather_epi32(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m128i) __builtin_ia32_gather3div8si ((__v4si)(__m128i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v4di)(__m256i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm_mmask_i64gather_epi32(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m128i) __builtin_ia32_gather3div4si ((__v4si)(__m128i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v2di)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm256_mmask_i64gather_epi64(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m256i) __builtin_ia32_gather3div4di ((__v4di)(__m256i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v4di)(__m256i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm_mmask_i64gather_epi64(V1OLD, MASK, INDEX, ADDR, SCALE)	\
## (__m128i) __builtin_ia32_gather3div2di ((__v2di)(__m128i) (V1OLD),	\
## (void const *) (ADDR),	\
## (__v2di)(__m128i) (INDEX),	\
## (__mmask8) (MASK),		\
## (int) (SCALE))

## [Macro Original]
## #define _mm256_i32scatter_ps(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv8sf ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v8si)(__m256i) (INDEX),		\
## (__v8sf)(__m256) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_i32scatter_ps(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scattersiv8sf ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v8si)(__m256i) (INDEX),		\
## (__v8sf)(__m256) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_i32scatter_ps(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv4sf ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4si)(__m128i) (INDEX),		\
## (__v4sf)(__m128) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_mask_i32scatter_ps(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scattersiv4sf ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4si)(__m128i) (INDEX),		\
## (__v4sf)(__m128) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_i32scatter_pd(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv4df ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4si)(__m128i) (INDEX),		\
## (__v4df)(__m256d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_i32scatter_pd(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scattersiv4df ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4si)(__m128i) (INDEX),		\
## (__v4df)(__m256d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_i32scatter_pd(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv2df ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4si)(__m128i) (INDEX),		\
## (__v2df)(__m128d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_mask_i32scatter_pd(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scattersiv2df ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4si)(__m128i) (INDEX),		\
## (__v2df)(__m128d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_i64scatter_ps(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv8sf ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4di)(__m256i) (INDEX),		\
## (__v4sf)(__m128) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_i64scatter_ps(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scatterdiv8sf ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4di)(__m256i) (INDEX),		\
## (__v4sf)(__m128) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_i64scatter_ps(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv4sf ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v2di)(__m128i) (INDEX),		\
## (__v4sf)(__m128) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_mask_i64scatter_ps(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scatterdiv4sf ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v2di)(__m128i) (INDEX),		\
## (__v4sf)(__m128) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_i64scatter_pd(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv4df ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4di)(__m256i) (INDEX),		\
## (__v4df)(__m256d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_i64scatter_pd(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scatterdiv4df ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4di)(__m256i) (INDEX),		\
## (__v4df)(__m256d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_i64scatter_pd(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv2df ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v2di)(__m128i) (INDEX),		\
## (__v2df)(__m128d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_mask_i64scatter_pd(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scatterdiv2df ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v2di)(__m128i) (INDEX),		\
## (__v2df)(__m128d) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_i32scatter_epi32(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv8si ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v8si)(__m256i) (INDEX),		\
## (__v8si)(__m256i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_i32scatter_epi32(ADDR, MASK, INDEX, V1, SCALE)	\
## __builtin_ia32_scattersiv8si ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v8si)(__m256i) (INDEX),		\
## (__v8si)(__m256i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_i32scatter_epi32(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv4si ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4si)(__m128i) (INDEX),		\
## (__v4si)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_mask_i32scatter_epi32(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scattersiv4si ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4si)(__m128i) (INDEX),		\
## (__v4si)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_i32scatter_epi64(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv4di ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4si)(__m128i) (INDEX),		\
## (__v4di)(__m256i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_i32scatter_epi64(ADDR, MASK, INDEX, V1, SCALE)	\
## __builtin_ia32_scattersiv4di ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4si)(__m128i) (INDEX),		\
## (__v4di)(__m256i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_i32scatter_epi64(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scattersiv2di ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4si)(__m128i) (INDEX),		\
## (__v2di)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_mask_i32scatter_epi64(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scattersiv2di ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4si)(__m128i) (INDEX),		\
## (__v2di)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_i64scatter_epi32(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv8si ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4di)(__m256i) (INDEX),		\
## (__v4si)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_i64scatter_epi32(ADDR, MASK, INDEX, V1, SCALE)	\
## __builtin_ia32_scatterdiv8si ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4di)(__m256i) (INDEX),		\
## (__v4si)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_i64scatter_epi32(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv4si ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v2di)(__m128i) (INDEX),		\
## (__v4si)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_mask_i64scatter_epi32(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scatterdiv4si ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v2di)(__m128i) (INDEX),		\
## (__v4si)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_i64scatter_epi64(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv4di ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v4di)(__m256i) (INDEX),		\
## (__v4di)(__m256i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_i64scatter_epi64(ADDR, MASK, INDEX, V1, SCALE)	\
## __builtin_ia32_scatterdiv4di ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v4di)(__m256i) (INDEX),		\
## (__v4di)(__m256i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_i64scatter_epi64(ADDR, INDEX, V1, SCALE)			\
## __builtin_ia32_scatterdiv2di ((void *) (ADDR), (__mmask8)0xFF,	\
## (__v2di)(__m128i) (INDEX),		\
## (__v2di)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm_mask_i64scatter_epi64(ADDR, MASK, INDEX, V1, SCALE)		\
## __builtin_ia32_scatterdiv2di ((void *) (ADDR), (__mmask8) (MASK),	\
## (__v2di)(__m128i) (INDEX),		\
## (__v2di)(__m128i) (V1), (int) (SCALE))

## [Macro Original]
## #define _mm256_mask_shuffle_epi32(W, U, X, C)                                       \
## ((__m256i)  __builtin_ia32_pshufd256_mask ((__v8si)(__m256i)(X), (int)(C),        \
## (__v8si)(__m256i)(W),                  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_shuffle_epi32(U, X, C)                                         \
## ((__m256i)  __builtin_ia32_pshufd256_mask ((__v8si)(__m256i)(X), (int)(C),        \
## (__v8si)(__m256i)			    \
## _mm256_avx512_setzero_si256 (),		    \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_shuffle_epi32(W, U, X, C)                                          \
## ((__m128i)  __builtin_ia32_pshufd128_mask ((__v4si)(__m128i)(X), (int)(C),        \
## (__v4si)(__m128i)(W),                  \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_shuffle_epi32(U, X, C)                                            \
## ((__m128i)  __builtin_ia32_pshufd128_mask ((__v4si)(__m128i)(X), (int)(C),        \
## (__v4si)(__m128i)_mm_avx512_setzero_si128 (), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_rol_epi64(A, B)                                                 \
## ((__m256i)__builtin_ia32_prolq256_mask ((__v4di)(__m256i)(A), (int)(B),      \
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_rol_epi64(W, U, A, B)                                      \
## ((__m256i)__builtin_ia32_prolq256_mask ((__v4di)(__m256i)(A), (int)(B),      \
## (__v4di)(__m256i)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_rol_epi64(U, A, B)                                        \
## ((__m256i)__builtin_ia32_prolq256_mask ((__v4di)(__m256i)(A), (int)(B),      \
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_rol_epi64(A, B)                                                    \
## ((__m128i)__builtin_ia32_prolq128_mask ((__v2di)(__m128i)(A), (int)(B),      \
## (__v2di)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_rol_epi64(W, U, A, B)                                         \
## ((__m128i)__builtin_ia32_prolq128_mask ((__v2di)(__m128i)(A), (int)(B),      \
## (__v2di)(__m128i)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_rol_epi64(U, A, B)                                           \
## ((__m128i)__builtin_ia32_prolq128_mask ((__v2di)(__m128i)(A), (int)(B),      \
## (__v2di)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_ror_epi64(A, B)                                                 \
## ((__m256i)__builtin_ia32_prorq256_mask ((__v4di)(__m256i)(A), (int)(B),      \
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_ror_epi64(W, U, A, B)                                      \
## ((__m256i)__builtin_ia32_prorq256_mask ((__v4di)(__m256i)(A), (int)(B),      \
## (__v4di)(__m256i)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_ror_epi64(U, A, B)                                        \
## ((__m256i)__builtin_ia32_prorq256_mask ((__v4di)(__m256i)(A), (int)(B),      \
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_ror_epi64(A, B)                                                    \
## ((__m128i)__builtin_ia32_prorq128_mask ((__v2di)(__m128i)(A), (int)(B),      \
## (__v2di)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_ror_epi64(W, U, A, B)                                         \
## ((__m128i)__builtin_ia32_prorq128_mask ((__v2di)(__m128i)(A), (int)(B),      \
## (__v2di)(__m128i)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_ror_epi64(U, A, B)                                           \
## ((__m128i)__builtin_ia32_prorq128_mask ((__v2di)(__m128i)(A), (int)(B),      \
## (__v2di)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_rol_epi32(A, B)                                                 \
## ((__m256i)__builtin_ia32_prold256_mask ((__v8si)(__m256i)(A), (int)(B),      \
## (__v8si)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_rol_epi32(W, U, A, B)                                      \
## ((__m256i)__builtin_ia32_prold256_mask ((__v8si)(__m256i)(A), (int)(B),      \
## (__v8si)(__m256i)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_rol_epi32(U, A, B)                                        \
## ((__m256i)__builtin_ia32_prold256_mask ((__v8si)(__m256i)(A), (int)(B),      \
## (__v8si)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_rol_epi32(A, B)                                                    \
## ((__m128i)__builtin_ia32_prold128_mask ((__v4si)(__m128i)(A), (int)(B),      \
## (__v4si)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_rol_epi32(W, U, A, B)                                         \
## ((__m128i)__builtin_ia32_prold128_mask ((__v4si)(__m128i)(A), (int)(B),      \
## (__v4si)(__m128i)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_rol_epi32(U, A, B)                                           \
## ((__m128i)__builtin_ia32_prold128_mask ((__v4si)(__m128i)(A), (int)(B),      \
## (__v4si)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_ror_epi32(A, B)                                                 \
## ((__m256i)__builtin_ia32_prord256_mask ((__v8si)(__m256i)(A), (int)(B),      \
## (__v8si)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_ror_epi32(W, U, A, B)                                      \
## ((__m256i)__builtin_ia32_prord256_mask ((__v8si)(__m256i)(A), (int)(B),      \
## (__v8si)(__m256i)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_ror_epi32(U, A, B)                                        \
## ((__m256i)__builtin_ia32_prord256_mask ((__v8si)(__m256i)(A), (int)(B),      \
## (__v8si)(__m256i)		       \
## _mm256_avx512_setzero_si256 (),	       \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_ror_epi32(A, B)                                                    \
## ((__m128i)__builtin_ia32_prord128_mask ((__v4si)(__m128i)(A), (int)(B),      \
## (__v4si)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_ror_epi32(W, U, A, B)                                         \
## ((__m128i)__builtin_ia32_prord128_mask ((__v4si)(__m128i)(A), (int)(B),      \
## (__v4si)(__m128i)(W),                \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_ror_epi32(U, A, B)                                           \
## ((__m128i)__builtin_ia32_prord128_mask ((__v4si)(__m128i)(A), (int)(B),      \
## (__v4si)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_alignr_epi32(X, Y, C)                                        \
## ((__m256i)__builtin_ia32_alignd256_mask ((__v8si)(__m256i)(X),          \
## (__v8si)(__m256i)(Y), (int)(C), (__v8si)(__m256i)(X), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_alignr_epi32(W, U, X, Y, C)                             \
## ((__m256i)__builtin_ia32_alignd256_mask ((__v8si)(__m256i)(X),          \
## (__v8si)(__m256i)(Y), (int)(C), (__v8si)(__m256i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_alignr_epi32(U, X, Y, C)                               \
## ((__m256i)__builtin_ia32_alignd256_mask ((__v8si)(__m256i)(X),          \
## (__v8si)(__m256i)(Y), (int)(C), (__v8si)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_alignr_epi64(X, Y, C)                                        \
## ((__m256i)__builtin_ia32_alignq256_mask ((__v4di)(__m256i)(X),          \
## (__v4di)(__m256i)(Y), (int)(C), (__v4di)(__m256i)(X), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_alignr_epi64(W, U, X, Y, C)                             \
## ((__m256i)__builtin_ia32_alignq256_mask ((__v4di)(__m256i)(X),          \
## (__v4di)(__m256i)(Y), (int)(C), (__v4di)(__m256i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_alignr_epi64(U, X, Y, C)                               \
## ((__m256i)__builtin_ia32_alignq256_mask ((__v4di)(__m256i)(X),          \
## (__v4di)(__m256i)(Y), (int)(C), (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_alignr_epi32(X, Y, C)                                           \
## ((__m128i)__builtin_ia32_alignd128_mask ((__v4si)(__m128i)(X),          \
## (__v4si)(__m128i)(Y), (int)(C), (__v4si)(__m128i)(X), (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_alignr_epi32(W, U, X, Y, C)                                \
## ((__m128i)__builtin_ia32_alignd128_mask ((__v4si)(__m128i)(X),          \
## (__v4si)(__m128i)(Y), (int)(C), (__v4si)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_alignr_epi32(U, X, Y, C)                                  \
## ((__m128i)__builtin_ia32_alignd128_mask ((__v4si)(__m128i)(X),          \
## (__v4si)(__m128i)(Y), (int)(C), (__v4si)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_alignr_epi64(X, Y, C)                                           \
## ((__m128i)__builtin_ia32_alignq128_mask ((__v2di)(__m128i)(X),          \
## (__v2di)(__m128i)(Y), (int)(C), (__v2di)(__m128i)(X), (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_alignr_epi64(W, U, X, Y, C)                                \
## ((__m128i)__builtin_ia32_alignq128_mask ((__v2di)(__m128i)(X),          \
## (__v2di)(__m128i)(Y), (int)(C), (__v2di)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_alignr_epi64(U, X, Y, C)                                  \
## ((__m128i)__builtin_ia32_alignq128_mask ((__v2di)(__m128i)(X),          \
## (__v2di)(__m128i)(Y), (int)(C), (__v2di)(__m128i)_mm_avx512_setzero_si128 (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_cvtps_ph(W, U, A, I)						\
## ((__m128i) __builtin_ia32_vcvtps2ph_mask ((__v4sf)(__m128) (A), (int) (I),	\
## (__v8hi)(__m128i) (W), (__mmask8) (U)))

## [Macro Original]
## #define _mm_maskz_cvtps_ph(U, A, I)						\
## ((__m128i) __builtin_ia32_vcvtps2ph_mask ((__v4sf)(__m128) (A), (int) (I),	\
## (__v8hi)(__m128i) _mm_avx512_setzero_si128 (), (__mmask8) (U)))

## [Macro Original]
## #define _mm256_mask_cvtps_ph(W, U, A, I)					\
## ((__m128i) __builtin_ia32_vcvtps2ph256_mask ((__v8sf)(__m256) (A), (int) (I),	\
## (__v8hi)(__m128i) (W), (__mmask8) (U)))

## [Macro Original]
## #define _mm256_maskz_cvtps_ph(U, A, I)						\
## ((__m128i) __builtin_ia32_vcvtps2ph256_mask ((__v8sf)(__m256) (A), (int) (I),	\
## (__v8hi)(__m128i) _mm_avx512_setzero_si128 (), (__mmask8) (U)))

## [Macro Original]
## #define _mm256_mask_srai_epi32(W, U, A, B)				\
## ((__m256i) __builtin_ia32_psradi256_mask ((__v8si)(__m256i)(A),	\
## (unsigned int)(B), (__v8si)(__m256i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_srai_epi32(U, A, B)				\
## ((__m256i) __builtin_ia32_psradi256_mask ((__v8si)(__m256i)(A),	\
## (unsigned int)(B), (__v8si)_mm256_avx512_setzero_si256 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_srai_epi32(W, U, A, B)                                 \
## ((__m128i) __builtin_ia32_psradi128_mask ((__v4si)(__m128i)(A),       \
## (unsigned int)(B), (__v4si)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_srai_epi32(U, A, B)                                   \
## ((__m128i) __builtin_ia32_psradi128_mask ((__v4si)(__m128i)(A),       \
## (unsigned int)(B), (__v4si)_mm_avx512_setzero_si128 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_srai_epi64(A, B)						\
## ((__m256i) __builtin_ia32_psraqi256_mask ((__v4di)(__m256i)(A),	\
## (unsigned int)(B), (__v4di)_mm256_avx512_setzero_si256 (), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_srai_epi64(W, U, A, B)				\
## ((__m256i) __builtin_ia32_psraqi256_mask ((__v4di)(__m256i)(A),	\
## (unsigned int)(B), (__v4di)(__m256i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_srai_epi64(U, A, B)				\
## ((__m256i) __builtin_ia32_psraqi256_mask ((__v4di)(__m256i)(A),	\
## (unsigned int)(B), (__v4di)_mm256_avx512_setzero_si256 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm_srai_epi64(A, B)						\
## ((__m128i) __builtin_ia32_psraqi128_mask ((__v2di)(__m128i)(A),       \
## (unsigned int)(B), (__v2di)_mm_avx512_setzero_si128 (), (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_srai_epi64(W, U, A, B)                                 \
## ((__m128i) __builtin_ia32_psraqi128_mask ((__v2di)(__m128i)(A),       \
## (unsigned int)(B), (__v2di)(__m128i)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_srai_epi64(U, A, B)                                   \
## ((__m128i) __builtin_ia32_psraqi128_mask ((__v2di)(__m128i)(A),       \
## (unsigned int)(B), (__v2di)_mm_avx512_setzero_si128 (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_permutex_pd(W, U, A, B)                             \
## ((__m256d) __builtin_ia32_permdf256_mask ((__v4df)(__m256d)(A),       \
## (int)(B), (__v4df)(__m256d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_permutex_pd(U, A, B)				\
## ((__m256d) __builtin_ia32_permdf256_mask ((__v4df)(__m256d)(A),       \
## (int)(B), (__v4df)(__m256d)_mm256_avx512_setzero_pd (), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_permute_pd(W, U, X, C)					    \
## ((__m256d) __builtin_ia32_vpermilpd256_mask ((__v4df)(__m256d)(X), (int)(C),	    \
## (__v4df)(__m256d)(W),		    \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_permute_pd(U, X, C)					    \
## ((__m256d) __builtin_ia32_vpermilpd256_mask ((__v4df)(__m256d)(X), (int)(C),	    \
## (__v4df)(__m256d)_mm256_avx512_setzero_pd (),\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_permute_ps(W, U, X, C)					    \
## ((__m256) __builtin_ia32_vpermilps256_mask ((__v8sf)(__m256)(X), (int)(C),	    \
## (__v8sf)(__m256)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_permute_ps(U, X, C)					    \
## ((__m256) __builtin_ia32_vpermilps256_mask ((__v8sf)(__m256)(X), (int)(C),	    \
## (__v8sf)(__m256)_mm256_avx512_setzero_ps (), \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_permute_pd(W, U, X, C)						    \
## ((__m128d) __builtin_ia32_vpermilpd_mask ((__v2df)(__m128d)(X), (int)(C),	    \
## (__v2df)(__m128d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_permute_pd(U, X, C)						    \
## ((__m128d) __builtin_ia32_vpermilpd_mask ((__v2df)(__m128d)(X), (int)(C),	    \
## (__v2df)(__m128d)_mm_avx512_setzero_pd (),	    \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_permute_ps(W, U, X, C)						    \
## ((__m128) __builtin_ia32_vpermilps_mask ((__v4sf)(__m128)(X), (int)(C),	    \
## (__v4sf)(__m128)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_permute_ps(U, X, C)						    \
## ((__m128) __builtin_ia32_vpermilps_mask ((__v4sf)(__m128)(X), (int)(C),	    \
## (__v4sf)(__m128)_mm_avx512_setzero_ps (),	    \
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_cmp_epu32_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_ucmpd256_mask ((__v8si)(__m256i)(X),	\
## (__v8si)(__m256i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_cmp_epi64_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpq256_mask ((__v4di)(__m256i)(X),	\
## (__v4di)(__m256i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_cmp_epi32_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpd256_mask ((__v8si)(__m256i)(X),	\
## (__v8si)(__m256i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_cmp_epu64_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_ucmpq256_mask ((__v4di)(__m256i)(X),	\
## (__v4di)(__m256i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_cmp_pd_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmppd256_mask ((__v4df)(__m256d)(X),	\
## (__v4df)(__m256d)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_cmp_ps_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpps256_mask ((__v8sf)(__m256)(X),	\
## (__v8sf)(__m256)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_cmp_epi64_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpq256_mask ((__v4di)(__m256i)(X),	\
## (__v4di)(__m256i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_epi32_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpd256_mask ((__v8si)(__m256i)(X),	\
## (__v8si)(__m256i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_epu64_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_ucmpq256_mask ((__v4di)(__m256i)(X),	\
## (__v4di)(__m256i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_epu32_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_ucmpd256_mask ((__v8si)(__m256i)(X),	\
## (__v8si)(__m256i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_pd_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmppd256_mask ((__v4df)(__m256d)(X),	\
## (__v4df)(__m256d)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm256_mask_cmp_ps_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpps256_mask ((__v8sf)(__m256)(X),	\
## (__v8sf)(__m256)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm_cmp_epi64_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpq128_mask ((__v2di)(__m128i)(X),	\
## (__v2di)(__m128i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_cmp_epi32_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpd128_mask ((__v4si)(__m128i)(X),	\
## (__v4si)(__m128i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_cmp_epu64_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_ucmpq128_mask ((__v2di)(__m128i)(X),	\
## (__v2di)(__m128i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_cmp_epu32_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_ucmpd128_mask ((__v4si)(__m128i)(X),	\
## (__v4si)(__m128i)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_cmp_pd_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmppd128_mask ((__v2df)(__m128d)(X),	\
## (__v2df)(__m128d)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_cmp_ps_mask(X, Y, P)					\
## ((__mmask8) __builtin_ia32_cmpps128_mask ((__v4sf)(__m128)(X),	\
## (__v4sf)(__m128)(Y), (int)(P),\
## (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_cmp_epi64_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpq128_mask ((__v2di)(__m128i)(X),	\
## (__v2di)(__m128i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm_mask_cmp_epi32_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpd128_mask ((__v4si)(__m128i)(X),	\
## (__v4si)(__m128i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm_mask_cmp_epu64_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_ucmpq128_mask ((__v2di)(__m128i)(X),	\
## (__v2di)(__m128i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm_mask_cmp_epu32_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_ucmpd128_mask ((__v4si)(__m128i)(X),	\
## (__v4si)(__m128i)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm_mask_cmp_pd_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmppd128_mask ((__v2df)(__m128d)(X),	\
## (__v2df)(__m128d)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm_mask_cmp_ps_mask(M, X, Y, P)				\
## ((__mmask8) __builtin_ia32_cmpps128_mask ((__v4sf)(__m128)(X),	\
## (__v4sf)(__m128)(Y), (int)(P),\
## (__mmask8)(M)))

## [Macro Original]
## #define _mm256_permutexvar_ps(A, B)	_mm256_permutevar8x32_ps ((B), (A))

## [Macro Original]
## #define _mm256_mask_cvt_roundps_ph(A, B, C, D)	\
## _mm256_mask_cvtps_ph ((A), (B), (C), (D))

## [Macro Original]
## #define _mm256_maskz_cvt_roundps_ph(A, B, C)	\
## _mm256_maskz_cvtps_ph ((A), (B), (C))

## [Macro Original]
## #define _mm_mask_cvt_roundps_ph(A, B, C, D)	\
## _mm_mask_cvtps_ph ((A), (B), (C), (D))

## [Macro Original]
## #define _mm_maskz_cvt_roundps_ph(A, B, C) _mm_maskz_cvtps_ph ((A), (B), (C))

## [Macro Original]
## #define __DISABLE_AVX512VLCD__

func mm_broadcastmb_epi64*(a: MMask8): M128i {.importc: "_mm_broadcastmb_epi64".}

func mm256_broadcastmb_epi64*(a: MMask8): M256i {.importc: "_mm256_broadcastmb_epi64".}

func mm_broadcastmw_epi32*(a: MMask16): M128i {.importc: "_mm_broadcastmw_epi32".}

func mm256_broadcastmw_epi32*(a: MMask16): M256i {.importc: "_mm256_broadcastmw_epi32".}

func mm256_lzcnt_epi32*(a: M256i): M256i {.importc: "_mm256_lzcnt_epi32".}

func mm256_mask_lzcnt_epi32*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_lzcnt_epi32".}

func mm256_maskz_lzcnt_epi32*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_lzcnt_epi32".}

func mm256_lzcnt_epi64*(a: M256i): M256i {.importc: "_mm256_lzcnt_epi64".}

func mm256_mask_lzcnt_epi64*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_lzcnt_epi64".}

func mm256_maskz_lzcnt_epi64*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_lzcnt_epi64".}

func mm256_conflict_epi64*(a: M256i): M256i {.importc: "_mm256_conflict_epi64".}

func mm256_mask_conflict_epi64*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_conflict_epi64".}

func mm256_maskz_conflict_epi64*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_conflict_epi64".}

func mm256_conflict_epi32*(a: M256i): M256i {.importc: "_mm256_conflict_epi32".}

func mm256_mask_conflict_epi32*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_conflict_epi32".}

func mm256_maskz_conflict_epi32*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_conflict_epi32".}

func mm_lzcnt_epi32*(a: M128i): M128i {.importc: "_mm_lzcnt_epi32".}

func mm_mask_lzcnt_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_lzcnt_epi32".}

func mm_maskz_lzcnt_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_lzcnt_epi32".}

func mm_lzcnt_epi64*(a: M128i): M128i {.importc: "_mm_lzcnt_epi64".}

func mm_mask_lzcnt_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_lzcnt_epi64".}

func mm_maskz_lzcnt_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_lzcnt_epi64".}

func mm_conflict_epi64*(a: M128i): M128i {.importc: "_mm_conflict_epi64".}

func mm_mask_conflict_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_conflict_epi64".}

func mm_maskz_conflict_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_conflict_epi64".}

func mm_conflict_epi32*(a: M128i): M128i {.importc: "_mm_conflict_epi32".}

func mm_mask_conflict_epi32*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_conflict_epi32".}

func mm_maskz_conflict_epi32*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_conflict_epi32".}
