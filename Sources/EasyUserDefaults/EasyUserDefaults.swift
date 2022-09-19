import Foundation

/// EasyUserDefaults is a easy save protocol.
public protocol EasyUserDefaults {
    associatedtype Value: Equatable
    static var key: UserDefaultsKeys { get }
    static var userDefaults: UserDefaults { get }
    @discardableResult
    static func save(value: Value) -> Value
    @discardableResult
    static func save(value: [Value]) -> [Value]
    @discardableResult
    static func update(value: Value, in index: Int) throws -> Value
    @discardableResult
    static func update(value: [Value]) -> [Value]
    @discardableResult
    static func getAll() -> [Value]
    static func delete(value: Value)
    static func delete(at index: Int)
    static func deleteAll() -> [Value]
}

public extension EasyUserDefaults {

    /// UserDefaults.standard is a default UserDefaults object.
    static var userDefaults: UserDefaults {
        UserDefaults.standard
    }

    @discardableResult
    /// Set generics value to userdefaults.
    /// - Parameter value: Generics Value.
    /// - Returns: Save value.
    static func save(value: Value) -> Value {
        var newValue = getAll()
        newValue.append(value)
        userDefaults.set(newValue, forKey: key.keyValue)
        return value
    }
    
    @discardableResult
    /// Set generics array value to userdefaults.
    /// - Parameter value: Generics value array.
    /// - Returns: Array<Value>
    static func save(value: [Value]) -> [Value] {
        var newValue = getAll()
        newValue += value
        userDefaults.set(newValue, forKey: key.keyValue)
        return value
    }
    
    @discardableResult
    /// Update value at index.
    /// - Parameters:
    ///   - value: Generics value
    ///   - index: Array index
    /// - Returns: Value
    static func update(value: Value, in index: Int) throws -> Value {
        var newValue = getAll()
        guard newValue.count > index else {
            throw EasyUserDefaultsError.indexNotFound
        }
        newValue[index] = value
        update(value: newValue)
        
        return value
    }
    
    @discardableResult
    /// Update all [Value].
    /// - Parameter value: Array<Value>
    /// - Returns: Array<Value>
    static func update(value: [Value]) -> [Value] {
        userDefaults.set(value, forKey: key.keyValue)
        return value
    }
    
    
    @discardableResult
    /// Get all [Value].
    /// - Returns: Array<Value>
    static func getAll() -> [Value] {
        guard let result = userDefaults.value(forKey: key.keyValue) as? [Value] else {
            return []
        }
        return result
    }
    
    /// Delete value.
    /// - Parameter value: Value
    static func delete(value: Value) {
        var currentValue = getAll()
        currentValue.removeAll { target in
            target == value
        }
        update(value: currentValue)
    }
    
    /// Delete value at index.
    /// - Parameter index: Int
    static func delete(at index: Int) {
        var currentValue = getAll()
        currentValue.remove(at: index)
        update(value: currentValue)
    }
    
    /// Delete all object.
    /// - Returns: Empty
    static func deleteAll() -> [Value] {
        userDefaults.removeObject(forKey: key.keyValue)
        return []
    }
}
