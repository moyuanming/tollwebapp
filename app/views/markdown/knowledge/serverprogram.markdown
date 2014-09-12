#软件介绍#


##TCS.PGLWatch.exe##
此程序用来监视PGL版本的消息提取程序和SSH方式的图片读取方式。
###安装方式包含两种：###

1. 系统服务方式
服务方式请使用下面的命令来进行安装。 具体安装将会在自动安装包中进行处理。 

    "%systemroot%\Microsoft.NET\Framework\v4.0.30319\InstallUtil.exe"  "D:\RHYSOFT\BIN\TCS.PGLWatch.exe" /u
    "%systemroot%\Microsoft.NET\Framework\v4.0.30319\InstallUtil.exe"  "D:\RHYSOFT\BIN\TCS.PGLWatch.exe"
    net start TCS.PGLWatch

2. 命令行方式 
双击 TCS.PGLWatch.exe 可以启动程序  在此控制台界面中按 Ctrl+C 终止。 
终止时将所有车道数据提取和图片提取的程序全部关闭。 
如果直接关闭此节目， 比如点击关闭按钮， 则不会进行此操作。 
 

 
此程序启动时 会先检查是否 存在 TCS.PGMsg2DBServer.exe 和 TCS.SHFTPScanner.exe ，如果存在则关闭，并等待五秒钟。 然后开始启动TCS.PGMsg2DBServer.exe和TCS.SHFTPScanner.exe


##TCS.PGMsg2DBServer.exe##
使用方法  `TCS.PGMsg2DBServer.exe <IPAddress>`

1. 此程序启动开始先读取消息映射文件并预编译程序集
2. 检查服务端数据库是否可以连接
3. 根据参数指定的IP地址连接车道的PglSQL
4. 连接后先查询数据库
5. 查询到数据进行解析，解析入库确实完成
6. 再将 mark 字段设置为1 进行保存
7. 查询是否超过CleanDBSize容量
8. 超过时 将删除一定量的数据
9. 循环至第三步

注意：
TCS.PGMsg2DBServer.exe.config 文件不能删除， 必须跟TCS.PGMsg2DBServer.exe在一起，且保证文件内包含以下内容， 否则会导致无法访问数据库。 如果你的VS2012 提示找不见这个数据提供器， 则请在vs的 devent.exe.config 中添加下面的内容。 

>
>  
>  
>  	
>  	<system.data>
>  	<DbProviderFactories>
>   	<remove invariant="Npgsql" />
>   	<add name="Npgsql Data Provider" invariant="Npgsql" description=".Net Data Provider for PostgreSQL" type="Npgsql.NpgsqlFactory, Npgsql, Version=2.2.0.0, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7" support="FF" />
>  	</DbProviderFactories>
>    	</system.data>

##TCS.SHFTPScanner.exe##
使用方法 `TCS.SHFTPScanner.exe <IPAddress>`

此程序用于食用sftp 读取车道的图片文件夹， 并逐个下载每一辆车的图片 ， 进行解析处理。 

注意， 此程序必须配置LaneAppDir ，计重软件为 EMRCV4 全封闭为 EMRCV5 旧式五型车收费为 EMRCV3 . 其中 'VNCPassword' 也是必须配置项， 瑞华赢旧式车道机全部密码为 'kissme' ， 新式车道机， debian  armdebian 均为 'future' . 'VNCPassword' 用于ssh 登录， sftp 登录。包括参数表下发等。 这里填写错误将导致 参数下发， 文件读取全都无法正常工作。 




