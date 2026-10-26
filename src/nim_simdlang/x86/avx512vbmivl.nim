import avx512f

## [Macro Original]
## #define _AVX512VBMIVLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VBMIVL__

func mm256_mask_multishift_epi64_epi8*(w: M256i, m: MMask32, x: M256i, y: M256i): M256i {.importc: "_mm256_mask_multishift_epi64_epi8".}

func mm256_maskz_multishift_epi64_epi8*(m: MMask32, x: M256i, y: M256i): M256i {.importc: "_mm256_maskz_multishift_epi64_epi8".}

func mm256_multishift_epi64_epi8*(x: M256i, y: M256i): M256i {.importc: "_mm256_multishift_epi64_epi8".}

func mm_mask_multishift_epi64_epi8*(w: M128i, m: MMask16, x: M128i, y: M128i): M128i {.importc: "_mm_mask_multishift_epi64_epi8".}

func mm_maskz_multishift_epi64_epi8*(m: MMask16, x: M128i, y: M128i): M128i {.importc: "_mm_maskz_multishift_epi64_epi8".}

func mm_multishift_epi64_epi8*(x: M128i, y: M128i): M128i {.importc: "_mm_multishift_epi64_epi8".}

func mm256_permutexvar_epi8*(a: M256i, b: M256i): M256i {.importc: "_mm256_permutexvar_epi8".}

func mm256_maskz_permutexvar_epi8*(m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_permutexvar_epi8".}

func mm256_mask_permutexvar_epi8*(w: M256i, m: MMask32, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_permutexvar_epi8".}

func mm_permutexvar_epi8*(a: M128i, b: M128i): M128i {.importc: "_mm_permutexvar_epi8".}

func mm_maskz_permutexvar_epi8*(m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_permutexvar_epi8".}

func mm_mask_permutexvar_epi8*(w: M128i, m: MMask16, a: M128i, b: M128i): M128i {.importc: "_mm_mask_permutexvar_epi8".}

func mm256_permutex2var_epi8*(a: M256i, i: M256i, b: M256i): M256i {.importc: "_mm256_permutex2var_epi8".}

func mm256_mask_permutex2var_epi8*(a: M256i, u: MMask32, i: M256i, b: M256i): M256i {.importc: "_mm256_mask_permutex2var_epi8".}

func mm256_mask2_permutex2var_epi8*(a: M256i, i: M256i, u: MMask32, b: M256i): M256i {.importc: "_mm256_mask2_permutex2var_epi8".}

func mm256_maskz_permutex2var_epi8*(u: MMask32, a: M256i, i: M256i, b: M256i): M256i {.importc: "_mm256_maskz_permutex2var_epi8".}

func mm_permutex2var_epi8*(a: M128i, i: M128i, b: M128i): M128i {.importc: "_mm_permutex2var_epi8".}

func mm_mask_permutex2var_epi8*(a: M128i, u: MMask16, i: M128i, b: M128i): M128i {.importc: "_mm_mask_permutex2var_epi8".}

func mm_mask2_permutex2var_epi8*(a: M128i, i: M128i, u: MMask16, b: M128i): M128i {.importc: "_mm_mask2_permutex2var_epi8".}

func mm_maskz_permutex2var_epi8*(u: MMask16, a: M128i, i: M128i, b: M128i): M128i {.importc: "_mm_maskz_permutex2var_epi8".}