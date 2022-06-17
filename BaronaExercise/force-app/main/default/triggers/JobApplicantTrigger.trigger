trigger JobApplicantTrigger on Job_Applicant__c (before update, after update) {
	if(trigger.isbefore && trigger.isupdate)
    {
        for(Job_Applicant__c appl:Trigger.new){
            if(appl.Job_Request__c == 'Fulfilled'){
                appl.addError('Job Request Status Should be Open');
            }
        }
    }
    
    if(trigger.isafter && trigger.isupdate){
        Set<Id> jRList = new Set<Id>();
        List<Job_Request__c> jRtoUpdate = new List<Job_Request__c>();
        for(Job_Applicant__c appl:Trigger.new){
            if(appl.Status__c == 'Selected'){
                jRList.add(appl.Job_Request__c);
            }
        }
        for(Job_Request__c jReq:[SELECT id,Status__c FROM Job_Request__c WHERE id in:jRList]){
            jReq.Status__c='Fulfilled';
            jRtoUpdate.add(jReq);
        }
        update jRtoUpdate;
    }
}