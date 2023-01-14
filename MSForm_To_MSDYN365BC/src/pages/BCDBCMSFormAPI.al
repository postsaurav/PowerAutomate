page 60001 "BCD BC MS Form API"
{
    APIGroup = 'bcopendiscussion';
    APIPublisher = 'saurav';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'BCMSFormAPI';
    DelayedInsert = true;
    EntityName = 'msformsapis';
    EntitySetName = 'msformsapi';
    PageType = API;
    ODataKeyFields = systemId;
    SourceTable = "BCD BC MS Form";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(responderName; Rec."Responder Name")
                {
                    Caption = 'Responder Name';
                }
                field(responderEMail; Rec."Responder E-Mail")
                {
                    Caption = 'Responder E-Mail';
                }
                field(responderAge; Rec."Responder Age")
                {
                    Caption = 'Responder Age';
                }
                field(In64bitValue; In64bitValue)
                {
                    Caption = 'Bit64 Image';
                    trigger OnValidate()
                    begin
                        if In64bitValue <> '' then
                            Rec.ImportAttachment(In64bitValue);
                    end;
                }
            }
        }
    }

    var
        In64bitValue: Text;
}
