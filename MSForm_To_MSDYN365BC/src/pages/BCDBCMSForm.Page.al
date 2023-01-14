page 60000 "BCD BC MS Form"
{
    ApplicationArea = All;
    Caption = 'BC MS Form';
    PageType = List;
    SourceTable = "BCD BC MS Form";
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Responder Name"; Rec."Responder Name")
                {
                    ToolTip = 'Specifies the value of the Responder Name field.';
                }
                field("Responder E-Mail"; Rec."Responder E-Mail")
                {
                    ToolTip = 'Specifies the value of the Responder E-Mail field.';
                }
                field("Responder Age"; Rec."Responder Age")
                {
                    ToolTip = 'Specifies the value of the Responder Age field.';
                }
                field("Profile Picture"; Rec."Profile Picture")
                {
                    ToolTip = 'Specifies the value of the Profile Picture field.';
                }
            }
        }
    }
}
