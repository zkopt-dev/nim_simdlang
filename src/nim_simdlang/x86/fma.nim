import avx

export avx

{.push header: "immintrin.h".}

# operating : compute (a * b) + c for packed double-precision floats
# lane unit : float64(pd) / lane numbers : 2 (128-bit), 4 (256-bit)
func mm_fmadd_pd*(a, b, c: M128d): M128d {.importc: "_mm_fmadd_pd".}
func mm256_fmadd_pd*(a, b, c: M256d): M256d {.importc: "_mm256_fmadd_pd".}

# operating : compute (a * b) + c for packed single-precision floats
# lane unit : float32(ps) / lane numbers : 4 (128-bit), 8 (256-bit)
func mm_fmadd_ps*(a, b, c: M128): M128 {.importc: "_mm_fmadd_ps".}
func mm256_fmadd_ps*(a, b, c: M256): M256 {.importc: "_mm256_fmadd_ps".}

# operating : compute (a * b) + c for the lowest scalar double/single-precision float
# lane unit : float64(sd) / float32(ss) / lane numbers : 1
func mm_fmadd_sd*(a, b, c: M128d): M128d {.importc: "_mm_fmadd_sd".}
func mm_fmadd_ss*(a, b, c: M128): M128 {.importc: "_mm_fmadd_ss".}

# operating : compute (a * b) + c for odd indexed lanes and (a * b) - c for even indexed lanes
# lane unit : float64(pd) / float32(ps) / lane numbers : 2/4 (128-bit), 4/8 (256-bit)
func mm_fmaddsub_pd*(a, b, c: M128d): M128d {.importc: "_mm_fmaddsub_pd".}
func mm256_fmaddsub_pd*(a, b, c: M256d): M256d {.importc: "_mm256_fmaddsub_pd".}
func mm_fmaddsub_ps*(a, b, c: M128): M128 {.importc: "_mm_fmaddsub_ps".}
func mm256_fmaddsub_ps*(a, b, c: M256): M256 {.importc: "_mm256_fmaddsub_ps".}

# operating : compute (a * b) - c for packed double/single-precision floats
# lane unit : float64(pd) / float32(ps) / lane numbers : 2/4 (128-bit), 4/8 (256-bit)
func mm_fmsub_pd*(a, b, c: M128d): M128d {.importc: "_mm_fmsub_pd".}
func mm256_fmsub_pd*(a, b, c: M256d): M256d {.importc: "_mm256_fmsub_pd".}
func mm_fmsub_ps*(a, b, c: M128): M128 {.importc: "_mm_fmsub_ps".}
func mm256_fmsub_ps*(a, b, c: M256): M256 {.importc: "_mm256_fmsub_ps".}

# operating : compute (a * b) - c for the lowest scalar double/single-precision float
# lane unit : float64(sd) / float32(ss) / lane numbers : 1
func mm_fmsub_sd*(a, b, c: M128d): M128d {.importc: "_mm_fmsub_sd".}
func mm_fmsub_ss*(a, b, c: M128): M128 {.importc: "_mm_fmsub_ss".}

# operating : compute (a * b) - c for odd indexed lanes and (a * b) + c for even indexed lanes
# lane unit : float64(pd) / float32(ps) / lane numbers : 2/4 (128-bit), 4/8 (256-bit)
func mm_fmsubadd_pd*(a, b, c: M128d): M128d {.importc: "_mm_fmsubadd_pd".}
func mm256_fmsubadd_pd*(a, b, c: M256d): M256d {.importc: "_mm256_fmsubadd_pd".}
func mm_fmsubadd_ps*(a, b, c: M128): M128 {.importc: "_mm_fmsubadd_ps".}
func mm256_fmsubadd_ps*(a, b, c: M256): M256 {.importc: "_mm256_fmsubadd_ps".}

# operating : compute -(a * b) + c for packed double/single-precision floats
# lane unit : float64(pd) / float32(ps) / lane numbers : 2/4 (128-bit), 4/8 (256-bit)
func mm_fnmadd_pd*(a, b, c: M128d): M128d {.importc: "_mm_fnmadd_pd".}
func mm256_fnmadd_pd*(a, b, c: M256d): M256d {.importc: "_mm256_fnmadd_pd".}
func mm_fnmadd_ps*(a, b, c: M128): M128 {.importc: "_mm_fnmadd_ps".}
func mm256_fnmadd_ps*(a, b, c: M256): M256 {.importc: "_mm256_fnmadd_ps".}

# operating : compute -(a * b) + c for the lowest scalar double/single-precision float
# lane unit : float64(sd) / float32(ss) / lane numbers : 1
func mm_fnmadd_sd*(a, b, c: M128d): M128d {.importc: "_mm_fnmadd_sd".}
func mm_fnmadd_ss*(a, b, c: M128): M128 {.importc: "_mm_fnmadd_ss".}

# operating : compute -(a * b) - c for packed double/single-precision floats
# lane unit : float64(pd) / float32(ps) / lane numbers : 2/4 (128-bit), 4/8 (256-bit)
func mm_fnmsub_pd*(a, b, c: M128d): M128d {.importc: "_mm_fnmsub_pd".}
func mm256_fnmsub_pd*(a, b, c: M256d): M256d {.importc: "_mm256_fnmsub_pd".}
func mm_fnmsub_ps*(a, b, c: M128): M128 {.importc: "_mm_fnmsub_ps".}
func mm256_fnmsub_ps*(a, b, c: M256): M256 {.importc: "_mm256_fnmsub_ps".}

# operating : compute -(a * b) - c for the lowest scalar double/single-precision float
# lane unit : float64(sd) / float32(ss) / lane numbers : 1
func mm_fnmsub_sd*(a, b, c: M128d): M128d {.importc: "_mm_fnmsub_sd".}
func mm_fnmsub_ss*(a, b, c: M128): M128 {.importc: "_mm_fnmsub_ss".}

{.pop.}
