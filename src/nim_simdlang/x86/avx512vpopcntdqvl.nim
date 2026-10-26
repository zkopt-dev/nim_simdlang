import avx512f

## [Macro Original]
## #define _AVX512VPOPCNTDQVLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VPOPCNTDQVL__

func mm_popcnt_epi32*(a: M128i): M128i {.importc: "_mm_popcnt_epi32".}

func mm_mask_popcnt_epi32*(w: M128i, u: MMask16, a: M128i): M128i {.importc: "_mm_mask_popcnt_epi32".}

func mm_maskz_popcnt_epi32*(u: MMask16, a: M128i): M128i {.importc: "_mm_maskz_popcnt_epi32".}

func mm256_popcnt_epi32*(a: M256i): M256i {.importc: "_mm256_popcnt_epi32".}

func mm256_mask_popcnt_epi32*(w: M256i, u: MMask16, a: M256i): M256i {.importc: "_mm256_mask_popcnt_epi32".}

func mm256_maskz_popcnt_epi32*(u: MMask16, a: M256i): M256i {.importc: "_mm256_maskz_popcnt_epi32".}

func mm_popcnt_epi64*(a: M128i): M128i {.importc: "_mm_popcnt_epi64".}

func mm_mask_popcnt_epi64*(w: M128i, u: MMask8, a: M128i): M128i {.importc: "_mm_mask_popcnt_epi64".}

func mm_maskz_popcnt_epi64*(u: MMask8, a: M128i): M128i {.importc: "_mm_maskz_popcnt_epi64".}

func mm256_popcnt_epi64*(a: M256i): M256i {.importc: "_mm256_popcnt_epi64".}

func mm256_mask_popcnt_epi64*(w: M256i, u: MMask8, a: M256i): M256i {.importc: "_mm256_mask_popcnt_epi64".}

func mm256_maskz_popcnt_epi64*(u: MMask8, a: M256i): M256i {.importc: "_mm256_maskz_popcnt_epi64".}