public with sharing class AegisMetricsEventLogFileSelector {

    public static list<Eventlogfile> getEventLogFiles(List<String> eventMonitoringTypeNames) {
        return [SELECT Id, LogFile, LogFileFieldNames, EventType, LogFileFieldTypes 
                FROM Eventlogfile 
                WHERE EventType IN : eventMonitoringTypeNames 
                AND logDate = LAST_N_DAYS:2
                AND Interval = 'Daily'
                WITH SECURITY_ENFORCED
                ORDER BY EventType ASC];
    }
}