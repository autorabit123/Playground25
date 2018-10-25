trigger TestAccountTrigger on Account (before insert) {
    for (Account acc: Trigger.new)
    {
       if(acc.type == 'Customer')
       {
          acc.Industry = 'Fashion';
       }
    }

}