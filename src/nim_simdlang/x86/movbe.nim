{.push header: "immintrin.h".}

# operating : load 16-bit integer from memory and convert from big-endian to native endian
# lane unit : int16 / lane numbers : 1
func loadbe_i16*(p: pointer): int16 {.importc: "_loadbe_i16".}

# operating : load 32-bit integer from memory and convert from big-endian to native endian
# lane unit : int32 / lane numbers : 1
func loadbe_i32*(p: pointer): int32 {.importc: "_loadbe_i32".}

# operating : load 64-bit integer from memory and convert from big-endian to native endian
# lane unit : int64 / lane numbers : 1
func loadbe_i64*(p: pointer): int64 {.importc: "_loadbe_i64".}

# operating : convert 16-bit integer from native endian to big-endian and store to memory
# lane unit : int16 / lane numbers : 1
func storebe_i16*(p: pointer, data: int16) {.importc: "_storebe_i16".}

# operating : convert 32-bit integer from native endian to big-endian and store to memory
# lane unit : int32 / lane numbers : 1
func storebe_i32*(p: pointer, data: int32) {.importc: "_storebe_i32".}

# operating : convert 64-bit integer from native endian to big-endian and store to memory
# lane unit : int64 / lane numbers : 1
func storebe_i64*(p: pointer, data: int64) {.importc: "_storebe_i64".}

{.pop.}
