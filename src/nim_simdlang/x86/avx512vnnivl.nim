import avx512f

## [Macro Original]
## #define _AVX512VNNIVLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VNNIVL__

## [Macro Original]
## #define _mm256_dpbusd_epi32(A, B, C)				\
## ((__m256i) __builtin_ia32_vpdpbusd_v8si ((__v8si) (A),	\
## (__v8si) (B),	\
## (__v8si) (C)))

func mm256_mask_dpbusd_epi32*(a: M256i, b: MMask8, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_dpbusd_epi32".}

func mm256_maskz_dpbusd_epi32*(a: MMask8, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_dpbusd_epi32".}

## [Macro Original]
## #define _mm_dpbusd_epi32(A, B, C)				\
## ((__m128i) __builtin_ia32_vpdpbusd_v4si ((__v4si) (A),	\
## (__v4si) (B),	\
## (__v4si) (C)))

func mm_mask_dpbusd_epi32*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_dpbusd_epi32".}

func mm_maskz_dpbusd_epi32*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_dpbusd_epi32".}

## [Macro Original]
## #define _mm256_dpbusds_epi32(A, B, C)				\
## ((__m256i) __builtin_ia32_vpdpbusds_v8si ((__v8si) (A),	\
## (__v8si) (B),	\
## (__v8si) (C)))

func mm256_mask_dpbusds_epi32*(a: M256i, b: MMask8, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_dpbusds_epi32".}

func mm256_maskz_dpbusds_epi32*(a: MMask8, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_dpbusds_epi32".}

## [Macro Original]
## #define _mm_dpbusds_epi32(A, B, C)				\
## ((__m128i) __builtin_ia32_vpdpbusds_v4si ((__v4si) (A),	\
## (__v4si) (B),	\
## (__v4si) (C)))

func mm_mask_dpbusds_epi32*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_dpbusds_epi32".}

func mm_maskz_dpbusds_epi32*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_dpbusds_epi32".}

## [Macro Original]
## #define _mm256_dpwssd_epi32(A, B, C)				\
## ((__m256i) __builtin_ia32_vpdpwssd_v8si ((__v8si) (A),	\
## (__v8si) (B),	\
## (__v8si) (C)))

func mm256_mask_dpwssd_epi32*(a: M256i, b: MMask8, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_dpwssd_epi32".}

func mm256_maskz_dpwssd_epi32*(a: MMask8, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_dpwssd_epi32".}

## [Macro Original]
## #define _mm_dpwssd_epi32(A, B, C)				\
## ((__m128i) __builtin_ia32_vpdpwssd_v4si ((__v4si) (A),	\
## (__v4si) (B),	\
## (__v4si) (C)))

func mm_mask_dpwssd_epi32*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_dpwssd_epi32".}

func mm_maskz_dpwssd_epi32*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_dpwssd_epi32".}

## [Macro Original]
## #define _mm256_dpwssds_epi32(A, B, C)				\
## ((__m256i) __builtin_ia32_vpdpwssds_v8si ((__v8si) (A),	\
## (__v8si) (B),	\
## (__v8si) (C)))

func mm256_mask_dpwssds_epi32*(a: M256i, b: MMask8, c: M256i, d: M256i): M256i {.importc: "_mm256_mask_dpwssds_epi32".}

func mm256_maskz_dpwssds_epi32*(a: MMask8, b: M256i, c: M256i, d: M256i): M256i {.importc: "_mm256_maskz_dpwssds_epi32".}

## [Macro Original]
## #define _mm_dpwssds_epi32(A, B, C)				\
## ((__m128i) __builtin_ia32_vpdpwssds_v4si ((__v4si) (A),	\
## (__v4si) (B),	\
## (__v4si) (C)))

func mm_mask_dpwssds_epi32*(a: M128i, b: MMask8, c: M128i, d: M128i): M128i {.importc: "_mm_mask_dpwssds_epi32".}

func mm_maskz_dpwssds_epi32*(a: MMask8, b: M128i, c: M128i, d: M128i): M128i {.importc: "_mm_maskz_dpwssds_epi32".}