codeunit 50105 "AIR Upgrade To 3.0.0.0"
{
    procedure RunUpgradePerCompanyProcess()
    begin
        If Not CheckIfInstallingAppVersionCompatibleWithUpgradeCodeunit() then
            exit;

        PopulateDefaultCustomVisionUriAndKey();
        EnableWebServiceCallsInSandbox();
    end;

    local procedure CheckIfInstallingAppVersionCompatibleWithUpgradeCodeunit(): Boolean
    begin
        exit(GetAppInstallingVersion() = '3.0.0.0')
    end;

    local procedure GetAppInstallingVersion(): Text
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        exit(FORMAT(AppInfo.AppVersion()));
    end;

    procedure PopulateDefaultCustomVisionUriAndKey()
    var
        CustomVisionSetup: Record "AIR Custom Vision Setup";
    begin
        with CustomVisionSetup do begin
            InsertIfNotExists();
            validate(Uri, 'https://southcentralus.api.cognitive.microsoft.com/customvision/v2.0/Prediction/08b99585-0b43-40b5-b811-b3701c8d4d1e/image');
            Validate("Prediction-Key", 'c90050391f5747aa88bb6d9befb4364d');
            Modify(true)
        end;
    end;

    procedure EnableWebServiceCallsInSandbox()
    var
        NavAppSetting: Record "NAV App Setting";
        TenantManagement: Codeunit "Tenant Management";
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);

        if TenantManagement.IsSandbox() then begin
            NavAppSetting."App ID" := AppInfo.Id();
            NavAppSetting."Allow HttpClient Requests" := true;
            if not NavAppSetting.Insert() then
                NavAppSetting.Modify();
        end;
    end;





}