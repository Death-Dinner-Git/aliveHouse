因为人生太短暂，不要浪费时间重新输入密码。

这个插件可以让你轻松隐藏和显示一个密码输入字段的内容。

你可以在你的项目目录中安装hideShowPassword插件。

用法
如果所有你需要做的是改变密码字段的可见性，您可以使用速记方法：

$('#password').showPassword(); // Reveal
$('#password').hidePassword(); // Hide
$('#password').togglePassword(); // Toggle
你可以通过传递TRUE，FALSE或'切换'到hideShowPassword方法做同样的事情：

$('#password').hideShowPassword(true); // Reveal
$('#password').hideShowPassword(false); // Hide
$('#password').hideShowPassword('toggle'); // Toggle
如果你想调整超过了可见性，您可以传递一个对象到hideShowPassword ：

$('#password').hideShowPassword({
    show: true, // Reveal the password
    innerToggle: true, // Create an inner toggle
    hideToggleUntil: 'focus', // Hide the toggle till focus
    touchSupport: Modernizr.touch // Enable touch enhancements
});
如果您需要更改这些密码字段的可见性反应，你可以使用passwordShown和passwordHidden事件：

$('#password').on('passwordShown', function () {
    console.log('password is visible');
}).on('passwordHidden', function () {
    console.log('password is hidden');
});