import avx512f

## [Macro Original]
## #define _AVX512VLDQINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VLDQ__

func mm256_cvttpd_epi64*(a: M256d): M256i {.importc: "_mm256_cvttpd_epi64".}

func mm256_mask_cvttpd_epi64*(w: M256i, u: MMask8, a: M256d): M256i {.importc: "_mm256_mask_cvttpd_epi64".}

func mm256_maskz_cvttpd_epi64*(u: MMask8, a: M256d): M256i {.importc: "_mm256_maskz_cvttpd_epi64".}

func mm_cvttpd_epi64*(a: M128d): M128i {.importc: "_mm_cvttpd_epi64".}

func mm_mask_cvttpd_epi64*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvttpd_epi64".}

func mm_maskz_cvttpd_epi64*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvttpd_epi64".}

func mm256_cvttpd_epu64*(a: M256d): M256i {.importc: "_mm256_cvttpd_epu64".}

func mm256_mask_cvttpd_epu64*(w: M256i, u: MMask8, a: M256d): M256i {.importc: "_mm256_mask_cvttpd_epu64".}

func mm256_maskz_cvttpd_epu64*(u: MMask8, a: M256d): M256i {.importc: "_mm256_maskz_cvttpd_epu64".}

func mm_cvttpd_epu64*(a: M128d): M128i {.importc: "_mm_cvttpd_epu64".}

func mm_mask_cvttpd_epu64*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvttpd_epu64".}

func mm_maskz_cvttpd_epu64*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvttpd_epu64".}

func mm256_cvtpd_epi64*(a: M256d): M256i {.importc: "_mm256_cvtpd_epi64".}

func mm256_mask_cvtpd_epi64*(w: M256i, u: MMask8, a: M256d): M256i {.importc: "_mm256_mask_cvtpd_epi64".}

func mm256_maskz_cvtpd_epi64*(u: MMask8, a: M256d): M256i {.importc: "_mm256_maskz_cvtpd_epi64".}

func mm_cvtpd_epi64*(a: M128d): M128i {.importc: "_mm_cvtpd_epi64".}

func mm_mask_cvtpd_epi64*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvtpd_epi64".}

func mm_maskz_cvtpd_epi64*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvtpd_epi64".}

func mm256_cvtpd_epu64*(a: M256d): M256i {.importc: "_mm256_cvtpd_epu64".}

func mm256_mask_cvtpd_epu64*(w: M256i, u: MMask8, a: M256d): M256i {.importc: "_mm256_mask_cvtpd_epu64".}

func mm256_maskz_cvtpd_epu64*(u: MMask8, a: M256d): M256i {.importc: "_mm256_maskz_cvtpd_epu64".}

func mm_cvtpd_epu64*(a: M128d): M128i {.importc: "_mm_cvtpd_epu64".}

func mm_mask_cvtpd_epu64*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvtpd_epu64".}

func mm_maskz_cvtpd_epu64*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvtpd_epu64".}

func mm256_cvttps_epi64*(a: M128): M256i {.importc: "_mm256_cvttps_epi64".}

func mm256_mask_cvttps_epi64*(w: M256i, u: MMask8, a: M128): M256i {.importc: "_mm256_mask_cvttps_epi64".}

func mm256_maskz_cvttps_epi64*(u: MMask8, a: M128): M256i {.importc: "_mm256_maskz_cvttps_epi64".}

func mm_cvttps_epi64*(a: M128): M128i {.importc: "_mm_cvttps_epi64".}

func mm_mask_cvttps_epi64*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvttps_epi64".}

func mm_maskz_cvttps_epi64*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvttps_epi64".}

func mm256_cvttps_epu64*(a: M128): M256i {.importc: "_mm256_cvttps_epu64".}

func mm256_mask_cvttps_epu64*(w: M256i, u: MMask8, a: M128): M256i {.importc: "_mm256_mask_cvttps_epu64".}

func mm256_maskz_cvttps_epu64*(u: MMask8, a: M128): M256i {.importc: "_mm256_maskz_cvttps_epu64".}

func mm_cvttps_epu64*(a: M128): M128i {.importc: "_mm_cvttps_epu64".}

func mm_mask_cvttps_epu64*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvttps_epu64".}

func mm_maskz_cvttps_epu64*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvttps_epu64".}

func mm256_broadcast_f64x2*(a: M128d): M256d {.importc: "_mm256_broadcast_f64x2".}

func mm256_mask_broadcast_f64x2*(o: M256d, m: MMask8, a: M128d): M256d {.importc: "_mm256_mask_broadcast_f64x2".}

func mm256_maskz_broadcast_f64x2*(m: MMask8, a: M128d): M256d {.importc: "_mm256_maskz_broadcast_f64x2".}

func mm256_broadcast_i64x2*(a: M128i): M256i {.importc: "_mm256_broadcast_i64x2".}

func mm256_mask_broadcast_i64x2*(o: M256i, m: MMask8, a: M128i): M256i {.importc: "_mm256_mask_broadcast_i64x2".}

func mm256_maskz_broadcast_i64x2*(m: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_broadcast_i64x2".}

func mm256_broadcast_f32x2*(a: M128): M256 {.importc: "_mm256_broadcast_f32x2".}

func mm256_mask_broadcast_f32x2*(o: M256, m: MMask8, a: M128): M256 {.importc: "_mm256_mask_broadcast_f32x2".}

func mm256_maskz_broadcast_f32x2*(m: MMask8, a: M128): M256 {.importc: "_mm256_maskz_broadcast_f32x2".}

func mm256_broadcast_i32x2*(a: M128i): M256i {.importc: "_mm256_broadcast_i32x2".}

func mm256_mask_broadcast_i32x2*(o: M256i, m: MMask8, a: M128i): M256i {.importc: "_mm256_mask_broadcast_i32x2".}

func mm256_maskz_broadcast_i32x2*(m: MMask8, a: M128i): M256i {.importc: "_mm256_maskz_broadcast_i32x2".}

func mm_broadcast_i32x2*(a: M128i): M128i {.importc: "_mm_broadcast_i32x2".}

func mm_mask_broadcast_i32x2*(o: M128i, m: MMask8, a: M128i): M128i {.importc: "_mm_mask_broadcast_i32x2".}

func mm_maskz_broadcast_i32x2*(m: MMask8, a: M128i): M128i {.importc: "_mm_maskz_broadcast_i32x2".}

func mm256_mullo_epi64*(a: M256i, b: M256i): M256i {.importc: "_mm256_mullo_epi64".}

func mm256_mask_mullo_epi64*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_mullo_epi64".}

func mm256_maskz_mullo_epi64*(u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_mullo_epi64".}

func mm_mullo_epi64*(a: M128i, b: M128i): M128i {.importc: "_mm_mullo_epi64".}

func mm_mask_mullo_epi64*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_mullo_epi64".}

func mm_maskz_mullo_epi64*(u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_mullo_epi64".}

func mm256_mask_andnot_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_andnot_pd".}

func mm256_maskz_andnot_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_andnot_pd".}

func mm_mask_andnot_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_andnot_pd".}

func mm_maskz_andnot_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_andnot_pd".}

func mm256_mask_andnot_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_andnot_ps".}

func mm256_maskz_andnot_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_andnot_ps".}

func mm_mask_andnot_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_andnot_ps".}

func mm_maskz_andnot_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_andnot_ps".}

func mm256_cvtps_epi64*(a: M128): M256i {.importc: "_mm256_cvtps_epi64".}

func mm256_mask_cvtps_epi64*(w: M256i, u: MMask8, a: M128): M256i {.importc: "_mm256_mask_cvtps_epi64".}

func mm256_maskz_cvtps_epi64*(u: MMask8, a: M128): M256i {.importc: "_mm256_maskz_cvtps_epi64".}

func mm_cvtps_epi64*(a: M128): M128i {.importc: "_mm_cvtps_epi64".}

func mm_mask_cvtps_epi64*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvtps_epi64".}

func mm_maskz_cvtps_epi64*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvtps_epi64".}

func mm256_cvtps_epu64*(a: M128): M256i {.importc: "_mm256_cvtps_epu64".}

func mm256_mask_cvtps_epu64*(w: M256i, u: MMask8, a: M128): M256i {.importc: "_mm256_mask_cvtps_epu64".}

func mm256_maskz_cvtps_epu64*(u: MMask8, a: M128): M256i {.importc: "_mm256_maskz_cvtps_epu64".}

func mm_cvtps_epu64*(a: M128): M128i {.importc: "_mm_cvtps_epu64".}

func mm_mask_cvtps_epu64*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvtps_epu64".}

func mm_maskz_cvtps_epu64*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvtps_epu64".}

func mm256_cvtepi64_ps*(a: M256i): M128 {.importc: "_mm256_cvtepi64_ps".}

func mm256_mask_cvtepi64_ps*(w: M128, u: MMask8, a: M256i): M128 {.importc: "_mm256_mask_cvtepi64_ps".}

func mm256_maskz_cvtepi64_ps*(u: MMask8, a: M256i): M128 {.importc: "_mm256_maskz_cvtepi64_ps".}

func mm_cvtepi64_ps*(a: M128i): M128 {.importc: "_mm_cvtepi64_ps".}

func mm_mask_cvtepi64_ps*(w: M128, u: MMask8, a: M128i): M128 {.importc: "_mm_mask_cvtepi64_ps".}

func mm_maskz_cvtepi64_ps*(u: MMask8, a: M128i): M128 {.importc: "_mm_maskz_cvtepi64_ps".}

func mm256_cvtepu64_ps*(a: M256i): M128 {.importc: "_mm256_cvtepu64_ps".}

func mm256_mask_cvtepu64_ps*(w: M128, u: MMask8, a: M256i): M128 {.importc: "_mm256_mask_cvtepu64_ps".}

func mm256_maskz_cvtepu64_ps*(u: MMask8, a: M256i): M128 {.importc: "_mm256_maskz_cvtepu64_ps".}

func mm_cvtepu64_ps*(a: M128i): M128 {.importc: "_mm_cvtepu64_ps".}

func mm_mask_cvtepu64_ps*(w: M128, u: MMask8, a: M128i): M128 {.importc: "_mm_mask_cvtepu64_ps".}

func mm_maskz_cvtepu64_ps*(u: MMask8, a: M128i): M128 {.importc: "_mm_maskz_cvtepu64_ps".}

func mm256_cvtepi64_pd*(a: M256i): M256d {.importc: "_mm256_cvtepi64_pd".}

func mm256_mask_cvtepi64_pd*(w: M256d, u: MMask8, a: M256i): M256d {.importc: "_mm256_mask_cvtepi64_pd".}

func mm256_maskz_cvtepi64_pd*(u: MMask8, a: M256i): M256d {.importc: "_mm256_maskz_cvtepi64_pd".}

func mm_cvtepi64_pd*(a: M128i): M128d {.importc: "_mm_cvtepi64_pd".}

func mm_mask_cvtepi64_pd*(w: M128d, u: MMask8, a: M128i): M128d {.importc: "_mm_mask_cvtepi64_pd".}

func mm_maskz_cvtepi64_pd*(u: MMask8, a: M128i): M128d {.importc: "_mm_maskz_cvtepi64_pd".}

func mm256_cvtepu64_pd*(a: M256i): M256d {.importc: "_mm256_cvtepu64_pd".}

func mm256_mask_cvtepu64_pd*(w: M256d, u: MMask8, a: M256i): M256d {.importc: "_mm256_mask_cvtepu64_pd".}

func mm256_maskz_cvtepu64_pd*(u: MMask8, a: M256i): M256d {.importc: "_mm256_maskz_cvtepu64_pd".}

func mm256_mask_and_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_and_pd".}

func mm256_maskz_and_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_and_pd".}

func mm_mask_and_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_and_pd".}

func mm_maskz_and_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_and_pd".}

func mm256_mask_and_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_and_ps".}

func mm256_maskz_and_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_and_ps".}

func mm_mask_and_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_and_ps".}

func mm_maskz_and_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_and_ps".}

func mm_cvtepu64_pd*(a: M128i): M128d {.importc: "_mm_cvtepu64_pd".}

func mm_mask_cvtepu64_pd*(w: M128d, u: MMask8, a: M128i): M128d {.importc: "_mm_mask_cvtepu64_pd".}

func mm_maskz_cvtepu64_pd*(u: MMask8, a: M128i): M128d {.importc: "_mm_maskz_cvtepu64_pd".}

func mm256_mask_xor_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_xor_pd".}

func mm256_maskz_xor_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_xor_pd".}

func mm_mask_xor_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_xor_pd".}

func mm_maskz_xor_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_xor_pd".}

func mm256_mask_xor_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_xor_ps".}

func mm256_maskz_xor_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_xor_ps".}

func mm_mask_xor_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_xor_ps".}

func mm_maskz_xor_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_xor_ps".}

func mm256_mask_or_pd*(w: M256d, u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_mask_or_pd".}

func mm256_maskz_or_pd*(u: MMask8, a: M256d, b: M256d): M256d {.importc: "_mm256_maskz_or_pd".}

func mm_mask_or_pd*(w: M128d, u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_mask_or_pd".}

func mm_maskz_or_pd*(u: MMask8, a: M128d, b: M128d): M128d {.importc: "_mm_maskz_or_pd".}

func mm256_mask_or_ps*(w: M256, u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_mask_or_ps".}

func mm256_maskz_or_ps*(u: MMask8, a: M256, b: M256): M256 {.importc: "_mm256_maskz_or_ps".}

func mm_mask_or_ps*(w: M128, u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_mask_or_ps".}

func mm_maskz_or_ps*(u: MMask8, a: M128, b: M128): M128 {.importc: "_mm_maskz_or_ps".}

func mm_movm_epi32*(a: MMask8): M128i {.importc: "_mm_movm_epi32".}

func mm256_movm_epi32*(a: MMask8): M256i {.importc: "_mm256_movm_epi32".}

func mm_movm_epi64*(a: MMask8): M128i {.importc: "_mm_movm_epi64".}

func mm256_movm_epi64*(a: MMask8): M256i {.importc: "_mm256_movm_epi64".}

func mm_movepi32_mask*(a: M128i): MMask8 {.importc: "_mm_movepi32_mask".}

func mm256_movepi32_mask*(a: M256i): MMask8 {.importc: "_mm256_movepi32_mask".}

func mm_movepi64_mask*(a: M128i): MMask8 {.importc: "_mm_movepi64_mask".}

func mm256_movepi64_mask*(a: M256i): MMask8 {.importc: "_mm256_movepi64_mask".}

func mm256_extractf64x2_pd*(a: M256d, imm: int32): M128d {.importc: "_mm256_extractf64x2_pd".}

func mm256_mask_extractf64x2_pd*(w: M128d, u: MMask8, a: M256d, imm: int32): M128d {.importc: "_mm256_mask_extractf64x2_pd".}

func mm256_maskz_extractf64x2_pd*(u: MMask8, a: M256d, imm: int32): M128d {.importc: "_mm256_maskz_extractf64x2_pd".}

func mm256_extracti64x2_epi64*(a: M256i, imm: int32): M128i {.importc: "_mm256_extracti64x2_epi64".}

func mm256_mask_extracti64x2_epi64*(w: M128i, u: MMask8, a: M256i, imm: int32): M128i {.importc: "_mm256_mask_extracti64x2_epi64".}

func mm256_maskz_extracti64x2_epi64*(u: MMask8, a: M256i, imm: int32): M128i {.importc: "_mm256_maskz_extracti64x2_epi64".}

func mm256_reduce_pd*(a: M256d, b: int32): M256d {.importc: "_mm256_reduce_pd".}

func mm256_mask_reduce_pd*(w: M256d, u: MMask8, a: M256d, b: int32): M256d {.importc: "_mm256_mask_reduce_pd".}

func mm256_maskz_reduce_pd*(u: MMask8, a: M256d, b: int32): M256d {.importc: "_mm256_maskz_reduce_pd".}

func mm_reduce_pd*(a: M128d, b: int32): M128d {.importc: "_mm_reduce_pd".}

func mm_mask_reduce_pd*(w: M128d, u: MMask8, a: M128d, b: int32): M128d {.importc: "_mm_mask_reduce_pd".}

func mm_maskz_reduce_pd*(u: MMask8, a: M128d, b: int32): M128d {.importc: "_mm_maskz_reduce_pd".}

func mm256_reduce_ps*(a: M256, b: int32): M256 {.importc: "_mm256_reduce_ps".}

func mm256_mask_reduce_ps*(w: M256, u: MMask8, a: M256, b: int32): M256 {.importc: "_mm256_mask_reduce_ps".}

func mm256_maskz_reduce_ps*(u: MMask8, a: M256, b: int32): M256 {.importc: "_mm256_maskz_reduce_ps".}

func mm_reduce_ps*(a: M128, b: int32): M128 {.importc: "_mm_reduce_ps".}

func mm_mask_reduce_ps*(w: M128, u: MMask8, a: M128, b: int32): M128 {.importc: "_mm_mask_reduce_ps".}

func mm_maskz_reduce_ps*(u: MMask8, a: M128, b: int32): M128 {.importc: "_mm_maskz_reduce_ps".}

func mm256_range_pd*(a: M256d, b: M256d, c: int32): M256d {.importc: "_mm256_range_pd".}

func mm256_mask_range_pd*(w: M256d, u: MMask8, a: M256d, b: M256d, c: int32): M256d {.importc: "_mm256_mask_range_pd".}

func mm256_maskz_range_pd*(u: MMask8, a: M256d, b: M256d, c: int32): M256d {.importc: "_mm256_maskz_range_pd".}

func mm_range_pd*(a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_range_pd".}

func mm_mask_range_pd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_mask_range_pd".}

func mm_maskz_range_pd*(u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_maskz_range_pd".}

func mm256_range_ps*(a: M256, b: M256, c: int32): M256 {.importc: "_mm256_range_ps".}

func mm256_mask_range_ps*(w: M256, u: MMask8, a: M256, b: M256, c: int32): M256 {.importc: "_mm256_mask_range_ps".}

func mm256_maskz_range_ps*(u: MMask8, a: M256, b: M256, c: int32): M256 {.importc: "_mm256_maskz_range_ps".}

func mm_range_ps*(a: M128, b: M128, c: int32): M128 {.importc: "_mm_range_ps".}

func mm_mask_range_ps*(w: M128, u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_mask_range_ps".}

func mm_maskz_range_ps*(u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_maskz_range_ps".}

func mm256_mask_fpclass_pd_mask*(u: MMask8, a: M256d, imm: int32): MMask8 {.importc: "_mm256_mask_fpclass_pd_mask".}

func mm256_fpclass_pd_mask*(a: M256d, imm: int32): MMask8 {.importc: "_mm256_fpclass_pd_mask".}

func mm256_mask_fpclass_ps_mask*(u: MMask8, a: M256, imm: int32): MMask8 {.importc: "_mm256_mask_fpclass_ps_mask".}

func mm256_fpclass_ps_mask*(a: M256, imm: int32): MMask8 {.importc: "_mm256_fpclass_ps_mask".}

func mm_mask_fpclass_pd_mask*(u: MMask8, a: M128d, imm: int32): MMask8 {.importc: "_mm_mask_fpclass_pd_mask".}

func mm_fpclass_pd_mask*(a: M128d, imm: int32): MMask8 {.importc: "_mm_fpclass_pd_mask".}

func mm_mask_fpclass_ps_mask*(u: MMask8, a: M128, imm: int32): MMask8 {.importc: "_mm_mask_fpclass_ps_mask".}

func mm_fpclass_ps_mask*(a: M128, imm: int32): MMask8 {.importc: "_mm_fpclass_ps_mask".}

func mm256_inserti64x2*(a: M256i, b: M128i, imm: int32): M256i {.importc: "_mm256_inserti64x2".}

func mm256_mask_inserti64x2*(w: M256i, u: MMask8, a: M256i, b: M128i, imm: int32): M256i {.importc: "_mm256_mask_inserti64x2".}

func mm256_maskz_inserti64x2*(u: MMask8, a: M256i, b: M128i, imm: int32): M256i {.importc: "_mm256_maskz_inserti64x2".}

func mm256_insertf64x2*(a: M256d, b: M128d, imm: int32): M256d {.importc: "_mm256_insertf64x2".}

func mm256_mask_insertf64x2*(w: M256d, u: MMask8, a: M256d, b: M128d, imm: int32): M256d {.importc: "_mm256_mask_insertf64x2".}

func mm256_maskz_insertf64x2*(u: MMask8, a: M256d, b: M128d, imm: int32): M256d {.importc: "_mm256_maskz_insertf64x2".}

## [Macro Original]
## #define _mm256_insertf64x2(X, Y, C)                                     \
## ((__m256d) __builtin_ia32_insertf64x2_256_mask ((__v4df)(__m256d) (X),\
## (__v2df)(__m128d) (Y), (int) (C),					\
## (__v4df)(__m256d)_mm256_avx512_setzero_pd(),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_insertf64x2(W, U, X, Y, C)                          \
## ((__m256d) __builtin_ia32_insertf64x2_256_mask ((__v4df)(__m256d) (X),\
## (__v2df)(__m128d) (Y), (int) (C),					\
## (__v4df)(__m256d)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_insertf64x2(U, X, Y, C)				\
## ((__m256d) __builtin_ia32_insertf64x2_256_mask ((__v4df)(__m256d) (X),\
## (__v2df)(__m128d) (Y), (int) (C),					\
## (__v4df)(__m256d)_mm256_avx512_setzero_pd(),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_inserti64x2(X, Y, C)                                     \
## ((__m256i) __builtin_ia32_inserti64x2_256_mask ((__v4di)(__m256i) (X),\
## (__v2di)(__m128i) (Y), (int) (C),					\
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),				\
## (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_inserti64x2(W, U, X, Y, C)                          \
## ((__m256i) __builtin_ia32_inserti64x2_256_mask ((__v4di)(__m256i) (X),\
## (__v2di)(__m128i) (Y), (int) (C),					\
## (__v4di)(__m256i)(W),						\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_inserti64x2(U, X, Y, C)                            \
## ((__m256i) __builtin_ia32_inserti64x2_256_mask ((__v4di)(__m256i) (X),\
## (__v2di)(__m128i) (Y), (int) (C),					\
## (__v4di)(__m256i)_mm256_avx512_setzero_si256 (),				\
## (__mmask8)(U)))

## [Macro Original]
## #define _mm256_extractf64x2_pd(X, C)                                    \
## ((__m128d) __builtin_ia32_extractf64x2_256_mask ((__v4df)(__m256d) (X),\
## (int) (C), (__v2df)(__m128d) _mm_avx512_setzero_pd(), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_extractf64x2_pd(W, U, X, C)                         \
## ((__m128d) __builtin_ia32_extractf64x2_256_mask ((__v4df)(__m256d) (X),\
## (int) (C), (__v2df)(__m128d) (W), (__mmask8) (U)))

## [Macro Original]
## #define _mm256_maskz_extractf64x2_pd(U, X, C)                           \
## ((__m128d) __builtin_ia32_extractf64x2_256_mask ((__v4df)(__m256d) (X),\
## (int) (C), (__v2df)(__m128d) _mm_avx512_setzero_pd(), (__mmask8) (U)))

## [Macro Original]
## #define _mm256_extracti64x2_epi64(X, C)                                 \
## ((__m128i) __builtin_ia32_extracti64x2_256_mask ((__v4di)(__m256i) (X),\
## (int) (C), (__v2di)(__m128i) _mm_avx512_setzero_si128 (), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_extracti64x2_epi64(W, U, X, C)                     \
## ((__m128i) __builtin_ia32_extracti64x2_256_mask ((__v4di)(__m256i) (X),\
## (int) (C), (__v2di)(__m128i) (W), (__mmask8) (U)))

## [Macro Original]
## #define _mm256_maskz_extracti64x2_epi64(U, X, C)                        \
## ((__m128i) __builtin_ia32_extracti64x2_256_mask ((__v4di)(__m256i) (X),\
## (int) (C), (__v2di)(__m128i) _mm_avx512_setzero_si128 (), (__mmask8) (U)))

## [Macro Original]
## #define _mm256_reduce_pd(A, B)						\
## ((__m256d) __builtin_ia32_reducepd256_mask ((__v4df)(__m256d)(A),	\
## (int)(B), (__v4df)_mm256_avx512_setzero_pd(), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_reduce_pd(W, U, A, B)				\
## ((__m256d) __builtin_ia32_reducepd256_mask ((__v4df)(__m256d)(A),	\
## (int)(B), (__v4df)(__m256d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_reduce_pd(U, A, B)					\
## ((__m256d) __builtin_ia32_reducepd256_mask ((__v4df)(__m256d)(A),	\
## (int)(B), (__v4df)_mm256_avx512_setzero_pd(), (__mmask8)(U)))

## [Macro Original]
## #define _mm_reduce_pd(A, B)						\
## ((__m128d) __builtin_ia32_reducepd128_mask ((__v2df)(__m128d)(A),	\
## (int)(B), (__v2df)_mm_avx512_setzero_pd(), (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_reduce_pd(W, U, A, B)					\
## ((__m128d) __builtin_ia32_reducepd128_mask ((__v2df)(__m128d)(A),	\
## (int)(B), (__v2df)(__m128d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_reduce_pd(U, A, B)					\
## ((__m128d) __builtin_ia32_reducepd128_mask ((__v2df)(__m128d)(A),	\
## (int)(B), (__v2df)_mm_avx512_setzero_pd(), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_reduce_ps(A, B)						\
## ((__m256) __builtin_ia32_reduceps256_mask ((__v8sf)(__m256)(A),	\
## (int)(B), (__v8sf)_mm256_avx512_setzero_ps(), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_reduce_ps(W, U, A, B)				\
## ((__m256) __builtin_ia32_reduceps256_mask ((__v8sf)(__m256)(A),	\
## (int)(B), (__v8sf)(__m256)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_reduce_ps(U, A, B)					\
## ((__m256) __builtin_ia32_reduceps256_mask ((__v8sf)(__m256)(A),	\
## (int)(B), (__v8sf)_mm256_avx512_setzero_ps(), (__mmask8)(U)))

## [Macro Original]
## #define _mm_reduce_ps(A, B)						\
## ((__m128) __builtin_ia32_reduceps128_mask ((__v4sf)(__m128)(A),	\
## (int)(B), (__v4sf)_mm_avx512_setzero_ps(), (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_reduce_ps(W, U, A, B)					\
## ((__m128) __builtin_ia32_reduceps128_mask ((__v4sf)(__m128)(A),	\
## (int)(B), (__v4sf)(__m128)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_reduce_ps(U, A, B)					\
## ((__m128) __builtin_ia32_reduceps128_mask ((__v4sf)(__m128)(A),	\
## (int)(B), (__v4sf)_mm_avx512_setzero_ps(), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_range_pd(A, B, C)					\
## ((__m256d) __builtin_ia32_rangepd256_mask ((__v4df)(__m256d)(A),	\
## (__v4df)(__m256d)(B), (int)(C),					\
## (__v4df)_mm256_avx512_setzero_pd(), (__mmask8)-1))

## [Macro Original]
## #define _mm256_maskz_range_pd(U, A, B, C)				\
## ((__m256d) __builtin_ia32_rangepd256_mask ((__v4df)(__m256d)(A),	\
## (__v4df)(__m256d)(B), (int)(C),					\
## (__v4df)_mm256_avx512_setzero_pd(), (__mmask8)(U)))

## [Macro Original]
## #define _mm_range_pd(A, B, C)						\
## ((__m128d) __builtin_ia32_rangepd128_mask ((__v2df)(__m128d)(A),	\
## (__v2df)(__m128d)(B), (int)(C),					\
## (__v2df)_mm_avx512_setzero_pd(), (__mmask8)-1))

## [Macro Original]
## #define _mm256_range_ps(A, B, C)					\
## ((__m256) __builtin_ia32_rangeps256_mask ((__v8sf)(__m256)(A),	\
## (__v8sf)(__m256)(B), (int)(C),					\
## (__v8sf)_mm256_avx512_setzero_ps(), (__mmask8)-1))

## [Macro Original]
## #define _mm256_mask_range_ps(W, U, A, B, C)				\
## ((__m256) __builtin_ia32_rangeps256_mask ((__v8sf)(__m256)(A),	\
## (__v8sf)(__m256)(B), (int)(C),					\
## (__v8sf)(__m256)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_maskz_range_ps(U, A, B, C)				\
## ((__m256) __builtin_ia32_rangeps256_mask ((__v8sf)(__m256)(A),	\
## (__v8sf)(__m256)(B), (int)(C),					\
## (__v8sf)_mm256_avx512_setzero_ps(), (__mmask8)(U)))

## [Macro Original]
## #define _mm_range_ps(A, B, C)						\
## ((__m128) __builtin_ia32_rangeps128_mask ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C),					\
## (__v4sf)_mm_avx512_setzero_ps(), (__mmask8)-1))

## [Macro Original]
## #define _mm_mask_range_ps(W, U, A, B, C)				\
## ((__m128) __builtin_ia32_rangeps128_mask ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C),					\
## (__v4sf)(__m128)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_range_ps(U, A, B, C)					\
## ((__m128) __builtin_ia32_rangeps128_mask ((__v4sf)(__m128)(A),	\
## (__v4sf)(__m128)(B), (int)(C),					\
## (__v4sf)_mm_avx512_setzero_ps(), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_range_pd(W, U, A, B, C)				\
## ((__m256d) __builtin_ia32_rangepd256_mask ((__v4df)(__m256d)(A),	\
## (__v4df)(__m256d)(B), (int)(C),					\
## (__v4df)(__m256d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_mask_range_pd(W, U, A, B, C)				\
## ((__m128d) __builtin_ia32_rangepd128_mask ((__v2df)(__m128d)(A),	\
## (__v2df)(__m128d)(B), (int)(C),					\
## (__v2df)(__m128d)(W), (__mmask8)(U)))

## [Macro Original]
## #define _mm_maskz_range_pd(U, A, B, C)					\
## ((__m128d) __builtin_ia32_rangepd128_mask ((__v2df)(__m128d)(A),	\
## (__v2df)(__m128d)(B), (int)(C),					\
## (__v2df)_mm_avx512_setzero_pd(), (__mmask8)(U)))

## [Macro Original]
## #define _mm256_mask_fpclass_pd_mask(u, X, C)                            \
## ((__mmask8) __builtin_ia32_fpclasspd256_mask ((__v4df) (__m256d) (X), \
## (int) (C),(__mmask8)(u)))

## [Macro Original]
## #define _mm256_mask_fpclass_ps_mask(u, X, C)				\
## ((__mmask8) __builtin_ia32_fpclassps256_mask ((__v8sf) (__m256) (X),  \
## (int) (C),(__mmask8)(u)))

## [Macro Original]
## #define _mm_mask_fpclass_pd_mask(u, X, C)                               \
## ((__mmask8) __builtin_ia32_fpclasspd128_mask ((__v2df) (__m128d) (X), \
## (int) (C),(__mmask8)(u)))

## [Macro Original]
## #define _mm_mask_fpclass_ps_mask(u, X, C)                               \
## ((__mmask8) __builtin_ia32_fpclassps128_mask ((__v4sf) (__m128) (X),  \
## (int) (C),(__mmask8)(u)))

## [Macro Original]
## #define _mm256_fpclass_pd_mask(X, C)                                    \
## ((__mmask8) __builtin_ia32_fpclasspd256_mask ((__v4df) (__m256d) (X), \
## (int) (C),(__mmask8)-1))

## [Macro Original]
## #define _mm256_fpclass_ps_mask(X, C)                                    \
## ((__mmask8) __builtin_ia32_fpclassps256_mask ((__v8sf) (__m256) (X),  \
## (int) (C),(__mmask8)-1))

## [Macro Original]
## #define _mm_fpclass_pd_mask(X, C)                                       \
## ((__mmask8) __builtin_ia32_fpclasspd128_mask ((__v2df) (__m128d) (X), \
## (int) (C),(__mmask8)-1))

## [Macro Original]
## #define _mm_fpclass_ps_mask(X, C)                                       \
## ((__mmask8) __builtin_ia32_fpclassps128_mask ((__v4sf) (__m128) (X),  \
## (int) (C),(__mmask8)-1))