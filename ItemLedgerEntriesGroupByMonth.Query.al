query 50102 ItemLedgerEntriesGroupByMonth
{
    QueryType = Normal;
    Caption = 'Item Ledger Entries Group By Month';
    QueryCategory = 'Item List';

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = "Entry Type" = const(1), "Source Type" = const(1);//Entry Type::Sales, Source Type::Customer
            column(Item_No_; "Item No.")
            {
                Caption = 'Item No.';
            }
            column(Posting_Date_Year; "Posting Date")
            {
                Caption = 'Year';
                Method = Year;
            }
            dataitem(Item_Ledger_Entry_Month; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = Item_Ledger_Entry."Item No.", "Posting Date" = Item_Ledger_Entry."Posting Date";
                DataItemTableFilter = "Entry Type" = const(1), "Source Type" = const(1);//Entry Type::Sales, Source Type::Customer
                column(Posting_Date_Month; "Posting Date")
                {
                    Caption = 'Month';
                    Method = Month;
                }
                column(Quantity; Quantity)
                {
                    Caption = 'Sales Quantity';
                    Method = Sum;
                }
                column(Sales_Amount__Actual_; "Sales Amount (Actual)")
                {
                    Caption = 'Sales Amount (Actual)';
                    Method = Sum;
                }
            }
        }
    }
}