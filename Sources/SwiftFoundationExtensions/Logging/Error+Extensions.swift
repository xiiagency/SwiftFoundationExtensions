import Foundation

/**
 Extend Error to be able to send a user readable message to `OSLog` (via `Logger`).
 */
extension Error {
  /**
   Returns the description of this error.
   Useful for printing error names via `OSLog` (via `Logger`).
   */
  public var description: String {
    String(describing: self)
  }
  
  /**
   Wraps an `Error` to a `ErrorWithTrace`, capturing the call site's file/line.
   
   `withTrace` should only be called at the call site where the error is thrown (or sent through the continuation) like this:
   
   ```
   throw MyErrorEnum.MyErrorValue(someArg).withTrace()
   ```
   */
  public func withTrace(filePath: String = #file, line: Int = #line) -> ErrorWithTrace {
    ErrorWithTrace(
      file: (filePath as NSString).lastPathComponent,
      line: line,
      error: self
    )
  }
  
  /**
   Provides the ability to convert an `ErrorWithTrace` to it's underlying error or cast a general `Error` to a specific type.
   Attempts to cast the current error as the requested target, returns the value if the cast is successful.
   Then checks if the error is a `ErrorWithTrace`, attempting to cast its underlying `error` as the target, returning the value.
   If either conversion fails, nil is returned.
   */
  public func castError<Target : Error>(to type: Target.Type) -> Target? {
    if let directCast = self as? Target {
      return directCast
    }
    
    if let indirectCast = (self as? ErrorWithTrace)?.error as? Target {
      return indirectCast
    }
    
    return nil
  }
}
