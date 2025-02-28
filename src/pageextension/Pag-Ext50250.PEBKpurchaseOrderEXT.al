pageextension 50250 "PEBK_purchaseOrderEXT" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field(R_K_Field; Rec.R_K_Field)
            {
                ApplicationArea = All;
            }
        }
    }


    actions
    {
        // Add changes to page actions here
        addafter("O&rder")
        {
            action(Trigger_Action_By_Kirti)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    eventSUB: Codeunit codeunit_PurchaseHeader;
                begin
                    eventSUB.Run();
                    CurrPage.Update();
                end;
            }
        }

    }

    var
        myInt: Integer;
}