table 50100 "AIR Custom Vision Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {

        }

        field(10; "Uri"; Text[250])
        {

        }
        field(11; "Prediction-Key"; Text[250])
        {

        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure InsertIfNotExists()
    var
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;


}