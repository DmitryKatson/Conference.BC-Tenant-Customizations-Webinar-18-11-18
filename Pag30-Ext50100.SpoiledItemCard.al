pageextension 50100 "AIR Spoiled Item Card" extends "Item Card" //30
{
    layout
    {
        addbefore(Blocked)
        {
            field(Spoiled; "AIR Spoiled")
            {
                Caption = 'Spoiled';
                ApplicationArea = All;
            }

            field("AIR Quality Level"; "AIR Quality Level")
            {
                Caption = 'Quality Level';
                ApplicationArea = All;
            }
        }
    }
}