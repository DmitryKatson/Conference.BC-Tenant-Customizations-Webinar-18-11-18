pageextension 50101 "AIR Spoiled Item List" extends "Item List" //31
{
    layout
    {
        addafter(Inventory)
        {
            field(Spoiled; "AIR Spoiled")
            {
                Caption = 'Spoiled';
                ApplicationArea = All;
            }

        }
    }
}