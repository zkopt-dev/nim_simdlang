import avx512f

## [Macro Original]
## #define _AVX512BMMVLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512BMMVL__

func mm256_bmacor16x16x16*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_bmacor16x16x16".}

func mm256_bmacxor16x16x16*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_bmacxor16x16x16".}

func mm128_mask_bitrev_epi8*(u: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm128_mask_bitrev_epi8".}

func mm128_maskz_bitrev_epi8*(u: MMask16, a: M128i): M128i {.importc: "_mm128_maskz_bitrev_epi8".}

func mm128_bitrev_epi8*(a: M128i): M128i {.importc: "_mm128_bitrev_epi8".}

func mm256_mask_bitrev_epi8*(u: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_bitrev_epi8".}

func mm256_maskz_bitrev_epi8*(u: MMask32, a: M256i): M256i {.importc: "_mm256_maskz_bitrev_epi8".}

func mm256_bitrev_epi8*(a: M256i): M256i {.importc: "_mm256_bitrev_epi8".}