trigger TestAccountTrigger on Account (before insert) {
    for (Account acc: Trigger.new)
    {
       if(acc.type == 'Prospect')
       {
          acc.Industry = 'Banking';
       }
    }

}