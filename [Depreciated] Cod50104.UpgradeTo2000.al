// codeunit 50104 "AIR Upgrade To 2.0.0.0"
// {
//     procedure RunUpgradePerCompanyProcess()
//     begin
//         If Not CheckIfInstallingAppVersionCompatibleWithUpgradeCodeunit() then
//             exit;

//         TransferValueFromItemSpoiledFieldToItemQualityField();
//     end;

//     local procedure CheckIfInstallingAppVersionCompatibleWithUpgradeCodeunit(): Boolean
//     begin
//         exit(GetAppInstallingVersion() = '2.0.0.0')
//     end;

//     local procedure GetAppInstallingVersion(): Text
//     var
//         AppInfo: ModuleInfo;
//     begin
//         NavApp.GetCurrentModuleInfo(AppInfo);
//         exit(FORMAT(AppInfo.AppVersion()));
//     end;

//     local procedure TransferValueFromItemSpoiledFieldToItemQualityField()
//     var
//         item: Record Item;
//     begin
//         item.setrange("AIR Spoiled", true);
//         if item.FindFirst() then
//             repeat
//                 item."AIR Quality Level" := item."AIR Quality Level"::Spoiled;
//                 item.modify;
//             until item.Next() = 0;
//     end;



// }