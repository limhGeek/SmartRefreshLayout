@ECHO OFF

set aa=伟大的中国！我为你自豪！
echo 替换前：%aa%
echo 替换后：%aa:中国=中华人民共和国%
echo aa = %aa%
set aa=%aa:中国=中华人民共和国%
echo aa = %aa%

SET sdk=null
SET tool=null
FOR /F "eol=; tokens=2,2 delims==" %%i IN ('findstr /i "sdk.dir" local.properties') DO SET sdk=%%i
FOR /F %%i IN ('findstr /i "buildToolsVersion" %~dp0app\build.gradle') DO SET tool=%%i

findstr /i "sdk.dir" local.properties
findstr /i "buildToolsVersion" %~dp0app\build.gradle

rem type %~dp0app\build.gradle
rem type local.properties

echo tool=%tool%

IF %sdk% == null (
    ECHO 没找到SDK，脚本中止
    GOTO END
)

SET sdk=%sdk:\\=\%
SET sdk=%sdk:\:=:%
set sdk=%sdk%\build-tools\28.0.3\dx.bat

echo skd=%sdk%

rem %sdk%
rem ./gradlew assemble
rem dx --dex --verbose --no-strict --output=refresh-layout/build/intermediates/intermediate-jars/debug/classes.jar.dex refresh-layout/build/intermediates/intermediate-jars/debug/classes.jar
rem https://github.com/mihaip/dex-method-counts
rem java -jar ./art/dex-method-counts.jar --filter=all --output-style=tree --package-filter=com.scwang.smartrefresh refresh-layout/build/intermediates/intermediate-jars/debug/classes.jar.dex

:END