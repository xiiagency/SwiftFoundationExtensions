/**
 Mapping utilities for `Sequence`s.
 */
extension Sequence {
  /**
   Converts a `Sequence` of tuples of size 2 containing a `Hashable` key and a value to a `Dictionary`.
   */
  public func asDictionary<Key : Hashable, Value>() -> [Key: Value] where Element == (Key, Value) {
    Dictionary(uniqueKeysWithValues: self)
  }
  
  /**
   Returns a `Dictionary` containing unique key/value pairs, extracted by the provided closure for each element in the `Sequence`.
   */
  public func mapToDictionary<Key : Hashable, MappedValue>(
    _ pairExtractor: @escaping (Element) throws -> (Key, MappedValue)
  ) rethrows -> [Key: MappedValue] {
    try map(pairExtractor)
      .asDictionary()
  }
  
  /**
   Returns `Dictionary` containing the elements of this `Sequence`, grouped by a key returned from the provided closure.
   */
  public func grouped<Key : Hashable>(
    _ keyExtractor: @escaping (Element) throws -> Key
  ) rethrows -> [Key: [Element]] {
    try Dictionary(
      grouping: self,
      by: { element in try keyExtractor(element) }
    )
  }
}

/**
 Math utilities or `Sequence`s of numeric elements.
 */
extension Sequence {
  /**
   Returns the sum of the values in the `Collection`, or `0.0` if the collection is empty.
   */
  public func sum() -> Double where Element == Double {
    reduce(0.0, +)
  }
  
  /**
   Returns the sum of the squares of the values in the `Collection`, or `0.0` if the collection is empty.
   */
  public func sumOfSquares() -> Double where Element == Double {
    reduce(0.0, { last, next in last + (next * next) })
  }
  
  /**
   Returns the sum of the values in the `Collection`, or `0` if the collection is empty.
   */
  public func sum() -> Int where Element == Int {
    reduce(0, +)
  }
  
  /**
   Returns the sum of the squares of the values in the `Collection`, or `0` if the collection is empty.
   */
  public func sumOfSquares() -> Int where Element == Int {
    reduce(0, { last, next in last + (next * next) })
  }
}
