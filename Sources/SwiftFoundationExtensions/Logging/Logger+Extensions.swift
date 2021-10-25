import Foundation
import os

extension Logger {
  // Retrieve the bundle id so that it doesn't have be retrieved every time we build a Logger.
  private static var subsystem = Bundle.main.bundleIdentifier!
  
  /**
   Returns a Logger instance for the given category and the current application bundle id.
   
   Usage:
     ```
     private struct FooView : View {
       private static let logger: Logger = .loggerFor("FooView")
       ...
     }
     ```
   */
  public static func loggerFor(_ category: String) -> Logger {
    Logger(subsystem: subsystem, category: category)
  }
  
  /**
   Returns a Logger instance for the given type and the current application bundle id.
   
   Usage:
     ```
     private struct FooView : View {
       private static let logger: Logger = .loggerFor(FooView.self)
       ...
     }
     ```
   */
  public static func loggerFor<Type>(_ type: Type.Type) -> Logger {
    loggerFor(String(reflecting: type))
  }
}
