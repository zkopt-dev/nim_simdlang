import avx512f

## [Macro Original]
## #define _AVX512IFMAINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512IFMA__

func mm512_madd52lo_epu64*(x: M512i, y: M512i, z: M512i): M512i {.importc: "_mm512_madd52lo_epu64".}

func mm512_madd52hi_epu64*(x: M512i, y: M512i, z: M512i): M512i {.importc: "_mm512_madd52hi_epu64".}

func mm512_mask_madd52lo_epu64*(w: M512i, m: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_madd52lo_epu64".}

func mm512_mask_madd52hi_epu64*(w: M512i, m: MMask8, x: M512i, y: M512i): M512i {.importc: "_mm512_mask_madd52hi_epu64".}

func mm512_maskz_madd52lo_epu64*(m: MMask8, x: M512i, y: M512i, z: M512i): M512i {.importc: "_mm512_maskz_madd52lo_epu64".}

func mm512_maskz_madd52hi_epu64*(m: MMask8, x: M512i, y: M512i, z: M512i): M512i {.importc: "_mm512_maskz_madd52hi_epu64".}