table 50103 "AIR PictureTags"
{
    fields
    {
        field(1; "Request GUID"; Guid)
        {
        }

        field(10; "TagName"; Text[250])
        {

        }
        field(11; "TagID"; Text[250])
        {

        }
        field(12; "Probability"; Decimal)
        {

        }
    }

    keys
    {
        key(PK; "Request GUID", TagID)
        {
            Clustered = true;
        }
    }

}