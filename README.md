# Swifter String

A sane way to use strings in Swift.

```swift
var str = "<Hello, World>"

str["Hello"]                        // 1
str["World"]                        // 8
str["Carl"]                         // raises NSException ("SubstringIndexNotFound")
str["<", ">"]                       // "Hello, World"
str[1]                              // "H"
str[1, 13]                          // "Hello, World"
str[-1]                             // ">"
str[-14]                            // "<"
str[14]                             // raises NSException ("StringIndexBeyondRange")
str[-15]                            // raises NSException ("StringIndexBeyondRange")
str.length()                        // 14
str.reverse()                       // ">dlroW ,olleH<"
str.reverseSelf()                   // ">dlroW ,olleH<" and mutates str to its reversed string
str.substring(start: 1, end: 13)    // "Hello, World" (Equivalent to str[1, 13])
str.substringFrom(1)                // "Hello, World>"
str.substringTo(13)                 // "<Hello, World"
```

## Installing

Just drop SwifterString.swift in your Xcode project, and you're ready to go.
