import avx512f

## [Macro Original]
## #define _AVX512BITALGINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512BITALG__

func mm512_popcnt_epi8*(a: M512i): M512i {.importc: "_mm512_popcnt_epi8".}

func mm512_popcnt_epi16*(a: M512i): M512i {.importc: "_mm512_popcnt_epi16".}

func mm512_mask_popcnt_epi8*(w: M512i, u: MMask64, a: M512i): M512i {.importc: "_mm512_mask_popcnt_epi8".}

func mm512_maskz_popcnt_epi8*(u: MMask64, a: M512i): M512i {.importc: "_mm512_maskz_popcnt_epi8".}

func mm512_mask_popcnt_epi16*(w: M512i, u: MMask32, a: M512i): M512i {.importc: "_mm512_mask_popcnt_epi16".}

func mm512_maskz_popcnt_epi16*(u: MMask32, a: M512i): M512i {.importc: "_mm512_maskz_popcnt_epi16".}

func mm512_bitshuffle_epi64_mask*(a: M512i, b: M512i): MMask64 {.importc: "_mm512_bitshuffle_epi64_mask".}

func mm512_mask_bitshuffle_epi64_mask*(m: MMask64, a: M512i, b: M512i): MMask64 {.importc: "_mm512_mask_bitshuffle_epi64_mask".}