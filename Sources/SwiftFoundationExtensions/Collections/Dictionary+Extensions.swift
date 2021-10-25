import Foundation

extension Dictionary {
  /**
   Allows for incrementing the value stored under the requested `Key`.
   If there is no such value it is assumed to be `0`.
   */
  public mutating func increment(key: Key, by value: Value) where Value == Int {
    self[key] = (self[key] ?? 0) + value
  }
  
  /**
   Allows for incrementing by one the value stored under the requested `Key`.
   If there is no such value it is assumed to be `0`.
   */
  public mutating func increment(key: Key) where Value == Int {
    increment(key: key, by: 1)
  }
  
  /**
   Allows for decrementing by one the value stored under the requested `Key`.
   If there is no such value it is assumed to be `0`.
   */
  public mutating func decrement(key: Key) where Value == Int {
    increment(key: key, by: -1)
  }
  
  /**
   Allows for incrementing the value stored under the requested `Key`.
   If there is no such value it is assumed to be `0.0`.
   */
  public mutating func increment(key: Key, by value: Value) where Value == Double {
    self[key] = (self[key] ?? 0.0) + value
  }
  
  /**
   Allows for incrementing by one the value stored under the requested `Key`.
   If there is no such value it is assumed to be `0.0`.
   */
  public mutating func increment(key: Key) where Value == Double {
    increment(key: key, by: 1.0)
  }
  
  /**
   Allows for decrementing by one the value stored under the requested `Key`.
   If there is no such value it is assumed to be `0.0`.
   */
  public mutating func decrement(key: Key) where Value == Double {
    increment(key: key, by: -1)
  }
  
  /**
   Inverts the key->value mapping to one of value->key. Assumes that all values are unique and will raise a fatal error otherwise.
   */
  public func inverted() -> [Value: Key] where Value : Hashable {
    let invertedPairs: [(Value, Key)] = map { (key, value) in (value, key) }
    return Dictionary<Value, Key>(uniqueKeysWithValues: invertedPairs)
  }
}
