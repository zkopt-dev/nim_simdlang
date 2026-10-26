import sse

## SSE and SSE2 intrinsics

template MM_SHUFFLE*(z, y, x, w: int | uint): int32 =
  ((z shl 6) or (y shl 4) or (x shl 2) or w).int32

{.push header: "immintrin.h".}

const
  MM_HINT_T0*: int32 = 3
  MM_HINT_T1*: int32 = 2
  MM_HINT_T2*: int32 = 1
  MM_HINT_NTA*: int32 = 0
  MM_HINT_ET0*: int32 = 7
  MM_HINT_ET1*: int32 = 6

# operating : allocate 'size' bytes of memory aligned to 'align' boundary
# lane unit : N/A / lane numbers : N/A
func mm_malloc*(size, align: int): pointer {.importc: "_mm_malloc".}

# operating : free memory block allocated by _mm_malloc
# lane unit : N/A / lane numbers : N/A
func mm_free*(p: pointer) {.importc: "_mm_free".}

# operating : ensure all previous store instructions are globally visible before subsequent stores
# lane unit : N/A / lane numbers : N/A
func mm_sfence*() {.importc: "_mm_sfence".}

# operating : fetch a line of data from memory into cache before it is actually needed
# lane unit : N/A / lane numbers : N/A
func mm_prefetch*(p: pointer, i: int32) {.importc: "_mm_prefetch".}

{.pop.}

{.push header: "xmmintrin.h".}

# operating : add packed single-precision floats in 'a' and 'b'
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_add_ps*(a, b: M128): M128 {.importc: "_mm_add_ps".}

# operating : add the lowest scalar single-precision float in 'a' and 'b'
# lane unit : float32 / lane numbers : 1
func mm_add_ss*(a, b: M128): M128 {.importc: "_mm_add_ss".}

# operating : compute bitwise AND of packed single-precision floats in 'a' and 'b'
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_and_ps*(a, b: M128): M128 {.importc: "_mm_and_ps".}

# operating : compute bitwise AND NOT of 'a' with 'b' ( (~a) & b )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_andnot_ps*(a, b: M128): M128 {.importc: "_mm_andnot_ps".}

# operating : compare packed single-precision floats for equality ( a == b )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpeq_ps*(a, b: M128): M128 {.importc: "_mm_cmpeq_ps".}

# operating : compare lowest scalar single-precision floats for equality ( a == b )
# lane unit : float32 / lane numbers : 1
func mm_cmpeq_ss*(a, b: M128): M128 {.importc: "_mm_cmpeq_ss".}

# operating : compare packed single-precision floats for greater-than-or-equal ( a >= b )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpge_ps*(a, b: M128): M128 {.importc: "_mm_cmpge_ps".}

# operating : compare lowest scalar single-precision floats for greater-than-or-equal ( a >= b )
# lane unit : float32 / lane numbers : 1
func mm_cmpge_ss*(a, b: M128): M128 {.importc: "_mm_cmpge_ss".}

# operating : compare packed single-precision floats for greater-than ( a > b )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpgt_ps*(a, b: M128): M128 {.importc: "_mm_cmpgt_ps".}

# operating : compare lowest scalar single-precision floats for greater-than ( a > b )
# lane unit : float32 / lane numbers : 1
func mm_cmpgt_ss*(a, b: M128): M128 {.importc: "_mm_cmpgt_ss".}

# operating : compare packed single-precision floats for less-than-or-equal ( a <= b )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmple_ps*(a, b: M128): M128 {.importc: "_mm_cmple_ps".}

# operating : compare lowest scalar single-precision floats for less-than-or-equal ( a <= b )
# lane unit : float32 / lane numbers : 1
func mm_cmple_ss*(a, b: M128): M128 {.importc: "_mm_cmple_ss".}

# operating : compare packed single-precision floats for less-than ( a < b )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmplt_ps*(a, b: M128): M128 {.importc: "_mm_cmplt_ps".}

# operating : compare lowest scalar single-precision floats for less-than ( a < b )
# lane unit : float32 / lane numbers : 1
func mm_cmplt_ss*(a, b: M128): M128 {.importc: "_mm_cmplt_ss".}

# operating : compare packed single-precision floats for inequality ( a != b )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpneq_ps*(a, b: M128): M128 {.importc: "_mm_cmpneq_ps".}

# operating : compare lowest scalar single-precision floats for inequality ( a != b )
# lane unit : float32 / lane numbers : 1
func mm_cmpneq_ss*(a, b: M128): M128 {.importc: "_mm_cmpneq_ss".}

# operating : compare packed single-precision floats for not-greater-than-or-equal ( !(a >= b) )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpnge_ps*(a, b: M128): M128 {.importc: "_mm_cmpnge_ps".}

# operating : compare lowest scalar single-precision floats for not-greater-than-or-equal ( !(a >= b) )
# lane unit : float32 / lane numbers : 1
func mm_cmpnge_ss*(a, b: M128): M128 {.importc: "_mm_cmpnge_ss".}

# operating : compare packed single-precision floats for not-greater-than ( !(a > b) )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpngt_ps*(a, b: M128): M128 {.importc: "_mm_cmpngt_ps".}

# operating : compare lowest scalar single-precision floats for not-greater-than ( !(a > b) )
# lane unit : float32 / lane numbers : 1
func mm_cmpngt_ss*(a, b: M128): M128 {.importc: "_mm_cmpngt_ss".}

# operating : compare packed single-precision floats for not-less-than-or-equal ( !(a <= b) )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpnle_ps*(a, b: M128): M128 {.importc: "_mm_cmpnle_ps".}

# operating : compare lowest scalar single-precision floats for not-less-than-or-equal ( !(a <= b) )
# lane unit : float32 / lane numbers : 1
func mm_cmpnle_ss*(a, b: M128): M128 {.importc: "_mm_cmpnle_ss".}

# operating : compare packed single-precision floats for not-less-than ( !(a < b) )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpnlt_ps*(a, b: M128): M128 {.importc: "_mm_cmpnlt_ps".}

# operating : compare lowest scalar single-precision floats for not-less-than ( !(a < b) )
# lane unit : float32 / lane numbers : 1
func mm_cmpnlt_ss*(a, b: M128): M128 {.importc: "_mm_cmpnlt_ss".}

# operating : compare packed single-precision floats for ordered ( check if both are not NaN )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpord_ps*(a, b: M128): M128 {.importc: "_mm_cmpord_ps".}

# operating : compare lowest scalar single-precision floats for ordered ( check if both are not NaN )
# lane unit : float32 / lane numbers : 1
func mm_cmpord_ss*(a, b: M128): M128 {.importc: "_mm_cmpord_ss".}

# operating : compare packed single-precision floats for unordered ( check if either is NaN )
# lane unit : float32 / lane numbers : 4 (128-bit)
func mm_cmpunord_ps*(a, b: M128): M128 {.importc: "_mm_cmpunord_ps".}

# operating : compare lowest scalar single-precision floats for unordered ( check if either is NaN )
# lane unit : float32 / lane numbers : 1
func mm_cmpunord_ss*(a, b: M128): M128 {.importc: "_mm_cmpunord_ss".}

# operating : compare lowest scalar single-precision floats and return 1 if equal, 0 otherwise
# lane unit : float32 / lane numbers : 1
func mm_comieq_ss*(a, b: M128): int32 {.importc: "_mm_comieq_ss".}

# operating : compare lowest scalar single-precision floats (a >= b)
# lane unit : float32 / lane numbers : 1
func mm_comige_ss*(a, b: M128): int32 {.importc: "_mm_comige_ss".}

# operating : compare lowest scalar single-precision floats (a > b)
# lane unit : float32 / lane numbers : 1
func mm_comigt_ss*(a, b: M128): int32 {.importc: "_mm_comigt_ss".}

# operating : compare lowest scalar single-precision floats (a <= b)
# lane unit : float32 / lane numbers : 1
func mm_comile_ss*(a, b: M128): int32 {.importc: "_mm_comile_ss".}

# operating : compare lowest scalar single-precision floats (a < b)
# lane unit : float32 / lane numbers : 1
func mm_comilt_ss*(a, b: M128): int32 {.importc: "_mm_comilt_ss".}

# operating : compare lowest scalar single-precision floats (a != b)
# lane unit : float32 / lane numbers : 1
func mm_comineq_ss*(a, b: M128): int32 {.importc: "_mm_comineq_ss".}

# operating : convert 32-bit integer 'b' to single-precision float and replace lowest lane of 'a'
# lane unit : int32 -> float32 / lane numbers : 1
func mm_cvt_si2ss*(a: M128, b: int32): M128 {.importc: "_mm_cvt_si2ss".}

# operating : convert lowest single-precision float in 'a' to 32-bit integer
# lane unit : float32 -> int32 / lane numbers : 1
func mm_cvt_ss2si*(a: M128): int32 {.importc: "_mm_cvt_ss2si".}

# operating : alias for _mm_cvt_si2ss
# lane unit : int32 -> float32 / lane numbers : 1
func mm_cvtsi32_ss*(a: M128, b: int32): M128 {.importc: "_mm_cvtsi32_ss".}

# operating : extract lowest single-precision float from 'a'
# lane unit : float32 / lane numbers : 1
func mm_cvtss_f32*(a: M128): float32 {.importc: "_mm_cvtss_f32".}

# operating : convert lowest single-precision float in 'a' to 32-bit integer (rounding)
# lane unit : float32 -> int32 / lane numbers : 1
func mm_cvtss_si32*(a: M128): int32 {.importc: "_mm_cvtss_si32".}

# operating : convert lowest single-precision float in 'a' to 64-bit integer (rounding)
# lane unit : float32 -> int64 / lane numbers : 1
func mm_cvtss_si64*(a: M128): int64 {.importc: "_mm_cvtss_si64".}

# operating : convert lowest single-precision float in 'a' to 32-bit integer (truncation)
# lane unit : float32 -> int32 / lane numbers : 1
func mm_cvtt_ss2si*(a: M128): int32 {.importc: "_mm_cvtt_ss2si".}

# operating : convert lowest single-precision float in 'a' to 32-bit integer (truncation)
# lane unit : float32 -> int32 / lane numbers : 1
func mm_cvttss_si32*(a: M128): int32 {.importc: "_mm_cvttss_si32".}

# operating : convert lowest single-precision float in 'a' to 64-bit integer (truncation)
# lane unit : float32 -> int64 / lane numbers : 1
func mm_cvttss_si64*(a: M128): int64 {.importc: "_mm_cvttss_si64".}

# operating : divide packed single-precision floats (a / b)
# lane unit : float32 / lane numbers : 4
func mm_div_ps*(a, b: M128): M128 {.importc: "_mm_div_ps".}

# operating : divide lowest scalar single-precision float (a / b)
# lane unit : float32 / lane numbers : 1
func mm_div_ss*(a, b: M128): M128 {.importc: "_mm_div_ss".}

# operating : load 128-bits (4 floats) from aligned memory
# lane unit : float32 / lane numbers : 4
func mm_load_ps*(p: pointer): M128 {.importc: "_mm_load_ps".}

# operating : load a single float and broadcast to all 4 lanes
# lane unit : float32 / lane numbers : 4
func mm_load_ps1*(p: pointer): M128 {.importc: "_mm_load_ps1".}

# operating : load a single float into the lowest lane, zeroing others
# lane unit : float32 / lane numbers : 1
func mm_load_ss*(p: pointer): M128 {.importc: "_mm_load_ss".}

# operating : alias for _mm_load_ps1
# lane unit : float32 / lane numbers : 4
func mm_load1_ps*(p: pointer): M128 {.importc: "_mm_load1_ps".}

# operating : load 128-bits from aligned memory in reverse order
# lane unit : float32 / lane numbers : 4
func mm_loadr_ps*(p: pointer): M128 {.importc: "_mm_loadr_ps".}

# operating : load 128-bits from unaligned memory
# lane unit : float32 / lane numbers : 4
func mm_loadu_ps*(p: pointer): M128 {.importc: "_mm_loadu_ps".}

# operating : load 16-bits from unaligned memory into lowest lane
# lane unit : int16 / lane numbers : 1
func mm_loadu_si16*(p: pointer): M128 {.importc: "_mm_loadu_si16".}

# operating : load 64-bits from unaligned memory into lowest lane
# lane unit : int64 / lane numbers : 1
func mm_loadu_si64*(p: pointer): M128 {.importc: "_mm_loadu_si64".}

# operating : find maximum of packed single-precision floats
# lane unit : float32 / lane numbers : 4
func mm_max_ps*(a, b: M128): M128 {.importc: "_mm_max_ps".}

# operating : find maximum of lowest scalar single-precision float
# lane unit : float32 / lane numbers : 1
func mm_max_ss*(a, b: M128): M128 {.importc: "_mm_max_ss".}

# operating : find minimum of packed single-precision floats
# lane unit : float32 / lane numbers : 4
func mm_min_ps*(a, b: M128): M128 {.importc: "_mm_min_ps".}

# operating : find minimum of lowest scalar single-precision float
# lane unit : float32 / lane numbers : 1
func mm_min_ss*(a, b: M128): M128 {.importc: "_mm_min_ss".}

# operating : move lowest scalar single-precision float from 'b' to 'a'
# lane unit : float32 / lane numbers : 1
func mm_move_ss*(a, b: M128): M128 {.importc: "_mm_move_ss".}

# operating : move high 64-bits of 'b' to low 64-bits of result; high 64-bits are from 'a'
# lane unit : float32 / lane numbers : 4
func mm_movehl_ps*(a, b: M128): M128 {.importc: "_mm_movehl_ps".}

# operating : move low 64-bits of 'b' to high 64-bits of result; low 64-bits are from 'a'
# lane unit : float32 / lane numbers : 4
func mm_movelh_ps*(a, b: M128): M128 {.importc: "_mm_movelh_ps".}

# operating : create a 4-bit mask from the most significant bit of each float lane
# lane unit : float32 / lane numbers : 4
func mm_movemask_ps*(a: M128): int32 {.importc: "_mm_movemask_ps".}

# operating : multiply packed single-precision floats
# lane unit : float32 / lane numbers : 4
func mm_mul_ps*(a, b: M128): M128 {.importc: "_mm_mul_ps".}

# operating : multiply lowest scalar single-precision float
# lane unit : float32 / lane numbers : 1
func mm_mul_ss*(a, b: M128): M128 {.importc: "_mm_mul_ss".}

# operating : bitwise OR of packed single-precision floats
# lane unit : float32 / lane numbers : 4
func mm_or_ps*(a, b: M128): M128 {.importc: "_mm_or_ps".}

# operating : compute approximate reciprocal (1/x) of packed single-precision floats
# lane unit : float32 / lane numbers : 4
func mm_rcp_ps*(a: M128): M128 {.importc: "_mm_rcp_ps".}

# operating : compute approximate reciprocal (1/x) of lowest scalar float
# lane unit : float32 / lane numbers : 1
func mm_rcp_ss*(a: M128): M128 {.importc: "_mm_rcp_ss".}

# operating : compute approximate reciprocal square root (1/sqrt(x)) of packed floats
# lane unit : float32 / lane numbers : 4
func mm_rsqrt_ps*(a: M128): M128 {.importc: "_mm_rsqrt_ps".}

# operating : compute approximate reciprocal square root (1/sqrt(x)) of lowest scalar float
# lane unit : float32 / lane numbers : 1
func mm_rsqrt_ss*(a: M128): M128 {.importc: "_mm_rsqrt_ss".}

# operating : set 4 packed single-precision floats (in order: d, c, b, a)
# lane unit : float32 / lane numbers : 4
func mm_set_ps*(a, b, c, d: float32): M128 {.importc: "_mm_set_ps".}

# operating : alias for _mm_set1_ps
# lane unit : float32 / lane numbers : 4
func mm_set_ps1*(a: float32): M128 {.importc: "_mm_set_ps1".}

# operating : set lowest lane to 'a', zeroing others
# lane unit : float32 / lane numbers : 1
func mm_set_ss*(a: float32): M128 {.importc: "_mm_set_ss".}

# operating : set all 4 lanes to the value 'a'
# lane unit : float32 / lane numbers : 4
func mm_set1_ps*(a: float32): M128 {.importc: "_mm_set1_ps".}

# operating : set 4 packed single-precision floats in reverse order
# lane unit : float32 / lane numbers : 4
func mm_setr_ps*(a, b, c, d: float32): M128 {.importc: "_mm_setr_ps".}

# operating : initialize all 4 lanes to zero
# lane unit : float32 / lane numbers : 4
func mm_setzero_ps*(): M128 {.importc: "_mm_setzero_ps".}

# operating : shuffle lanes of 'a' and 'b' based on imm8 control value
# lane unit : float32 / lane numbers : 4
func mm_shuffle_ps*(a, b: M128, imm8: int32 | uint32): M128 {.importc: "_mm_shuffle_ps".}

# operating : compute square root of packed single-precision floats
# lane unit : float32 / lane numbers : 4
func mm_sqrt_ps*(a: M128): M128 {.importc: "_mm_sqrt_ps".}

# operating : compute square root of lowest scalar float
# lane unit : float32 / lane numbers : 1
func mm_sqrt_ss*(a: M128): M128 {.importc: "_mm_sqrt_ss".}

# operating : store 128-bits (4 floats) to aligned memory
# lane unit : float32 / lane numbers : 4
func mm_store_ps*(p: pointer, a: M128) {.importc: "_mm_store_ps".}

# operating : store lowest float lane to all 4 consecutive memory locations
# lane unit : float32 / lane numbers : 4
func mm_store_ps1*(p: pointer, a: M128) {.importc: "_mm_store_ps1".}

# operating : store lowest scalar float to memory
# lane unit : float32 / lane numbers : 1
func mm_store_ss*(p: pointer, a: M128) {.importc: "_mm_store_ss".}

# operating : alias for _mm_store_ps1
# lane unit : float32 / lane numbers : 4
func mm_store1_ps*(p: pointer, a: M128) {.importc: "_mm_store1_ps".}

# operating : store 128-bits to aligned memory in reverse order
# lane unit : float32 / lane numbers : 4
func mm_storer_ps*(p: pointer, a: M128) {.importc: "_mm_storer_ps".}

# operating : store 128-bits to unaligned memory address
# lane unit : float32 / lane numbers : 4
func mm_storeu_ps_internal(p: ptr float32, a: M128) {.importc: "_mm_storeu_ps".}

template mm_storeu_ps*(p: pointer, a: M128) =
  mm_storeu_ps_internal(cast[ptr float32](p), a)

# operating : store lowest 16-bits to unaligned memory
# lane unit : int16 / lane numbers : 1
func mm_storeu_si16*(p: pointer, a: M128) {.importc: "_mm_storeu_si16".}

# operating : store lowest 64-bits to unaligned memory
# lane unit : int64 / lane numbers : 1
func mm_storeu_si64*(p: pointer, a: M128) {.importc: "_mm_storeu_si64".}

# operating : store 128-bits to memory bypassing cache (non-temporal)
# lane unit : float32 / lane numbers : 4
func mm_stream_ps*(p: pointer, a: M128) {.importc: "_importc: _mm_stream_ps".}

# operating : subtract packed single-precision floats (a - b)
# lane unit : float32 / lane numbers : 4
func mm_sub_ps*(a, b: M128): M128 {.importc: "_mm_sub_ps".}

# operating : subtract lowest scalar float (a - b)
# lane unit : float32 / lane numbers : 1
func mm_sub_ss*(a, b: M128): M128 {.importc: "_mm_sub_ss".}

# operating : compare lowest scalar single-precision floats (quiet equality)
# lane unit : float32 / lane numbers : 1
func mm_ucomieq_ss*(a, b: M128): int32 {.importc: "_mm_ucomieq_ss".}

# operating : compare lowest scalar single-precision floats (quiet a >= b)
# lane unit : float32 / lane numbers : 1
func mm_ucomige_ss*(a, b: M128): int32 {.importc: "_mm_ucomige_ss".}

# operating : compare lowest scalar single-precision floats (quiet a > b)
# lane unit : float32 / lane numbers : 1
func mm_ucomigt_ss*(a, b: M128): int32 {.importc: "_mm_ucomigt_ss".}

# operating : compare lowest scalar single-precision floats (quiet a <= b)
# lane unit : float32 / lane numbers : 1
func mm_ucomile_ss*(a, b: M128): int32 {.importc: "_mm_ucomile_ss".}

# operating : compare lowest scalar single-precision floats (quiet a < b)
# lane unit : float32 / lane numbers : 1
func mm_ucomilt_ss*(a, b: M128): int32 {.importc: "_mm_ucomilt_ss".}

# operating : compare lowest scalar single-precision floats (quiet a != b)
# lane unit : float32 / lane numbers : 1
func mm_ucomineq_ss*(a, b: M128): int32 {.importc: "_mm_ucomineq_ss".}

# operating : return a M128 vector with undefined contents (optimization)
# lane unit : N/A / lane numbers : N/A
func mm_undefined_ps*(): M128 {.importc: "_mm_undefined_ps".}

# operating : unpack and interleave high floats from 'a' and 'b'
# lane unit : float32 / lane numbers : 4
func mm_unpackhi_ps*(a, b: M128): M128 {.importc: "_mm_unpackhi_ps".}

# operating : unpack and interleave low floats from 'a' and 'b'
# lane unit : float32 / lane numbers : 4
func mm_unpacklo_ps*(a, b: M128): M128 {.importc: "_mm_unpacklo_ps".}

# operating : bitwise XOR of packed single-precision floats
# lane unit : float32 / lane numbers : 4
func mm_xor_ps*(a, b: M128): M128 {.importc: "_mm_xor_ps".}

# operating : add packed 16-bit integers in 'a' and 'b'
# lane unit : int16 / lane numbers : 8 (128-bit)
func mm_add_epi16*(a, b: M128i): M128i {.importc: "_mm_add_epi16".}

# operating : add packed 32-bit integers in 'a' and 'b'
# lane unit : int32 / lane numbers : 4 (128-bit)
func mm_add_epi32*(a, b: M128i): M128i {.importc: "_mm_add_epi32".}

# operating : add packed 64-bit integers in 'a' and 'b'
# lane unit : int64 / lane numbers : 2 (128-bit)
func mm_add_epi64*(a, b: M128i): M128i {.importc: "_mm_add_epi64".}

# operating : add packed 8-bit integers in 'a' and 'b'
# lane unit : int8 / lane numbers : 16 (128-bit)
func mm_add_epi8*(a, b: M128i): M128i {.importc: "_mm_add_epi8".}

# operating : add packed double-precision floats in 'a' and 'b'
# lane unit : float64 / lane numbers : 2 (128-bit)
func mm_add_pd*(a, b: M128d): M128d {.importc: "_mm_add_pd".}

# operating : add the lowest scalar double-precision float in 'a' and 'b'
# lane unit : float64 / lane numbers : 1
func mm_add_sd*(a, b: M128d): M128d {.importc: "_mm_add_sd".}

# operating : add packed 16-bit integers in 'a' and 'b' using saturation
# lane unit : int16 / lane numbers : 8 (128-bit)
func mm_adds_epi16*(a, b: M128i): M128i {.importc: "_mm_adds_epi16".}

# operating : add packed 8-bit integers in 'a' and 'b' using saturation
# lane unit : int8 / lane numbers : 16 (128-bit)
func mm_adds_epi8*(a, b: M128i): M128i {.importc: "_mm_adds_epi8".}

# operating : add packed unsigned 16-bit integers in 'a' and 'b' using saturation
# lane unit : uint16 / lane numbers : 8 (128-bit)
func mm_adds_epu16*(a, b: M128i): M128i {.importc: "_mm_adds_epu16".}

# operating : add packed unsigned 8-bit integers in 'a' and 'b' using saturation
# lane unit : uint8 / lane numbers : 16 (128-bit)
func mm_adds_epu8*(a, b: M128i): M128i {.importc: "_mm_adds_epu8".}

# operating : compute bitwise AND of packed double-precision floats in 'a' and 'b'
# lane unit : float64 / lane numbers : 2 (128-bit)
func mm_and_pd*(a, b: M128d): M128d {.importc: "_mm_and_pd".}

# operating : compute bitwise AND of 128-bits of data in 'a' and 'b'
# lane unit : N/A / lane numbers : N/A
func mm_and_si128*(a, b: M128i): M128i {.importc: "_mm_and_si128".}

# operating : compute bitwise AND NOT of 'a' and 'b' for double-precision floats ( (~a) & b )
# lane unit : float64 / lane numbers : 2 (128-bit)
func mm_andnot_pd*(a, b: M128d): M128d {.importc: "_mm_andnot_pd".}

# operating : compute bitwise AND NOT of 128-bits of data in 'a' and 'b' ( (~a) & b )
# lane unit : N/A / lane numbers : N/A
func mm_andnot_si128*(a, b: M128i): M128i {.importc: "_mm_andnot_si128".}

# operating : average packed unsigned 16-bit integers in 'a' and 'b' ( (a + b + 1) >> 1 )
# lane unit : uint16 / lane numbers : 8 (128-bit)
func mm_avg_epu16*(a, b: M128i): M128i {.importc: "_mm_avg_epu16".}

# operating : average packed unsigned 8-bit integers in 'a' and 'b' ( (a + b + 1) >> 1 )
# lane unit : uint8 / lane numbers : 16 (128-bit)
func mm_avg_epu8*(a, b: M128i): M128i {.importc: "_mm_avg_epu8".}

# operating : shift 'a' left by 'imm8' bytes while shifting in zeros
# lane unit : N/A / lane numbers : N/A
func mm_bslli_si128*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_bslli_si128".}

# operating : shift 'a' right by 'imm8' bytes while shifting in zeros
# lane unit : N/A / lane numbers : N/A
func mm_bsrli_si128*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_bsrli_si128".}

# operating : cast packed double-precision floats to single-precision floats (no conversion)
# lane unit : float64 -> float32 / lane numbers : 2 -> 4
func mm_castpd_ps*(a: M128d): M128 {.importc: "_mm_castpd_ps".}

# operating : cast packed double-precision floats to 128-bit integers (no conversion)
# lane unit : float64 -> int / lane numbers : 2 -> N/A
func mm_castpd_si128*(a: M128d): M128i {.importc: "_mm_castpd_si128".}

# operating : cast packed single-precision floats to double-precision floats (no conversion)
# lane unit : float32 -> float64 / lane numbers : 4 -> 2
func mm_castps_pd*(a: M128): M128d {.importc: "_mm_castps_pd".}

# operating : cast packed single-precision floats to 128-bit integers (no conversion)
# lane unit : float32 -> int / lane numbers : 4 -> N/A
func mm_castps_si128*(a: M128): M128i {.importc: "_mm_castps_si128".}

# operating : cast 128-bit integers to double-precision floats (no conversion)
# lane unit : int -> float64 / lane numbers : N/A -> 2
func mm_castsi128_pd*(a: M128i): M128d {.importc: "_mm_castsi128_pd".}

# operating : cast 128-bit integers to single-precision floats (no conversion)
# lane unit : int -> float32 / lane numbers : N/A -> 4
func mm_castsi128_ps*(a: M128i): M128 {.importc: "_mm_castsi128_ps".}

# operating : compare packed 16-bit integers for equality
# lane unit : int16 / lane numbers : 8
func mm_cmpeq_epi16*(a, b: M128i): M128i {.importc: "_mm_cmpeq_epi16".}

# operating : compare packed 32-bit integers for equality
# lane unit : int32 / lane numbers : 4
func mm_cmpeq_epi32*(a, b: M128i): M128i {.importc: "_mm_cmpeq_epi32".}

# operating : compare packed 8-bit integers for equality
# lane unit : int8 / lane numbers : 16
func mm_cmpeq_epi8*(a, b: M128i): M128i {.importc: "_mm_cmpeq_epi8".}

# operating : compare packed double-precision floats for equality
# lane unit : float64 / lane numbers : 2
func mm_cmpeq_pd*(a, b: M128d): M128d {.importc: "_mm_cmpeq_pd".}

# operating : compare lowest scalar double-precision floats for equality
# lane unit : float64 / lane numbers : 1
func mm_cmpeq_sd*(a, b: M128d): M128d {.importc: "_mm_cmpeq_sd".}

# operating : compare packed double-precision floats for greater-than-or-equal
# lane unit : float64 / lane numbers : 2
func mm_cmpge_pd*(a, b: M128d): M128d {.importc: "_mm_cmpge_pd".}

# operating : compare lowest scalar double-precision floats for greater-than-or-equal
# lane unit : float64 / lane numbers : 1
func mm_cmpge_sd*(a, b: M128d): M128d {.importc: "_mm_cmpge_sd".}

# operating : compare packed 16-bit integers for greater-than
# lane unit : int16 / lane numbers : 8
func mm_cmpgt_epi16*(a, b: M128i): M128i {.importc: "_mm_cmpgt_epi16".}

# operating : compare packed 32-bit integers for greater-than
# lane unit : int32 / lane numbers : 4
func mm_cmpgt_epi32*(a, b: M128i): M128i {.importc: "_mm_cmpgt_epi32".}

# operating : compare packed 8-bit integers for greater-than
# lane unit : int8 / lane numbers : 16
func mm_cmpgt_epi8*(a, b: M128i): M128i {.importc: "_mm_cmpgt_epi8".}

# operating : compare packed double-precision floats for greater-than
# lane unit : float64 / lane numbers : 2
func mm_cmpgt_pd*(a, b: M128d): M128d {.importc: "_mm_cmpgt_pd".}

# operating : compare lowest scalar double-precision floats for greater-than
# lane unit : float64 / lane numbers : 1
func mm_cmpgt_sd*(a, b: M128d): M128d {.importc: "_mm_cmpgt_sd".}

# operating : compare packed double-precision floats for less-than-or-equal
# lane unit : float64 / lane numbers : 2
func mm_cmple_pd*(a, b: M128d): M128d {.importc: "_mm_cmple_pd".}

# operating : compare lowest scalar double-precision floats for less-than-or-equal
# lane unit : float64 / lane numbers : 1
func mm_cmple_sd*(a, b: M128d): M128d {.importc: "_mm_cmple_sd".}

# operating : compare packed 16-bit integers for less-than
# lane unit : int16 / lane numbers : 8
func mm_cmplt_epi16*(a, b: M128i): M128i {.importc: "_mm_cmplt_epi16".}

# operating : compare packed 32-bit integers for less-than
# lane unit : int32 / lane numbers : 4
func mm_cmplt_epi32*(a, b: M128i): M128i {.importc: "_mm_cmplt_epi32".}

# operating : compare packed 8-bit integers for less-than
# lane unit : int8 / lane numbers : 16
func mm_cmplt_epi8*(a, b: M128i): M128i {.importc: "_mm_cmplt_epi8".}

# operating : compare packed double-precision floats for less-than
# lane unit : float64 / lane numbers : 2
func mm_cmplt_pd*(a, b: M128d): M128d {.importc: "_mm_cmplt_pd".}

# operating : compare lowest scalar double-precision floats for less-than
# lane unit : float64 / lane numbers : 1
func mm_cmplt_sd*(a, b: M128d): M128d {.importc: "_mm_cmplt_sd".}

# operating : compare packed double-precision floats for inequality
# lane unit : float64 / lane numbers : 2
func mm_cmpneq_pd*(a, b: M128d): M128d {.importc: "_mm_cmpneq_pd".}

# operating : compare lowest scalar double-precision floats for inequality
# lane unit : float64 / lane numbers : 1
func mm_cmpneq_sd*(a, b: M128d): M128d {.importc: "_mm_cmpneq_sd".}

# operating : compare packed double-precision floats for not-greater-than-or-equal
# lane unit : float64 / lane numbers : 2
func mm_cmpnge_pd*(a, b: M128d): M128d {.importc: "_mm_cmpnge_pd".}

# operating : compare lowest scalar double-precision floats for not-greater-than-or-equal
# lane unit : float64 / lane numbers : 1
func mm_cmpnge_sd*(a, b: M128d): int32 {.importc: "_mm_cmpnge_sd".}

# operating : compare packed double-precision floats for not-greater-than
# lane unit : float64 / lane numbers : 2
func mm_cmpngt_pd*(a, b: M128d): M128d {.importc: "_mm_cmpngt_pd".}

# operating : compare lowest scalar double-precision floats for not-greater-than
# lane unit : float64 / lane numbers : 1
func mm_cmpngt_sd*(a, b: M128d): M128d {.importc: "_mm_cmpngt_sd".}

# operating : compare packed double-precision floats for not-less-than-or-equal
# lane unit : float64 / lane numbers : 2
func mm_cmpnle_pd*(a, b: M128d): M128d {.importc: "_mm_cmpnle_pd".}

# operating : compare lowest scalar double-precision floats for not-less-than-or-equal
# lane unit : float64 / lane numbers : 1
func mm_cmpnle_sd*(a, b: M128d): M128d {.importc: "_mm_cmpnle_sd".}

# operating : compare packed double-precision floats for not-less-than
# lane unit : float64 / lane numbers : 2
func mm_cmpnlt_pd*(a, b: M128d): M128d {.importc: "_mm_cmpnlt_pd".}

# operating : compare lowest scalar double-precision floats for not-less-than
# lane unit : float64 / lane numbers : 1
func mm_cmpnlt_sd*(a, b: M128d): M128d {.importc: "_mm_cmpnlt_sd".}

# operating : compare packed double-precision floats for ordered (not NaN)
# lane unit : float64 / lane numbers : 2
func mm_cmpord_pd*(a, b: M128d): M128d {.importc: "_mm_cmpord_pd".}

# operating : compare lowest scalar double-precision floats for ordered (not NaN)
# lane unit : float64 / lane numbers : 1
func mm_cmpord_sd*(a, b: M128d): M128d {.importc: "_mm_cmpord_sd".}

# operating : compare packed double-precision floats for unordered (either is NaN)
# lane unit : float64 / lane numbers : 2
func mm_cmpunord_pd*(a, b: M128d): M128d {.importc: "_mm_cmpunord_pd".}

# operating : compare lowest scalar double-precision floats for unordered (either is NaN)
# lane unit : float64 / lane numbers : 1
func mm_cmpunord_sd*(a, b: M128d): M128d {.importc: "_mm_cmpunord_sd".}

# operating : compare lowest scalar double-precision floats and return 1 if equal
# lane unit : float64 / lane numbers : 1
func mm_comieq_sd*(a, b: M128d): int32 {.importc: "_mm_comieq_sd".}

# operating : compare lowest scalar double-precision floats (a >= b)
# lane unit : float64 / lane numbers : 1
func mm_comige_sd*(a, b: M128d): int32 {.importc: "_mm_comige_sd".}

# operating : compare lowest scalar double-precision floats (a > b)
# lane unit : float64 / lane numbers : 1
func mm_comigt_sd*(a, b: M128d): int32 {.importc: "_mm_comigt_sd".}

# operating : compare lowest scalar double-precision floats (a <= b)
# lane unit : float64 / lane numbers : 1
func mm_comile_sd*(a, b: M128d): int32 {.importc: "_mm_comile_sd".}

# operating : compare lowest scalar double-precision floats (a < b)
# lane unit : float64 / lane numbers : 1
func mm_comilt_sd*(a, b: M128d): int32 {.importc: "_mm_comilt_sd".}

# operating : compare lowest scalar double-precision floats (a != b)
# lane unit : float64 / lane numbers : 1
func mm_comineq_sd*(a, b: M128d): int32 {.importc: "_mm_comineq_sd".}

# operating : convert packed 32-bit integers to packed double-precision floats
# lane unit : int32 -> float64 / lane numbers : 2
func mm_cvtepi32_pd*(a: M128i): M128d {.importc: "_mm_cvtepi32_pd".}

# operating : convert packed 32-bit integers to packed single-precision floats
# lane unit : int32 -> float32 / lane numbers : 4
func mm_cvtepi32_ps*(a: M128i): M128 {.importc: "_mm_cvtepi32_ps".}

# operating : convert packed double-precision floats to packed 32-bit integers
# lane unit : float64 -> int32 / lane numbers : 2
func mm_cvtpd_epi32*(a: M128d): M128i {.importc: "_mm_cvtpd_epi32".}

# operating : convert packed double-precision floats to packed single-precision floats
# lane unit : float64 -> float32 / lane numbers : 2
func mm_cvtpd_ps*(a: M128d): M128 {.importc: "_mm_cvtpd_ps".}

# operating : convert packed single-precision floats to packed 32-bit integers
# lane unit : float32 -> int32 / lane numbers : 4
func mm_cvtps_epi32*(a: M128): M128i {.importc: "_mm_cvtps_epi32".}

# operating : convert packed single-precision floats to packed double-precision floats
# lane unit : float32 -> float64 / lane numbers : 2
func mm_cvtps_pd*(a: M128): M128d {.importc: "_mm_cvtps_pd".}

# operating : extract the lowest double-precision float to float64
# lane unit : float64 / lane numbers : 1
func mm_cvtsd_f64*(a: M128d): float64 {.importc: "_mm_cvtsd_f64".}

# operating : convert the lowest double-precision float to 32-bit integer
# lane unit : float64 -> int32 / lane numbers : 1
func mm_cvtsd_si32*(a: M128d): int32 {.importc: "_mm_cvtsd_si32".}

# operating : convert the lowest double-precision float to 64-bit integer
# lane unit : float64 -> int64 / lane numbers : 1
func mm_cvtsd_si64*(a: M128d): int64 {.importc: "_mm_cvtsd_si64".}

# operating : alias for _mm_cvtsd_si64
# lane unit : float64 -> int64 / lane numbers : 1
func mm_cvtsd_si64x*(a: M128d): int64 {.importc: "_mm_cvtsd_si64x".}

# operating : convert the lowest double-precision float to single-precision float
# lane unit : float64 -> float32 / lane numbers : 1
func mm_cvtsd_ss*(a, b: M128d): M128 {.importc: "_mm_cvtsd_ss".}

# operating : extract the lowest 32-bit integer from 128-bit integer vector
# lane unit : int32 / lane numbers : 1
func mm_cvtsi128_si32*(a: M128i): int32 {.importc: "_mm_cvtsi128_si32".}

# operating : extract the lowest 64-bit integer from 128-bit integer vector
# lane unit : int64 / lane numbers : 1
func mm_cvtsi128_si64*(a: M128i): int64 {.importc: "_mm_cvtsi128_si64".}

# operating : alias for _mm_cvtsi128_si64
# lane unit : int64 / lane numbers : 1
func mm_cvtsi128_si64x*(a: M128i): int64 {.importc: "_mm_cvtsi128_si64x".}

# operating : convert 32-bit integer to lowest double-precision float
# lane unit : int32 -> float64 / lane numbers : 1
func mm_cvtsi32_sd*(a: M128d, b: int32): M128d {.importc: "_mm_cvtsi32_sd".}

# operating : move 32-bit integer to the lowest lane of 128-bit integer vector
# lane unit : int32 -> int / lane numbers : 1
func mm_cvtsi32_si128*(a: int32 | uint32): M128i {.importc: "_mm_cvtsi32_si128".}

# operating : convert 64-bit integer to lowest double-precision float
# lane unit : int64 -> float64 / lane numbers : 1
func mm_cvtsi64_sd*(a: M128d, b: int64): M128d {.importc: "_mm_cvtsi64_sd".}

# operating : move 64-bit integer to the lowest lane of 128-bit integer vector
# lane unit : int64 -> int / lane numbers : 1
func mm_cvtsi64_si128*(a: int64 | uint64): M128i {.importc: "_mm_cvtsi64_si128".}

# operating : alias for _mm_cvtsi64_sd
# lane unit : int64 -> float64 / lane numbers : 1
func mm_cvtsi64x_sd*(a: M128d, b: int64): M128d {.importc: "_mm_cvtsi64x_sd".}

# operating : alias for _mm_cvtsi64_si128
# lane unit : int64 -> int / lane numbers : 1
func mm_cvtsi64x_si128*(a: int64 | uint64): M128i {.importc: "_mm_cvtsi64x_si128".}

# operating : convert lowest single-precision float to lowest double-precision float
# lane unit : float32 -> float64 / lane numbers : 1
func mm_cvtss_sd*(a, b: M128): M128d {.importc: "_mm_cvtss_sd".}

# operating : convert packed double-precision floats to 32-bit integers with truncation
# lane unit : float64 -> int32 / lane numbers : 2
func mm_cvttpd_epi32*(a: M128d): M128i {.importc: "_mm_cvttpd_epi32".}

# operating : convert packed single-precision floats to 32-bit integers with truncation
# lane unit : float32 -> int32 / lane numbers : 4
func mm_cvttps_epi32*(a: M128): M128i {.importc: "_mm_cvttps_epi32".}

# operating : convert lowest double-precision float to 32-bit integer with truncation
# lane unit : float64 -> int32 / lane numbers : 1
func mm_cvttsd_si32*(a: M128d): int32 {.importc: "_mm_cvttsd_si32".}

# operating : convert lowest double-precision float to 64-bit integer with truncation
# lane unit : float64 -> int64 / lane numbers : 1
func mm_cvttsd_si64*(a: M128d): int64 {.importc: "_mm_cvttsd_si64".}

# operating : alias for _mm_cvttsd_si64
# lane unit : float64 -> int64 / lane numbers : 1
func mm_cvttsd_si64x*(a: M128d): int64 {.importc: "_mm_cvttsd_si64x".}

# operating : divide packed double-precision floats (a / b)
# lane unit : float64 / lane numbers : 2
func mm_div_pd*(a, b: M128d): M128d {.importc: "_mm_div_pd".}

# operating : divide lowest scalar double-precision float (a / b)
# lane unit : float64 / lane numbers : 1
func mm_div_sd*(a, b: M128d): M128d {.importc: "_mm_div_sd".}

# operating : extract 16-bit integer from 'a' at index 'imm8'
# lane unit : int16 / lane numbers : 1 (out of 8)
func mm_extract_epi16*(a: M128i, imm8: int32 | uint32): int32 {.importc: "_mm_extract_epi16".}

# operating : insert 16-bit integer 'i' into 'a' at index 'imm8'
# lane unit : int16 / lane numbers : 1 (into 8)
func mm_insert_epi16*(a: M128i, i, imm8: int32 | uint32): M128i {.importc: "_mm_insert_epi16".}

# operating : load 128-bits (2 double-precision floats) from aligned memory
# lane unit : float64 / lane numbers : 2
func mm_load_pd*(p: pointer): M128d {.importc: "_mm_load_pd".}

# operating : load a single double-precision float and broadcast to both lanes
# lane unit : float64 / lane numbers : 2
func mm_load_pd1*(p: pointer): M128d {.importc: "_mm_load_pd1".}

# operating : load a single double-precision float into the lowest lane, zeroing the upper lane
# lane unit : float64 / lane numbers : 1
func mm_load_sd*(p: pointer): M128d {.importc: "_mm_load_sd".}

# operating : internal function to load 128-bits of integer data from aligned memory
# lane unit : N/A / lane numbers : N/A
func mm_load_si128(p: ptr M128i): M128i {.importc: "_mm_load_si128".}

# operating : load 128-bits of integer data from aligned memory (with automatic casting)
# lane unit : N/A / lane numbers : N/A
template mm_load_si128*(p: pointer): M128i =
  mm_load_si128(cast[ptr M128i](p))

# operating : alias for _mm_load_pd1
# lane unit : float64 / lane numbers : 2
func mm_load1_pd*(p: pointer): M128d {.importc: "_mm_load1_pd".}

# operating : load a double-precision float into the upper lane of 'a'
# lane unit : float64 / lane numbers : 1
func mm_loadh_pd*(a: M128d, p: pointer): M128d {.importc: "_mm_loadh_pd".}

# operating : internal function to load 64-bits of integer data into the low lane
# lane unit : int64 / lane numbers : 1
func mm_loadl_epi64(p: ptr M128i): M128i {.importc: "_mm_loadl_epi64".}

# operating : load 64-bits of integer data into the low lane (with automatic casting)
# lane unit : int64 / lane numbers : 1
template mm_loadl_epi64*(p: pointer): M128i =
  mm_loadl_epi64(cast[ptr M128i](p))

# operating : load a double-precision float into the lower lane of 'a'
# lane unit : float64 / lane numbers : 1
func mm_loadl_pd*(a: M128d, p: pointer): M128i {.importc: "_mm_loadl_pd".}

# operating : load two single-precision floats into the lower 64-bits of 'a'
# lane unit : float32 / lane numbers : 2
func mm_loadl_pi*(a: M128, p: pointer): M128 {.importc: "_mm_loadl_pi".}

# operating : load 128-bits from aligned memory in reverse order
# lane unit : float64 / lane numbers : 2
func mm_loadr_pd*(p: pointer): M128d {.importc: "_mm_loadr_pd".}

# operating : load 128-bits (2 double-precision floats) from unaligned memory
# lane unit : float64 / lane numbers : 2
func mm_loadu_pd*(p: pointer): M128d {.importc: "_mm_loadu_pd".}

# operating : internal function to load 128-bits of integer data from unaligned memory
# lane unit : N/A / lane numbers : N/A
func mm_loadu_si128(p: ptr M128i): M128i {.importc: "_mm_loadu_si128".}

# operating : load 128-bits of integer data from unaligned memory (with automatic casting)
# lane unit : N/A / lane numbers : N/A
template mm_loadu_si128*(p: pointer): M128i =
  mm_loadu_si128(cast[ptr M128i](p))

# operating : load 32-bit integer into the lowest lane, zeroing others
# lane unit : int32 / lane numbers : 1
func mm_loadu_si32*(p: pointer): M128i {.importc: "_mm_loadu_si32".}

# operating : multiply packed 16-bit integers and add adjacent 32-bit results
# lane unit : int16 -> int32 / lane numbers : 8 -> 4
func mm_madd_epi16*(a, b: M128i): M128i {.importc: "_mm_madd_epi16".}

# operating : selectively store bytes from 'a' to memory 'p' using a byte mask
# lane unit : int8 / lane numbers : 16
func mm_maskmoveu_si128*(a, mask: M128i, p: pointer) {.importc: "_mm_maskmoveu_si128".}

# operating : find maximum of packed signed 16-bit integers
# lane unit : int16 / lane numbers : 8
func mm_max_epi16*(a, b: M128i): M128i {.importc: "_mm_max_epi16".}

# operating : find maximum of packed unsigned 8-bit integers
# lane unit : uint8 / lane numbers : 16
func mm_max_epu8*(a, b: M128i): M128i {.importc: "_mm_max_epu8".}

# operating : find maximum of packed double-precision floats
# lane unit : float64 / lane numbers : 2
func mm_max_pd*(a, b: M128d): M128d {.importc: "_mm_max_pd".}

# operating : find maximum of lowest scalar double-precision float
# lane unit : float64 / lane numbers : 1
func mm_max_sd*(a, b: M128d): M128d {.importc: "_mm_max_sd".}

# operating : find minimum of packed signed 16-bit integers
# lane unit : int16 / lane numbers : 8
func mm_min_epi16*(a, b: M128i): M128i {.importc: "_mm_min_epi16".}

# operating : find minimum of packed unsigned 8-bit integers
# lane unit : uint8 / lane numbers : 16
func mm_min_epu8*(a, b: M128i): M128i {.importc: "_mm_min_epu8".}

# operating : find minimum of packed double-precision floats
# lane unit : float64 / lane numbers : 2
func mm_min_pd*(a, b: M128d): M128d {.importc: "_mm_min_pd".}

# operating : find minimum of lowest scalar double-precision float
# lane unit : float64 / lane numbers : 1
func mm_min_sd*(a, b: M128d): M128d {.importc: "_mm_min_sd".}

# operating : move the lowest 64-bit integer to the lowest lane, zeroing the upper lane
# lane unit : int64 / lane numbers : 1
func mm_move_epi64*(a: M128i): M128i {.importc: "_mm_move_epi64".}

# operating : move the lowest scalar double-precision float from 'b' to 'a'
# lane unit : float64 / lane numbers : 1
func mm_move_sd*(a, b: M128d): M128d {.importc: "_mm_move_sd".}

# operating : create a 16-bit mask from the most significant bit of each byte
# lane unit : int8 / lane numbers : 16
func mm_movemask_epi8*(a: M128i): int32 {.importc: "_mm_movemask_epi8".}

# operating : create a 2-bit mask from the most significant bit of each double lane
# lane unit : float64 / lane numbers : 2
func mm_movemask_pd*(a: M128d): int32 {.importc: "_mm_movemask_pd".}

# operating : multiply unsigned 32-bit integers in the low lanes and return 64-bit result
# lane unit : uint32 -> uint64 / lane numbers : 2 -> 2
func mm_mul_epu32*(a, b: M128i): M128i {.importc: "_mm_mul_epu32".}

# operating : multiply packed double-precision floats
# lane unit : float64 / lane numbers : 2
func mm_mul_pd*(a, b: M128d): M128d {.importc: "_mm_mul_pd".}

# operating : multiply lowest scalar double-precision float
# lane unit : float64 / lane numbers : 1
func mm_mul_sd*(a, b: M128d): M128d {.importc: "_mm_mul_sd".}

# operating : multiply packed signed 16-bit integers and return the high 16-bits of result
# lane unit : int16 / lane numbers : 8
func mm_mulhi_epi16*(a, b: M128i): M128i {.importc: "_mm_mulhi_epi16".}

# operating : multiply packed unsigned 16-bit integers and return the high 16-bits of result
# lane unit : uint16 / lane numbers : 8
func mm_mulhi_epu16*(a, b: M128i): M128i {.importc: "_mm_mulhi_epu16".}

# operating : multiply packed 16-bit integers and return the low 16-bits of result
# lane unit : int16 / lane numbers : 8
func mm_mullo_epi16*(a, b: M128i): M128i {.importc: "_mm_mullo_epi16".}

# operating : bitwise OR of packed double-precision floats
# lane unit : float64 / lane numbers : 2
func mm_or_pd*(a, b: M128d): M128d {.importc: "_mm_or_pd".}

# operating : bitwise OR of 128-bits of integer data
# lane unit : N/A / lane numbers : N/A
func mm_or_si128*(a, b: M128i): M128i {.importc: "_mm_or_si128".}

# operating : pack signed 16-bit integers into signed 8-bit integers using saturation
# lane unit : int16 -> int8 / lane numbers : 8 -> 16
func mm_packs_epi16*(a, b: M128i): M128i {.importc: "_mm_packs_epi16".}

# operating : pack signed 32-bit integers into signed 16-bit integers using saturation
# lane unit : int32 -> int16 / lane numbers : 4 -> 8
func mm_packs_epi32*(a, b: M128i): M128i {.importc: "_mm_packs_epi32".}

# operating : pack signed 16-bit integers into unsigned 8-bit integers using saturation
# lane unit : int16 -> uint8 / lane numbers : 8 -> 16
func mm_packus_epi16*(a, b: M128i): M128i {.importc: "_mm_packus_epi16".}

# operating : compute absolute differences of unsigned bytes and sum into 64-bit result
# lane unit : uint8 / lane numbers : 16
func mm_sad_epu8*(a, b: M128i): M128i {.importc: "_mm_sad_epu8".}

# operating : set 8 packed 16-bit integers with provided values
# lane unit : int16 / lane numbers : 8
func mm_set_epi16*(a, b, c, d, e, f, g, h: int16): M128i {.importc: "_mm_set_epi16".}

# operating : set 4 packed 32-bit integers with provided values
# lane unit : int32 / lane numbers : 4
func mm_set_epi32*(a, b, c, d: int32 | uint32): M128i {.importc: "_mm_set_epi32".}

# operating : set 2 packed 64-bit integers with provided values
# lane unit : int64 / lane numbers : 2
func mm_set_epi64x*(a, b: int64 | uint64): M128i {.importc: "_mm_set_epi64x".}

# operating : set 16 packed 8-bit integers with provided values
# lane unit : int8 / lane numbers : 16
func mm_set_epi8*(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p: int8 | uint8 | char): M128i {.importc: "_mm_set_epi8".}

# operating : set 2 packed double-precision floats with provided values
# lane unit : float64 / lane numbers : 2
func mm_set_pd*(a, b: float64): M128d {.importc: "_mm_set_pd".}

# operating : alias for _mm_set1_pd
# lane unit : float64 / lane numbers : 2
func mm_set_pd1*(a: float64): M128d {.importc: "_mm_set_pd1".}

# operating : set lowest lane to 'a', zeroing upper lane
# lane unit : float64 / lane numbers : 1
func mm_set_sd*(a: float64): M128d {.importc: "_mm_set_sd".}

# operating : set all 8 lanes to 16-bit value 'a'
# lane unit : int16 / lane numbers : 8
func mm_set1_epi16*(a: int16 | uint16): M128i {.importc: "_mm_set1_epi16".}

# operating : set all 4 lanes to 32-bit value 'a'
# lane unit : int32 / lane numbers : 4
func mm_set1_epi32*(a: int32 | uint32): M128i {.importc: "_mm_set1_epi32".}

# operating : set both 64-bit lanes to value 'a'
# lane unit : int64 / lane numbers : 2
func mm_set1_epi64x*(a: int64 | uint64): M128i {.importc: "_mm_set1_epi64x".}

# operating : set all 16 lanes to 8-bit value 'a'
# lane unit : int8 / lane numbers : 16
func mm_set1_epi8*(a: int8 | uint8 | char): M128i {.importc: "_mm_set1_epi8".}

# operating : set all lanes to double-precision value 'a'
# lane unit : float64 / lane numbers : 2
func mm_set1_pd*(a: float64): M128d {.importc: "_mm_set1_pd".}

# operating : set 8 packed 16-bit integers in reverse order
# lane unit : int16 / lane numbers : 8
func mm_setr_epi16*(a, b, c, d, e, f, g, h: int16): M128i {.importc: "_mm_setr_epi16".}

# operating : set 4 packed 32-bit integers in reverse order
# lane unit : int32 / lane numbers : 4
func mm_setr_epi32*(a, b, c, d: int32 | uint32): M128i {.importc: "_mm_setr_epi32".}

# operating : set 16 packed 8-bit integers in reverse order
# lane unit : int8 / lane numbers : 16
func mm_setr_epi8*(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p: int8 | uint8 | char): M128i {.importc: "_mm_setr_epi8".}

# operating : set 2 packed double-precision floats in reverse order
# lane unit : float64 / lane numbers : 2
func mm_setr_pd*(a, b: float64): M128d {.importc: "_mm_setr_pd".}

# operating : initialize all double lanes to zero
# lane unit : float64 / lane numbers : 2
func mm_setzero_pd*(): M128d {.importc: "_mm_setzero_pd".}

# operating : initialize 128-bit integer vector to zero
# lane unit : N/A / lane numbers : N/A
func mm_setzero_si128*(): M128i {.importc: "_mm_setzero_si128".}

# operating : shuffle packed 32-bit integers based on imm8
# lane unit : int32 / lane numbers : 4
func mm_shuffle_epi32*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_shuffle_epi32".}

# operating : shuffle packed double-precision floats based on imm8
# lane unit : float64 / lane numbers : 2
func mm_shuffle_pd*(a, b: M128d, imm8: int32 | uint32): M128d {.importc: "_mm_shuffle_pd".}

# operating : shuffle high 4 packed 16-bit integers based on imm8
# lane unit : int16 / lane numbers : 4 (upper)
func mm_shufflehi_epi16*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_shufflehi_epi16".}

# operating : shuffle low 4 packed 16-bit integers based on imm8
# lane unit : int16 / lane numbers : 4 (lower)
func mm_shufflelo_epi16*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_shufflelo_epi16".}

# operating : shift packed 16-bit integers left by 'count'
# lane unit : int16 / lane numbers : 8
func mm_sll_epi16*(a, count: M128i): M128i {.importc: "_mm_sll_epi16".}

# operating : shift packed 32-bit integers left by 'count'
# lane unit : int32 / lane numbers : 4
func mm_sll_epi32*(a, count: M128i): M128i {.importc: "_mm_sll_epi32".}

# operating : shift packed 64-bit integers left by 'count'
# lane unit : int64 / lane numbers : 2
func mm_sll_epi64*(a, count: M128i): M128i {.importc: "_mm_sll_epi64".}

# operating : shift packed 16-bit integers left by imm8
# lane unit : int16 / lane numbers : 8
func mm_slli_epi16*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_slli_epi16".}

# operating : shift packed 32-bit integers left by imm8
# lane unit : int32 / lane numbers : 4
func mm_slli_epi32*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_slli_epi32".}

# operating : shift packed 64-bit integers left by imm8
# lane unit : int64 / lane numbers : 2
func mm_slli_epi64*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_slli_epi64".}

# operating : shift 128-bits left by imm8 bytes
# lane unit : N/A / lane numbers : N/A
func mm_slli_si128*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_slli_si128".}

# operating : compute square root of packed double-precision floats
# lane unit : float64 / lane numbers : 2
func mm_sqrt_pd*(a: M128d): M128d {.importc: "_mm_sqrt_pd".}

# operating : compute square root of lowest scalar double-precision float
# lane unit : float64 / lane numbers : 1
func mm_sqrt_sd*(a, b: M128d): M128d {.importc: "_mm_sqrt_sd".}

# operating : shift packed 16-bit integers right (arithmetic) by 'count'
# lane unit : int16 / lane numbers : 8
func mm_sra_epi16*(a, count: M128i): M128i {.importc: "_mm_sra_epi16".}

# operating : shift packed 32-bit integers right (arithmetic) by 'count'
# lane unit : int32 / lane numbers : 4
func mm_sra_epi32*(a, count: M128i): M128i {.importc: "_mm_sra_epi32".}

# operating : shift packed 16-bit integers right (arithmetic) by imm8
# lane unit : int16 / lane numbers : 8
func mm_srai_epi16*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_srai_epi16".}

# operating : shift packed 32-bit integers right (arithmetic) by imm8
# lane unit : int32 / lane numbers : 4
func mm_srai_epi32*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_srai_epi32".}

# operating : shift packed 16-bit integers right (logical) by 'count'
# lane unit : int16 / lane numbers : 8
func mm_srl_epi16*(a, count: M128i): M128i {.importc: "_mm_srl_epi16".}

# operating : shift packed 32-bit integers right (logical) by 'count'
# lane unit : int32 / lane numbers : 4
func mm_srl_epi32*(a, count: M128i): M128i {.importc: "_mm_srl_epi32".}

# operating : shift packed 64-bit integers right (logical) by 'count'
# lane unit : int64 / lane numbers : 2
func mm_srl_epi64*(a, count: M128i): M128i {.importc: "_mm_srl_epi64".}

# operating : shift packed 16-bit integers right (logical) by imm8
# lane unit : int16 / lane numbers : 8
func mm_srli_epi16*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_srli_epi16".}

# operating : shift packed 32-bit integers right (logical) by imm8
# lane unit : int32 / lane numbers : 4
func mm_srli_epi32*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_srli_epi32".}

# operating : shift packed 64-bit integers right (logical) by imm8
# lane unit : int64 / lane numbers : 2
func mm_srli_epi64*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_srli_epi64".}

# operating : shift 128-bits right by imm8 bytes
# lane unit : N/A / lane numbers : N/A
func mm_srli_si128*(a: M128i, imm8: int32 | uint32): M128i {.importc: "_mm_srli_si128".}

# operating : store 128-bits (2 double floats) to aligned memory
# lane unit : float64 / lane numbers : 2
func mm_store_pd*(p: pointer, a: M128d) {.importc: "_mm_store_pd".}

# operating : store lowest double float to two consecutive locations
# lane unit : float64 / lane numbers : 2
func mm_store_pd1*(p: pointer, a: M128d) {.importc: "_mm_store_pd1".}

# operating : store lowest scalar double float to memory
# lane unit : float64 / lane numbers : 1
func mm_store_sd*(p: pointer, a: M128d) {.importc: "_mm_store_sd".}

# operating : store 128-bits of integer data to aligned memory
# lane unit : N/A / lane numbers : N/A
func mm_store_si128*(p: pointer, a: M128i) {.importc: "_mm_store_si128".}

# operating : alias for _mm_store_pd1
# lane unit : float64 / lane numbers : 2
func mm_store1_pd*(p: pointer, a: M128d) {.importc: "_mm_store1_pd".}

# operating : store upper double float to memory
# lane unit : float64 / lane numbers : 1
func mm_storeh_pd*(p: pointer, a: M128d) {.importc: "_mm_storeh_pd".}

# operating : store lowest 64-bit integer to memory
# lane unit : int64 / lane numbers : 1
func mm_storel_epi64*(p: pointer, a: M128i) {.importc: "_mm_storel_epi64".}

# operating : store lowest double float to memory
# lane unit : float64 / lane numbers : 1
func mm_storel_pd*(p: pointer, a: M128d) {.importc: "_mm_storel_pd".}

# operating : store 128-bits to aligned memory in reverse order
# lane unit : float64 / lane numbers : 2
func mm_storer_pd*(p: pointer, a: M128d) {.importc: "_mm_storer_pd".}

# operating : store 128-bits (2 double floats) to unaligned memory
# lane unit : float64 / lane numbers : 2
func mm_storeu_pd*(p: pointer, a: M128d) {.importc: "_mm_storeu_pd".}

# operating : internal function to store 128-bits of integer data to unaligned memory
# lane unit : N/A / lane numbers : N/A
func mm_storeu_si128(p: ptr M128i, a: M128i) {.importc: "_mm_storeu_si128".}

# operating : store 128-bits of integer data to unaligned memory (with automatic casting)
# lane unit : N/A / lane numbers : N/A
template mm_storeu_si128*(p: pointer, a: M128i) =
  mm_storeu_si128(cast[ptr M128i](p), a)

# operating : store lowest 32-bit integer to memory
# lane unit : int32 / lane numbers : 1
func mm_storeu_si32*(p: pointer, a: M128i) {.importc: "_mm_storeu_si32".}

# operating : store 128-bits to memory bypassing cache (non-temporal)
# lane unit : float64 / lane numbers : 2
func mm_stream_pd*(p: pointer, a: M128d) {.importc: "_mm_stream_pd".}

# operating : store 128-bits of integer data bypassing cache (non-temporal)
# lane unit : N/A / lane numbers : N/A
func mm_stream_si128*(p: pointer, a: M128i) {.importc: "_mm_stream_si128".}

# operating : store 32-bit integer bypassing cache
# lane unit : int32 / lane numbers : 1
func mm_stream_si32*(p: pointer, a: int32 | uint32) {.importc: "_mm_stream_si32".}

# operating : store 64-bit integer bypassing cache
# lane unit : int64 / lane numbers : 1
func mm_stream_si64*(p: pointer, a: int64 | uint64) {.importc: "_mm_stream_si64".}

# operating : subtract packed 16-bit integers
# lane unit : int16 / lane numbers : 8
func mm_sub_epi16*(a, b: M128i): M128i {.importc: "_mm_sub_epi16".}

# operating : subtract packed 32-bit integers
# lane unit : int32 / lane numbers : 4
func mm_sub_epi32*(a, b: M128i): M128i {.importc: "_mm_sub_epi32".}

# operating : subtract packed 64-bit integers
# lane unit : int64 / lane numbers : 2
func mm_sub_epi64*(a, b: M128i): M128i {.importc: "_mm_sub_epi64".}

# operating : subtract packed 8-bit integers
# lane unit : int8 / lane numbers : 16
func mm_sub_epi8*(a, b: M128i): M128i {.importc: "_mm_sub_epi8".}

# operating : subtract packed double-precision floats
# lane unit : float64 / lane numbers : 2
func mm_sub_pd*(a, b: M128d): M128d {.importc: "_mm_sub_pd".}

# operating : subtract lowest scalar double-precision float
# lane unit : float64 / lane numbers : 1
func mm_sub_sd*(a, b: M128d): M128d {.importc: "_mm_sub_sd".}

# operating : subtract packed signed 16-bit integers with saturation
# lane unit : int16 / lane numbers : 8
func mm_subs_epi16*(a, b: M128i): M128i {.importc: "_mm_subs_epi16".}

# operating : subtract packed signed 8-bit integers with saturation
# lane unit : int8 / lane numbers : 16
func mm_subs_epi8*(a, b: M128i): M128i {.importc: "_mm_subs_epi8".}

# operating : subtract packed unsigned 16-bit integers with saturation
# lane unit : uint16 / lane numbers : 8
func mm_subs_epu16*(a, b: M128i): M128i {.importc: "_mm_subs_epu16".}

# operating : subtract packed unsigned 8-bit integers with saturation
# lane unit : uint8 / lane numbers : 16
func mm_subs_epu8*(a, b: M128i): M128i {.importc: "_mm_subs_epu8".}

# operating : compare lowest scalar double floats and return 1 if equal (quiet)
# lane unit : float64 / lane numbers : 1
func mm_ucomieq_sd*(a, b: M128d): int32 {.importc: "_mm_ucomieq_sd".}

# operating : compare lowest scalar double floats (a >= b, quiet)
# lane unit : float64 / lane numbers : 1
func mm_ucomige_sd*(a, b: M128d): int32 {.importc: "_mm_ucomige_sd".}

# operating : compare lowest scalar double floats (a > b, quiet)
# lane unit : float64 / lane numbers : 1
func mm_ucomigt_sd*(a, b: M128d): int32 {.importc: "_mm_ucomigt_sd".}

# operating : compare lowest scalar double floats (a <= b, quiet)
# lane unit : float64 / lane numbers : 1
func mm_ucomile_sd*(a, b: M128d): int32 {.importc: "_mm_ucomile_sd".}

# operating : compare lowest scalar double floats (a < b, quiet)
# lane unit : float64 / lane numbers : 1
func mm_ucomilt_sd*(a, b: M128d): int32 {.importc: "_mm_ucomilt_sd".}

# operating : compare lowest scalar double floats (a != b, quiet)
# lane unit : float64 / lane numbers : 1
func mm_ucomineq_sd*(a, b: M128d): int32 {.importc: "_mm_ucomineq_sd".}

# operating : return a M128d vector with undefined contents (optimization)
# lane unit : N/A / lane numbers : N/A
func mm_undefined_pd*(): M128d {.importc: "_mm_undefined_pd".}

# operating : return a M128i vector with undefined contents (optimization)
# lane unit : N/A / lane numbers : N/A
func mm_undefined_si128*(): M128i {.importc: "_mm_undefined_si128".}

# operating : unpack and interleave high 16-bit integers from 'a' and 'b'
# lane unit : int16 / lane numbers : 8
func mm_unpackhi_epi16*(a, b: M128i): M128i {.importc: "_mm_unpackhi_epi16".}

# operating : unpack and interleave high 32-bit integers from 'a' and 'b'
# lane unit : int32 / lane numbers : 4
func mm_unpackhi_epi32*(a, b: M128i): M128i {.importc: "_mm_unpackhi_epi32".}

# operating : unpack and interleave high 64-bit integers from 'a' and 'b'
# lane unit : int64 / lane numbers : 2
func mm_unpackhi_epi64*(a, b: M128i): M128i {.importc: "_mm_unpackhi_epi64".}

# operating : unpack and interleave high bytes from 'a' and 'b'
# lane unit : int8 / lane numbers : 16
func mm_unpackhi_epi8*(a, b: M128i): M128i {.importc: "_mm_unpackhi_epi8".}

# operating : unpack and interleave high double floats from 'a' and 'b'
# lane unit : float64 / lane numbers : 2
func mm_unpackhi_pd*(a, b: M128d): M128d {.importc: "_mm_unpackhi_pd".}

# operating : unpack and interleave low 16-bit integers from 'a' and 'b'
# lane unit : int16 / lane numbers : 8
func mm_unpacklo_epi16*(a, b: M128i): M128i {.importc: "_mm_unpacklo_epi16".}

# operating : unpack and interleave low 32-bit integers from 'a' and 'b'
# lane unit : int32 / lane numbers : 4
func mm_unpacklo_epi32*(a, b: M128i): M128i {.importc: "_mm_unpacklo_epi32".}

# operating : unpack and interleave low 64-bit integers from 'a' and 'b'
# lane unit : int64 / lane numbers : 2
func mm_unpacklo_epi64*(a, b: M128i): M128i {.importc: "_mm_unpacklo_epi64".}

# operating : unpack and interleave low bytes from 'a' and 'b'
# lane unit : int8 / lane numbers : 16
func mm_unpacklo_epi8*(a, b: M128i): M128i {.importc: "_mm_unpacklo_epi8".}

# operating : unpack and interleave low double floats from 'a' and 'b'
# lane unit : float64 / lane numbers : 2
func mm_unpacklo_pd*(a, b: M128d): M128d {.importc: "_mm_unpacklo_pd".}

# operating : bitwise XOR of packed double-precision floats
# lane unit : float64 / lane numbers : 2
func mm_xor_pd*(a, b: M128d): M128d {.importc: "_mm_xor_pd".}

# operating : bitwise XOR of 128-bits of integer data
# lane unit : N/A / lane numbers : N/A
func mm_xor_si128*(a, b: M128i): M128i {.importc: "_mm_xor_si128".}

# operating : store two single-precision floats from the lower 64-bits of 'a' to memory
# lane unit : float32 / lane numbers : 2
func mm_storel_pi*(p: pointer, a: M128) {.importc: "_mm_storel_pi".}

{.pop.}
