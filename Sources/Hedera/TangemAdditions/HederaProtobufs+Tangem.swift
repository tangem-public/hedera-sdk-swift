import HederaProtobufs

extension Proto_SignedTransaction {
    /// - Note: Unmodified logic from `TransactionSources.signWithSigners(_:)`.
    /// - Note: Tangem addition.
    internal func isAlreadySignedWithPublicKey(_ publicKey: PublicKey) -> Bool {
        let key = publicKey.toBytesRaw()

        return sigMap.sigPair.contains { key.starts(with: $0.pubKeyPrefix) } ?? false
    }
}
