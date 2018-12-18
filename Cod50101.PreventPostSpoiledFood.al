codeunit 50101 "AIR Prevent Post Spoiled Food"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterTestPurchLine', '', true, true)]
    local procedure CheckIfSpoiledTomato(PurchLine: Record "Purchase Line")
    var
        CustomVision: Codeunit "AIR Custom Vision";
        ResultTags: Record "AIR PictureTags" temporary;
        Item: Record Item;
        PictureToAnalyze: Guid;
    begin
        If PurchLine.Type <> PurchLine.Type::Item then
            exit;

        if PurchLine."No." = '' then
            exit;

        if PurchLine.Quantity = 0 then
            exit;

        item.get(PurchLine."No.");

        //>> V2 removal 
        //if Item."AIR Spoiled" then
        //    Error('You have spolied food. Please remove them from Purchase order and Try again.');

        //>> V3 removal
        //case Item."AIR Quality Level" of
        //    Item."AIR Quality Level"::Soft:
        //        if not Confirm('Expiration date is about to expire. Do you want to continue?', false) then
        //            Error('Posting aborted.');
        //    Item."AIR Quality Level"::Spoiled:
        //        Error('You have spolied food. Please remove them from Purchase order and Try again.');
        //end;

        PictureToAnalyze := item.Picture.ITEM(item.Picture.Count());

        CustomVision.Analyze(PictureToAnalyze, ResultTags);

        ResultTags.Reset();
        ResultTags.SetFilter(TagName, 'good tomato');
        ResultTags.SetRange(Probability, 0, 0.2);
        if ResultTags.FindFirst() then
            Error('You have spolied tomatos. Please remove them from Purchase order and Try again.');

        ResultTags.SetRange(Probability, 0.2, 0.6);
        if ResultTags.FindFirst() then
            if not Confirm('Expiration date is about to expire. Do you want to continue?', false) then
                Error('Posting aborted.');
    end;

}