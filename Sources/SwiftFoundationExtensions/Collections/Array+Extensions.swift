import Foundation

extension Array {
  /**
   Returns a `Dictionary` containing unique key/value pairs, extracted by the provided closure for each element in the `Array`.
   */
  public func mapped<Key : Hashable, MappedValue>(
    by pairExtractor: @escaping (Element) -> (Key, MappedValue)
  ) -> [Key: MappedValue] {
    Dictionary(uniqueKeysWithValues: map(pairExtractor))
  }
  
  /**
   Returns a `Dictionary` containing unique key/value pairs, extracted by the provided closure for each element in the `Array`.
   */
  public func mapped<Key : Hashable, MappedValue>(
    by pairExtractor: @escaping (Element) throws -> (Key, MappedValue)
  ) throws -> [Key: MappedValue] {
    Dictionary(uniqueKeysWithValues: try map(pairExtractor))
  }
  
  /**
   Returns a `Dictionary` containing the elements of this array, uniquely keyed by the results of the provided key extractor.
   */
  public func mapped<Key : Hashable>(
    by keyExtractor: @escaping (Element) -> Key
  ) -> [Key: Element] {
    mapped(by: { element in (keyExtractor(element), element) })
  }
  
  /**
   Returns a `Dictionary` containing the elements of this array, uniquely keyed by the results of the provided key extractor.
   */
  public func mapped<Key : Hashable>(
    by keyExtractor: @escaping (Element) throws -> Key
  ) throws -> [Key: Element] {
    try mapped(by: { element in (try keyExtractor(element), element) })
  }
  
  /**
   Returns `Dictionary` containing the elements of this array, grouped by a key returned from the provided closure.
   */
  public func grouped<Key : Hashable>(
    by keyExtractor: @escaping (Element) -> Key
  ) -> [Key: [Element]] {
    Dictionary(
      grouping: self,
      by: { element in keyExtractor(element) }
    )
  }
  
  /**
   Returns `Dictionary` containing the elements of this array, grouped by a key returned from the provided closure.
   */
  public func grouped<Key : Hashable>(
    by keyExtractor: @escaping (Element) throws -> Key
  ) throws -> [Key: [Element]] {
    try Dictionary(
      grouping: self,
      by: { element in try keyExtractor(element) }
    )
  }
}

extension Array where Element: Identifiable {
  /**
   Returns a `Dictionary` containing the elements of this array, uniquely keyed by their IDs.
   */
  public func mappedById() -> [Element.ID: Element] {
    mapped(by: { element in element.id })
  }
  
  /**
   Returns a `Dictionary` containing the elements of this array, grouped by their IDs.
   */
  public func groupedById() -> [Element.ID: [Element]] {
    grouped(by: { element in element.id })
  }
}
