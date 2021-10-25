import Foundation

/**
 A Specialized error that captures the file/line number of a thrown error to aid in debugging.
 
 NOTE: This struct is not initialized directly but rather the `Error.withTrace()` extension should be used instead.
 */
public struct ErrorWithTrace : Error, CustomStringConvertible {
  /**
   The name of the file where `.withTrace()` conversion was called.
   */
  let file: String
  
  /**
   The line within the file where `.withTrace()` conversion was called.
   */
  let line: Int
  
  /**
   The underlying error.
   */
  let error: Error
  
  /**
   Returns the decorated description of this error.
   */
  public var description: String {
    "⚠️ \(error.description) @ \(file):\(line)"
  }
  
  /**
   Returns the decorated description, same as `description`.
   */
  public var localizedDescription: String {
    description
  }
}
