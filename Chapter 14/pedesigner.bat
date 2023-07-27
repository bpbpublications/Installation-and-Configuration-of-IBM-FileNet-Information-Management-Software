@echo off
@setlocal

if "%~1"==""  goto USAGE

set JPEINSTALL_DIR=C:\Progra~2\IBM\FileNet\ContentEngine\tools\PE

call cpetoolenv.bat
 
REM context sensitive help URL may be changed here
set CONTEXT_SENSITIVE_HELP=https://www.ibm.com/support/knowledgecenter/SSNW2F_5.2.1/

REM translatable strings in process designer will be displayed according to the chosen language and
REM  country values if a translation is available.
set COUNTRY_LANGUAGE_CODE=language=en,country=US

REM add additional arguments for the java virtual machine here
set ADDITIONAL_VM_ARGS=

REM client timeout value in milliseconds. 600000 is 10 minutes. Transfer from Process Designer will likely be
REM the longest running RPC encountered, typical transfer times will be a few seconds, but in unusual circumstances
REM transfer may take a few minutes to complete.  If CLIENT_TIMEOUT is not set, default will be 3 minutes.
set CLIENT_TIMEOUT=-Dfilenet.vw.api.rpc.timeout=600000

"%JAVA_HOME%\bin\java"  -cp "C:\Progra~2\IBM\FileNet\ContentEngine\lib\pe.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\peresources.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\pe3pt.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\Jace.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\javaapi.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\applets.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\application-utils.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\applets_i18.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\ICMSolutionEdit.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\stax-api.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\xlxpScanner.jar;C:\Progra~2\IBM\FileNet\ContentEngine\lib\xlxpScannerUtils.jar" -Djava.security.auth.login.config="%JPEINSTALL_DIR%\config\jaas.conf.WSI" -Dfilenet.wcmapiconfig="%JPEINSTALL_DIR%\config\WcmApiConfig.properties" -DWF_HELP=%CONTEXT_SENSITIVE_HELP%  -Xmx512m -Xms512m %ADDITIONAL_VM_ARGS% %CLIENT_TIMEOUT%  filenet.vw.apps.designer.VWDesignerApplication /webApp=WORKPLACE /systemRoles=PWDesigner,PWConfiguration,PWAdministrator /standAlone=1  /browserLocale=%COUNTRY_LANGUAGE_CODE% /routerNames=%*

goto END

:USAGE
echo Usage:  pedesigner connection_point_name

:END
@endlocal