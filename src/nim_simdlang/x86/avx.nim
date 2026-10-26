import sse42
import sse2
import sse

export sse42

type
  M256* {.importc: "__m256", header: "immintrin.h", bycopy.} = object
  M256i* {.importc: "__m256i", header: "immintrin.h", bycopy.} = object
  M256d* {.importc: "__m256d", header: "immintrin.h", bycopy.} = object

{.push header: "immintrin.h".}
# SIMD don't carry each elements
# SIMD operates each elements independently
# pd : double(64 bits float)
# ps : float(32 bits float)
# epi32/64 : extended packed integer 32/64 bits
# epu8/16/32/64 : extended packed unsigned-integer 8/16/32/64 bits

# AVX-2's unit : 256bits

# operating : add each lanes
# lane unit : float64(double) / lane numbers : 4
func mm256_add_pd*(a, b: M256d): M256d {.importc: "_mm256_add_pd".}

# operating : add each lanes
# lane unit : float32(float) / lane numbers : 8
func mm256_add_ps*(a, b: M256): M256 {.importc: "_mm256_add_ps".}

# operating : adds even lanes and subtracts odd lanes (b[i] +/- a[i])
# lane unit : float64(double) / lane numbers : 4
func mm256_addsub_pd*(a, b: M256d): M256d {.importc: "_mm256_addsub_pd".}

# operating : adds even lanes and subtracts odd lanes (b[i] +/- a[i])
# lane unit : float32(float) / lane numbers : 8
func mm256_addsub_ps*(a, b: M256): M256 {.importc: "_mm256_addsub_ps".}

# operating : bitwise AND operation for 256-bit
# lane unit : 256-bit raw / lane numbers : 1
func mm256_and_pd*(a, b: M256d): M256d {.importc: "_mm256_and_pd".}

# operating : bitwise AND operation for 256-bit
# lane unit : 256-bit raw / lane numbers : 1
func mm256_and_ps*(a, b: M256): M256 {.importc: "_mm256_and_ps".}

# operating : bitwise NOT for 'a', then bitwise AND with 'b' ((NOT a) AND b)
# lane unit : 256-bit raw / lane numbers : 1
func mm256_andnot_pd*(a, b: M256d): M256d {.importc: "_mm256_andnot_pd".}

# operating : bitwise NOT for 'a', then bitwise AND with 'b' ((NOT a) AND b)
# lane unit : 256-bit raw / lane numbers : 1
func mm256_andnot_ps*(a, b: M256): M256 {.importc: "_mm256_andnot_ps".}

# operating : select elements between a and b using static 8-bit immediate mask
# lane unit : float64(double) / lane numbers : 4 (uses lower 4 bits of imm8)
func mm256_blend_pd*(a, b: M256d, imm8: int32 | uint32): M256d {.importc: "_mm256_blend_pd".}

# operating : select elements between a and b using static 8-bit immediate mask
# lane unit : float32(float) / lane numbers : 8 (uses all 8 bits of imm8)
func mm256_blend_ps*(a, b: M256, imm8: int32 | uint32): M256 {.importc: "_mm256_blend_ps".}

# operating : select elements between a and b using the sign bit (MSB) of the mask register
# lane unit : float64(double) / lane numbers : 4
# if mask[i].MSB == 1: result[i] = b[i], else: result[i] = a[i]
func mm256_blendv_pd*(a, b, mask: M256d): M256d {.importc: "_mm256_blendv_pd".}

# operating : select elements between a and b using the sign bit (MSB) of the mask register
# lane unit : float32(float) / lane numbers : 8
# if mask[i].MSB == 1: result[i] = b[i], else: result[i] = a[i]
func mm256_blendv_ps*(a, b, mask: M256): M256 {.importc: "_mm256_blendv_ps".}

# operating : load 128-bit(2 doubles) from memory and copy to all 128-bit lanes
# lane unit : float64(double) x 2 / lane numbers : 2 groups (total 4 doubles)
func mm256_broadcast_pd*(p: pointer): M256d {.importc: "_mm256_broadcast_pd".}

# operating : load 128-bit(4 floats) from memory and copy to all 128-bit lanes
# lane unit : float32(float) x 4 / lane numbers : 2 groups (total 8 floats)
func mm256_broadcast_ps*(p: pointer): M256 {.importc: "_mm256_broadcast_ps".}

# operating : load 1 double (64-bit) from memory and broadcast to all 4 lanes
# lane unit : float64(double) / lane numbers : 4
func mm256_broadcast_sd*(p: pointer): M256d {.importc: "_mm256_broadcast_sd".}

# operating : load 1 float (32-bit) from memory and broadcast to all 4 lanes
# lane unit : float32(float) / lane numbers : 4 (128-bit register)
func mm_broadcast_ss*(p: pointer): M128 {.importc: "_mm_broadcast_ss".}

# operating : load 1 float (32-bit) from memory and broadcast to all 8 lanes
# lane unit : float32(float) / lane numbers : 8 (256-bit register)
func mm256_broadcast_ss*(p: pointer): M256 {.importc: "_mm256_broadcast_ss".}

# operating : reinterprets M256d(double) as M256(float) without conversion
# lane unit : bit-reinterpret / lane numbers : N/A
func mm256_castpd_ps*(a: M256d): M256 {.importc: "_mm256_castpd_ps".}

# operating : reinterprets M256d(double) as M256i(integer) without conversion
# lane unit : bit-reinterpret / lane numbers : N/A
func mm256_castpd_si256*(a: M256d): M256i {.importc: "_mm256_castpd_si256".}

# operating : cast 128-bit to 256-bit (upper 128-bit becomes undefined)
# lane unit : width-expand / lane numbers : 128 -> 256
func mm256_castpd128_pd256*(a: M128d): M256d {.importc: "_mm256_castpd128_pd256".}

# operating : cast 256-bit to 128-bit (extracts lower 128-bit, ignores upper)
# lane unit : width-truncate / lane numbers : 256 -> 128
func mm256_castpd256_pd128*(a: M256d): M128d {.importc: "_mm256_castpd256_pd128".}

# operating : reinterprets M256(float) as M256d(double) without conversion
func mm256_castps_pd*(a: M256): M256d {.importc: "_mm256_castps_pd".}

# operating : reinterprets M256d(double) as M256i(integer) without conversion
# lane unit : bit-reinterpret / lane numbers : N/A
func mm256_castps_si256*(a: M256): M256i {.importc: "_mm256_castps_si256".}

# operating : cast 128-bit to 256-bit (upper 128-bit becomes undefined)
func mm256_castps128_ps256*(a: M128): M256 {.importc: "_mm256_castps128_ps256".}

# operating : cast 256-bit to 128-bit (extracts lower 128-bit)
func mm256_castps256_ps128*(a: M256): M128 {.importc: "_mm256_castps256_ps128".}

# operating : cast 128-bit integer to 256-bit (upper 128-bit becomes undefined)
func mm256_castsi128_si256*(a: M128i): M256i {.importc: "_mm256_castsi128_si256".}

# operating : reinterprets M256i(integer) as M256d(double) without conversion
func mm256_castsi256_pd*(a: M256i): M256d {.importc: "_mm256_castsi256_pd".}

# operating : reinterprets M256i(integer) as M256(float) without conversion
func mm256_castsi256_ps*(a: M256i): M256 {.importc: "_mm256_castsi256_ps".}

# operating : cast 256-bit integer to 128-bit (extracts lower 128-bit)
func mm256_castsi256_si128*(a: M256i): M128i {.importc: "_mm256_castsi256_si128".}

# operating : round each double-precision element up to the nearest integer
# lane unit : float64(pd) / lane numbers : 4
func mm256_ceil_pd*(a: M256d): M256d {.importc: "_mm256_ceil_pd".}

# operating : round each single-precision element up to the nearest integer
# lane unit : float32(ps) / lane numbers : 8
func mm256_ceil_ps*(a: M256): M256 {.importc: "_mm256_ceil_ps".}

# imm8 list
# 0 : _CMP_EQ_OQ : a == b
# 1 : _CMP_LT_OS : a < b
# 2 : _CMP_LE_OS : a <= b
# 4 : _CMP_NEQ_UQ : a != b

# operating : compare packed double-precision elements using imm8 condition
# lane unit : float64(pd) / lane numbers : 2 (128-bit)
func mm_cmp_pd*(a, b: M128d, imm8: int32 | uint32): M128d {.importc: "_mm_cmp_pd".}

# operating : compare packed double-precision elements using imm8 condition
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_cmp_pd*(a, b: M256d, imm8: int32 | uint32): M256d {.importc: "_mm256_cmp_pd".}

# operating : compare packed single-precision elements using imm8 condition
# lane unit : float32(ps) / lane numbers : 4 (128-bit)
func mm_cmp_ps*(a, b: M128, imm8: int32 | uint32): M128 {.importc: "_mm_cmp_ps".}

# operating : compare packed single-precision elements using imm8 condition
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_cmp_ps*(a, b: M256, imm8: int32 | uint32): M256 {.importc: "_mm256_cmp_ps".}

# operating : compare the lowest double-precision element and preserve upper bits from 'a'
# lane unit : float64(sd) / lane numbers : 1 (low 64-bit)
func mm_cmp_sd*(a, b: M128d, imm8: int32 | uint32): M128d {.importc: "_mm_cmp_sd".}

# operating : compare the lowest single-precision element and preserve upper bits from 'a'
# lane unit : float32(ss) / lane numbers : 1 (low 32-bit)
func mm_cmp_ss*(a, b: M128, imm8: int32 | uint32): M128 {.importc: "_mm_cmp_ss".}

# operating : convert 4 packed signed 32-bit integers to 4 packed float64
# lane unit : i32 to f64 / lane numbers : 4 (128-bit to 256-bit)
func mm256_cvtepi32_pd*(a: M128i): M256d {.importc: "_mm256_cvtepi32_pd".}

# operating : convert 8 packed signed 32-bit integers to 8 packed float32
# lane unit : i32 to f32 / lane numbers : 8 (256-bit)
func mm256_cvtepi32_ps*(a: M256i): M256 {.importc: "_mm256_cvtepi32_ps".}

# operating : convert 4 packed float64 to 4 packed signed 32-bit integers (rounding)
# lane unit : f64 to i32 / lane numbers : 4 (256-bit to 128-bit)
func mm256_cvtpd_epi32*(a: M256d): M128i {.importc: "_mm256_cvtpd_epi32".}

# operating : convert 4 packed float64 to 4 packed float32
# lane unit : f64 to f32 / lane numbers : 4 (256-bit to 128-bit)
func mm256_cvtpd_ps*(a: M256d): M128 {.importc: "_mm256_cvtpd_ps".}

# operating : convert 8 packed float32 to 8 packed signed 32-bit integers (rounding)
# lane unit : f32 to i32 / lane numbers : 8 (256-bit)
func mm256_cvtps_epi32*(a: M256): M256i {.importc: "_mm256_cvtps_epi32".}

# operating : convert 4 packed float32 to 4 packed float64
# lane unit : f32 to f64 / lane numbers : 4 (128-bit to 256-bit)
func mm256_cvtps_pd*(a: M128): M256d {.importc: "_mm256_cvtps_pd".}

# operating : extract the lowest float64 element to scalar float64
# lane unit : f64 / lane numbers : 1 (low 64-bit)
func mm256_cvtsd_f64*(a: M256d): float64 {.importc: "_mm256_cvtsd_f64".}

# operating : extract the lowest 32-bit integer to scalar int32
# lane unit : i32 / lane numbers : 1 (low 32-bit)
func mm256_cvtsi256_si32*(a: M256i): int32 {.importc: "_mm256_cvtsi256_si32".}

# operating : extract the lowest float32 element to scalar float32
# lane unit : f32 / lane numbers : 1 (low 32-bit)
func mm256_cvtss_f32*(a: M256): float32 {.importc: "_mm256_cvtss_f32".}

# operating : convert 4 packed float64 to 4 packed i32 with truncation
# lane unit : f64 to i32 / lane numbers : 4 (256-bit to 128-bit)
func mm256_cvttpd_epi32*(a: M256d): M128i {.importc: "_mm256_cvttpd_epi32".}

# operating : convert 8 packed float32 to 8 packed i32 with truncation
# lane unit : f32 to i32 / lane numbers : 8 (256-bit)
func mm256_cvttps_epi32*(a: M256): M256i {.importc: "_mm256_cvttps_epi32".}

# operating : divide packed double-precision elements in 'a' by 'b'
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_div_pd*(a, b: M256d): M256d {.importc: "_mm256_div_pd".}

# operating : divide packed single-precision elements in 'a' by 'b'
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_div_ps*(a, b: M256): M256 {.importc: "_mm256_div_ps".}

# operating : compute the dot product of packed single-precision elements in 'a' and 'b'
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
# note : 'imm8' controls which elements are multiplied and where the result is stored
func mm256_dp_ps*(a, b: M256, imm8: int32 | uint32): M256 {.importc: "_mm256_dp_ps".}

# operating : extract a 32-bit integer from 'a' at the specified index
# lane unit : i32 / lane numbers : 1 (from 8 possible slots)
func mm256_extract_epi32*(a: M256i, index: int32 | uint32): int32 {.importc: "_mm256_extract_epi32".}

# operating : extract a 32-bit integer from 'a' at the specified index
# lane unit : i32 / lane numbers : 1 (from 8 possible slots)
func mm256_extract_epi64*(a: M256i, index: int32 | uint32): int64 {.importc: "_mm256_extract_epi64".}

# operating : extract a 128-bit lane of double-precision elements from 'a'
# lane unit : M128d (2 x f64) / lane numbers : 2 (imm8: 0 for low, 1 for high)
func mm256_extractf128_pd*(a: M256d, imm8: int32 | uint32): M128d {.importc: "_mm256_extractf128_pd".}

# operating : extract a 128-bit lane of single-precision elements from 'a'
# lane unit : M128 (4 x f32) / lane numbers : 4 (imm8: 0 for low, 1 for high)
func mm256_extractf128_ps*(a: M256, imm8: int32 | uint32): M128 {.importc: "_mm256_extractf128_ps".}

# operating : extract a 128-bit lane of integer elements from 'a'
# lane unit : M128i / lane numbers : 1 (imm8: 0 for low, 1 for high)
func mm256_extractf128_si256*(a: M256i, imm8: int32 | uint32): M128i {.importc: "_mm256_extractf128_si256".}

# operating : round each double-precision element down to the nearest integer
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_floor_pd*(a: M256d): M256d {.importc: "_mm256_floor_pd".}

# operating : round each single-precision element down to the nearest integer
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_floor_ps*(a: M256): M256 {.importc: "_mm256_floor_ps".}

# operating : horizontally add adjacent pairs of double-precision elements in 'a' and 'b'
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_hadd_pd*(a, b: M256d): M256d {.importc: "_mm256_hadd_pd".}

# operating : horizontally add adjacent pairs of single-precision elements in 'a' and 'b'
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_hadd_ps*(a, b: M256): M256 {.importc: "_mm256_hadd_ps".}

# operating : horizontally subtract adjacent pairs of double-precision elements in 'a' and 'b'
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_hsub_pd*(a, b: M256d): M256d {.importc: "_mm256_hsub_pd".}

# operating : horizontally subtract adjacent pairs of single-precision elements in 'a' and 'b'
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_hsub_ps*(a, b: M256): M256 {.importc: "_mm256_hsub_ps".}

# operating : insert an integer value into 'a' at the specified index
# lane unit : i8~i64 / lane numbers : 1 (scalar to vector)
func mm256_insert_epi16*(a: M256i, i: int16 | uint16, index: int32 | uint32): M256i {.importc: "_mm256_insert_epi16".}

func mm256_insert_epi32*(a: M256i, i: int32 | uint32, index: int32 | uint32): M256i {.importc: "_mm256_insert_epi32".}

func mm256_insert_epi64*(a: M256i, i: int64 | uint64, index: int32 | uint32): M256i {.importc: "_mm256_insert_epi64".}

func mm256_insert_epi8*(a: M256i, i: int8 | uint8, index: int32 | uint32): M256i {.importc: "_mm256_insert_epi8".}

# operating : insert a 128-bit lane 'b' into 'a' at the specified position
# lane unit : M128d, M128, M128i / lane numbers : 1 (imm8: 0 for low, 1 for high)
func mm256_insertf128_pd*(a: M256d, b: M128d, imm8: int32 | uint32): M256d {.importc: "_mm256_insertf128_pd".}

func mm256_insertf128_ps*(a: M256, b: M128, imm8: int32 | uint32): M256 {.importc: "_mm256_insertf128_ps".}

func mm256_insertf128_si256*(a: M256i, b: M128i, imm8: int32 | uint32): M256i {.importc: "_mm256_insertf128_si256".}

# operating : load 256-bits of integer data from unaligned memory (special handling for cache line splits)
# lane unit : i8~i64 / lane numbers : 32 (8-bit) to 4 (64-bit)
# note : legacy intrinsic, usually maps to VMOVDQU on modern CPUs
func mm256_lddqu_si256*(p: pointer): M256i {.importc: "_mm256_lddqu_si256".}

# operating : load 256-bits of double-precision float data from aligned memory
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
# note : address 'p' must be aligned on a 32-byte boundary
func mm256_load_pd*(p: pointer): M256d {.importc: "_mm256_load_pd".}

# operating : load 256-bits of single-precision float data from aligned memory
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
# note : address 'p' must be aligned on a 32-byte boundary
func mm256_load_ps*(p: pointer): M256 {.importc: "_mm256_load_ps".}

# operating : load 256-bits of integer data from aligned memory
# lane unit : i8~i64 / lane numbers : 32 (8-bit) to 4 (64-bit)
# note : address 'p' must be aligned on a 32-byte boundary
func mm256_load_si256*(p: pointer): M256i {.importc: "_mm256_load_si256".}

# operating : load 256-bits of double-precision float data from unaligned memory
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_loadu_pd*(p: pointer): M256d {.importc: "_mm256_loadu_pd".}

# operating : load 256-bits of single-precision float data from unaligned memory
# lane unit : float32(ps) / lane numbers : 8 (256-bit)ssssss
func mm256_loadu_ps(p: ptr float32): M256 {.importc: "_mm256_loadu_ps".}

# operating : load 256-bits of integer data from unaligned memory
# lane unit : i8~i64 / lane numbers : 32 (8-bit) to 4 (64-bit)
template mm256_loadu_ps*(p: pointer): M256 =
  mm256_loadu_ps(cast[ptr float32](p))

func mm256_loadu_si256(p: ptr M256i): M256i {.importc: "_mm256_loadu_si256".}

template mm256_loadu_si256*(p: pointer): M256i =
  mm256_loadu_si256(cast[ptr M256i](p))

# operating : load two 128-bit blocks of single-precision floats into one 256-bit register
# lane unit : float32(ps) / lane numbers : 4+4 (128-bit + 128-bit)
func mm256_loadu2_m128*(hi, lo: pointer): M256 {.importc: "_mm256_loadu2_m128".}

# operating : load two 128-bit blocks of double-precision floats into one 256-bit register
# lane unit : float64(pd) / lane numbers : 2+2 (128-bit + 128-bit)
func mm256_loadu2_m128d*(hi, lo: pointer): M256d {.importc: "_mm256_loadu2_m128d".}

# operating : load two 128-bit blocks of integer data into one 256-bit register
# lane unit : i8~i64 / lane numbers : 128-bit + 128-bit
func mm256_loadu2_m128i*(hi, lo: pointer): M256i {.importc: "_mm256_loadu2_m128i".}

# operating : load packed double-precision floats from memory using a mask
# lane unit : float64(pd) / lane numbers : 2 (128-bit) or 4 (256-bit)
func mm_maskload_pd*(p: pointer, mask: M128i): M256d {.importc: "_mm_maskload_pd".}
func mm256_maskload_pd*(p: pointer, mask: M256i): M256d {.importc: "_mm256_maskload_pd".}

# operating : load packed single-precision floats from memory using a mask
# lane unit : float32(ps) / lane numbers : 4 (128-bit) or 8 (256-bit)
func mm_maskload_ps*(p: pointer, mask: M128i): M128 {.importc: "_mm_maskload_ps".}
func mm256_maskload_ps*(p: pointer, mask: M256i): M256 {.importc: "_mm256_maskload_ps".}

# operating : store packed double-precision floats to memory using a mask
# lane unit : float64(pd) / lane numbers : 2 (128-bit) or 4 (256-bit)
func mm_maskstore_pd*(p: pointer, mask: M128i, a: M128d) {.importc: "_mm_maskstore_pd".}
func mm256_maskstore_pd*(p: pointer, mask: M256i, a: M256d) {.importc: "_mm256_maskstore_pd".}

# operating : store packed single-precision floats to memory using a mask
# lane unit : float32(ps) / lane numbers : 4 (128-bit) or 8 (256-bit)
func mm_maskstore_ps*(p: pointer, mask: M128i, a: M128) {.importc: "_mm_maskstore_ps".}
func mm256_maskstore_ps*(p: pointer, mask: M256i, a: M256) {.importc: "_mm256_maskstore_ps".}

# operating : select the maximum value between packed elements in 'a' and 'b'
# lane unit : float64(pd), float32(ps) / lane numbers : 4 or 8 (256-bit)
func mm256_max_pd*(a, b: M256d): M256d {.importc: "_mm256_max_pd".}
func mm256_max_ps*(a, b: M256): M256 {.importc: "_mm256_max_ps".}

# operating : select the minimum value between packed elements in 'a' and 'b'
# lane unit : float64(pd), float32(ps) / lane numbers : 4 or 8 (256-bit)
func mm256_min_pd*(a, b: M256d): M256d {.importc: "_mm256_min_pd".}
func mm256_min_ps*(a, b: M256): M256 {.importc: "_mm256_min_ps".}

# operating : duplicate even-indexed double-precision elements to adjacent odd-indexed slots
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_movedup_pd*(a: M256d): M256d {.importc: "_mm256_movedup_pd".}

# operating : duplicate high (odd-indexed) single-precision elements in each 64-bit block
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_movehdup_ps*(a: M256): M256 {.importc: "_mm256_movehdup_ps".}

# operating : duplicate low (even-indexed) single-precision elements in each 64-bit block
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_moveldup_ps*(a: M256): M256 {.importc: "_mm256_moveldup_ps".}

# operating : create an 4-bit or 8-bit mask from the most significant bit of each element
# lane unit : MSB of float64/float32 / lane numbers : 4 or 8 (returns int32)
func mm256_movemask_pd*(a: M256d): int32 {.importc: "_mm256_movemask_pd".}
func mm256_movemask_ps*(a: M256): int32 {.importc: "_mm256_movemask_ps".}

# operating : multiply packed double-precision floating-point elements in 'a' and 'b'
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_mul_pd*(a, b: M256d): M256d {.importc: "_mm256_mul_pd".}

# operating : multiply packed single-precision floating-point elements in 'a' and 'b'
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_mul_ps*(a, b: M256): M256 {.importc: "_mm256_mul_ps".}

# operating : compute the bitwise OR of packed double-precision floating-point elements
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_or_pd*(a, b: M256d): M256d {.importc: "_mm256_or_pd".}

# operating : compute the bitwise OR of packed single-precision floating-point elements
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_or_ps*(a, b: M256): M256 {.importc: "_mm256_or_ps".}

# operating : permute double-precision elements within 128-bit lanes using imm8
# lane unit : float64(pd) / lane numbers : 2 (128-bit) or 4 (256-bit)
func mm_permute_pd*(a: M128d, imm8: int32 | uint32): M128d {.importc: "_mm_permute_pd".}
func mm256_permute_pd*(a: M256d, imm8: int32 | uint32): M256d {.importc: "_mm256_permute_pd".}

# operating : permute single-precision elements within 128-bit lanes using imm8
# lane unit : float32(ps) / lane numbers : 4 (128-bit) or 8 (256-bit)
func mm_permute_ps*(a: M128, imm8: int32 | uint32): M128 {.importc: "_mm_permute_ps".}
func mm256_permute_ps*(a: M256, imm8: int32 | uint32): M256 {.importc: "_mm256_permute_ps".}

# operating : permute 128-bit lanes from 'a' and 'b' using imm8
# lane unit : 128-bit blocks / lane numbers : 2 (from a total of 4 available lanes)
func mm256_permute2f128_pd*(a, b: M256d, imm8: int32 | uint32): M256d {.importc: "_mm256_permute2f128_pd".}
func mm256_permute2f128_ps*(a, b: M256, imm8: int32 | uint32): M256 {.importc: "_mm256_permute2f128_ps".}
func mm256_permute2f128_si256*(a, b: M256i, imm8: int32 | uint32): M256i {.importc: "_mm256_permute2f128_si256".}

# operating : permute double-precision elements using indices in vector 'b'
# lane unit : float64(pd) / lane numbers : 2 (128-bit) or 4 (256-bit)
func mm_permutevar_pd*(a: M128d, b: M128i): M128d {.importc: "_mm_permutevar_pd".}
func mm256_permutevar_pd*(a: M256d, b: M256i): M256d {.importc: "_mm256_permutevar_pd".}

# operating : permute single-precision elements using indices in vector 'b'
# lane unit : float32(ps) / lane numbers : 4 (128-bit) or 8 (256-bit)
func mm_permutevar_ps*(a: M128, b: M128i): M128 {.importc: "_mm_permutevar_ps".}
func mm256_permutevar_ps*(a: M256, b: M256i): M256 {.importc: "_mm256_permutevar_ps".}
# operating : compute the approximate reciprocal of packed single-precision floating-point elements
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_rcp_ps*(a: M256): M256 {.importc: "_mm256_rcp_ps".}

# operating : round packed double-precision floating-point elements using the rounding parameter
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_round_pd*(a: M256d, rounding: int32 | uint32): M256d {.importc: "_mm256_round_pd".}

# operating : round packed single-precision floating-point elements using the rounding parameter
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_round_ps*(a: M256, rounding: int32 | uint32): M256 {.importc: "_mm256_round_ps".}

# operating : compute the approximate reciprocal square root of packed single-precision floating-point elements
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_rsqrt_ps*(a: M256): M256 {.importc: "_mm256_rsqrt_ps".}

# operating : set packed 16-bit integers with the supplied values in reverse order
# lane unit : int16(epi16) / lane numbers : 16 (256-bit)
func mm256_set_epi16*(e15, e14, e13, e12, e11, e10, e9, e8, e7, e6, e5, e4, e3, e2, e1, e0: int16 | uint16): M256i {.importc: "_mm256_set_epi16".}

# operating : set packed 32-bit integers with the supplied values in reverse order
# lane unit : int32(epi32) / lane numbers : 8 (256-bit)
func mm256_set_epi32*(e7, e6, e5, e4, e3, e2, e1, e0: int32 | uint32): M256i {.importc: "_mm256_set_epi32".}

# operating : set packed 64-bit integers with the supplied values in reverse order
# lane unit : int64(epi64x) / lane numbers : 4 (256-bit)
func mm256_set_epi64x*(e3, e2, e1, e0: int64 | uint64): M256i {.importc: "_mm256_set_epi64x".}

# operating : set packed 8-bit integers with the supplied values in reverse order
# lane unit : int8(epi8) / lane numbers : 32 (256-bit)
func mm256_set_epi8*(e31, e30, e29, e28, e27, e26, e25, e24, e23, e22, e21, e20, e19, e18, e17, e16, e15, e14, e13, e12, e11, e10, e9, e8, e7, e6, e5, e4, e3, e2, e1, e0: int8 | uint8): M256i {.importc: "_mm256_set_epi8".}

# operating : combine two 128-bit single-precision vectors into one 256-bit vector
# lane unit : 128-bit block / lane numbers : 2 (256-bit)
func mm256_set_m128*(hi, lo: M128): M256 {.importc: "_mm256_set_m128".}

# operating : combine two 128-bit double-precision vectors into one 256-bit vector
# lane unit : 128-bit block / lane numbers : 2 (256-bit)
func mm256_set_m128d*(hi, lo: M128d): M256d {.importc: "_mm256_set_m128d".}

# operating : combine two 128-bit integer vectors into one 256-bit vector
# lane unit : 128-bit block / lane numbers : 2 (256-bit)
func mm256_set_m128i*(hi, lo: M128i): M256i {.importc: "_mm256_set_m128i".}

# operating : set packed double-precision floating-point elements with the supplied values in reverse order
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_set_pd*(e3, e2, e1, e0: float64): M256d {.importc: "_mm256_set_pd".}

# operating : set packed single-precision floating-point elements with the supplied values in reverse order
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_set_ps*(e7, e6, e5, e4, e3, e2, e1, e0: float32): M256 {.importc: "_mm256_set_ps".}

# operating : broadcast a 16-bit integer to all elements
# lane unit : int16(epi16) / lane numbers : 16 (256-bit)
func mm256_set1_epi16*(a: int16 | uint16): M256i {.importc: "_mm256_set1_epi16".}

# operating : broadcast a 32-bit integer to all elements
# lane unit : int32(epi32) / lane numbers : 8 (256-bit)
func mm256_set1_epi32*(a: int32 | uint32): M256i {.importc: "_mm256_set1_epi32".}

# operating : broadcast a 64-bit integer to all elements
# lane unit : int64(epi64x) / lane numbers : 4 (256-bit)
func mm256_set1_epi64x*(a: int64 | uint64): M256i {.importc: "_mm256_set1_epi64x".}

# operating : broadcast an 8-bit integer to all elements
# lane unit : int8(epi8) / lane numbers : 32 (256-bit)
func mm256_set1_epi8*(a: int8 | uint8): M256i {.importc: "_mm256_set1_epi8".}

# operating : broadcast a double-precision floating-point value to all elements
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_set1_pd*(a: float64): M256d {.importc: "_mm256_set1_pd".}

# operating : broadcast a single-precision floating-point value to all elements
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_set1_ps*(a: float32): M256 {.importc: "_mm256_set1_ps".}

# operating : set packed 16-bit integers with the supplied values in natural order
# lane unit : int16(epi16) / lane numbers : 16 (256-bit)
func mm256_setr_epi16*(e15, e14, e13, e12, e11, e10, e9, e8, e7, e6, e5, e4, e3, e2, e1, e0: int16 | uint16): M256i {.importc: "_mm256_setr_epi16".}

# operating : set packed 32-bit integers with the supplied values in natural order
# lane unit : int32(epi32) / lane numbers : 8 (256-bit)
func mm256_setr_epi32*(e7, e6, e5, e4, e3, e2, e1, e0: int32 | uint32): M256i {.importc: "_mm256_setr_epi32".}

# operating : set packed 64-bit integers with the supplied values in natural order
# lane unit : int64(epi64x) / lane numbers : 4 (256-bit)
func mm256_setr_epi64x*(e3, e2, e1, e0: int64 | uint64): M256i {.importc: "_mm256_setr_epi64x".}

# operating : set packed 8-bit integers with the supplied values in natural order
# lane unit : int8(epi8) / lane numbers : 32 (256-bit)
func mm256_setr_epi8*(e31, e30, e29, e28, e27, e26, e25, e24, e23, e22, e21, e20, e19, e18, e17, e16, e15, e14, e13, e12, e11, e10, e9, e8, e7, e6, e5, e4, e3, e2, e1, e0: int8 | uint8): M256i {.importc: "_mm256_setr_epi8".}

# operating : combine two 128-bit single-precision vectors into one 256-bit vector in natural order
# lane unit : 128-bit block / lane numbers : 2 (256-bit)
func mm256_setr_m128*(lo, hi: M128): M256 {.importc: "_mm256_setr_m128".}

# operating : combine two 128-bit double-precision vectors into one 256-bit vector in natural order
# lane unit : 128-bit block / lane numbers : 2 (256-bit)
func mm256_setr_m128d*(lo, hi: M128d): M256d {.importc: "_mm256_setr_m128d".}

# operating : combine two 128-bit integer vectors into one 256-bit vector in natural order
# lane unit : 128-bit block / lane numbers : 2 (256-bit)
func mm256_setr_m128i*(lo, hi: M128i): M256i {.importc: "_mm256_setr_m128i".}

# operating : set packed double-precision floating-point elements with the supplied values in natural order
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_setr_pd*(e3, e2, e1, e0: float64): M256d {.importc: "_mm256_setr_pd".}

# operating : set packed single-precision floating-point elements with the supplied values in natural order
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_setr_ps*(e7, e6, e5, e4, e3, e2, e1, e0: float32): M256 {.importc: "_mm256_setr_ps".}

# operating : initialize a 256-bit vector with all zeros
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_setzero_pd*(): M256d {.importc: "_mm256_setzero_pd".}

# operating : initialize a 256-bit vector with all zeros
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_setzero_ps*(): M256 {.importc: "_mm256_setzero_ps".}

# operating : initialize a 256-bit vector with all zeros
# lane unit : any (integer) / lane numbers : 256-bit total
func mm256_setzero_si256*(): M256i {.importc: "_mm256_setzero_si256".}

# operating : shuffle double-precision elements from 'a' and 'b' within 128-bit lanes using imm8
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_shuffle_pd*(a, b: M256d, imm8: int32 | uint32): M256d {.importc: "_mm256_shuffle_pd".}

# operating : shuffle single-precision elements from 'a' and 'b' within 128-bit lanes using imm8
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_shuffle_ps*(a, b: M256, imm8: int32 | uint32): M256 {.importc: "_mm256_shuffle_ps".}

# operating : compute the square root of packed double-precision floating-point elements
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_sqrt_pd*(a: M256d): M256d {.importc: "_mm256_sqrt_pd".}

# operating : compute the square root of packed single-precision floating-point elements
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_sqrt_ps*(a: M256): M256 {.importc: "_mm256_sqrt_ps".}

# operating : store 256-bits (4 double-precision elements) into an aligned memory location
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_store_pd*(p: pointer, a: M256d) {.importc: "_mm256_store_pd".}

# operating : store 256-bits (8 single-precision elements) into an aligned memory location
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_store_ps*(p: pointer, a: M256) {.importc: "_mm256_store_ps".}

# operating : store 256-bits (integer data) into an aligned memory location
# lane unit : any (integer) / lane numbers : 256-bit total
func mm256_store_si256*(p: pointer, a: M256i) {.importc: "_mm256_store_si256".}

# operating : store 256-bits (4 double-precision elements) into an unaligned memory location
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_storeu_pd*(p: pointer, a: M256d) {.importc: "_mm256_storeu_pd".}

# operating : store 256-bits (8 single-precision elements) into an unaligned memory location
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_storeu_ps(p: ptr float32, a: M256) {.importc: "_mm256_storeu_ps".}
# operating : store 256-bits (8 single-precision elements) into an unaligned memory location
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
template mm256_storeu_ps*(p: pointer, a: M256) =
  mm256_storeu_ps(cast[ptr float32](p), a)

# operating : store 256-bits (integer data) into an unaligned memory location
# lane unit : any (integer) / lane numbers : 256-bit total
func mm256_storeu_si256(p: ptr M256i, a: M256i) {.importc: "_mm256_storeu_si256".}

# operating : store 256-bits (integer data) into an unaligned memory location (template wrapper)
# lane unit : any (integer) / lane numbers : 256-bit total
template mm256_storeu_si256*(p: pointer, a: M256i) =
  mm256_storeu_si256(cast[ptr M256i](p), a)

# operating : store the high and low 128-bit halves of a 256-bit single-precision vector to separate memory locations
# lane unit : float32(ps) / lane numbers : 4 + 4 (256-bit)
func mm256_storeu2_m128*(hi, lo: pointer) {.importc: "_mm256_storeu2_m128".}

# operating : store the high and low 128-bit halves of a 256-bit double-precision vector to separate memory locations
# lane unit : float64(pd) / lane numbers : 2 + 2 (256-bit)
func mm256_storeu2_m128d*(hi, lo: pointer) {.importc: "_mm256_storeu2_m128d".}

# operating : store the high and low 128-bit halves of a 256-bit integer vector to separate memory locations
# lane unit : any (integer) / lane numbers : 128-bit + 128-bit (256-bit)
func mm256_storeu2_m128i*(hi, lo: pointer) {.importc: "_mm256_storeu2_m128i".}

# operating : store 256-bits of double-precision data using a non-temporal hint (bypassing cache)
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_stream_pd*(p: pointer, a: M256d) {.importc: "_mm256_stream_pd".}

# operating : store 256-bits of single-precision data using a non-temporal hint (bypassing cache)
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_stream_ps*(p: pointer, a: M256) {.importc: "_mm256_stream_ps".}

# operating : store 256-bits of integer data using a non-temporal hint (bypassing cache)
# lane unit : any (integer) / lane numbers : 256-bit total
func mm256_stream_si256*(p: pointer, a: M256i) {.importc: "_mm256_stream_si256".}

# operating : subtract packed double-precision floating-point elements in 'b' from 'a'
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_sub_pd*(a, b: M256d): M256d {.importc: "_mm256_sub_pd".}

# operating : subtract packed single-precision floating-point elements in 'b' from 'a'
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_sub_ps*(a, b: M256): M256 {.importc: "_mm256_sub_ps".}

# operating : compute the carry flag using bitwise AND of NOT 'a' and 'b' (Check if all bits in 'b' are set in 'a')
# lane unit : float64(pd) / lane numbers : 2 (128-bit) or 4 (256-bit)
func mm_testc_pd*(a, b: M128d): int32 {.importc: "_mm_testc_pd".}
func mm256_testc_pd*(a, b: M256d): int32 {.importc: "_mm256_testc_pd".}

# operating : compute the carry flag using bitwise AND of NOT 'a' and 'b'
# lane unit : float32(ps) / lane numbers : 4 (128-bit) or 8 (256-bit)
func mm_testc_ps*(a, b: M128): int32 {.importc: "_mm_testc_ps".}
func mm256_testc_ps*(a, b: M256): int32 {.importc: "_mm256_testc_ps".}

# operating : compute the carry flag using bitwise AND of NOT 'a' and 'b'
# lane unit : any (integer) / lane numbers : 256-bit total
func mm256_testc_si256*(a, b: M256i): int32 {.importc: "_mm256_testc_si256".}

# operating : compute both zero and carry flags (checks if any bit is set and if some but not all bits are set)
# lane unit : float64(pd) / lane numbers : 2 (128-bit) or 4 (256-bit)
func mm_testnzc_pd*(a, b: M128d): int32 {.importc: "_mm_testnzc_pd".}
func mm256_testnzc_pd*(a, b: M256d): int32 {.importc: "_mm256_testnzc_pd".}

# operating : compute both zero and carry flags
# lane unit : float32(ps) / lane numbers : 4 (128-bit) or 8 (256-bit)
func mm_testnzc_ps*(a, b: M128): int32 {.importc: "_mm_testnzc_ps".}
func mm256_testnzc_ps*(a, b: M256): int32 {.importc: "_mm256_testnzc_ps".}

# operating : compute both zero and carry flags
# lane unit : any (integer) / lane numbers : 256-bit total
func mm256_testnzc_si256*(a, b: M256i): int32 {.importc: "_mm256_testnzc_si256".}

# operating : compute the zero flag using bitwise AND of 'a' and 'b' (Check if no bits of 'b' are set in 'a')
# lane unit : float64(pd) / lane numbers : 2 (128-bit) or 4 (256-bit)
func mm_testz_pd*(a, b: M128d): int32 {.importc: "_mm_testz_pd".}
func mm256_testz_pd*(a, b: M256d): int32 {.importc: "_mm256_testz_pd".}

# operating : compute the zero flag using bitwise AND of 'a' and 'b'
# lane unit : float32(ps) / lane numbers : 4 (128-bit) or 8 (256-bit)
func mm_testz_ps*(a, b: M128): int32 {.importc: "_mm_testz_ps".}
func mm256_testz_ps*(a, b: M256): int32 {.importc: "_mm256_testz_ps".}

# operating : compute the zero flag using bitwise AND of 'a' and 'b'
# lane unit : any (integer) / lane numbers : 256-bit total
func mm256_testz_si256*(a, b: M256i): int32 {.importc: "_mm256_testz_si256".}

# operating : return a 256-bit vector of uninitialized double-precision elements
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_undefined_pd*(): M256d {.importc: "_mm256_undefined_pd".}

# operating : return a 256-bit vector of uninitialized single-precision elements
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_undefined_ps*(): M256 {.importc: "_mm256_undefined_ps".}

# operating : return a 256-bit vector of uninitialized integer elements
# lane unit : any (integer) / lane numbers : 256-bit total
func mm256_undefined_si256*(): M256i {.importc: "_mm256_undefined_si256".}

# operating : unpack and interleave high double-precision elements from 'a' and 'b' within 128-bit lanes
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_unpackhi_pd*(a, b: M256d): M256d {.importc: "_mm256_unpackhi_pd".}

# operating : unpack and interleave high single-precision elements from 'a' and 'b' within 128-bit lanes
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_unpackhi_ps*(a, b: M256): M256 {.importc: "_mm256_unpackhi_ps".}

# operating : unpack and interleave low double-precision elements from 'a' and 'b' within 128-bit lanes
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_unpacklo_pd*(a, b: M256d): M256d {.importc: "_mm256_unpacklo_pd".}

# operating : unpack and interleave low single-precision elements from 'a' and 'b' within 128-bit lanes
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_unpacklo_ps*(a, b: M256): M256 {.importc: "_mm256_unpacklo_ps".}

# operating : compute the bitwise XOR of packed double-precision floating-point elements
# lane unit : float64(pd) / lane numbers : 4 (256-bit)
func mm256_xor_pd*(a, b: M256d): M256d {.importc: "_mm256_xor_pd".}

# operating : compute the bitwise XOR of packed single-precision floating-point elements
# lane unit : float32(ps) / lane numbers : 8 (256-bit)
func mm256_xor_ps*(a, b: M256): M256 {.importc: "_mm256_xor_ps".}

# operating : set all YMM registers to zero
# lane unit : N/A / lane numbers : All registers
func mm256_zeroall*() {.importc: "_mm256_zeroall".}

# operating : zero the upper 128 bits of all YMM registers
# lane unit : upper 128-bits / lane numbers : All registers
func mm256_zeroupper*() {.importc: "_mm256_zeroupper".}

# operating : zero-extend a 128-bit double-precision vector to 256-bit
# lane unit : float64(pd) / lane numbers : 2 -> 4 (256-bit)
func mm256_zextpd128_pd256*(a: M128d): M256d {.importc: "_mm256_zextpd128_pd256".}

# operating : zero-extend a 128-bit single-precision vector to 256-bit
# lane unit : float32(ps) / lane numbers : 4 -> 8 (256-bit)
func mm256_zextps128_ps256*(a: M128): M256 {.importc: "_mm256_zextps128_ps256".}

# operating : zero-extend a 128-bit integer vector to 256-bit
# lane unit : any (integer) / lane numbers : 128-bit -> 256-bit
func mm256_zextsi128_si256*(a: M128i): M256i {.importc: "_mm256_zextsi128_si256".}

# operating : extract a 16-bit integer from a 256-bit integer vector at a specified index
# lane unit : int16(epi16) / index range : 0 -> 15 (16-bit units in 256-bit)
func mm256_extract_epi16*(x: M256i, n: int32): int32 {.importc: "_mm256_extract_epi16".}

# operating : extract an 8-bit integer from a 256-bit integer vector at a specified index
# lane unit : int8(epi8) / index range : 0 -> 31 (8-bit units in 256-bit)
func mm256_extract_epi8*(x: M256i, n: int32): int32 {.importc: "_mm256_extract_epi8".}

{.pop.}
