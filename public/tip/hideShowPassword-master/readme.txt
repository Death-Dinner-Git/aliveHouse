��Ϊ����̫���ݣ���Ҫ�˷�ʱ�������������롣

���������������������غ���ʾһ�����������ֶε����ݡ�

������������ĿĿ¼�а�װhideShowPassword�����

�÷�
�����������Ҫ�����Ǹı������ֶεĿɼ��ԣ�������ʹ���ټǷ�����

$('#password').showPassword(); // Reveal
$('#password').hidePassword(); // Hide
$('#password').togglePassword(); // Toggle
�����ͨ������TRUE��FALSE��'�л�'��hideShowPassword������ͬ�������飺

$('#password').hideShowPassword(true); // Reveal
$('#password').hideShowPassword(false); // Hide
$('#password').hideShowPassword('toggle'); // Toggle
���������������˿ɼ��ԣ������Դ���һ������hideShowPassword ��

$('#password').hideShowPassword({
    show: true, // Reveal the password
    innerToggle: true, // Create an inner toggle
    hideToggleUntil: 'focus', // Hide the toggle till focus
    touchSupport: Modernizr.touch // Enable touch enhancements
});
�������Ҫ������Щ�����ֶεĿɼ��Է�Ӧ�������ʹ��passwordShown��passwordHidden�¼���

$('#password').on('passwordShown', function () {
    console.log('password is visible');
}).on('passwordHidden', function () {
    console.log('password is hidden');
});