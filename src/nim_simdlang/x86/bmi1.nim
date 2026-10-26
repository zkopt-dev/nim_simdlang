{.push header: "immintrin.h".}

# operating : compute bitwise AND of NOT 'a' with 'b' ( (~a) & b )
# lane unit : uint32 / lane numbers : 1
func andn_u32*(a, b: uint32): uint32 {.importc: "_andn_u32".}

# operating : compute bitwise AND of NOT 'a' with 'b' ( (~a) & b )
# lane unit : uint64 / lane numbers : 1
func andn_u64*(a, b: uint64): uint64 {.importc: "_andn_u64".}

# operating : extract contiguous bits from 'a' starting at 'start' for 'len' bits
# lane unit : uint32 / lane numbers : 1
func bextr_u32*(a, start, len: uint32): uint32 {.importc: "_bextr_u32".}

# operating : extract contiguous bits from 'a' starting at 'start' for 'len' bits
# lane unit : uint64 / lane numbers : 1
func bextr_u64*(a: uint64, start, len: uint32): uint64 {.importc: "_bextr_u64".}

# operating : extract contiguous bits from 'a' using start/length specified in 'control'
# lane unit : uint32 / lane numbers : 1
func bextr2_u32*(a, control: uint32): uint32 {.importc: "_bextr2_u32".}

# operating : extract contiguous bits from 'a' using start/length specified in 'control'
# lane unit : uint64 / lane numbers : 1
func bextr2_u64*(a, control: uint64): uint64 {.importc: "_bextr2_u64".}

# operating : extract the lowest set bit from 'a' ( a & -a )
# lane unit : uint32 / lane numbers : 1
func blsi_u32*(a: uint32): uint32 {.importc: "_blsi_u32".}

# operating : extract the lowest set bit from 'a' ( a & -a )
# lane unit : uint64 / lane numbers : 1
func blsi_u64*(a: uint64): uint64 {.importc: "_blsi_u64".}

# operating : set all bits below the lowest set bit to 1, including the bit itself ( a ^ (a - 1) )
# lane unit : uint32 / lane numbers : 1
func blsmsk_u32*(a: uint32): uint32 {.importc: "_blsmsk_u32".}

# operating : set all bits below the lowest set bit to 1, including the bit itself ( a ^ (a - 1) )
# lane unit : uint64 / lane numbers : 1
func blsmsk_u64*(a: uint64): uint64 {.importc: "_blsmsk_u64".}

# operating : reset the lowest set bit of 'a' to zero ( a & (a - 1) )
# lane unit : uint32 / lane numbers : 1
func blsr_u32*(a: uint32): uint32 {.importc: "_blsr_u32".}

# operating : reset the lowest set bit of 'a' to zero ( a & (a - 1) )
# lane unit : uint64 / lane numbers : 1
func blsr_u64*(a: uint64): uint64 {.importc: "_blsr_u64".}

# operating : count the number of trailing zeros in 'a' (starting from the least significant bit)
# lane unit : uint32 / lane numbers : 1
func mm_tzcnt_32*(a: uint32): int32 {.importc: "_mm_tzcnt_32".}

# operating : count the number of trailing zeros in 'a' (starting from the least significant bit)
# lane unit : uint64 / lane numbers : 1
func mm_tzcnt_64*(a: uint64): int64 {.importc: "_mm_tzcnt_64".}

# operating : count the number of trailing zeros in 'a' (starting from the least significant bit)
# lane unit : uint16 / lane numbers : 1
func mm_tzcnt_u16*(a: uint16): uint16 {.importc: "_mm_tzcnt_u16".}

# operating : count the number of trailing zeros in 'a' (starting from the least significant bit)
# lane unit : uint32 / lane numbers : 1
func mm_tzcnt_u32*(a: uint32): uint32 {.importc: "_mm_tzcnt_u32".}

# operating : count the number of trailing zeros in 'a' (starting from the least significant bit)
# lane unit : uint64 / lane numbers : 1
func mm_tzcnt_u64*(a: uint64): uint64 {.importc: "_mm_tzcnt_u64".}

func tzcnt_u16*(x: uint16): uint16 {.importc: "__tzcnt_u16".}

func tzcnt_u32*(x: uint32): uint32 {.importc: "__tzcnt_u32".}

func tzcnt_u64*(x: uint64): uint64 {.importc: "__tzcnt_u64".}

{.pop.}
