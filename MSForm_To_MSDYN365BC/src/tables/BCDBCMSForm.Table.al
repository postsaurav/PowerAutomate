table 60000 "BCD BC MS Form"
{
    Caption = 'BC MS Form';
    DataClassification = CustomerContent;
    LookupPageId = "BCD BC MS Form";
    DrillDownPageId = "BCD BC MS Form";
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(2; "Responder Name"; Text[250])
        {
            Caption = 'Responder Name';
            DataClassification = CustomerContent;
        }
        field(3; "Responder E-Mail"; Text[80])
        {
            Caption = 'Responder E-Mail';
            ExtendedDatatype = EMail;
            DataClassification = CustomerContent;
        }
        field(4; "Responder Age"; Integer)
        {
            Caption = 'Responder Age';
            DataClassification = CustomerContent;
        }
        field(5; "Profile Picture"; Blob)
        {
            Caption = 'Profile Picture';
            Subtype = Bitmap;
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Responder Name", "Responder E-Mail", "Responder Age")
        {
        }
        fieldgroup(Brick; "Responder Name", "Responder E-Mail", "Profile Picture")
        {
        }
    }

    procedure ImportAttachment(Bit64InputValue: Text)
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        TempOutStream: OutStream;
        RecRef: RecordRef;
    begin
        RecRef.Open(Database::"BCD BC MS Form");
        RecRef.GetTable(Rec);

        TempBlob.CreateOutStream(TempOutStream);
        Base64Convert.FromBase64(Bit64InputValue, TempOutStream);
        TempBlob.ToRecordRef(RecRef, Rec.FieldNo("Profile Picture"));
        RecRef.SetTable(Rec);
        RecRef.Close();
    end;
}