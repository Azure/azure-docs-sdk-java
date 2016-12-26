---
uid: com.microsoft.azure.management.compute._virtual_machine
summary: *content
---

The code below demonstrates how to use the Java SDK's fluent syntax to create a new [Standard D3](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-sizes/#d-series) Linux Virtual Machine running Ubuntu 16.04 server in the Eastern US data center.

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

---
uid: com.microsoft.azure.management.compute._virtual_machine.computerName()
summary: Gets the name of the virtual machine.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.dataDisks()
summary: Gets the list of data disks that are attached to the virtual machine.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.extensions()
summary: Gets the extensions that are installed on the virtual machine.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.getPrimaryPublicIpAddressId()
summary: Gets the identifier of the public IP address associated with this virtual machine's primary network interface.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.licenseType()
summary: Gets the license type of the virtual machine.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.osDiskCachingType()
summary: Gets the caching type of the operating system disk.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.osDiskSize()
summary: Gets the size of the operating system disk.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.osDiskVhdUri()
summary: Gets the URI of the virtual hard disk that contains the operating system.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.osType()
summary: Gets the type of the operating system.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.plan()
summary: Gets the plan for the virtual machine image.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.powerState()
summary: Gets the power state of the virtual machine.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.provisioningState()
summary: Gets the prrovisioning state of the virtual machine.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.size()
summary: Gets the size of the virtual machine.
---

---
uid: com.microsoft.azure.management.compute._virtual_machine.vmId()
summary: Gets the identifier of the virtual machine.
---