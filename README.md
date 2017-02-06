
### 简述

>本文是自动化测试部署系列的文章,参考了喵神等人的文章.

关于 UI 测试,在 iOS 的开源社区有过一系列的尝试,比如 KIF 框架,Apple 自己的 Automating UI Testing 或者 Facebook 的截图测试等.这些方法有一个共同的特点,那就是配置起来十分繁琐,使用上也有诸多不便.这大概也是 UI 测试所面临的最大窘境 -- 往往开发者在一个项目里写了一两个 UI 测试用例后,就会觉得难以维护,怯于巨大的时间成本,继而放弃.

Apple 在 Xcode 7 中新加入了一套 UI Testing 的工具,其目的就是解决这个问题.新的 UI Testing 比以往的解决方案要简单不少,特别是在创建测试用例的时候更集成了录制的功能,这有希望让 UI Testing 变得更为普及.

### UI Testing 和 Accessibility

在 iOS 中使用 XCTest, 就必须要了解 Accessibility. UI Accessibility 早在 iOS 3.0 就被引入了,用来辅助身体不便的人士使用 app.VoiceOver 是 Apple 的屏幕阅读技术,而 UI Accessibility 的基本原则就是对屏幕上的 UI 元素进行分类和标记.两者配合,通过阅读或者聆听这些元素,用户就可以在不接触屏幕的情况下通过声音来使用 app.

Accessibility 的核心思想是对 UI 元素进行分类和标记 -- 将屏幕上的 UI 分类为像是按钮,文本框,cell 或者是静态文本 (也就是 label) 这样的类型,然后使用 identifier 来区分不同的 UI 元素.用户可以通过语音控制 app 的按钮点击,或是询问某个 label 的内容等等,十分方便.iOS SDK 中的控件都实现了默认的 Accessibility 支持,而我们如果使用自定义的控件的话,则需要自行使用 Accessibility 的 API 来进行添加.

UI 测试的本质就是定位在屏幕上的元素,实现一些像是点击或者拖动这样的操作交互,然后获取 UI 的状态进行断言来判断是否符合我们的预期.这个过程及其需求与 Accessibility 的功能是高度吻合的.这也是为什么 iOS 中大部分的 UI 测试框架都是基于 UI Accessibility 的原因, UI Testing 也不例外.

### demo

demo 比较简单,主要用于演示基本的流程,代码在 GitHub 中.

相比起其他一些 UI 测试框架,Xcode 的 UI Testing 最为诱人的优点在于可以直接录制操作.新建一个 XCTest,默认实现如下:

``` swift
import XCTest

class UITESTUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        // launch 方法来启动测试 app
        // XCUIApplication 是 UIApplication 在测试进程中的代理 (proxy)

        XCUIApplication().launch() 

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
    }
    
}
```

使用的方法是,先创建一个测试方法,然后将光标停留在方法中,然后点击录制.和 app 的交互就会被自动转写成代码.

![](https://ooo.0o0.ooo/2017/02/06/5898158326f72.png)

操作是:
- 2次点击 "color" 按钮 ,改变背景色
- 点击"下一页"按钮 push 到第二页
- 点击"back" 按钮 pop 回第一页



![](https://ooo.0o0.ooo/2017/02/06/589817a5d03a6.png)

``` swift 
func testMyApp() {
        
        let app = XCUIApplication()

        // "color" 按钮设置 Accessibility id 为 changeColor
        let changecolorButton = app.buttons["changeColor"]

        changecolorButton.tap()
        changecolorButton.tap()

        // "下一页"按钮没有设置 Accessibility id
        app.buttons["下一页"].tap()

        // "back" 按钮设置 Accessibility id 为 back
        app.buttons["back"].tap()
        
    }
```

编写完成之后可以 cmd+U 运行试试吧.

### 参考及延伸阅读

- [Xcode 7 UI 测试初窥](http://www.infoq.com/cn/news/2015/01/fastlane-ios-continuous-deploy)
- [UITest](http://masilotti.com/ui-testing-cheat-sheet/)
- [XCTest​Case](http://nshipster.com/xctestcase/)
- [UI 测试](https://objccn.io/issue-15-6/)
- [截图测试](https://objccn.io/issue-15-7/)


