import sse
import sse2
import avx
import avx2
import avx512f

# --- IFMA (Integer Fused Multiply-Add 52-bit precision) ---

# operating : multiply unsigned 52-bit integers from y and z, add the low 52 bits of the product to x
# lane unit : (u52 * u52) + u64 (low part) / total : 128-bit (2 lanes)
func mm_madd52lo_avx_epu64*(x: M128i, y: M128i, z: M128i): M128i {.importc: "_mm_madd52lo_avx_epu64".}

# operating : multiply unsigned 52-bit integers from y and z, add the high 52 bits of the product to x
# lane unit : (u52 * u52) + u64 (high part) / total : 128-bit (2 lanes)
func mm_madd52hi_avx_epu64*(x: M128i, y: M128i, z: M128i): M128i {.importc: "_mm_madd52hi_avx_epu64".}

# operating : multiply unsigned 52-bit integers from y and z, add the low 52 bits of the product to x
# lane unit : (u52 * u52) + u64 (low part) / total : 256-bit (4 lanes)
func mm256_madd52lo_avx_epu64*(x: M256i, y: M256i, z: M256i): M256i {.importc: "_mm256_madd52lo_avx_epu64".}

# operating : multiply unsigned 52-bit integers from y and z, add the high 52 bits of the product to x
# lane unit : (u52 * u52) + u64 (high part) / total : 256-bit (4 lanes)
func mm256_madd52hi_avx_epu64*(x: M256i, y: M256i, z: M256i): M256i {.importc: "_mm256_madd52hi_avx_epu64".}