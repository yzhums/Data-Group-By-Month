query 50100 ValueEntriesGroupByMonth
{
    QueryType = Normal;
    Caption = 'Value Entries Group By Month';
    QueryCategory = 'Item List';

    elements
    {
        dataitem(Value_Entry; "Value Entry")
        {
            DataItemTableFilter = "Item Ledger Entry Type" = const(1), "Source Type" = const(1); //"Item Ledger Entry Type"::Sales,"Source Type"::Customer
            column(Item_No_; "Item No.")
            {
                Caption = 'Item No.';
            }
            column(Posting_Date_Year; "Posting Date")
            {
                Caption = 'Year';
                Method = Year;
            }
            dataitem(Value_Entry01; "Value Entry")
            {
                DataItemLink = "Item No." = Value_Entry."Item No.", "Posting Date" = Value_Entry."Posting Date";
                DataItemTableFilter = "Item Ledger Entry Type" = const(1), "Source Type" = const(1);//"Item Ledger Entry Type"::Sales,"Source Type"::Customer

                column(Posting_Date_Month; "Posting Date")
                {
                    Caption = 'Month';
                    Method = Month;
                }
                column(Sales_Amount__Actual_; "Sales Amount (Actual)")
                {
                    Caption = 'Sales Amount (Actual)';
                    Method = Sum;
                }
                column(Cost_Amount__Actual_; "Cost Amount (Actual)")
                {
                    Caption = 'Cost Amount (Actual)';
                    Method = Sum;
                }
                column(Invoiced_Quantity; "Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                    Method = Sum;
                }
                column(Valued_Quantity; "Valued Quantity")
                {
                    Caption = 'Valued Quantity';
                    Method = Sum;
                }
                column(Item_Ledger_Entry_Quantity; "Item Ledger Entry Quantity")
                {
                    Caption = 'Item Ledger Entry Quantity';
                    Method = Sum;
                }
                column(Cost_Posted_to_G_L; "Cost Posted to G/L")
                {
                    Caption = 'Cost Posted to G/L';
                    Method = Average;
                }
            }
        }
    }
}