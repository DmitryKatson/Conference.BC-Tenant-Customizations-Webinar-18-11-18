codeunit 50101 "AIR Prevent Post Spoiled Food"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterTestPurchLine', '', true, true)]
    local procedure CheckIfSpoiledTomato(PurchLine: Record "Purchase Line")
    var
        Item: Record Item;
    begin
        If PurchLine.Type <> PurchLine.Type::Item then
            exit;

        if PurchLine."No." = '' then
            exit;

        if PurchLine.Quantity = 0 then
            exit;

        item.get(PurchLine."No.");

        if Item."AIR Spoiled" then
            Error('You have spolied food. Please remove them from Purchase order and Try again.');

    end;

}