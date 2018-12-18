codeunit 50103 "AIR Upgrade codeunit"
{
    Subtype = Upgrade;

    trigger OnCheckPreconditionsPerDatabase()
    begin
        //if you will add insert any code that insert data to a table, 
        //where DataPerCompany = True, you will receive an error during publish process
    end;

    trigger OnCheckPreconditionsPerCompany()
    begin

    end;

    trigger OnUpgradePerDatabase()
    begin

    end;

    trigger OnUpgradePerCompany()
    begin
        //OnUpgradePerCompanyToVersion_2_0_0_0();
        OnUpgradePerCompanyToVersion_3_0_0_0();

    end;

    trigger OnValidateUpgradePerDatabase()
    begin

    end;

    trigger OnValidateUpgradePerCompany()
    begin

    end;

    // local procedure OnUpgradePerCompanyToVersion_2_0_0_0()
    // var
    //     UpgradeTo2Version: Codeunit "AIR Upgrade To 2.0.0.0";
    // begin
    //     UpgradeTo2Version.RunUpgradePerCompanyProcess();
    // end;

    local procedure OnUpgradePerCompanyToVersion_3_0_0_0()
    var
        UpgradeTo3Version: Codeunit "AIR Upgrade To 3.0.0.0";
    begin
        UpgradeTo3Version.RunUpgradePerCompanyProcess();
    end;


}

