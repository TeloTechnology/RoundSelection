# Round Selection

> This library gives you round buttons to be used in your projects.

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
![CocoaPods Version][cocoapods-image]

[![Build Status][bitrise-image]][bitrise-url]

This RoundSelection library helps you to do round selection.

<kbd><img src="Images/example1.png" width="200"> <img src="Images/example2.png" width="200"></kbd>

## Features

- [x] Add icon and title for your button.
- [x] Choose the color for the background and title.
- [x] Choose the check mark image.

## Requirements

- Xcode 12.x
- Swift 5.x

## Installation

#### CocoaPods

You can use [CocoaPods](http://cocoapods.org/) to install `RoundSelection` by adding it to your `Podfile`:

```ruby
platform :ios, '15.0'
use_frameworks!
pod 'RoundSelection', :git => 'https://github.com/TeloTechnology/RoundSelection.git', :tag => '1.0.0'
```

#### Import after installation

To get the full benefits import `RoundSelection`.

```swift
import RoundSelection
```

#### Manually

1. Download and drop `RoundSelection` folder in your project.
2. Congratulations!

## Usage example

```swift

@IBOutlet
private weak var customView1: RoundSelectionView!

//RoundSelectionView
customView1.data = RoundSelectionView.Data(icon: UIImage(named: "CreditCard"), title: "Credit Card")

customView1.colorBackgroundOnSelected = .black
customView1.colorTitleOnSelected = .white

customView1.didSelected = { [weak self] isSelected in
    if let title = self?.customView1.titleData {
        print("Selected: \(isSelected) ", title)
    }
}
```

```swift

@IBOutlet
private weak var customView1: RoundSelectionView!

//RoundSelectionView
customView1.data = RoundSelectionView.Data(icon: UIImage(named: "CreditCard"), title: "Credit Card")
customView1.checkMarkImage = UIImage(named: "GreenCheckMark")

```

Check the demo project.

## Contribute

We would love you for the contribution to **RoundSelection**, please create a Pull Request.

## Meta

Rudi Luis – [@Linkedin](http://linkedin.com/in/ruditluis)

Telo Technology Limited – [@Website](https://telotechnology.com)

![](Images/logo.jpg)

[swift-image]: https://img.shields.io/badge/swift-5.0-red.svg
[swift-url]: https://swift.org/
[bitrise-image]: https://app.bitrise.io/app/568f8ac0a61af5ec/status.svg?token=nPVne2W827u-Dz3IxZ3m_A&branch=master
[bitrise-url]: https://app.bitrise.io/app/568f8ac0a61af5ec
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[cocoapods-image]: https://img.shields.io/badge/pod-1.11.3-blueviolet.svg
