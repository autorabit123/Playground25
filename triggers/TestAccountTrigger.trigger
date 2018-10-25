trigger TestAccountTrigger on Account (before insert) {
    for (Account acc: Trigger.new)
    {
       if(acc.type != null && acc.type == 'Customer')
       {
          acc.Industry = 'Retail';
       }
    }

}