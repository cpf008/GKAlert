<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">




</head>

<body>

<h1 id="toc_0">GKAlert</h1>

<p><a href="https://travis-ci.org/cpf/GKAlert"><img src="http://img.shields.io/travis/cpf/GKAlert.svg?style=flat" alt="CI Status"></a>
<a href="http://cocoapods.org/pods/GKAlert"><img src="https://img.shields.io/cocoapods/v/GKAlert.svg?style=flat" alt="Version"></a>
<a href="http://cocoapods.org/pods/GKAlert"><img src="https://img.shields.io/cocoapods/l/GKAlert.svg?style=flat" alt="License"></a>
<a href="http://cocoapods.org/pods/GKAlert"><img src="https://img.shields.io/cocoapods/p/GKAlert.svg?style=flat" alt="Platform"></a></p>

<h2 id="toc_1">Example</h2>

<p>To run the example project, clone the repo, and run <code>pod install</code> from the Example directory first.</p>

<h2 id="toc_2">Requirements</h2>

<h2 id="toc_3">Installation</h2>

<p>GKAlert is available through <a href="http://cocoapods.org">CocoaPods</a>. To install
it, simply add the following line to your Podfile:</p>

<p><code>ruby
pod &#39;GKAlert&#39;
</code></p>

<h2 id="toc_4">Usage</h2>

<h4 id="toc_5">1.普通弹框：有title</h4>

<p><code>javascript
GKAlertView.showAlert(title:&quot;你知道吗？&quot;, message: &quot;我是有title的弹框&quot;)
</code></p>

<h4 id="toc_6">2.普通弹框：无title</h4>

<p><code>
GKAlertView.showAlert(message: &quot;可惜我没有title&quot;) { (index , alert) in
//index 1: 第一个按钮  2：第二个按钮
}
</code></p>

<h4 id="toc_7">3.强制更新</h4>

<p>```
let content = &quot;本次版本更新主要内容，\n1:修复已知bug。\n2:应广大网友呼唤，开掉制造bug的程序员。\n3:\n4:\n5:\n6:&quot;</p>

<div><pre><code class="language-none">    let update = GKUpdateAlertContent.init(content)
GKAlertView.showCustomContainer(title: nil,
contentContainer: update,
button1: nil,
button2: &quot;立即更新&quot;) { (index , alert) in

}</code></pre></div>

<p>```</p>

<h4 id="toc_8">4.普通更新</h4>

<p>```
let content = &quot;123股份有限公司（123 CO.,LTD.），前身1234567有限公司，成立于1999年12月30日，2014年4月18日变更为123股份有限公司，专业从事智能语音及语言... &quot;</p>

<div><pre><code class="language-none">    let update = GKUpdateAlertContent.init(content)
GKAlertView.showCustomContainer(title: nil,
contentContainer: update,
button1: &quot;暂不更新&quot;,
button2: &quot;立即更新&quot;) { (index , alert) in

}</code></pre></div>

<p>```</p>

<h4 id="toc_9">5.输入框弹框</h4>

<p>```
let password = GKAlertMessageCode.init(&quot;已向手机123****7777发送短信&quot;)
GKAlertView.showCustomContainer(title: nil,
contentContainer: password,
button1: &quot;取消&quot;,
button2: &quot;确认&quot;) { (index, alert) in</p>

<div><pre><code class="language-none">    }</code></pre></div>

<p>```</p>

<h4 id="toc_10">6.自定义视图弹框</h4>

<p>```
let device = GKAlertDevice.init()
device.deviceTypeItem.valueLabel.text = &quot;我是自定义的&quot;
device.storageItem.valueLabel.text = &quot;我是自定义的&quot;
device.versionItem.valueLabel.text = &quot;我是自定义的&quot;
GKAlertView.showCustomContainer(title: &quot;我可以自定义哦&quot;,
contentContainer: device,
button1: &quot;取消&quot;,
button2: &quot;确定&quot;) { (index, alert) in</p>

<div><pre><code class="language-none">    }</code></pre></div>

<p>```</p>

<h2 id="toc_11">Author</h2>

<p>cpf, xiaocui_008@126.com</p>

<h2 id="toc_12">License</h2>

<p>GKAlert is available under the MIT license. See the LICENSE file for more info.</p>




</body>

</html>

