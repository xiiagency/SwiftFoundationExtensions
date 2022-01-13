/**
 Math utilities or `AsyncSequence`s of numeric elements.
 */
extension AsyncSequence {
  /**
   Returns the sum of the values in the `Collection`, or `0.0` if the collection is empty.
   */
  public func sum() async rethrows -> Double where Element == Double {
    try await reduce(0.0, +)
  }
  
  /**
   Returns the sum of the squares of the values in the `Collection`, or `0.0` if the collection is empty.
   */
  public func sumOfSquares() async rethrows -> Double where Element == Double {
    try await reduce(0.0, { last, next in last + (next * next) })
  }
  
  /**
   Returns the sum of the values in the `Collection`, or `0` if the collection is empty.
   */
  public func sum() async rethrows -> Int where Element == Int {
    try await reduce(0, +)
  }
  
  /**
   Returns the sum of the squares of the values in the `Collection`, or `0` if the collection is empty.
   */
  public func sumOfSquares() async rethrows -> Int where Element == Int {
    try await reduce(0, { last, next in last + (next * next) })
  }
}
