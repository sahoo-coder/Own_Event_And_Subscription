codeunit 50400 "codeunit_PurchaseHeader"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PurchaseHeaderEventPublisher, OnPurchaseHeaderEvent, '', false, false)]
    local procedure testedSubscription(var PurchaseHeader: Record "Purchase Header")

    begin
        PurchaseHeader.R_K_Field := 'TESTING SUCCESS';
        PurchaseHeader.Modify();
        Message('Came to EVENT');
    end;
}