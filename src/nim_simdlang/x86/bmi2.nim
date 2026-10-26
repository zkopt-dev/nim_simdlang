{.push header: "immintrin.h".}

# operating : zero out bits at and above 'index' (keep only the lowest 'index' bits)
# lane unit : uint32 / lane numbers : 1
func bzhi_u32*(a: uint32, index: uint32): uint32 {.importc: "_bzhi_u32".}

# operating : zero out bits at and above 'index' (keep only the lowest 'index' bits)
# lane unit : uint64 / lane numbers : 1
func bzhi_u64*(a: uint64, index: uint32): uint64 {.importc: "_bzhi_u64".}

# operating : multiply 'a' and 'b' without affecting flags (low 32-bit returned, high 32-bit to 'hi')
# lane unit : uint32 / lane numbers : 1
func mulx_u32*(a, b: uint32; hi: ptr uint32): uint32 {.importc: "_mulx_u32".}

# operating : multiply 'a' and 'b' without affecting flags (low 64-bit returned, high 64-bit to 'hi')
# lane unit : uint64 / lane numbers : 1
func mulx_u64*(a, b: uint64; hi: ptr uint64): uint64 {.importc: "_mulx_u64".}

# operating : extract bits from 'a' at positions specified by 'mask' to contiguous low bits
# lane unit : uint32 / lane numbers : 1
func pext_u32*(a, mask: uint32): uint32 {.importc: "_pext_u32".}

# operating : extract bits from 'a' at positions specified by 'mask' to contiguous low bits
# lane unit : uint64 / lane numbers : 1
func pext_u64*(a, mask: uint64): uint64 {.importc: "_pext_u64".}

# operating : spread low bits of 'a' to positions specified by 'mask'
# lane unit : uint32 / lane numbers : 1
func pdep_u32*(a, mask: uint32): uint32 {.importc: "_pdep_u32".}

# operating : spread low bits of 'a' to positions specified by 'mask'
# lane unit : uint64 / lane numbers : 1
func pdep_u64*(a, mask: uint64): uint64 {.importc: "_pdep_u64".}

{.pop.}
