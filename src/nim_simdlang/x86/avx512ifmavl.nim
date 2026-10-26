import avx512f

## [Macro Original]
## #define _AVX512IFMAVLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512IFMAVL__

## [Macro Original]
## #define _mm_madd52lo_epu64(A, B, C)			  \
## ((__m128i) __builtin_ia32_vpmadd52luq128 ((__v2di) (A), \
## (__v2di) (B), \
## (__v2di) (C)))

## [Macro Original]
## #define _mm_madd52hi_epu64(A, B, C)			  \
## ((__m128i) __builtin_ia32_vpmadd52huq128 ((__v2di) (A), \
## (__v2di) (B), \
## (__v2di) (C)))

## [Macro Original]
## #define _mm256_madd52lo_epu64(A, B, C)			  \
## ((__m256i) __builtin_ia32_vpmadd52luq256 ((__v4di) (A), \
## (__v4di) (B), \
## (__v4di) (C)))

## [Macro Original]
## #define _mm256_madd52hi_epu64(A, B, C)			  \
## ((__m256i) __builtin_ia32_vpmadd52huq256 ((__v4di) (A), \
## (__v4di) (B), \
## (__v4di) (C)))

func mm_mask_madd52lo_epu64*(w: M128i, m: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_madd52lo_epu64".}

func mm_mask_madd52hi_epu64*(w: M128i, m: MMask8, x: M128i, y: M128i): M128i {.importc: "_mm_mask_madd52hi_epu64".}

func mm256_mask_madd52lo_epu64*(w: M256i, m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_madd52lo_epu64".}

func mm256_mask_madd52hi_epu64*(w: M256i, m: MMask8, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_madd52hi_epu64".}

func mm_maskz_madd52lo_epu64*(m: MMask8, x: M128i, y: M128i, z: M128i): M128i {.importc: "_mm_maskz_madd52lo_epu64".}

func mm_maskz_madd52hi_epu64*(m: MMask8, x: M128i, y: M128i, z: M128i): M128i {.importc: "_mm_maskz_madd52hi_epu64".}

func mm256_maskz_madd52lo_epu64*(m: MMask8, x: M256i, y: M256i, z: M256i): M256i {.importc: "_mm256_maskz_madd52lo_epu64".}

func mm256_maskz_madd52hi_epu64*(m: MMask8, x: M256i, y: M256i, z: M256i): M256i {.importc: "_mm256_maskz_madd52hi_epu64".}