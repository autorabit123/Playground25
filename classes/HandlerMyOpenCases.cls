public with sharing class HandlerMyOpenCases implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session, String fileName, String fileContent) {
        
        List<Case> cases = 
            [SELECT Id, CaseNumber, Subject, Status, Priority, Contact.Id, Contact.Name 
             FROM Case WHERE OwnerId =:UserInfo.getUserId() AND Status != 'Closed'];
        
        List<BotRecord> records = new List<BotRecord>();
        
        if(cases != null) {
            for (Case c : cases) {
                List<BotField> fields = new List<BotField>();
                fields.add(new BotField('Case Number', c.CaseNumber, '#/sObject/' + c.Id + '/view'));
                //Test Vikram - 10/25
                fields.add(new BotField('PotentialLiability', c.PotentialLiability__c));
                fields.add(new BotField('Subject of the Case', c.Subject));
                fields.add(new BotField('Status', c.Status));
                fields.add(new BotField('SLA Violation', c.SLAViolation__c));
                fields.add(new BotField('Contact', c.Contact.Name, '#/sObject/' + c.Contact.Id + '/view'));
                records.add(new BotRecord(fields));
            }
        }
        BotMessage message = new BotMessage('Bot', 'Here are your open cases:', records);
        return new BotResponse(message);
        
    }
    
}