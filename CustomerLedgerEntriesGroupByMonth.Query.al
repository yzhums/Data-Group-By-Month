query 50101 CustLedgerEntriesGroupByMonth
{
    QueryType = Normal;
    Caption = 'Customer Ledger Entries Group By Month';
    QueryCategory = 'Customer List';

    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
        {
            DataItemTableFilter = "Document Type" = const(2); //"Document Type"::Invoice
            column(Customer_No_; "Customer No.")
            {
                Caption = 'Customer No.';
            }
            column(Customer_Name; "Customer Name")
            {
                Caption = 'Customer Name';
            }
            column(Posting_Date_Year; "Posting Date")
            {
                Caption = 'Year';
                Method = Year;
            }
            dataitem(Cust__Ledger_Entry_Month; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Cust__Ledger_Entry."Customer No.", "Posting Date" = Cust__Ledger_Entry."Posting Date";
                DataItemTableFilter = "Document Type" = const(2);//"Document Type"::Invoice

                column(Posting_Date_Month; "Posting Date")
                {
                    Caption = 'Month';
                    Method = Month;
                }
                column(Original_Amount; "Original Amount")
                {
                    Caption = 'Original Amount';
                    Method = Sum;
                }
                column(Amount; Amount)
                {
                    Caption = 'Amount';
                    Method = Sum;
                }
                column(Remaining_Amount; "Remaining Amount")
                {
                    Caption = 'Remaining Amount';
                    Method = Sum;
                }
            }
        }
    }
}