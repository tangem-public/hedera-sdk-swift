import Foundation

extension Transaction {
    /// - Note: Tangem addition.
    public func signedTransactionsData() throws -> [Data] {
        return try makeSources()
            .signedTransactions
            .map { $0.bodyBytes }
    }
}
