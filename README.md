# ✅ Require

[![CocoaPods](https://img.shields.io/cocoapods/v/Require.svg)](https://cocoapods.org/pods/Require)
[![Carthage](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift PM](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
[![Twitter](https://img.shields.io/badge/contact-@johnsundell-blue.svg?style=flat)](https://twitter.com/johnsundell)

Require lets you easily require `Optional` values to be non-`nil`, or crash gracefully.

Sometimes you have optional values in your code that are not really optional, and will cause your
application to enter an undefined state if `nil`. Require makes it easy to avoid such states, by
causing a crash with rich debug information, to enable you to much easier hunt down & fix the bug.

## Usage

Call `require()` on any `Optional`, optionally giving a `hint` for debugging purposes:

```swift
class ConfigurationLoader {
    func load() -> Configuration {
        let data = readJSONFile().require(hint: "Verify that Config.JSON is valid")
        let config: Configuration? = try? unbox(data: data)
        return config.require()
    }
}
```

## Installation

**Swift Package Manager:**

Add `.Package(url: "git@github.com:johnsundell/require.git", majorVersion: 1)` to your `Package.swift` file.

**CocoaPods:**

Add `pod "Require"` to your `Podfile`.

**Carthage:**

Add `github "johnsundell/require"` to your `Cartfile`.

**Manual:**

Clone the repo and drag the file `Require.swift` into your Xcode project.

## Help, feedback or suggestions?

- [Open an issue](https://github.com/JohnSundell/Require/issues/new) if you need help, if you found a bug, or if you want to discuss a feature request.
- [Open a PR](https://github.com/JohnSundell/Require/pull/new/master) if you want to make some change to Require.
- Contact [@johnsundell on Twitter](https://twitter.com/johnsundell) for discussions, news & announcements about Require.
