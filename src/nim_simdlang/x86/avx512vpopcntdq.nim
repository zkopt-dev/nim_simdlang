import avx512f

## [Macro Original]
## #define _AVX512VPOPCNTDQINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VPOPCNTDQ__

func mm512_popcnt_epi32*(a: M512i): M512i {.importc: "_mm512_popcnt_epi32".}

func mm512_mask_popcnt_epi32*(w: M512i, u: MMask16, a: M512i): M512i {.importc: "_mm512_mask_popcnt_epi32".}

func mm512_maskz_popcnt_epi32*(u: MMask16, a: M512i): M512i {.importc: "_mm512_maskz_popcnt_epi32".}

func mm512_popcnt_epi64*(a: M512i): M512i {.importc: "_mm512_popcnt_epi64".}

func mm512_mask_popcnt_epi64*(w: M512i, u: MMask8, a: M512i): M512i {.importc: "_mm512_mask_popcnt_epi64".}

func mm512_maskz_popcnt_epi64*(u: MMask8, a: M512i): M512i {.importc: "_mm512_maskz_popcnt_epi64".}