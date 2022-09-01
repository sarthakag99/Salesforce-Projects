public class PasswordGeneration {
    //List<User> usrList
    @InvocableMethod(callout=true label='Password Mail')
    public static void sendEmail(List<User> usrList){
        User usr = [SELECT Id,Name,Username FROM User WHERE Username = :usrList[0].Username][0];
        ResetPasswordResult rese = system.resetPassword(usr.Id, true); 
        String resultpwd= rese.getPassword(); 
        system.debug('$$$ '+resultpwd);
    }
}