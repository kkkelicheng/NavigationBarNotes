# NavigationBarNotes
记录一下日常简单的NavigationBar使用，哦也包含一下NavigationController吧。
因为不是记录中间的实现过程和原理，篇幅不会很长。
[了解NavigationBar官方文档](https://developer.apple.com/documentation/uikit/uinavigationbar?language=objc)


### Bar的Translucent & Opaque

当设置为Opaque不透明。

在某些情况下导航栏会透明（包括半透明）。系统会自动跟你设置Navigationbar的bgImage，来让bar不透明。

所以那些实现滑动渐变Bar的透明，需要注意设置这个。

```swift
let appearance = UINavigationBarAppearance()
appearance.configureWithTransparentBackground()
// set bar appearance
```

### 如何设置Bar的颜色。iOS13+

iOS13之前需要了解
- barTintColor : The tint color to apply to the navigation bar background.
- backgroundColor : change the background color of navigationBar
- tintColor : The tint color to apply to the navigation items and bar button items.

设置几个基础属性就OK


[官方Note](https://developer.apple.com/documentation/technotes/tn3106-customizing-uinavigationbar-appearance)
其中有全局设置，

摘抄一下重点。

首先通过`UINavigationBarAppearance`设置一下样式。
```swift
@available(iOS 13.0, *)
func customNavBarAppearance() -> UINavigationBarAppearance {
    let customNavBarAppearance = UINavigationBarAppearance()
    
    // Apply a red background.
    customNavBarAppearance.configureWithOpaqueBackground()
    customNavBarAppearance.backgroundColor = .systemRed //可以注意到官方文档也用的backgroundColor
    
    // Apply white colored normal and large titles.
    customNavBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    customNavBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

    // Apply white color to all the nav bar buttons.
    let barButtonItemAppearance = UIBarButtonItemAppearance(style: .plain)
    barButtonItemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
    barButtonItemAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.lightText]
    barButtonItemAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.label]
    barButtonItemAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.white]
    customNavBarAppearance.buttonAppearance = barButtonItemAppearance
    customNavBarAppearance.backButtonAppearance = barButtonItemAppearance
    customNavBarAppearance.doneButtonAppearance = barButtonItemAppearance
    
    return customNavBarAppearance
}
```

- 针对全局，通过设置`UINavigationBar.appearance()`。官方给出的位置是在`didFinishLaunchingWithOptions`

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let newNavBarAppearance = customNavBarAppearance()
        
    let appearance = UINavigationBar.appearance()
    appearance.scrollEdgeAppearance = newNavBarAppearance
    appearance.compactAppearance = newNavBarAppearance
    appearance.standardAppearance = newNavBarAppearance
    if #available(iOS 15.0, *) {
        appearance.compactScrollEdgeAppearance = newNavBarAppearance
    }

    return true
}


```

- 针对某个`ViewController`的设置。通过设置某个`vc`的`navigationBar`
```swift
override func viewDidLoad() {
    super.viewDidLoad()

    let newNavBarAppearance = customNavBarAppearance()
    navigationController!.navigationBar.scrollEdgeAppearance = newNavBarAppearance
    navigationController!.navigationBar.compactAppearance = newNavBarAppearance
    navigationController!.navigationBar.standardAppearance = newNavBarAppearance
    if #available(iOS 15.0, *) {
        navigationController!.navigationBar.compactScrollEdgeAppearance = newNavBarAppearance
    }
}

```



### 2个ViewController切换（后面直接写为bar的切换），Bar的渐变。

网上很多渐变的设置。真的要那么复杂吗？apple年年更新这个导航栏，虽然曾经确实很难用。那也是曾经。

重点：**需要设置的是Navigationbar的backgroundColor属性来实现导航栏的颜色**，而不是通过backgroundImage属性。
backgroundImage属性设置颜色在过渡的时候会表现的非常突兀（会突然变化）

经过测试

- 2个颜色完全不同的bar的切换。中间会自动有自动过渡颜色。

![Simulator Screen Shot - iPhone 12 - 2022-06-17 at 10 19 32](https://user-images.githubusercontent.com/11294005/174212767-8d706752-d304-4ab3-ae7d-7aeb541b0c46.png)


![blue](https://user-images.githubusercontent.com/11294005/174213090-04bc85b6-5826-4b4c-ac62-f055d729328c.png)


![Simulator Screen Shot - iPhone 12 - 2022-06-17 at 10 17 58](https://user-images.githubusercontent.com/11294005/174212792-bfab804d-e70c-453b-9caf-dbb733175578.png)

![screen shot 2022-06-17 上午10 18 49](https://user-images.githubusercontent.com/11294005/174212197-a13658e2-1bd3-49aa-b236-106dee9a7803.png)


- 1个不透明的颜色bar，1个透明的bar切换。中间也会有自动过渡的颜色。
效果也跟上面类似，都是叠加的。这里就不贴图了。你可以想想一下，不透明的和透明的叠加。
叠加的过程也是随着移动而变化的。

