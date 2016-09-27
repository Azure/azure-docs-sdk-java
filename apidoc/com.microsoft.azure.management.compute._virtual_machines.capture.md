---
uid: com.microsoft.azure.management.compute._virtual_machines.capture(String,String,String,boolean)
remarks: *content
---

```java
System.out.println("Capturing vm " + virtualMachineName + " to " + blobContainerName);
        
Azure azure = Azure.authenticate(propertiesFile).withDefaultSubscription();

String result = azure
        .virtualMachines()
            .capture(resourceGroupName,virtualMachineName,blobContainerName, true);

System.out.println("Result " + result);
```
