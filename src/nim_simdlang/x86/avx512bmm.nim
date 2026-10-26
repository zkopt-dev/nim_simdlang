import avx512f

## [Macro Original]
## #define _AVX512BMMINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512BMM__

func mm512_bmacor16x16x16*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_bmacor16x16x16".}

func mm512_bmacxor16x16x16*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_bmacxor16x16x16".}

func mm512_mask_bitrev_epi8*(u: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_bitrev_epi8".}

func mm512_maskz_bitrev_epi8*(u: MMask64, a: M512i): M512i {.importc: "_mm512_maskz_bitrev_epi8".}

func mm512_bitrev_epi8*(a: M512i): M512i {.importc: "_mm512_bitrev_epi8".}