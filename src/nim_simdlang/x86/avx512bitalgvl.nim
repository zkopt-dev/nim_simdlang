import avx512f

## [Macro Original]
## #define _AVX512BITALGVLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512BITALGVL__

func mm256_mask_popcnt_epi8*(w: M256i, u: MMask32, a: M256i): M256i {.importc: "_mm256_mask_popcnt_epi8".}

func mm256_maskz_popcnt_epi8*(u: MMask32, a: M256i): M256i {.importc: "_mm256_maskz_popcnt_epi8".}

func mm256_bitshuffle_epi64_mask*(a: M256i, b: M256i): MMask32 {.importc: "_mm256_bitshuffle_epi64_mask".}

func mm256_mask_bitshuffle_epi64_mask*(m: MMask32, a: M256i, b: M256i): MMask32 {.importc: "_mm256_mask_bitshuffle_epi64_mask".}

func mm_bitshuffle_epi64_mask*(a: M128i, b: M128i): MMask16 {.importc: "_mm_bitshuffle_epi64_mask".}

func mm_mask_bitshuffle_epi64_mask*(m: MMask16, a: M128i, b: M128i): MMask16 {.importc: "_mm_mask_bitshuffle_epi64_mask".}

func mm256_popcnt_epi8*(a: M256i): M256i {.importc: "_mm256_popcnt_epi8".}

func mm256_popcnt_epi16*(a: M256i): M256i {.importc: "_mm256_popcnt_epi16".}

func mm_popcnt_epi8*(a: M128i): M128i {.importc: "_mm_popcnt_epi8".}

func mm_popcnt_epi16*(a: M128i): M128i {.importc: "_mm_popcnt_epi16".}

func mm256_mask_popcnt_epi16*(w: M256i, u: MMask16, a: M256i): M256i {.importc: "_mm256_mask_popcnt_epi16".}

func mm256_maskz_popcnt_epi16*(u: MMask16, a: M256i): M256i {.importc: "_mm256_maskz_popcnt_epi16".}

func mm_mask_popcnt_epi8*(w: M128i, u: MMask16, a: M128i): M128i {.importc: "_mm_mask_popcnt_epi8".}

func mm_maskz_popcnt_epi8*(u: MMask16, a: M128i): M128i {.importc: "_mm_maskz_popcnt_epi8".}

func mm_mask_popcnt_epi16*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_popcnt_epi16".}

func mm_maskz_popcnt_epi16*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_popcnt_epi16".}