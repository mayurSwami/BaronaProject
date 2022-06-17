@isTest
public class JobApplicantTriggerTest {
@isTest
    public static void testUpdateTrigger(){
        String Status = 'Fulfilled';
        Job_Request__c jReq = [SELECT id,Status__c FROM Job_Request__c WHERE Status__c=:Status];
        Job_Applicant__c jAppl = [SELECT id,Job_Request__c FROM Job_Applicant__c WHERE Job_Request__c=:jReq.Id];
        jAppl.Status__c = 'Selected';
        update jAppl;
    }
    
}