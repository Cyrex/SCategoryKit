<h1 align="center">SCategoryKit</h1>

<p align="center">
    <a href="https://travis-ci.com/Cyrex/SCategoryKit">
        <img src="https://travis-ci.com/Cyrex/SCategoryKit.svg?branch=master" alt="Travis Build Status">
    </a>
    <a href="https://codecov.io/github/Cyrex/SCategoryKit">
        <img src="https://codecov.io/gh/Cyrex/SCategoryKit/branch/master/graph/badge.svg" alt="Codecov">
    </a>
    <a href="http://cocoapods.org/pods/SCategoryKit">
        <img src="https://img.shields.io/cocoapods/v/SCategoryKit.svg?style=flat" alt="CocoaPods Version">
    </a>
    <a href="https://houndci.com">
        <img src="https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg" alt="Hound">
    </a>
    <a href="https://github.com/Cyrex/SCategoryKit">
        <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
    </a>
</p>


<p align="center">
    <a href="http://cocoapods.org/pods/SCategoryKit">
        <img src="https://img.shields.io/cocoapods/l/SCategoryKit.svg?style=flat" alt="License">
    </a>
    <a href="http://cocoapods.org/pods/SCategoryKit">
        <img src="https://img.shields.io/cocoapods/p/SCategoryKit.svg?style=flat" alt="Platform">
    </a>
    <a href="https://github.com/Cyrex/SCategoryKit/pulls">
        <img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat" alt="Contributions welcome">
    </a>
</p>


## Requirements


## Content
<details>
    <summary>UIKit</summary>
    <blockquote>
        <details>
            <summary>UIPageViewController</summary>
            <blockquote>
                <details>
                    <summary>UIPageViewController+SGestureConflict</summary>
                    <blockquote>
                        <pre><code>/// Handle gesture conflicts between pageviewcontroller's pan gesture and other gesture,
/// especially for screen edge pan gestureRecognizer in navigationController.
/// @param recognizer a gestureRecognizer, default is navigationController's pop gestureRecognizer.
- (void)s_requireGestureRecognizerToFail:(UIGestureRecognizer *)recognizer;</code></pre>
                    </blockquote>
                </details>
            </blockquote>
        </details>
    </blockquote>
</details>

## Installation
#### CocoaPods
SCategoryKit is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'SCategoryKit'
```

#### Carthage
[Carthage](https://github.com/Carthage/Carthage) is a lightweight dependency manager for Swift and Objective-C. It leverages CocoaTouch modules and is less invasive than CocoaPods.

To install with carthage, follow the instruction on [Carthage](https://github.com/Carthage/Carthage)

##### Cartfile
```ruby
github "Cyrex/SCategoryKit"
```

#### Manual Installation
Copy and add all of the files in the `SCategoryKit` directory (and its subdirectories) into your project.

## Author

Cyrex, szwathub@gmail.com

## License

SCategoryKit is available under the MIT license. See the LICENSE file for more info.
