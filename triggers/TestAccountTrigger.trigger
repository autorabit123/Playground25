trigger TestAccountTrigger on Account (before insert) {
    system.debug('Test Trigger Comment');

}