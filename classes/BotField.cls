public class BotField {
//Test
    @AuraEnabled public String name { get;set; }
    @AuraEnabled public String value { get;set; }
    @AuraEnabled public String linkURL { get;set; }
    
    public BotField(String name, String value) {
        this.name = name;
        this.value = value;
    }
    //Demo123
    public BotField(String name, String value, string linkURL) {
        this.name = name;
        this.value = value;
        this.linkURL = linkURL;
    }

}