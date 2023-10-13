extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}