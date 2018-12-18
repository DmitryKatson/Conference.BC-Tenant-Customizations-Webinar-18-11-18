codeunit 50102 "AIR Install codeunit"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    begin
    end;

    trigger OnInstallAppPerCompany()
    begin
        HandleFreshInstall();
    end;

    local procedure HandleFreshInstall();
    var
        InstallProcedures: Codeunit "AIR Upgrade To 3.0.0.0";
    begin
        if Not CheckIfThisIsFirstInstallOfApp() then
            exit;

        InstallProcedures.PopulateDefaultCustomVisionUriAndKey();
        InstallProcedures.EnableWebServiceCallsInSandbox();
    end;

    local procedure CheckIfThisIsFirstInstallOfApp(): Boolean
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        exit(AppInfo.DataVersion() = Version.Create(0, 0, 0, 0));
    end;


    //useful procedures
    //what app version are you installing right now
    procedure GetAppInstallingVersion(): Text
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        exit(FORMAT(AppInfo.AppVersion()));
    end;

    //what app version was installed on the tenant, just before this installation process
    procedure GetAppCurrentlyInstalledVersion(): Text
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        exit(FORMAT(AppInfo.DataVersion()));
    end;




}