import avx512f

## [Macro Original]
## #define __AVX512VNNIINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VNNI__

func mm512_dpbusd_epi32*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_dpbusd_epi32".}

func mm512_mask_dpbusd_epi32*(a: M512i, b: MMask16, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_dpbusd_epi32".}

func mm512_maskz_dpbusd_epi32*(a: MMask16, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_dpbusd_epi32".}

func mm512_dpbusds_epi32*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_dpbusds_epi32".}

func mm512_mask_dpbusds_epi32*(a: M512i, b: MMask16, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_dpbusds_epi32".}

func mm512_maskz_dpbusds_epi32*(a: MMask16, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_dpbusds_epi32".}

func mm512_dpwssd_epi32*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_dpwssd_epi32".}

func mm512_mask_dpwssd_epi32*(a: M512i, b: MMask16, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_dpwssd_epi32".}

func mm512_maskz_dpwssd_epi32*(a: MMask16, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_dpwssd_epi32".}

func mm512_dpwssds_epi32*(a: M512i, b: M512i, c: M512i): M512i {.importc: "_mm512_dpwssds_epi32".}

func mm512_mask_dpwssds_epi32*(a: M512i, b: MMask16, c: M512i, d: M512i): M512i {.importc: "_mm512_mask_dpwssds_epi32".}

func mm512_maskz_dpwssds_epi32*(a: MMask16, b: M512i, c: M512i, d: M512i): M512i {.importc: "_mm512_maskz_dpwssds_epi32".}