/**
 Math utilities for `Collection`s containing numeric values (e.g. `Int`/`Double`).
 */
extension Collection {
  /**
   Returns the average of the values in the `Collection`, or `0.0` if the collection is empty.
   */
  public func average() -> Double where Element == Double {
    guard !isEmpty else {
      return 0.0
    }
    
    return sum() / Double(count)
  }
  
  /**
   Returns the average of the values in the `Collection`, or `0.0` if the collection is empty.
   */
  public func average() -> Int where Element == Int {
    guard !isEmpty else {
      return 0
    }
    
    return sum() / count
  }
}
