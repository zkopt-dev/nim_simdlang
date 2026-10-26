type
  M128* {.importc: "__m128", header: "xmmintrin.h", bycopy.} = object
  M64* {.importc: "__m64", header: "mmintrin.h", bycopy.} = object
  M64u* {.importc: "__m64_u", header: "mmintrin.h", bycopy.} = object

## Category  : Data Struct
## Operator  : Prefetch
## Type      : None
## Docs      : Prefetches a line of data from memory into the cache to minimize memory latency.
## Parameter : [p] Pointer to the source memory address.
##             [i] Prefetch hint constant specifying cache tier target (e.g., T0, T1, T2, NTA).
func mm_prefetch*(p: pointer, i: int32): void {.importc: "_mm_prefetch".}

## Category  : Data Struct
## Operator  : ShuffleMask
## Type      : int32
## Docs      : Combines four 2-bit element indices into an 8-bit immediate mask used for shuffle/permute instructions.
## Parameter : [fp3] Index for element 3 (bits 6-7)
##             [fp2] Index for element 2 (bits 4-5)
##             [fp1] Index for element 1 (bits 2-3)
##             [fp0] Index for element 0 (bits 0-1)
template MM_SHUFFLE*(fp3, fp2, fp1, fp0: int32): int32 =
  (((fp3) shl 6) or ((fp2) shl 4) or ((fp1) shl 2) or (fp0))

# ------------------------------------------
# MXCSR Control and Status Register Bits (Exceptions)
# ------------------------------------------

const
  ## Category  : Bit
  ## Operator  : Mask
  ## Type      : int32
  ## Docs      : Bitmask isolating all sticky exception flags in the MXCSR register.
  MM_EXCEPT_MASK* = 0x003f

  ## Category  : Bit
  ## Operator  : Flag
  ## Type      : int32
  ## Docs      : Invalid Operation exception flag. Triggered by operations like 0.0 / 0.0 or Sqrt(-1.0).
  MM_EXCEPT_INVALID* = 0x0001

  ## Category  : Bit
  ## Operator  : Flag
  ## Type      : int32
  ## Docs      : Denormal Operand exception flag. Triggered when an arithmetic operand is a subnormal number.
  MM_EXCEPT_DENORM* = 0x0002

  ## Category  : Bit
  ## Operator  : Flag
  ## Type      : int32
  ## Docs      : Divide-by-Zero exception flag. Triggered when dividing a non-zero number by zero.
  MM_EXCEPT_DIV_ZERO* = 0x0004

  ## Category  : Bit
  ## Operator  : Flag
  ## Type      : int32
  ## Docs      : Overflow exception flag. Triggered when the absolute result exceeds the maximum representable finite value.
  MM_EXCEPT_OVERFLOW* = 0x0008

  ## Category  : Bit
  ## Operator  : Flag
  ## Type      : int32
  ## Docs      : Underflow exception flag. Triggered when the absolute result is non-zero but too small to be represented normally.
  MM_EXCEPT_UNDERFLOW* = 0x0010

  ## Category  : Bit
  ## Operator  : Flag
  ## Type      : int32
  ## Docs      : Inexact Result exception flag. Triggered when the rounded result of an operation is not exact.
  MM_EXCEPT_INEXACT* = 0x0020

# ------------------------------------------
# MXCSR Exception Masking
# ------------------------------------------

const
  ## Category  : Bit
  ## Operator  : Mask
  ## Type      : int32
  ## Docs      : Bitmask isolating all exception mask bits in the MXCSR register.
  MM_MASK_MASK* = 0x1f80

  ## Category  : Bit
  ## Operator  : MaskBit
  ## Type      : int32
  ## Docs      : Mask bit to disable hardware trap/interruption for Invalid Operation exceptions.
  MM_MASK_INVALID* = 0x0080

  ## Category  : Bit
  ## Operator  : MaskBit
  ## Type      : int32
  ## Docs      : Mask bit to disable hardware trap/interruption for Denormal Operand exceptions.
  MM_MASK_DENORM* = 0x0100

  ## Category  : Bit
  ## Operator  : MaskBit
  ## Type      : int32
  ## Docs      : Mask bit to disable hardware trap/interruption for Divide-by-Zero exceptions.
  MM_MASK_DIV_ZERO* = 0x0200

  ## Category  : Bit
  ## Operator  : MaskBit
  ## Type      : int32
  ## Docs      : Mask bit to disable hardware trap/interruption for Overflow exceptions.
  MM_MASK_OVERFLOW* = 0x0400

  ## Category  : Bit
  ## Operator  : MaskBit
  ## Type      : int32
  ## Docs      : Mask bit to disable hardware trap/interruption for Underflow exceptions.
  MM_MASK_UNDERFLOW* = 0x0800

  ## Category  : Bit
  ## Operator  : MaskBit
  ## Type      : int32
  ## Docs      : Mask bit to disable hardware trap/interruption for Inexact Result exceptions.
  MM_MASK_INEXACT* = 0x1000

# ------------------------------------------
# MXCSR Rounding Modes & Flush-to-Zero
# ------------------------------------------

const
  ## Category  : Bit
  ## Operator  : Mask
  ## Type      : int32
  ## Docs      : Bitmask isolating rounding mode control configuration bits in MXCSR.
  MM_ROUND_MASK* = 0x6000

  ## Category  : Bit
  ## Operator  : RoundMode
  ## Type      : int32
  ## Docs      : Rounding control: Round to nearest even number (IEEE 754 default standard).
  MM_ROUND_NEAREST* = 0x0000

  ## Category  : Bit
  ## Operator  : RoundMode
  ## Type      : int32
  ## Docs      : Rounding control: Round down toward negative infinity.
  MM_ROUND_DOWN* = 0x2000

  ## Category  : Bit
  ## Operator  : RoundMode
  ## Type      : int32
  ## Docs      : Rounding control: Round up toward positive infinity.
  MM_ROUND_UP* = 0x4000

  ## Category  : Bit
  ## Operator  : RoundMode
  ## Type      : int32
  ## Docs      : Rounding control: Round toward zero (Direct truncation).
  MM_ROUND_TOWARD_ZERO* = 0x6000

  ## Category  : Bit
  ## Operator  : Mask
  ## Type      : int32
  ## Docs      : Bitmask isolating the Flush-to-Zero (FTZ) status switch bit in MXCSR.
  MM_FLUSH_ZERO_MASK* = 0x8000

  ## Category  : Bit
  ## Operator  : Control
  ## Type      : int32
  ## Docs      : Enables Flush-to-Zero mode. Underflow results are abruptly truncated to 0.0f for SIMD performance.
  MM_FLUSH_ZERO_ON* = 0x8000

  ## Category  : Bit
  ## Operator  : Control
  ## Type      : int32
  ## Docs      : Disables Flush-to-Zero mode. Subnormal/Denormal float values are safely preserved (IEEE 754 compliant).
  MM_FLUSH_ZERO_OFF* = 0x0000

# ------------------------------------------
# Generic Comparison Predicates (For immediate 'p' in mm_cmp_ps / mm_cmp_ss)
# ------------------------------------------

const
  ## Category  : Compare
  ## Operator  : Predicate
  ## Type      : int32
  ## Docs      : Predicate code for: Equal (ordered, non-signaling) comparison.
  CMP_EQ_OQ* = 0x00

  ## Category  : Compare
  ## Operator  : Predicate
  ## Type      : int32
  ## Docs      : Predicate code for: Less-than (ordered, signaling) comparison.
  CMP_LT_OS* = 0x01

  ## Category  : Compare
  ## Operator  : Predicate
  ## Type      : int32
  ## Docs      : Predicate code for: Less-than-or-equal (ordered, signaling) comparison.
  CMP_LE_OS* = 0x02

  ## Category  : Compare
  ## Operator  : Predicate
  ## Type      : int32
  ## Docs      : Predicate code for: Unordered (quiet) comparison. Yields true if either operand is NaN.
  CMP_UNORD_Q* = 0x03

  ## Category  : Compare
  ## Operator  : Predicate
  ## Type      : int32
  ## Docs      : Predicate code for: Not-equal (unordered, quiet) comparison.
  CMP_NEQ_UQ* = 0x04

  ## Category  : Compare
  ## Operator  : Predicate
  ## Type      : int32
  ## Docs      : Predicate code for: Not-less-than (unordered, signaling) comparison.
  CMP_NLT_US* = 0x05

  ## Category  : Compare
  ## Operator  : Predicate
  ## Type      : int32
  ## Docs      : Predicate code for: Not-less-than-or-equal (unordered, signaling) comparison.
  CMP_NLE_US* = 0x06

  ## Category  : Compare
  ## Operator  : Predicate
  ## Type      : int32
  ## Docs      : Predicate code for: Ordered (quiet) comparison. Yields true if neither operand is NaN.
  CMP_ORD_Q* = 0x07

# ==========================================
# SIMD Vector Extensions : SSE Floating-Point
# ==========================================

## Category  : Conversion
## Operator  : Undefined
## Type      : float32
## Docs      : Returns an uninitialized 128-bit vector of float32. Avoids performance penalty of clearing registers when data is overwritten immediately.
## Parameter : None
func mm_undefined_ps*(): M128 {.importc: "_mm_undefined_ps".}

## Category  : Conversion
## Operator  : SetZero
## Type      : float32
## Docs      : Initializes a 128-bit vector with all elements set to zero (0.0).
## Parameter : None
func mm_setzero_ps*(): M128 {.importc: "_mm_setzero_ps".}

# ------------------------------------------
# Scalar Arithmetic Operations (Lower 32-bit element only)
# ------------------------------------------

## Category  : Arithmetic
## Operator  : Add
## Type      : float32
## Docs      : Adds the lower float32 element of 'b' to 'a'. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector (elements 1-3 are preserved).
##             [b] 128-bit source vector containing the value to add at element 0.
func mm_add_ss*(a: M128, b: M128): M128 {.importc: "_mm_add_ss".}

## Category  : Arithmetic
## Operator  : Subtract
## Type      : float32
## Docs      : Subtracts the lower float32 element of 'b' from 'a'. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector (minuend).
##             [b] 128-bit source vector (subtrahend at element 0).
func mm_sub_ss*(a: M128, b: M128): M128 {.importc: "_mm_sub_ss".}

## Category  : Arithmetic
## Operator  : Multiply
## Type      : float32
## Docs      : Multiplies the lower float32 element of 'a' and 'b'. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_mul_ss*(a: M128, b: M128): M128 {.importc: "_mm_mul_ss".}

## Category  : Arithmetic
## Operator  : Divide
## Type      : float32
## Docs      : Divides the lower float32 element of 'a' by 'b'. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector (dividend).
##             [b] 128-bit source vector (divisor at element 0).
func mm_div_ss*(a: M128, b: M128): M128 {.importc: "_mm_div_ss".}

## Category  : Arithmetic
## Operator  : Sqrt
## Type      : float32
## Docs      : Computes the square root of the lower float32 element of 'a'. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector.
func mm_sqrt_ss*(a: M128): M128 {.importc: "_mm_sqrt_ss".}

## Category  : Arithmetic
## Operator  : Reciprocal
## Type      : float32
## Docs      : Computes the approximate reciprocal (1/x) of the lower float32 element of 'a'. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector.
func mm_rcp_ss*(a: M128): M128 {.importc: "_mm_rcp_ss".}

## Category  : Arithmetic
## Operator  : ReciprocalSqrt
## Type      : float32
## Docs      : Computes the approximate reciprocal square root (1/sqrt(x)) of the lower float32 element of 'a'. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector.
func mm_rsqrt_ss*(a: M128): M128 {.importc: "_mm_rsqrt_ss".}

## Category  : Compare
## Operator  : Min
## Type      : float32
## Docs      : Compares the lower float32 element of 'a' and 'b', and returns the minimum value. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_min_ss*(a: M128, b: M128): M128 {.importc: "_mm_min_ss".}

## Category  : Compare
## Operator  : Max
## Type      : float32
## Docs      : Compares the lower float32 element of 'a' and 'b', and returns the maximum value. Upper 3 elements of 'a' are passed through.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_max_ss*(a: M128, b: M128): M128 {.importc: "_mm_max_ss".}

# ------------------------------------------
# Packed Arithmetic Operations (All 4 float32 elements)
# ------------------------------------------

## Category  : Arithmetic
## Operator  : Add
## Type      : float32
## Docs      : Performs packed parallel addition of four pairs of float32 elements from 'a' and 'b'.
## Parameter : [a] 128-bit vector containing four float32 values.
##             [b] 128-bit vector containing four float32 values.
func mm_add_ps*(a: M128, b: M128): M128 {.importc: "_mm_add_ps".}

## Category  : Arithmetic
## Operator  : Subtract
## Type      : float32
## Docs      : Performs packed parallel subtraction of four pairs of float32 elements ('a' - 'b').
## Parameter : [a] 128-bit vector (minuend).
##             [b] 128-bit vector (subtrahend).
func mm_sub_ps*(a: M128, b: M128): M128 {.importc: "_mm_sub_ps".}

## Category  : Arithmetic
## Operator  : Multiply
## Type      : float32
## Docs      : Performs packed parallel multiplication of four pairs of float32 elements from 'a' and 'b'.
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_mul_ps*(a: M128, b: M128): M128 {.importc: "_mm_mul_ps".}

## Category  : Arithmetic
## Operator  : Divide
## Type      : float32
## Docs      : Performs packed parallel division of four pairs of float32 elements ('a' / 'b').
## Parameter : [a] 128-bit vector (dividend).
##             [b] 128-bit vector (divisor).
func mm_div_ps*(a: M128, b: M128): M128 {.importc: "_mm_div_ps".}

## Category  : Arithmetic
## Operator  : Sqrt
## Type      : float32
## Docs      : Computes the square root of all four packed float32 elements in 'a'.
## Parameter : [a] 128-bit vector.
func mm_sqrt_ps*(a: M128): M128 {.importc: "_mm_sqrt_ps".}

## Category  : Arithmetic
## Operator  : Reciprocal
## Type      : float32
## Docs      : Computes the approximate reciprocal (1/x) of all four packed float32 elements in 'a'.
## Parameter : [a] 128-bit vector.
func mm_rcp_ps*(a: M128): M128 {.importc: "_mm_rcp_ps".}

## Category  : Arithmetic
## Operator  : ReciprocalSqrt
## Type      : float32
## Docs      : Computes the approximate reciprocal square root (1/sqrt(x)) of all four packed float32 elements in 'a'.
## Parameter : [a] 128-bit vector.
func mm_rsqrt_ps*(a: M128): M128 {.importc: "_mm_rsqrt_ps".}

## Category  : Compare
## Operator  : Min
## Type      : float32
## Docs      : Compares packed float32 elements in 'a' and 'b', and returns the minimum values.
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_min_ps*(a: M128, b: M128): M128 {.importc: "_mm_min_ps".}

## Category  : Compare
## Operator  : Max
## Type      : float32
## Docs      : Compares packed float32 elements in 'a' and 'b', and returns the maximum values.
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_max_ps*(a: M128, b: M128): M128 {.importc: "_mm_max_ps".}

# ------------------------------------------
# Bitwise Logical Operations
# ------------------------------------------

## Category  : Bit
## Operator  : AND
## Type      : float32
## Docs      : Computes the bitwise AND of 128-bit vectors 'a' and 'b'.
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_and_ps*(a: M128, b: M128): M128 {.importc: "_mm_and_ps".}

## Category  : Bit
## Operator  : AndNot
## Type      : float32
## Docs      : Computes the bitwise NOT of 'a', then bitwise AND with 'b' ( (~a) & b ).
## Parameter : [a] 128-bit vector to be inverted.
##             [b] 128-bit vector.
func mm_andnot_ps*(a: M128, b: M128): M128 {.importc: "_mm_andnot_ps".}

## Category  : Bit
## Operator  : OR
## Type      : float32
## Docs      : Computes the bitwise OR of 128-bit vectors 'a' and 'b'.
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_or_ps*(a: M128, b: M128): M128 {.importc: "_mm_or_ps".}

## Category  : Bit
## Operator  : XOR
## Type      : float32
## Docs      : Computes the bitwise XOR of 128-bit vectors 'a' and 'b'. Often used to flip signs or clear registers.
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_xor_ps*(a: M128, b: M128): M128 {.importc: "_mm_xor_ps".}

# ==========================================
# SIMD Vector Extensions : SSE Comparisons
# ==========================================

# ------------------------------------------
# Scalar Comparison Operations (Lower 32-bit element only)
# Result is bitmask: True = 0xFFFFFFFF, False = 0x00000000
# Upper 3 elements of 'a' are passed through.
# ------------------------------------------

## Category  : Compare
## Operator  : CompareEQ
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is equal to 'b'. Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector (upper 3 elements are preserved).
##             [b] 128-bit source vector.
func mm_cmpeq_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpeq_ss".}

## Category  : Compare
## Operator  : CompareLT
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is less than 'b' (a < b). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmplt_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmplt_ss".}

## Category  : Compare
## Operator  : CompareLE
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is less than or equal to 'b' (a <= b). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmple_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmple_ss".}

## Category  : Compare
## Operator  : CompareGT
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is greater than 'b' (a > b). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpgt_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpgt_ss".}

## Category  : Compare
## Operator  : CompareGE
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is greater than or equal to 'b' (a >= b). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpge_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpge_ss".}

## Category  : Compare
## Operator  : CompareNEQ
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is not equal to 'b'. Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpneq_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpneq_ss".}

## Category  : Compare
## Operator  : CompareNLT
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is NOT less than 'b' (NOT a < b). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpnlt_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpnlt_ss".}

## Category  : Compare
## Operator  : CompareNLE
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is NOT less than or equal to 'b' (NOT a <= b). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpnle_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpnle_ss".}

## Category  : Compare
## Operator  : CompareNGT
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is NOT greater than 'b' (NOT a > b). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpngt_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpngt_ss".}

## Category  : Compare
## Operator  : CompareNGE
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is NOT greater than or equal to 'b' (NOT a >= b). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpnge_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpnge_ss".}

## Category  : Compare
## Operator  : CompareORD
## Type      : float32
## Docs      : Checks if both the lower float32 elements of 'a' and 'b' are ordered (neither is NaN). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpord_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpord_ss".}

## Category  : Compare
## Operator  : CompareUNORD
## Type      : float32
## Docs      : Checks if either the lower float32 element of 'a' or 'b' is unordered (at least one is NaN). Returns bitmask in the lower slot.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_cmpunord_ss*(a: M128, b: M128): M128 {.importc: "_mm_cmpunord_ss".}

# ------------------------------------------
# Packed Comparison Operations (All 4 float32 elements)
# Result is bitmask: True = 0xFFFFFFFF, False = 0x00000000
# ------------------------------------------

## Category  : Compare
## Operator  : CompareEQ
## Type      : float32
## Docs      : Performs packed parallel equality comparison on all four float32 elements of 'a' and 'b'.
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpeq_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpeq_ps".}

## Category  : Compare
## Operator  : CompareLT
## Type      : float32
## Docs      : Performs packed parallel less-than comparison on all four float32 elements ('a' < 'b').
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmplt_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmplt_ps".}

## Category  : Compare
## Operator  : CompareLE
## Type      : float32
## Docs      : Performs packed parallel less-than-or-equal-to comparison on all four float32 elements ('a' <= 'b').
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmple_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmple_ps".}

## Category  : Compare
## Operator  : CompareGT
## Type      : float32
## Docs      : Performs packed parallel greater-than comparison on all four float32 elements ('a' > 'b').
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpgt_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpgt_ps".}

## Category  : Compare
## Operator  : CompareGE
## Type      : float32
## Docs      : Performs packed parallel greater-than-or-equal-to comparison on all four float32 elements ('a' >= 'b').
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpge_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpge_ps".}

## Category  : Compare
## Operator  : CompareNEQ
## Type      : float32
## Docs      : Performs packed parallel inequality comparison on all four float32 elements of 'a' and 'b'.
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpneq_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpneq_ps".}

## Category  : Compare
## Operator  : CompareNLT
## Type      : float32
## Docs      : Performs packed parallel NOT-less-than comparison on all four float32 elements (NOT 'a' < 'b').
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpnlt_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpnlt_ps".}

## Category  : Compare
## Operator  : CompareNLE
## Type      : float32
## Docs      : Performs packed parallel NOT-less-than-or-equal-to comparison on all four float32 elements (NOT 'a' <= 'b').
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpnle_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpnle_ps".}

## Category  : Compare
## Operator  : CompareNGT
## Type      : float32
## Docs      : Performs packed parallel NOT-greater-than comparison on all four float32 elements (NOT 'a' > 'b').
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpngt_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpngt_ps".}

## Category  : Compare
## Operator  : CompareNGE
## Type      : float32
## Docs      : Performs packed parallel NOT-greater-than-or-equal-to comparison on all four float32 elements (NOT 'a' >= 'b').
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpnge_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpnge_ps".}

## Category  : Compare
## Operator  : CompareORD
## Type      : float32
## Docs      : Performs packed parallel ordered check on all four float32 elements (checks if neither 'a' nor 'b' is NaN).
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpord_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpord_ps".}

## Category  : Compare
## Operator  : CompareUNORD
## Type      : float32
## Docs      : Performs packed parallel unordered check on all four float32 elements (checks if either 'a' or 'b' is NaN).
## Parameter : [a] 128-bit vector.
##             [b] 128-bit vector.
func mm_cmpunord_ps*(a: M128, b: M128): M128 {.importc: "_mm_cmpunord_ps".}

# ------------------------------------------
# Immediate/Predicate Generic Comparison Operations
# ------------------------------------------

## Category  : Compare
## Operator  : CompareGeneric
## Type      : float32
## Docs      : Performs a packed parallel comparison on all elements using a 3-bit immediate predicate 'p' (0-7 defining EQ, LT, LE, UNORD, NEQ, NLT, NLE, ORD).
## Parameter : [x] 128-bit source vector.
##             [y] 128-bit source vector.
##             [p] 3-bit comparison predicate constant (0-7).
func mm_cmp_ps*(x: M128, y: M128, p: int32): M128 {.importc: "_mm_cmp_ps".}

## Category  : Compare
## Operator  : CompareGeneric
## Type      : float32
## Docs      : Performs a scalar comparison on the lower float32 element using a 3-bit immediate predicate 'p' (0-7 defining EQ, LT, LE, UNORD, NEQ, NLT, NLE, ORD). Upper 3 elements of 'x' are preserved.
## Parameter : [x] 128-bit source vector (upper 3 elements are preserved).
##             [y] 128-bit source vector.
##             [p] 3-bit comparison predicate constant (0-7).
func mm_cmp_ss*(x: M128, y: M128, p: int32): M128 {.importc: "_mm_cmp_ss".}

# ==========================================
# SIMD Vector Extensions : SSE Comparisons & Conversions
# ==========================================

# ------------------------------------------
# Scalar Comparison Operations Returning Integer (EFLAGS-based)
# ------------------------------------------

## Category  : Compare
## Operator  : CompareEQ
## Type      : float32
## Docs      : Compares the lower float32 element of 'a' and 'b' for equality. Signals an invalid operation exception if either operand is a quiet or signaling NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_comieq_ss*(a: M128, b: M128): int32 {.importc: "_mm_comieq_ss".}

## Category  : Compare
## Operator  : CompareLT
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is less than 'b'. Signals an exception if either is NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_comilt_ss*(a: M128, b: M128): int32 {.importc: "_mm_comilt_ss".}

## Category  : Compare
## Operator  : CompareLE
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is less than or equal to 'b'. Signals an exception if either is NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_comile_ss*(a: M128, b: M128): int32 {.importc: "_mm_comile_ss".}

## Category  : Compare
## Operator  : CompareGT
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is greater than 'b'. Signals an exception if either is NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_comigt_ss*(a: M128, b: M128): int32 {.importc: "_mm_comigt_ss".}

## Category  : Compare
## Operator  : CompareGE
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is greater than or equal to 'b'. Signals an exception if either is NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_comige_ss*(a: M128, b: M128): int32 {.importc: "_mm_comige_ss".}

## Category  : Compare
## Operator  : CompareNEQ
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is not equal to 'b'. Signals an exception if either is NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_comineq_ss*(a: M128, b: M128): int32 {.importc: "_mm_comineq_ss".}

# ------------------------------------------
# Unsignaling/Unordered Scalar Comparison Operations
# ------------------------------------------

## Category  : Compare
## Operator  : CompareEQ
## Type      : float32
## Docs      : Compares the lower float32 element of 'a' and 'b' for equality. Does NOT signal an exception if an operand is a quiet NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_ucomieq_ss*(a: M128, b: M128): int32 {.importc: "_mm_ucomieq_ss".}

## Category  : Compare
## Operator  : CompareLT
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is less than 'b'. Does NOT signal an exception if an operand is a quiet NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_ucomilt_ss*(a: M128, b: M128): int32 {.importc: "_mm_ucomilt_ss".}

## Category  : Compare
## Operator  : CompareLE
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is less than or equal to 'b'. Does NOT signal an exception if an operand is a quiet NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_ucomile_ss*(a: M128, b: M128): int32 {.importc: "_mm_ucomile_ss".}

## Category  : Compare
## Operator  : CompareGT
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is greater than 'b'. Does NOT signal an exception if an operand is a quiet NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_ucomigt_ss*(a: M128, b: M128): int32 {.importc: "_mm_ucomigt_ss".}

## Category  : Compare
## Operator  : CompareGE
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is greater than or equal to 'b'. Does NOT signal an exception if an operand is a quiet NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_ucomige_ss*(a: M128, b: M128): int32 {.importc: "_mm_ucomige_ss".}

## Category  : Compare
## Operator  : CompareNEQ
## Type      : float32
## Docs      : Compares if the lower float32 element of 'a' is not equal to 'b'. Does NOT signal an exception if an operand is a quiet NaN. Returns 1 if true, 0 if false.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_ucomineq_ss*(a: M128, b: M128): int32 {.importc: "_mm_ucomineq_ss".}

# ------------------------------------------
# Conversion Operations (Using MXCSR Rounding Mode)
# ------------------------------------------

## Category  : Conversion
## Operator  : Convert
## Type      : int32
## Docs      : Converts the lower float32 element of 'a' to a signed 32-bit integer according to the MXCSR rounding control.
## Parameter : [a] 128-bit source vector.
func mm_cvtss_si32*(a: M128): int32 {.importc: "_mm_cvtss_si32".}

## Category  : Conversion
## Operator  : Convert
## Type      : int32
## Docs      : Alias of mm_cvtss_si32. Converts the lower float32 element of 'a' to a signed 32-bit integer based on MXCSR rounding rules.
## Parameter : [a] 128-bit source vector.
func mm_cvt_ss2si*(a: M128): int32 {.importc: "_mm_cvt_ss2si".}

## Category  : Conversion
## Operator  : Convert
## Type      : int64
## Docs      : Converts the lower float32 element of 'a' to a signed 64-bit integer according to the MXCSR rounding control. (64-bit mode only).
## Parameter : [a] 128-bit source vector.
func mm_cvtss_si64*(a: M128): int64 {.importc: "_mm_cvtss_si64".}

## Category  : Conversion
## Operator  : Convert
## Type      : int64
## Docs      : Alias of mm_cvtss_si64. Converts the lower float32 element of 'a' to a signed 64-bit integer based on MXCSR rounding rules.
## Parameter : [a] 128-bit source vector.
func mm_cvtss_si64x*(a: M128): int64 {.importc: "_mm_cvtss_si64x".}

## Category  : Conversion
## Operator  : Convert
## Type      : int32
## Docs      : Converts the two lower packed float32 elements of 'a' into two signed 32-bit integers, returning a 64-bit M64 vector. Uses MXCSR rounding rules.
## Parameter : [a] 128-bit source vector.
func mm_cvtps_pi32*(a: M128): M64 {.importc: "_mm_cvtps_pi32".}

## Category  : Conversion
## Operator  : Convert
## Type      : int32
## Docs      : Alias of mm_cvtps_pi32. Converts the two lower packed float32 elements of 'a' into two signed 32-bit integers.
## Parameter : [a] 128-bit source vector.
func mm_cvt_ps2pi*(a: M128): M64 {.importc: "_mm_cvt_ps2pi".}

# ------------------------------------------
# Truncating Conversion Operations (Always Truncate toward Zero)
# ------------------------------------------

## Category  : Conversion
## Operator  : Truncate
## Type      : int32
## Docs      : Converts the lower float32 element of 'a' to a signed 32-bit integer using direct truncation (rounds toward zero, ignoring MXCSR).
## Parameter : [a] 128-bit source vector.
func mm_cvttss_si32*(a: M128): int32 {.importc: "_mm_cvttss_si32".}

## Category  : Conversion
## Operator  : Truncate
## Type      : int32
## Docs      : Alias of mm_cvttss_si32. Converts the lower float32 element of 'a' to an int32 via truncation.
## Parameter : [a] 128-bit source vector.
func mm_cvtt_ss2si*(a: M128): int32 {.importc: "_mm_cvtt_ss2si".}

## Category  : Conversion
## Operator  : Truncate
## Type      : int64
## Docs      : Converts the lower float32 element of 'a' to a signed 64-bit integer using direct truncation (rounds toward zero).
## Parameter : [a] 128-bit source vector.
func mm_cvttss_si64*(a: M128): int64 {.importc: "_mm_cvttss_si64".}

## Category  : Conversion
## Operator  : Truncate
## Type      : int64
## Docs      : Alias of mm_cvttss_si64. Converts the lower float32 element of 'a' to an int64 via truncation.
## Parameter : [a] 128-bit source vector.
func mm_cvttss_si64x*(a: M128): int64 {.importc: "_mm_cvttss_si64x".}

## Category  : Conversion
## Operator  : Truncate
## Type      : int32
## Docs      : Converts the two lower packed float32 elements of 'a' to two signed 32-bit integers using truncation, returning an M64 vector.
## Parameter : [a] 128-bit source vector.
func mm_cvttps_pi32*(a: M128): M64 {.importc: "_mm_cvttps_pi32".}

## Category  : Conversion
## Operator  : Truncate
## Type      : int32
## Docs      : Alias of mm_cvttps_pi32. Converts the two lower packed float32 elements of 'a' to two int32s via truncation.
## Parameter : [a] 128-bit source vector.
func mm_cvtt_ps2pi*(a: M128): M64 {.importc: "_mm_cvtt_ps2pi".}

# ------------------------------------------
# Reverse Conversion Operations (Integer/MMX to Float32)
# ------------------------------------------

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Converts a signed 32-bit integer 'b' into a float32 and inserts it into the lower element of 'a'. Upper 3 elements of 'a' are preserved.
## Parameter : [a] 128-bit destination vector providing the upper 3 elements.
##             [b] Signed 32-bit integer to convert.
func mm_cvtsi32_ss*(a: M128, b: int32): M128 {.importc: "_mm_cvtsi32_ss".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Alias of mm_cvtsi32_ss. Converts int32 'b' into the lower element of float32 vector 'a'.
## Parameter : [a] 128-bit destination vector providing the upper 3 elements.
##             [b] Signed 32-bit integer to convert.
func mm_cvt_si2ss*(a: M128, b: int32): M128 {.importc: "_mm_cvt_si2ss".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Converts a signed 64-bit integer 'b' into a float32 and inserts it into the lower element of 'a'. Upper 3 elements of 'a' are preserved.
## Parameter : [a] 128-bit destination vector providing the upper 3 elements.
##             [b] Signed 64-bit integer to convert.
func mm_cvtsi64_ss*(a: M128, b: int64): M128 {.importc: "_mm_cvtsi64_ss".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Alias of mm_cvtsi64_ss. Converts int64 'b' into the lower element of float32 vector 'a'.
## Parameter : [a] 128-bit destination vector providing the upper 3 elements.
##             [b] Signed 64-bit integer to convert.
func mm_cvtsi64x_ss*(a: M128, b: int64): M128 {.importc: "_mm_cvtsi64x_ss".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Converts two packed signed 32-bit integers in M64 vector 'b' into two float32 values and packs them into the lower elements of 'a'. Upper 2 elements of 'a' are preserved.
## Parameter : [a] 128-bit destination vector providing the upper 2 elements.
##             [b] 64-bit M64 vector containing two int32s.
func mm_cvtpi32_ps*(a: M128, b: M64): M128 {.importc: "_mm_cvtpi32_ps".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Alias of mm_cvtpi32_ps. Converts two int32s from 'b' into the lower slots of 'a'.
## Parameter : [a] 128-bit destination vector providing the upper 2 elements.
##             [b] 64-bit M64 vector containing two int32s.
func mm_cvt_pi2ps*(a: M128, b: M64): M128 {.importc: "_mm_cvt_pi2ps".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Converts four packed signed 16-bit integers in M64 vector 'a' into four float32 values, returning a 128-bit vector.
## Parameter : [a] 64-bit M64 vector containing four signed 16-bit integers.
func mm_cvtpi16_ps*(a: M64): M128 {.importc: "_mm_cvtpi16_ps".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Converts four packed unsigned 16-bit integers in M64 vector 'a' into four float32 values, returning a 128-bit vector.
## Parameter : [a] 64-bit M64 vector containing four unsigned 16-bit integers.
func mm_cvtpu16_ps*(a: M64): M128 {.importc: "_mm_cvtpu16_ps".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Converts the lower four packed signed 8-bit integers in M64 vector 'a' into four float32 values, returning a 128-bit vector.
## Parameter : [a] 64-bit M64 vector containing signed 8-bit integers.
func mm_cvtpi8_ps*(a: M64): M128 {.importc: "_mm_cvtpi8_ps".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Converts the lower four packed unsigned 8-bit integers in M64 vector 'a' into four float32 values, returning a 128-bit vector.
## Parameter : [a] 64-bit M64 vector containing unsigned 8-bit integers.
func mm_cvtpu8_ps*(a: M64): M128 {.importc: "_mm_cvtpu8_ps".}

## Category  : Conversion
## Operator  : Convert
## Type      : float32
## Docs      : Extracts and converts two pairs of packed signed 32-bit integers from M64 vectors 'a' and 'b' into four float32 values, returning a 128-bit vector.
## Parameter : [a] 64-bit vector supplying the lower two float32 values.
##             [b] 64-bit vector supplying the upper two float32 values.
func mm_cvtpi32x2_ps*(a: M64, b: M64): M128 {.importc: "_mm_cvtpi32x2_ps".}

## Category  : Conversion
## Operator  : Truncate
## Type      : int16
## Docs      : Converts the four packed float32 elements of 'a' into four signed 16-bit integers using truncation, returning a 64-bit M64 vector.
## Parameter : [a] 128-bit source vector containing four float32 values.
func mm_cvtps_pi16*(a: M128): M64 {.importc: "_mm_cvtps_pi16".}

## Category  : Conversion
## Operator  : Truncate
## Type      : int8
## Docs      : Converts the four packed float32 elements of 'a' into four signed 8-bit integers using truncation, returning a 64-bit M64 vector.
## Parameter : [a] 128-bit source vector containing four float32 values.
func mm_cvtps_pi8*(a: M128): M64 {.importc: "_mm_cvtps_pi8".}

# ------------------------------------------
# Vector Shuffle/Permute Operations
# ------------------------------------------

## Category  : Data Struct
## Operator  : Shuffle
## Type      : float32
## Docs      : Shuffles packed float32 elements between 'a' and 'b' using an immediate 8-bit mask. Elements 0-1 of the result are selected from 'a', and elements 2-3 are selected from 'b'. Use the MM_SHUFFLE macro to construct the mask.
## Parameter : [a] 128-bit vector supplying the lower two elements of the output.
##             [b] 128-bit vector supplying the upper two elements of the output.
##             [mask] 8-bit immediate mask defining which input elements map to the output slots.
func mm_shuffle_ps*(a: M128, b: M128, mask: int32): M128 {.importc: "_mm_shuffle_ps".}

# ==========================================
# SIMD Vector Extensions : SSE Memory, Shuffles & MMX/SSE2 Extensions
# ==========================================

## Category  : Data Struct
## Operator  : Shuffle
## Type      : float32
## Docs      : Macro wrapper for packed shuffle. Shuffles float32 elements between 'A' and 'B' using an immediate mask.
## Parameter : [A] 128-bit source vector.
##             [B] 128-bit source vector.
##             [MASK] 8-bit immediate mask defining output topology.
template mm_shuffle_ps*(A, B, MASK: untyped): untyped =
  mm_shuffle_ps(A, B, MASK.int32)

## Category  : Data Struct
## Operator  : Unpack
## Type      : float32
## Docs      : Unpacks and interleaves the high-order float32 elements from the upper halves of 'a' and 'b'.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_unpackhi_ps*(a: M128, b: M128): M128 {.importc: "_mm_unpackhi_ps".}

## Category  : Data Struct
## Operator  : Unpack
## Type      : float32
## Docs      : Unpacks and interleaves the low-order float32 elements from the lower halves of 'a' and 'b'.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_unpacklo_ps*(a: M128, b: M128): M128 {.importc: "_mm_unpacklo_ps".}

## Category  : Load
## Operator  : LoadHigh
## Type      : float32
## Docs      : Loads 64-bits of float32 values from memory location 'p' into the upper 64-bits of 'a'. Lower 64-bits are preserved.
## Parameter : [a] 128-bit destination template providing lower bits.
##             [p] Pointer to 64-bit source memory.
func mm_loadh_pi*(a: M128, p: ptr M64u): M128 {.importc: "_mm_loadh_pi".}

## Category  : Store
## Operator  : StoreHigh
## Type      : float32
## Docs      : Stores the upper 64-bits (higher two elements) of float32 vector 'a' into the 64-bit memory location 'p'.
## Parameter : [p] Pointer to 64-bit destination memory.
##             [a] 128-bit source vector.
func mm_storeh_pi*(p: ptr M64, a: M128): void {.importc: "_mm_storeh_pi".}

## Category  : Data Struct
## Operator  : Move
## Type      : float32
## Docs      : Moves the upper two float32 elements of 'b' into the lower two elements of the result. Upper two elements of 'a' are copied to the result's upper half.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_movehl_ps*(a: M128, b: M128): M128 {.importc: "_mm_movehl_ps".}

## Category  : Data Struct
## Operator  : Move
## Type      : float32
## Docs      : Moves the lower two float32 elements of 'b' into the upper two elements of the result. Lower two elements of 'a' are copied to the result's lower half.
## Parameter : [a] 128-bit source vector.
##             [b] 128-bit source vector.
func mm_movelh_ps*(a: M128, b: M128): M128 {.importc: "_mm_movelh_ps".}

## Category  : Load
## Operator  : LoadLow
## Type      : float32
## Docs      : Loads 64-bits of float32 values from memory location 'p' into the lower 64-bits of 'a'. Upper 64-bits are preserved.
## Parameter : [a] 128-bit destination template providing upper bits.
##             [p] Pointer to 64-bit source memory.
func mm_loadl_pi*(a: M128, p: ptr M64u): M128 {.importc: "_mm_loadl_pi".}

## Category  : Store
## Operator  : StoreLow
## Type      : float32
## Docs      : Stores the lower 64-bits (lower two elements) of float32 vector 'a' into the 64-bit memory location 'p'.
## Parameter : [p] Pointer to 64-bit destination memory.
##             [a] 128-bit source vector.
func mm_storel_pi*(p: ptr M64, a: M128): void {.importc: "_mm_storel_pi".}

## Category  : Data Struct
## Operator  : MoveMask
## Type      : int32
## Docs      : Extracts the sign bits (MSB) of all four packed float32 elements in 'a' and packs them into a 4-bit scalar integer.
## Parameter : [a] 128-bit source vector.
func mm_movemask_ps*(a: M128): int32 {.importc: "_mm_movemask_ps".}

## Category  : Control
## Operator  : GetStatus
## Type      : uint32
## Docs      : Reads the MXCSR control and status register.
## Parameter : None
func mm_getcsr*(): uint32 {.importc: "_mm_getcsr".}

## Category  : Control
## Operator  : SetStatus
## Type      : void
## Docs      : Writes the configuration bits into the MXCSR control and status register.
## Parameter : [i] 32-bit configuration mask.
func mm_setcsr*(i: uint32): void {.importc: "_mm_setcsr".}

# ------------------------------------------
# Set/Initialization Operations
# ------------------------------------------

## Category  : Conversion
## Operator  : Set
## Type      : float32
## Docs      : Sets the lower element of a vector to 'f', and zeros the upper 3 elements.
## Parameter : [f] Float32 value.
func mm_set_ss*(f: float32): M128 {.importc: "_mm_set_ss".}

## Category  : Conversion
## Operator  : Broadcast
## Type      : float32
## Docs      : Broadcasts/replicates a single float32 value 'f' across all four elements of a 128-bit vector.
## Parameter : [f] Float32 value.
func mm_set1_ps*(f: float32): M128 {.importc: "_mm_set1_ps".}

## Category  : Conversion
## Operator  : Broadcast
## Type      : float32
## Docs      : Alias of mm_set1_ps. Broadcasts value 'f' across all vector components.
## Parameter : [f] Float32 value.
func mm_set_ps1*(f: float32): M128 {.importc: "_mm_set_ps1".}

# ------------------------------------------
# Explicit Load Operations
# ------------------------------------------

## Category  : Load
## Operator  : LoadScalar
## Type      : float32
## Docs      : Loads a single float32 value from memory into the lower element of a vector. Upper elements are zeroed.
## Parameter : [p] Pointer to a scalar float32.
func mm_load_ss*(p: ptr float32): M128 {.importc: "_mm_load_ss".}

## Category  : Load
## Operator  : LoadBroadcast
## Type      : float32
## Docs      : Loads a scalar float32 from memory and duplicates it across all four elements of the result vector.
## Parameter : [p] Pointer to a scalar float32.
func mm_load1_ps*(p: ptr float32): M128 {.importc: "_mm_load1_ps".}

## Category  : Load
## Operator  : LoadBroadcast
## Type      : float32
## Docs      : Alias of mm_load1_ps. Loads and broadcasts a scalar float32 value.
## Parameter : [p] Pointer to a scalar float32.
func mm_load_ps1*(p: ptr float32): M128 {.importc: "_mm_load_ps1".}

## Category  : Load
## Operator  : LoadAligned
## Type      : float32
## Docs      : Loads 128-bits of packed float32 values from 16-byte aligned memory. General protection fault triggers if memory is non-aligned.
## Parameter : [p] Pointer to 16-byte aligned float32 array block.
func mm_load_ps*(p: ptr float32): M128 {.importc: "_mm_load_ps".}

## Category  : Load
## Operator  : LoadUnaligned
## Type      : float32
## Docs      : Loads 128-bits of packed float32 values from memory. Safe for non-aligned addresses, though slight performance penalty applies on older architectures.
## Parameter : [p] Pointer to an unaligned float32 array block.
func mm_loadu_ps*(p: ptr float32): M128 {.importc: "_mm_loadu_ps".}

## Category  : Load
## Operator  : LoadReverse
## Type      : float32
## Docs      : Loads 4 packed float32 values from memory and reverses their indexing order inside the target vector.
## Parameter : [p] Pointer to 16-byte aligned float32 array block.
func mm_loadr_ps*(p: ptr float32): M128 {.importc: "_mm_loadr_ps".}

## Category  : Conversion
## Operator  : SetElements
## Type      : float32
## Docs      : Constructs a vector from four explicit float32 values in standard natural argument order.
## Parameter : [z] Value for element 3.
##             [y] Value for element 2.
##             [x] Value for element 1.
##             [w] Value for element 0.
func mm_set_ps*(z: float32, y: float32, x: float32, w: float32): M128 {.importc: "_mm_set_ps".}

## Category  : Conversion
## Operator  : SetElements
## Type      : float32
## Docs      : Constructs a vector from four explicit float32 values in reverse argument order.
## Parameter : [z] Value for element 0.
##             [y] Value for element 1.
##             [x] Value for element 2.
##             [w] Value for element 3.
func mm_setr_ps*(z: float32, y: float32, x: float32, w: float32): M128 {.importc: "_mm_setr_ps".}

# ------------------------------------------
# Explicit Store Operations
# ------------------------------------------

## Category  : Store
## Operator  : StoreScalar
## Type      : float32
## Docs      : Stores the lowest float32 element of 'a' into the scalar memory address 'p'.
## Parameter : [p] Destination scalar address pointer.
##             [a] 128-bit source vector.
func mm_store_ss*(p: ptr float32, a: M128): void {.importc: "_mm_store_ss".}

## Category  : Conversion
## Operator  : Extract
## Type      : float32
## Docs      : Extracts the lowest float32 element from 'a' and returns it as a native scalar float32 value.
## Parameter : [a] 128-bit source vector.
func mm_cvtss_f32*(a: M128): float32 {.importc: "_mm_cvtss_f32".}

## Category  : Store
## Operator  : StoreAligned
## Type      : float32
## Docs      : Stores 128-bits of packed float32 values into a 16-byte aligned memory block.
## Parameter : [p] Destination 16-byte aligned memory address pointer.
##             [a] 128-bit source vector.
func mm_store_ps*(p: ptr float32, a: M128): void {.importc: "_mm_store_ps".}

## Category  : Store
## Operator  : StoreUnaligned
## Type      : float32
## Docs      : Stores 128-bits of packed float32 values into an unaligned memory block.
## Parameter : [p] Destination memory address pointer.
##             [a] 128-bit source vector.
func mm_storeu_ps*(p: ptr float32, a: M128): void {.importc: "_mm_storeu_ps".}

## Category  : Store
## Operator  : StoreBroadcast
## Type      : float32
## Docs      : Stores the lowest float32 element of 'a' into four consecutive memory locations starting at 'p'.
## Parameter : [p] Destination memory array base address.
##             [a] 128-bit source vector.
func mm_store1_ps*(p: ptr float32, a: M128): void {.importc: "_mm_store1_ps".}

## Category  : Store
## Operator  : StoreBroadcast
## Type      : float32
## Docs      : Alias of mm_store1_ps. Replicates the lowest float32 element across 4 memory slots.
## Parameter : [p] Destination memory address pointer.
##             [a] 128-bit source vector.
func mm_store_ps1*(p: ptr float32, a: M128): void {.importc: "_mm_store_ps1".}

## Category  : Store
## Operator  : StoreReverse
## Type      : float32
## Docs      : Stores 4 packed float32 values from 'a' into memory in reverse order.
## Parameter : [p] Destination memory array base address.
##             [a] 128-bit source vector.
func mm_storer_ps*(p: ptr float32, a: M128): void {.importc: "_mm_storer_ps".}

## Category  : Data Struct
## Operator  : Move
## Type      : float32
## Docs      : Moves the lower float32 element of 'b' into 'a'. Upper elements of 'a' are preserved.
## Parameter : [a] 128-bit base vector.
##             [b] 128-bit vector providing element 0.
func mm_move_ss*(a: M128, b: M128): M128 {.importc: "_mm_move_ss".}

# ------------------------------------------
# MMX Extensions (Integer Multi-Media Extensions)
# ------------------------------------------

## Category  : Data Struct
## Operator  : Extract
## Type      : int16
## Docs      : Extracts a 16-bit unsigned integer from 64-bit MMX vector 'a' at specified index 'n'.
## Parameter : [a] 64-bit MMX source register.
##             [n] Constant index selector (0-3).
func mm_extract_pi16*(a: M64, n: int32): int32 {.importc: "_mm_extract_pi16".}

## Category  : Data Struct
## Operator  : Extract
## Type      : int16
## Docs      : Template macro wrapper for mm_extract_pi16.
template mm_extract_pi16*(A, N: untyped): untyped = mm_extract_pi16(A, N.int32)
template m_pextrw*(A, N: untyped): untyped = mm_extract_pi16(A, N.int32)

## Category  : Data Struct
## Operator  : Insert
## Type      : int16
## Docs      : Inserts 16-bit integer 'd' into 64-bit MMX vector 'a' at position index 'n'.
## Parameter : [a] 64-bit MMX source register.
##             [d] 16-bit integer value to insert.
##             [n] Constant target slot index selector (0-3).
func mm_insert_pi16*(a: M64, d: int32, n: int32): M64 {.importc: "_mm_insert_pi16".}

## Category  : Data Struct
## Operator  : Insert
## Type      : int16
## Docs      : Template macro wrapper for mm_insert_pi16.
template mm_insert_pi16*(A, D, N: untyped): untyped = mm_insert_pi16(A, D.int32, N.int32)
template m_pinsrw*(A, D, N: untyped): untyped = mm_insert_pi16(A, D.int32, N.int32)

## Category  : Compare
## Operator  : Max
## Type      : int16
## Docs      : Compares packed signed 16-bit integers in 'a' and 'b', and returns maximum values.
## Parameter : [a] 64-bit MMX vector.
##             [b] 64-bit MMX vector.
func mm_max_pi16*(a: M64, b: M64): M64 {.importc: "_mm_max_pi16".}

## Category  : Compare
## Operator  : Max
## Type      : uint8
## Docs      : Compares packed unsigned 8-bit integers in 'a' and 'b', and returns maximum values.
## Parameter : [a] 64-bit MMX vector.
##             [b] 64-bit MMX vector.
func mm_max_pu8*(a: M64, b: M64): M64 {.importc: "_mm_max_pu8".}

## Category  : Compare
## Operator  : Min
## Type      : int16
## Docs      : Compares packed signed 16-bit integers in 'a' and 'b', and returns minimum values.
## Parameter : [a] 64-bit MMX vector.
##             [b] 64-bit MMX vector.
func mm_min_pi16*(a: M64, b: M64): M64 {.importc: "_mm_min_pi16".}

## Category  : Compare
## Operator  : Min
## Type      : uint8
## Docs      : Compares packed unsigned 8-bit integers in 'a' and 'b', and returns minimum values.
## Parameter : [a] 64-bit MMX vector.
##             [b] 64-bit MMX vector.
func mm_min_pu8*(a: M64, b: M64): M64 {.importc: "_mm_min_pu8".}

## Category  : Data Struct
## Operator  : MoveMask
## Type      : int8
## Docs      : Extracts the sign bits (MSB) of all eight packed 8-bit integers in M64 vector 'a' into an 8-bit scalar integer.
## Parameter : [a] 64-bit MMX vector.
func mm_movemask_pi8*(a: M64): int32 {.importc: "_mm_movemask_pi8".}

## Category  : Arithmetic
## Operator  : MultiplyHigh
## Type      : uint16
## Docs      : Multiplies packed unsigned 16-bit integers in 'a' and 'b', then returns the high 16-bits of each 32-bit intermediate product.
## Parameter : [a] 64-bit MMX vector.
##             [b] 64-bit MMX vector.
func mm_mulhi_pu16*(a: M64, b: M64): M64 {.importc: "_mm_mulhi_pu16".}

## Category  : Data Struct
## Operator  : Shuffle
## Type      : int16
## Docs      : Shuffles packed 16-bit integers in M64 vector 'a' using immediate mask constant 'n'.
## Parameter : [a] 64-bit MMX vector.
##             [n] 8-bit constant shuffle control mask.
func mm_shuffle_pi16*(a: M64, n: int32): M64 {.importc: "_mm_shuffle_pi16".}

## Category  : Data Struct
## Operator  : Shuffle
## Type      : int16
## Docs      : Template macro wrapper for mm_shuffle_pi16.
template mm_shuffle_pi16*(A, N: untyped): untyped = mm_shuffle_pi16(A, N.int32)
template m_pshufw*(A, N: untyped): untyped = mm_shuffle_pi16(A, N.int32)

## Category  : Store
## Operator  : MaskStore
## Type      : int8
## Docs      : Conditionally stores byte elements from M64 vector 'a' into memory address 'p' according to high-bit masks in 'n'.
## Parameter : [a] 64-bit MMX source register.
##             [n] 64-bit selector condition mask.
##             [p] Destination raw memory byte offset pointer.
func mm_maskmove_si64*(a: M64, n: M64, p: ptr int8): void {.importc: "_mm_maskmove_si64".}

## Category  : Arithmetic
## Operator  : Average
## Type      : uint8
## Docs      : Computes the rounded averages of packed unsigned 8-bit integers in 'a' and 'b' (e.g., (a+b+1)/2).
## Parameter : [a] 64-bit MMX vector.
##             [b] 64-bit MMX vector.
func mm_avg_pu8*(a: M64, b: M64): M64 {.importc: "_mm_avg_pu8".}

## Category  : Arithmetic
## Operator  : Average
## Type      : uint16
## Docs      : Computes the rounded averages of packed unsigned 16-bit integers in 'a' and 'b'.
## Parameter : [a] 64-bit MMX vector.
##             [b] 64-bit MMX vector.
func mm_avg_pu16*(a: M64, b: M64): M64 {.importc: "_mm_avg_pu16".}

## Category  : Arithmetic
## Operator  : SAD
## Type      : uint8
## Docs      : Computes the Sum of Absolute Differences (SAD) of packed unsigned 8-bit integers. Accumulates results into a single 16-bit unsigned integer value returned in the lower slot.
## Parameter : [a] 64-bit MMX vector.
##             [b] 64-bit MMX vector.
func mm_sad_pu8*(a: M64, b: M64): M64 {.importc: "_mm_sad_pu8".}

# ------------------------------------------
# Streaming Non-Temporal Operations & Fences
# ------------------------------------------

## Category  : Store
## Operator  : Stream
## Type      : int64
## Docs      : Writes a 64-bit MMX vector to memory using a non-temporal hint (bypasses cache lines directly to RAM, preventing cache pollution).
## Parameter : [p] Target 64-bit non-temporal memory address pointer.
##             [a] 64-bit MMX source vector.
func mm_stream_pi*(p: ptr M64, a: M64): void {.importc: "_mm_stream_pi".}

## Category  : Store
## Operator  : Stream
## Type      : float32
## Docs      : Writes 128-bits of packed float32 values to memory using a non-temporal hint. Memory must be 16-byte aligned.
## Parameter : [p] Target 16-byte aligned float32 memory array block pointer.
##             [a] 128-bit source vector.
func mm_stream_ps*(p: ptr float32, a: M128): void {.importc: "_mm_stream_ps".}

## Category  : Control
## Operator  : StoreFence
## Type      : void
## Docs      : Guarantees that every preceding write/store instruction is globally visible in system memory before any subsequent stores are executed.
## Parameter : None
func mm_sfence*(): void {.importc: "_mm_sfence".}

## Category  : Control
## Operator  : Pause
## Type      : void
## Docs      : Hints to the processor pipeline that a spin-wait loop is running, conserving power and optimization resources.
## Parameter : None
func mm_pause*(): void {.importc: "_mm_pause".}

# ------------------------------------------
# Complex Multi-Line Matrix Transformations
# ------------------------------------------

## Category  : Data Struct
## Operator  : Transpose
## Type      : float32
## Docs      : Matrix transpose macro. Inplaces a $4 \times 4$ float32 matrix transpose conversion directly within 4 vector registers in-flight. Zero-overhead wrapper.
## Parameter : [row0] 128-bit vector row 0 reference.
##             [row1] 128-bit vector row 1 reference.
##             [row2] 128-bit vector row 2 reference.
##             [row3] 128-bit vector row 3 reference.
template MM_TRANSPOSE4_PS*(row0, row1, row2, row3: var M128) =
  let r0 = row0
  let r1 = row1
  let r2 = row2
  let r3 = row3
  let t0 = mm_unpacklo_ps(r0, r1)
  let t1 = mm_unpacklo_ps(r2, r3)
  let t2 = mm_unpackhi_ps(r0, r1)
  let t3 = mm_unpackhi_ps(r2, r3)
  row0 = mm_movelh_ps(t0, t1)
  row1 = mm_movehl_ps(t1, t0)
  row2 = mm_movelh_ps(t2, t3)
  row3 = mm_movehl_ps(t3, t2)
