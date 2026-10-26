## POPCNT intrinsics

{.push header: "immintrin.h".}
# operating : count the number of bits set to 1 in a 32-bit unsigned integer
# lane unit : uint32 / lane numbers : 1
func mm_popcnt_u32*(a: uint32): int32 {.importc: "_mm_popcnt_u32".}

# operating : count the number of bits set to 1 in a 64-bit unsigned integer
# lane unit : uint64 / lane numbers : 1
func mm_popcnt_u64*(a: uint64): int64 {.importc: "_mm_popcnt_u64".}

# operating : count the number of bits set to 1 in a 32-bit signed integer
# lane unit : int32 / lane numbers : 1
func popcnt32*(a: int32): int32 {.importc: "_popcnt32".}

# operating : count the number of bits set to 1 in a 64-bit signed integer
# lane unit : int64 / lane numbers : 1
func popcnt64*(a: int64): int32 {.importc: "_popcnt64".}

{.pop.}
