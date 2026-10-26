import sse
import sse2
import avx
import avx2
import avx512f

# ==========================================
# SIMD Vector Extensions : Cryptography (AES)
# ==========================================

## Category  : Cryptography
## Operator  : Decrypt
## Type      : AES
## Docs      : Performs one round of an AES decryption flow on 128-bit interleaved lanes using the RoundKey.
## Parameter : [a] 256-bit vector containing two 128-bit cipher states.
##             [b] 256-bit vector containing two 128-bit round keys.
func mm256_aesdec_epi128*(a: M256i, b: M256i): M256i {.importc: "_mm256_aesdec_epi128".}

## Category  : Cryptography
## Operator  : DecryptLast
## Type      : AES
## Docs      : Performs the last round of an AES decryption flow on 128-bit interleaved lanes (omits the MixColumns stage).
## Parameter : [a] 256-bit vector containing two 128-bit cipher states.
##             [b] 256-bit vector containing two 128-bit round keys.
func mm256_aesdeclast_epi128*(a: M256i, b: M256i): M256i {.importc: "_mm256_aesdeclast_epi128".}

## Category  : Cryptography
## Operator  : Encrypt
## Type      : AES
## Docs      : Performs one round of an AES encryption flow on 128-bit interleaved lanes using the RoundKey.
## Parameter : [a] 256-bit vector containing two 128-bit plain/intermediate states.
##             [b] 256-bit vector containing two 128-bit round keys.
func mm256_aesenc_epi128*(a: M256i, b: M256i): M256i {.importc: "_mm256_aesenc_epi128".}

## Category  : Cryptography
## Operator  : EncryptLast
## Type      : AES
## Docs      : Performs the last round of an AES encryption flow on 128-bit interleaved lanes (omits the MixColumns stage).
## Parameter : [a] 256-bit vector containing two 128-bit plain/intermediate states.
##             [b] 256-bit vector containing two 128-bit round keys.
func mm256_aesenclast_epi128*(a: M256i, b: M256i): M256i {.importc: "_mm256_aesenclast_epi128".}

# ------------------------------------------

## Category  : Cryptography
## Operator  : Decrypt
## Type      : AES
## Docs      : Performs one round of an AES decryption flow on four independent 128-bit lanes simultaneously.
## Parameter : [a] 512-bit vector containing four 128-bit cipher states.
##             [b] 512-bit vector containing four 128-bit round keys.
func mm512_aesdec_epi128*(a: M512i, b: M512i): M512i {.importc: "_mm512_aesdec_epi128".}

## Category  : Cryptography
## Operator  : DecryptLast
## Type      : AES
## Docs      : Performs the last round of an AES decryption flow on four independent 128-bit lanes (omits the MixColumns stage).
## Parameter : [a] 512-bit vector containing four 128-bit cipher states.
##             [b] 512-bit vector containing four 128-bit round keys.
func mm512_aesdeclast_epi128*(a: M512i, b: M512i): M512i {.importc: "_mm512_aesdeclast_epi128".}

## Category  : Cryptography
## Operator  : Encrypt
## Type      : AES
## Docs      : Performs one round of an AES encryption flow on four independent 128-bit lanes simultaneously.
## Parameter : [a] 512-bit vector containing four 128-bit plain/intermediate states.
##             [b] 512-bit vector containing four 128-bit round keys.
func mm512_aesenc_epi128*(a: M512i, b: M512i): M512i {.importc: "_mm512_aesenc_epi128".}

## Category  : Cryptography
## Operator  : EncryptLast
## Type      : AES
## Docs      : Performs the last round of an AES encryption flow on four independent 128-bit lanes (omits the MixColumns stage).
## Parameter : [a] 512-bit vector containing four 128-bit plain/intermediate states.
##             [b] 512-bit vector containing four 128-bit round keys.
func mm512_aesenclast_epi128*(a: M512i, b: M512i): M512i {.importc: "_mm512_aesenclast_epi128".}
