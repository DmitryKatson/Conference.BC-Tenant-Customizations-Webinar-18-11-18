tableextension 50100 "AIR Sploiled" extends Item //27
{
    fields
    {
        field(50100; "AIR Spoiled"; Boolean)
        {
            ObsoleteState = Pending;
            ObsoleteReason = 'Changed to option';
        }
        field(50101; "AIR Quality Level"; Enum "AIR Quality Level")
        {
        }

    }

}