import avx
import avx512f
import sse2
import sse

# --- BF16 / FP16 Conversion and Broadcast (AVX-NE-CONVERT) ---

# operating : broadcast a 16-bit BFloat16 value from memory to all elements of a 128-bit FP32 vector
# lane unit : bf16 -> float32 (broadcast) / total : 128-bit (4 lanes)
func mm_bcstnebf16_ps*(p: pointer): M128 {.importc: "_mm_bcstnebf16_ps".}

# operating : broadcast a 16-bit BFloat16 value from memory to all elements of a 256-bit FP32 vector
# lane unit : bf16 -> float32 (broadcast) / total : 256-bit (8 lanes)
func mm256_bcstnebf16_ps*(p: pointer): M256 {.importc: "_mm256_bcstnebf16_ps".}

# operating : broadcast a 16-bit FP16(half) value from memory to all elements of a 128-bit FP32 vector
# lane unit : fp16 -> float32 (broadcast) / total : 128-bit (4 lanes)
func mm_bcstnesh_ps*(p: pointer): M128 {.importc: "_mm_bcstnesh_ps".}

# operating : broadcast a 16-bit FP16(half) value from memory to all elements of a 256-bit FP32 vector
# lane unit : fp16 -> float32 (broadcast) / total : 256-bit (8 lanes)
func mm256_bcstnesh_ps*(p: pointer): M256 {.importc: "_mm256_bcstnesh_ps".}

# operating : convert even-indexed BF16 elements from memory to a 128-bit FP32 vector
# lane unit : bf16[0, 2, 4, 6] -> float32 / total : 128-bit
func mm_cvtneebf16_ps*(a: ptr M128bh): M128 {.importc: "_mm_cvtneebf16_ps".}

# operating : convert even-indexed BF16 elements from memory to a 256-bit FP32 vector
# lane unit : bf16[0, 2, ..., 14] -> float32 / total : 256-bit
func mm256_cvtneebf16_ps*(a: ptr M256bh): M256 {.importc: "_mm256_cvtneebf16_ps".}

# operating : convert even-indexed FP16 elements from memory to a 128-bit FP32 vector
# lane unit : fp16[0, 2, 4, 6] -> float32 / total : 128-bit
func mm_cvtneeph_ps*(a: ptr M128h): M128 {.importc: "_mm_cvtneeph_ps".}

# operating : convert even-indexed FP16 elements from memory to a 256-bit FP32 vector
# lane unit : fp16[0, 2, ..., 14] -> float32 / total : 256-bit
func mm256_cvtneeph_ps*(a: ptr M256h): M256 {.importc: "_mm256_cvtneeph_ps".}

# operating : convert odd-indexed BF16 elements from memory to a 128-bit FP32 vector
# lane unit : bf16[1, 3, 5, 7] -> float32 / total : 128-bit
func mm_cvtneobf16_ps*(a: ptr M128bh): M128 {.importc: "_mm_cvtneobf16_ps".}

# operating : convert odd-indexed BF16 elements from memory to a 256-bit FP32 vector
# lane unit : bf16[1, 3, ..., 15] -> float32 / total : 256-bit
func mm256_cvtneobf16_ps*(a: ptr M256bh): M256 {.importc: "_mm256_cvtneobf16_ps".}

# operating : convert odd-indexed FP16 elements from memory to a 128-bit FP32 vector
# lane unit : fp16[1, 3, 5, 7] -> float32 / total : 128-bit
func mm_cvtneoph_ps*(a: ptr M128h): M128 {.importc: "_mm_cvtneoph_ps".}

# operating : convert odd-indexed FP16 elements from memory to a 256-bit FP32 vector
# lane unit : fp16[1, 3, ..., 15] -> float32 / total : 256-bit
func mm256_cvtneoph_ps*(a: ptr M256h): M256 {.importc: "_mm256_cvtneoph_ps".}

# operating : convert FP32 elements to BF16 elements using nearest-even rounding
# lane unit : float32 -> bf16 / total : 128-bit result (contains 8 elements)
func mm_cvtneps_avx_pbh*(a: M128): M128bh {.importc: "_mm_cvtneps_avx_pbh".}

# operating : convert 256-bit FP32 elements to 128-bit BF16 vector using nearest-even rounding
# lane unit : float32 -> bf16 / source : 256-bit (8 lanes) -> dest : 128-bit
func mm256_cvtneps_avx_pbh*(a: M256): M128bh {.importc: "_mm256_cvtneps_avx_pbh".}
