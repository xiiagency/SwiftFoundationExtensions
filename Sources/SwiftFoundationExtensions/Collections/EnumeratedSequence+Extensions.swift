/**
 Utilities for gathering values of an `EnumeratedSequence`.
 */
extension EnumeratedSequence {
  /**
   Returns a `Dictionary` containing unique key/value pairs, extracted by the provided closure for each element in the
   `EnumeratedSequence`.
   */
  public func mapToDictionary<Key : Hashable, MappedValue>(
    _ pairExtractor: @escaping (Iterator.Element) throws -> (Key, MappedValue)
  ) rethrows -> [Key: MappedValue] {
    Dictionary(uniqueKeysWithValues: try map(pairExtractor))
  }
}
