import Foundation

/**
 A utility for tracking/reporting the elapsed time between operations.
 
 Utilizes `CFAbsoluteTimeGetCurrent` to get an accurate measure of the current time on the device and the difference
 between these measures as the elapsed time.
 */
public class ElapsedTimer {
  // Text format to use when reporting elapsed time as text: millisecond precision.
  private static let SECONDS_TEXT_FORMAT = "%0.3fs"
  
  // The last start/reset time.
  private var lastTime: Double
  
  /**
   Creates an `ElapsedTimer`, recording the current timestamp to be used in reporting elapsed time.
   */
  public init() {
    self.lastTime = CFAbsoluteTimeGetCurrent()
  }
  
  /**
   Resets the timestamp of the tracked operation to the current timestamp via `CFAbsoluteTimeGetCurrent`.
   */
  public func reset() {
    lastTime = CFAbsoluteTimeGetCurrent()
  }
  
  /**
   Returns the elapsed time from the last time the timer was initialized or `reset` to right now as a `Double`.
   */
  public func elapsedTimeSeconds() -> Double {
    return CFAbsoluteTimeGetCurrent() - lastTime
  }
  
  /**
   Returns the elapsed time from the last time the timer was initialized or `reset` to right now, as a `String` with ms precision.
   */
  public func elapsedTimeSecondsText() -> String {
    let elapsed: Double = elapsedTimeSeconds()
    return String(format: Self.SECONDS_TEXT_FORMAT, elapsed)
  }
  
  /**
   Similarly to `elapsedTimeSeconds`, returns the elapsed time as a `Double`, but also resets the timer.
   */
  public func elapsedTimeSecondsAndReset() -> Double {
    let elapsed = elapsedTimeSeconds()
    reset()
    return elapsed
  }
  
  /**
   Similarly to `elapsedTimeSecondsText`, returns the elapsed time as a `String`, but also resets the timer.
   */
  public func elapsedTimeSecondsTextAndReset() -> String {
    let elapsedText = elapsedTimeSecondsText()
    reset()
    return elapsedText
  }
}
