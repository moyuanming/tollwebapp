#服务器安装规范#


##服务器基本安装##

1.  首先将 `Install.exe  Init.exe Installssh.exe SystemBase.exe   Subversion.exe`  复制到目标服务器中， 注意， 在安装非服务器时 `Subversion.exe` 请不要安装。 
2.  拷贝完成后，请点击Install.exe 开始安装， 也可以按照顺序手动执行 ` Init.exe Installssh.exe SystemBase.exe   Subversion.exe `
3.  所有安装过程无需认为敢于，安装过程中会显示每个软件的安装进度，安装和配置又每个安装程序的命令行或配置已经指定。不需要认为设置。 也请不要中断所有安装过程。 

##安装内容介绍##
### Init.exe  的工作 ###
1.   禁止"密码必须符合复杂性要求"
2.   添加root用户
3.   修改root用户密码永不过期
4.   修改Windows Time 为 NTP服务器
5.   调整资源管理器显示扩展文件名
6.   设置和打开部分ssh和svn服务的防火墙端口

### Installssh.exe ###
用于自动安装ssh服务<br> 
安装后密码为 future<br> 
安装配置实用的是 config.wst 文件<br> 
此配置的ssh服务是免费，但是**` GSSAPI被禁止，只能配置本地Windows 账户， 没有域用户，只能配置一个 用户组everyone ，只能配置一个虚拟组，限制10个Windows 账户，10个虚拟账户`**。
安装过程中密码以及选项由**config.wst**指定。 


### Subversion.exe ###
用于自动安装svn 服务 ，无论之前是否安装过都可以覆盖安装。 
此安装过程将D:\RHYSOFT作为版本库目录
 **Subversion的文件已经不在 D:\RHYSOFT\Subversion下存放，请删除D:\RHYSOFT\Subversion 文件夹**

### SystemBase.exe ###

用于安装系统必备组件

1. 安装了 安装图像处理 ，一般在Windows 2003 上会用到,更高版本上会忽略此安装。 
2. 安装安装程序，这里包含了再XP 2003 以及所有版本上可能需要更新的Windows Installer 的更新包和安装包， 如果不需要则会自动忽略。   
2. 安装VC++2010库 这是为一些程序准备的安装包。 C++程序等。  
3. 安装SQLCE组件 
4. 安装TortoiseSVN客户端 
5. 安装TortoiseSVN客户端语言包
6. 安装VNC服务端和客户端 tvnc 安装 后密码为 **future** 密码是安装过程中指定的。 
7. 安装dotNetFx40..此过程比较漫长
8. 安装dotNetFx40 的中文语言包
9. 安装完成后， 请重启系统。 
 


