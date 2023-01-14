permissionset 60000 "MS Forms"
{
    Assignable = true;
    Caption = 'Microsoft Forms', MaxLength = 30;
    Permissions = tabledata "BCD BC MS Form" = RIMD,
        table "BCD BC MS Form" = X,
        page "BCD BC MS Form" = X,
        page "BCD BC MS Form API" = X;
}