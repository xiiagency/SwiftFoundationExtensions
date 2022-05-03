# SwiftFoundationExtensions Library

![GitHub](https://img.shields.io/github/license/xiiagency/SwiftFoundationExtensions)

An open source library with some useful extensions and utilities for the core `Foundation`
Swift libraries. Developed as re-usable components for various projects at
[XII's](https://github.com/xiiagency) iOS, macOS, and watchOS applications.

## Installation

### Swift Package Manager

1. In Xcode, select File > Swift Packages > Add Package Dependency.
2. Follow the prompts using the URL for this repository
3. Select the `SwiftFoundationExtensions` library to add to your project

## License

See the [LICENSE](LICENSE) file.

## Included Extensions / API

### Informational ([Source](Sources/SwiftFoundationExtensions/Information/BundleInformation.swift))

```Swift
let mainBundleVersion: String
```

Full version and build number of the main bundle in the format: `v[MAJOR].[MINOR].[PATCH]-[BUILD]`

---

```Swift
let isInstalledFromAppstore: Bool
```

True if the main bundle was installed from the app store (not in a sandbox environment), false otherwise.

### `Date` Extensions ([Source](Sources/SwiftFoundationExtensions/Dates/Date%2BExtensions.swift))

```Swift
var startOfWeek: Date { get }

var daysRemainingThisWeek: Int { get }

var startOfMonth: Date { get }

var startOfYear: Date { get }

init(year: Int, month: Int, day: Int)
```

### `Comparable` Extensions ([Source](Sources/SwiftFoundationExtensions/Numeric/Comparable%2BExtensions.swift))

```Swift
func clamped(to limits: ClosedRange<Self>) -> Self

func clamped(to limits: Range<Self>) -> Self where Self : Strideable
```

### `Double` Extensions ([Source](Sources/SwiftFoundationExtensions/Numeric/Double%2BExtensions.swift))

```Swift
func isCloseTo(_ other: Double) -> Bool

func isCloseToOrGreaterThan(_ other: Double) -> Bool

func isCloseToOrLessThan(_ other: Double) -> Bool

var roundedUp: Int { get }

var roundedDown: Int { get }
```

### `Sequence` Extensions ([Source](Sources/SwiftFoundationExtensions/Collections/Sequence%2BExtensions.swift))

```Swift

func sum() -> Double where Element == Double

func sumOfSquares() -> Double where Element == Double

func sum() -> Int where Element == Int

func sumOfSquares() -> Int where Element == Int

func asDictionary<Key : Hashable, Value>() -> [Key: Value]
  where Element == (Key, Value)

func mapToDictionary<Key : Hashable, MappedValue>(
  _ pairExtractor: @escaping (Element) throws -> (Key, MappedValue)
) rethrows -> [Key: MappedValue]

func grouped<Key : Hashable>(
  _ keyExtractor: @escaping (Element) throws -> Key
) rethrows -> [Key: [Element]]
```

### `EnumeratedSequence` Extensions ([Source](Sources/SwiftFoundationExtensions/Collections/EnumeratedSequence%2BExtensions.swift))

```Swift
func mapToDictionary<Key : Hashable, MappedValue>(
  _ pairExtractor: @escaping (Iterator.Element) throws -> (Key, MappedValue)
) rethrows -> [Key: MappedValue]
```

### `Collection` Extensions ([Source](Sources/SwiftFoundationExtensions/Collections/Collection%2BExtensions.swift))

```Swift
func average() -> Double where Element == Double

func average() -> Int where Element == Int
```

### `AsyncSequence` Extensions ([Source](Sources/SwiftFoundationExtensions/Collections/AsyncSequence%2BExtensions.swift))

```Swift

func sum() async rethrows -> Double where Element == Double

func sumOfSquares() async rethrows -> Double where Element == Double

func sum() async rethrows -> Int where Element == Int

func sumOfSquares() async rethrows -> Int where Element == Int
```

### `Dictionary` Extensions ([Source](Sources/SwiftFoundationExtensions/Collections/Dictionary%2BExtensions.swift))

```Swift

mutating func increment(key: Key, by value: Value) where Value == Int

mutating func increment(key: Key) where Value == Int

mutating func decrement(key: Key) where Value == Int

mutating func increment(key: Key, by value: Value) where Value == Double

mutating func increment(key: Key) where Value == Double

mutating func decrement(key: Key) where Value == Double

mutating func incrementSubMapValue<SubKey : Hashable>(
  key: Key,
  subKey: SubKey,
  by value: Int
) where Value == Dictionary<SubKey, Int>

mutating func incrementSubMapValue<SubKey : Hashable>(
  key: Key,
  subKey: SubKey
) where Value == Dictionary<SubKey, Int>

mutating func decrementSubMapValue<SubKey : Hashable>(
  key: Key,
  subKey: SubKey
) where Value == Dictionary<SubKey, Int>

mutating func incrementSubMapValue<SubKey : Hashable>(
  key: Key,
  subKey: SubKey,
  by value: Double
) where Value == Dictionary<SubKey, Double>

mutating func incrementSubMapValue<SubKey : Hashable>(
  key: Key,
  subKey: SubKey
) where Value == Dictionary<SubKey, Double>

mutating func decrementSubMapValue<SubKey : Hashable>(
  key: Key,
  subKey: SubKey
) where Value == Dictionary<SubKey, Double>

mutating func append<InnerValue>(
  value: InnerValue,
  for key: Key
) where Value == Array<InnerValue>

func inverted() -> [Value: Key] where Value : Hashable

func inverted() -> [Value.Element: [Key]]
  where Value : Sequence, Value.Element : Hashable

mutating func set<SubKey : Hashable, SubValue>(
  value: SubValue,
  key: Key,
  subKey: SubKey
) where Value == Dictionary<SubKey, SubValue>
```

### `Logger` Extensions ([Source](Sources/SwiftFoundationExtensions/Logging/Logger%2BExtensions.swift))

```Swift
static func loggerFor(_ category: String) -> Logger

static func loggerFor<Type>(_ type: Type.Type) -> Logger
```

### `ErrorWithTrace` struct ([Source](Sources/SwiftFoundationExtensions/Logging/ErrorWithTrace.swift))

A Specialized `Error` that captures the file/line number of a thrown error to aid in debugging.

Conforms to: `Error` and `CustomStringConvertible`

```Swift
let file: String

let line: Int

let error: Error

var description: String { get }

var localizedDescription: String { get }
```

### `Error` Extensions ([Source](Sources/SwiftFoundationExtensions/Logging/Error%2BExtensions.swift))

```Swift
var description: String { get }

func withTrace(filePath: String = #file, line: Int = #line) -> ErrorWithTrace

func castError<Target : Error>(to type: Target.Type) -> Target?
```

### `ElapsedTimer` Utility ([Source](Sources/SwiftFoundationExtensions/Information/ElapsedTimer.swift))

A utility for tracking/reporting the elapsed time between operations.

Utilizes `CFAbsoluteTimeGetCurrent` to get an accurate measure of the current time on the device and the difference
between these measures as the elapsed time.

```Swift
init()

func reset()

func elapsedTimeSeconds() -> Double

func elapsedTimeSecondsText() -> String

func elapsedTimeSecondsAndReset() -> Double

func elapsedTimeSecondsTextAndReset() -> String
```
