public with sharing class ManageCustomMetadataExample {

    public static void createMetadata() {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        
        MetadataService.CustomMetadata customMetadata = new MetadataService.CustomMetadata();
        customMetadata.fullName = 'SimpleTest.Test6'; // Developer Name of the custom metadata type and record name
        customMetadata.label = 'test6'; // Master Label of the custom metadata type and record name
        customMetadata.values = new List<MetadataService.CustomMetadataValue>();

        MetadataService.CustomMetadataValue importIdValue = new MetadataService.CustomMetadataValue();
        importIdValue.field = 'tf1__c';
        importIdValue.value = '123456';
        customMetadata.values.add(importIdValue);
        
        List<MetadataService.UpsertResult> results = service.upsertMetadata(new MetadataService.CustomMetadata [] { customMetadata});
        
        if (results[0].success) {
            System.debug('Record inserted successfully');
        } else {
            System.debug('Error inserting record: ' + results[0].errors[0].message);
        }
    }

    public static void deleteMetadata(String[] fullNames) {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        List<MetadataService.DeleteResult> results = service.deleteMetadata('CustomMetadata',fullNames);
        
        if (results[0].success) {
            System.debug('Record deleted successfully');
        } else {
            System.debug('Error inserting record: ' + results[0].errors[0].message);
        }
    }

}