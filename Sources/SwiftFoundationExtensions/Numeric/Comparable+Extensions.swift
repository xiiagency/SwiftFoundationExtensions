import Foundation

extension Comparable {
  /**
   Returns the value clamped to the provided closed range.
   This is equivalent to: `min(max([VALUE], [LOWER_BOUND]), [UPPER_BOUND])`.
   */
  public func clamped(to limits: ClosedRange<Self>) -> Self {
    min(max(self, limits.lowerBound), limits.upperBound)
  }
  
  /**
   Returns the value clamped to the provided half-open range.
   This is equivalent to: `min(max([VALUE], [LOWER_BOUND]), [UPPER_BOUND] - 1)`.
   */
  public func clamped(to limits: Range<Self>) -> Self where Self : Strideable {
    min(max(self, limits.lowerBound), limits.upperBound.advanced(by: -1))
  }
}
