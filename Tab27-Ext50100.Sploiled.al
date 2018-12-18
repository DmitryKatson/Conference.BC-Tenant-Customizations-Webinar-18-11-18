tableextension 50100 "AIR Sploiled" extends Item //27
{
    fields
    {
        field(50100; "AIR Spoiled"; Boolean)
        {
            ObsoleteState = Removed;
            ObsoleteReason = 'Changed to option in v.2';
        }
        field(50101; "AIR Quality Level"; Enum "AIR Quality Level")
        {
            ObsoleteState = Removed;
            ObsoleteReason = 'Changed to AI analysis in v.3';
        }

    }

}