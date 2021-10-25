import Foundation

extension Date {
  /**
   Returns the start of the week (dependent on device locale) for the given date.
   */
  public var startOfWeek: Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
    return calendar.date(from: components)!
  }
  
  /**
   Returns the number of days remaining this week as an `Int`.
   */
  public var daysRemainingThisWeek: Int {
    let calendar = Calendar.current
    let numberOfDays = calendar.dateComponents([.day], from: self.startOfWeek, to: self)
    return numberOfDays.day!
  }
  
  /**
   Returns the start of the month for the given date.
   */
  public var startOfMonth: Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month], from: self)
    return calendar.date(from: components)!
  }
  
  /**
   Returns the start of the year for the given date.
   */
  public var startOfYear: Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year], from: self)
    return calendar.date(from: components)!
  }
  
  /**
   Creates a new date from year/month/day values using the current `Calendar`.
   */
  public init(year: Int, month: Int, day: Int) {
    let components = DateComponents(year: year, month: month, day: day)
    self = Calendar.current.date(from: components)!
  }
}
