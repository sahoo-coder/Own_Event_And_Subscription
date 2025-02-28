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
                    eventPublisher: Codeunit PurchaseHeaderEventPublisher;
                    purchaseHeader: Record "Purchase Header";
                begin
                    if Rec."No." <> '' then begin
                        if purchaseHeader.Get(Rec."Document Type", Rec."No.") then
                            eventPublisher.RaiseEvent(PurchaseHeader)
                        else
                            Message('Purchase Header not found.');
                    end
                end;
            }
        }

    }

    var
        myInt: Integer;
}