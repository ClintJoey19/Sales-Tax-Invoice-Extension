reportextension 50101 SalesTaxInvoiceExt extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Line)
        {
            column(PaymentTermsCode;Header."Payment Terms Code")
            {}
            column(LocationCode;Line."Location Code")
            {}
            column(CurrencyCodeV2;GetCurrencyCode())
            {}
            column(TarrifNo; GetTarrifNo())
            {}
        }   
    }

    var
        Item: Record Item;

    local procedure GetTarrifNo(): Code[20]
    begin
        if (Item.get(Line."No.")) then
            exit(Item."Tariff No.");
        exit('');
    end;
}