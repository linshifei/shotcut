REM
REM 测试用，需要先启动Qt mingw 命令行，再手动执行
REM

REM 源码目录
set prjDir=D:\Projects\github\linshifei\shotcut

REM Qt构建目录
set buildDir=D:\Projects\github\linshifei\build-shotcut-Desktop_Qt_5_9_9_MinGW_32bit-Release\src\release

REM 发布目录，注意：该目录回被情况
set relDir=E:\shotcut\publish

REM 初始化目录
rd /s /q %relDir%
mkdir    %relDir%


REM 拷贝exe文件必须在 windeployqt 之前
copy /Y %buildDir%\shotcut.exe  %relDir%\shotcut.exe


windeployqt --release --compiler-runtime --qmldir %prjDir%\src\ %relDir%\


REM 其他运行时依赖的 dll 文件，只拷贝必须的，不能多

REM mlt 的文件来自 D:\Projects\mlt-6.18.0\src\framework
copy /Y "C:\MinGW\msys\1.0\local\libmlt-6.dll" %relDir%\
copy /Y "C:\MinGW\msys\1.0\local\libmlt++-3.dll" %relDir%\

copy /Y "C:\MinGW\bin\libmingwex-2.dll" %relDir%\
copy /Y "C:\MinGW\bin\libiconv-2.dll" %relDir%\
copy /Y "C:\MinGW\bin\pthreadGC-3.dll" %relDir%\


