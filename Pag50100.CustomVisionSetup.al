page 50100 "AIR Custom Vision Setup"
{

    PageType = Card;
    SourceTable = "AIR Custom Vision Setup";
    Caption = 'Custom Vision Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Uri"; "Uri")
                {
                    ApplicationArea = All;
                }
                field("Prediction-Key"; "Prediction-Key")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        InsertIfNotExists();
    end;

}

