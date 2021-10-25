import Foundation


extension Double {
  /**
   The  level of tolerance for Double "closeness" comparisons = 4 decimal places.
   */
  public static let CLOSENESS_TOLERANCE = 0.0001

  /**
   Returns true if the current value and the provided one are closer than the "closeness" tolerance level, false otherwise.
   
   NOTE: This is needed due to the way Double/Float instances are stored in memory on devices.
         The number 0.5 may be stored as 0.49999999997 and if you attempt to compare these it will result in false.
   */
  public func isCloseTo(_ other: Double) -> Bool {
    abs(self - other) < Self.CLOSENESS_TOLERANCE
  }
  
  /**
   Returns true if the current value is greater than the provided one, or if they are closer than the "closeness" tolerance level,
   false otherwise.
   
   NOTE: This is needed due to the way Double/Float instances are stored in memory on devices.
         The number 0.5 may be stored as 0.49999999997 and if you attempt to compare these it will result in false.
   */
  public func isCloseToOrGreaterThan(_ other: Double) -> Bool {
    (self - other) > -Self.CLOSENESS_TOLERANCE
  }
  
  /**
   Returns true if the current value is less than the provided one, or if they are closer than the "closeness" tolerance level, false otherwise.
   
   NOTE: This is needed due to the way Double/Float instances are stored in memory on devices.
         The number 0.5 may be stored as 0.49999999997 and if you attempt to compare these it will result in false.
   */
  public func isCloseToOrLessThan(_ other: Double) -> Bool {
    (other - self) > -Self.CLOSENESS_TOLERANCE
  }
  
  /**
   Returns the value rounded upwards and converted to an `Int`.
   */
  public var roundedUp: Int {
    Int(rounded(.up))
  }
  
  /**
   Returns the value rounded downwards and converted to an `Int`.
   */
  public var roundedDown: Int {
    Int(rounded(.down))
  }
}
