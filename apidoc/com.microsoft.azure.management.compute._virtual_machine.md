---
uid: com.microsoft.azure.management.compute._virtual_machine
summary: [*content]
---

The code below demonstrates how to use the Java SDK's fluent syntax to create a new Linux Virtual Machine. 

```java
Azure azure = Azure.authenticate(propertiesFile).withDefaultSubscription();
System.out.println("Creating a Linux VM");

VirtualMachine linuxVM = azure.virtualMachines().define("myLinuxVM")
        .withRegion(Region.US_EAST)
        .withNewResourceGroup("myResourceGroup")
        .withNewPrimaryNetwork("10.0.0.0/28")
        .withPrimaryPrivateIpAddressDynamic()
        .withNewPrimaryPublicIpAddress("mylinuxvmdns")
        .withPopularLinuxImage(KnownLinuxVirtualMachineImage.UBUNTU_SERVER_16_04_LTS)
        .withRootUserName("tirekicker")
        .withSsh("your-ssh-key")
        .withSize(VirtualMachineSizeTypes.STANDARD_D3_V2)
        .create();

System.out.println("Created a Linux VM: " + linuxVM.id());
```
