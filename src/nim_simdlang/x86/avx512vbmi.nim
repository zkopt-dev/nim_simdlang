import avx512f

## [Macro Original]
## #define _AVX512VBMIINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VBMI__

func mm512_mask_multishift_epi64_epi8*(w: M512i, m: MMask64, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_multishift_epi64_epi8".}

func mm512_maskz_multishift_epi64_epi8*(m: MMask64, x: M512i, y: M512i): M512i {.importc: "_mm512_maskz_multishift_epi64_epi8".}

func mm512_multishift_epi64_epi8*(x: M512i, y: M512i): M512i {.importc: "_mm512_multishift_epi64_epi8".}

func mm512_permutexvar_epi8*(a: M512i, b: M512i): M512i {.importc: "_mm512_permutexvar_epi8".}

func mm512_maskz_permutexvar_epi8*(m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_permutexvar_epi8".}

func mm512_mask_permutexvar_epi8*(w: M512i, m: MMask64, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_permutexvar_epi8".}

func mm512_permutex2var_epi8*(a: M512i, i: M512i, b: M512i): M512i {.importc: "_mm512_permutex2var_epi8".}

func mm512_mask_permutex2var_epi8*(a: M512i, u: MMask64, i: M512i, b: M512i): M512i {.importc: "_mm512_mask_permutex2var_epi8".}

func mm512_mask2_permutex2var_epi8*(a: M512i, i: M512i, u: MMask64, b: M512i): M512i {.importc: "_mm512_mask2_permutex2var_epi8".}

func mm512_maskz_permutex2var_epi8*(u: MMask64, a: M512i, i: M512i, b: M512i): M512i {.importc: "_mm512_maskz_permutex2var_epi8".}