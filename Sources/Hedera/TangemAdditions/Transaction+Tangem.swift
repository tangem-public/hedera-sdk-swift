import Foundation

extension Transaction {
    /// Signs all of the transactions with the given signers.
    /// - Note: Signs in a one-to-one fashion (one specific signer at a particular index is used to sign one specific transaction at the same index).
    /// - Note: Tangem addition.
    @discardableResult
    public final func addSignatures(_ publicKey: PublicKey, _ signatures: [Data]) -> Self {
        precondition(nodeAccountIds?.count == signatures.count, "The number of network nodes and the number of signatures do not match")

        let signers = signatures.map { signature in
            return Signer(publicKey) { _ in signature }
        }

        // swiftlint:disable:next force_try
        let sources = try! makeSources()

        self.sources = sources.signWithSignersOneToOne(signers)

        return self
    }
}
