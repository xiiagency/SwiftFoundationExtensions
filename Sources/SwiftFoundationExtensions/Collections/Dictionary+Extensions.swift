import Foundation

/**
 Direct increment/decrement utilities for `Dictionary`s whose values are `Int`/`Double`.
 */
extension Dictionary {
  /**
   Allows for incrementing the value stored under the requested `Key`.
   If there is no such value it is assumed to be `0`.
   */
  public mutating func increment(key: Key, by value: Value) where Value == Int {
    self[key, default: 0] += value
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
    self[key, default: 0.0] += value
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
}

/**
 Increment/decrement utilities for `Dictionary`s that contain sub-maps (other `Dictionary` instances) whose values are
 `Int`/`Double` (e.g. keyed frequency maps).
 */
extension Dictionary {
  /**
   Applies to: Dictionaries whose value is another dictionary with an integer value (sub-maps).
   
   Increments the value in a sub-map retrieved using the main and sub keys by the requested amount.
   Initializes the sub-map and the sub-value (to 0) if they are missing.
   */
  public mutating func incrementSubMapValue<SubKey : Hashable>(
    key: Key,
    subKey: SubKey,
    by value: Int
  ) where Value == Dictionary<SubKey, Int> {
    self[key, default: [:]][subKey, default: 0] += value
  }
  
  /**
   Applies to: Dictionaries whose value is another dictionary with an integer value (sub-maps).
   
   Increments the value in a sub-map retrieved using the main and sub keys by 1.
   Initializes the sub-map and the sub-value (to 0) if they are missing.
   */
  public mutating func incrementSubMapValue<SubKey : Hashable>(
    key: Key,
    subKey: SubKey
  ) where Value == Dictionary<SubKey, Int> {
    incrementSubMapValue(key: key, subKey: subKey, by: 1)
  }
  
  /**
   Applies to: Dictionaries whose value is another dictionary with an integer value (sub-maps).
   
   Decrements the value in a sub-map retrieved using the main and sub keys by 1.
   Initializes the sub-map and the sub-value (to 0) if they are missing.
   */
  public mutating func decrementSubMapValue<SubKey : Hashable>(
    key: Key,
    subKey: SubKey
  ) where Value == Dictionary<SubKey, Int> {
    incrementSubMapValue(key: key, subKey: subKey, by: -1)
  }
  
  /**
   Applies to: Dictionaries whose value is another dictionary with an `Double` value (sub-maps).
   
   Increments the value in a sub-map retrieved using the main and sub keys by the requested amount.
   Initializes the sub-map and the sub-value (to 0.0) if they are missing.
   */
  public mutating func incrementSubMapValue<SubKey : Hashable>(
    key: Key,
    subKey: SubKey,
    by value: Double
  ) where Value == Dictionary<SubKey, Double> {
    self[key, default: [:]][subKey, default: 0.0] += value
  }
  
  /**
   Applies to: Dictionaries whose value is another dictionary with an `Double` value (sub-maps).
   
   Increments the value in a sub-map retrieved using the main and sub keys by 1.0.
   Initializes the sub-map and the sub-value (to 0.0) if they are missing.
   */
  public mutating func incrementSubMapValue<SubKey : Hashable>(
    key: Key,
    subKey: SubKey
  ) where Value == Dictionary<SubKey, Double> {
    incrementSubMapValue(key: key, subKey: subKey, by: 1.0)
  }
  
  /**
   Applies to: Dictionaries whose value is another dictionary with an `Double` value (sub-maps).
   
   Decrements the value in a sub-map retrieved using the main and sub keys by 1.0.
   Initializes the sub-map and the sub-value (to 0.0) if they are missing.
   */
  public mutating func decrementSubMapValue<SubKey : Hashable>(
    key: Key,
    subKey: SubKey
  ) where Value == Dictionary<SubKey, Double> {
    incrementSubMapValue(key: key, subKey: subKey, by: -1.0)
  }
}

/**
 Utilities for dealing with `Dictionary` instances whose values are collections of items.
 */
extension Dictionary {
  /**
   Applies to: Dictionaries where the value type is an `Array` of elements.
   
   Appends the provided value to the `Array` for the given key, creating a new one if one does not yet exist.
   */
  public mutating func append<InnerValue>(
    value: InnerValue,
    for key: Key
  ) where Value == Array<InnerValue> {
    self[key, default: []].append(value)
  }
}

/**
 `Dictionary` "inversion" utilities.
 */
extension Dictionary {
  /**
   Inverts the key->value mapping to one of value->key. Assumes that all values are unique and will raise a fatal error otherwise.
   */
  public func inverted() -> [Value: Key] where Value : Hashable {
    let invertedPairs: [(Value, Key)] = map { (key, value) in (value, key) }
    return Dictionary<Value, Key>(uniqueKeysWithValues: invertedPairs)
  }
  
  /**
   Inverts a `Dictionary` with a value that is a list of elements and returns a dictionary from listElement -> list of Keys.
   */
  public func inverted(
  ) -> [Value.Element: [Key]] where Value : Sequence, Value.Element : Hashable {
    var result: [Value.Element: [Key]] = [:]
    
    forEach { key, innerValues in
      innerValues.forEach { innerValue in
        result.append(value: key, for: innerValue)
      }
    }
    
    return result
  }
}

/**
 Utilities for `Dictionary`s whose values are a sub-map (another `Dictionary`).
 */
extension Dictionary {
  /**
   Sets the value for the provided `Key` and sub-map key, initializing the sub-map if it not already present.
   */
  public mutating func set<SubKey : Hashable, SubValue>(
    value: SubValue,
    key: Key,
    subKey: SubKey
  ) where Value == Dictionary<SubKey, SubValue> {
    self[key, default: [:]][subKey] = value
  }
}
