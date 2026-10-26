import avx512f

## [Macro Original]
## #define _AVX512CDINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512CD__

func mm512_conflict_epi32*(a: M512i): M512i {.importc: "_mm512_conflict_epi32".}

func mm512_mask_conflict_epi32*(w: M512i, u: MMask16, a: M512i): M512i {.importc: "_mm512_mask_conflict_epi32".}

func mm512_maskz_conflict_epi32*(u: MMask16, a: M512i): M512i {.importc: "_mm512_maskz_conflict_epi32".}

func mm512_conflict_epi64*(a: M512i): M512i {.importc: "_mm512_conflict_epi64".}

func mm512_mask_conflict_epi64*(w: M512i, u: MMask8, a: M512i): M512i {.importc: "_mm512_mask_conflict_epi64".}

func mm512_maskz_conflict_epi64*(u: MMask8, a: M512i): M512i {.importc: "_mm512_maskz_conflict_epi64".}

func mm512_lzcnt_epi64*(a: M512i): M512i {.importc: "_mm512_lzcnt_epi64".}

func mm512_mask_lzcnt_epi64*(w: M512i, u: MMask8, a: M512i): M512i {.importc: "_mm512_mask_lzcnt_epi64".}

func mm512_maskz_lzcnt_epi64*(u: MMask8, a: M512i): M512i {.importc: "_mm512_maskz_lzcnt_epi64".}

func mm512_lzcnt_epi32*(a: M512i): M512i {.importc: "_mm512_lzcnt_epi32".}

func mm512_mask_lzcnt_epi32*(w: M512i, u: MMask16, a: M512i): M512i {.importc: "_mm512_mask_lzcnt_epi32".}

func mm512_maskz_lzcnt_epi32*(u: MMask16, a: M512i): M512i {.importc: "_mm512_maskz_lzcnt_epi32".}

func mm512_broadcastmb_epi64*(a: MMask8): M512i {.importc: "_mm512_broadcastmb_epi64".}

func mm512_broadcastmw_epi32*(a: MMask16): M512i {.importc: "_mm512_broadcastmw_epi32".}