public class MultipleObjectDMLOperationApexClass {
    
    //Method-1 to Create Account record to Opportunity to Opportunity Product(line items) to Product to Pricebook entry to Pricebook
    public void AccRecord(){
        Account acc = new Account();
        acc.Name = 'DML Operation Account Record 003';
        acc.Active__c = 'True';
        Insert acc;
        //Create Opportunity
        Opportunity opp = new opportunity();
        opp.Name = 'DML SMB Order 003';
        opp.CloseDate = date.newInstance(2023, 09, 30);
        opp.StageName = 'Needs Analysis';
        opp.AccountId = acc.Id;
        insert opp;        
        // Create a Pricebook
        Pricebook2 customPriceBook = new Pricebook2(Name = 'DML Custom Price Book', Description = 'This is Custom Price Book description.', IsActive = true);
        insert customPriceBook;
        //Create Product
        Product2 prod = new Product2();
        prod.Name = 'DML Product 003';
        prod.IsActive = True;
        Insert prod;
        //Get standard price book and associate it to product
        pricebook2 spb = [SELECT Id, Name, IsStandard FROM Pricebook2 Where IsStandard = true];
        PricebookEntry pbe = new PricebookEntry();
        pbe.Pricebook2Id = spb.Id;
        pbe.Product2Id = prod.Id;
        pbe.UnitPrice = 10000;
        pbe.IsActive = True;
        Insert pbe;
        //Associate created custom price book to product
        PricebookEntry cpb = new pricebookEntry();
        cpb.Pricebook2Id = customPriceBook.Id;
        cpb.Product2Id = prod.Id;
        cpb.UnitPrice = 10000;
        cpb.IsActive = true;
        insert cpb;
        //create opportunity product (opportunity line item)
        OpportunityLineItem oli = new OpportunityLineItem(); // 
        oli.PricebookEntryId = cpb.Id;
        oli.OpportunityId = opp.Id;
        oli.Product2Id = prod.Id;
        oli.Quantity = 2;
        oli.UnitPrice = 10000;
        insert oli;
    }
    
    //Method 2 to create multiple products for opportunity
    public void multipleProducts(integer n){
        
        List<Product2> ProVar = new List<Product2>();
        for(Integer i=0; i<n; i++){
            Product2 prodt = new Product2();
            prodt.Name = 'DML Product'+i;
            prodt.IsActive = True;
            ProVar.add(prodt);
        }
        Insert ProVar; 
    }
}