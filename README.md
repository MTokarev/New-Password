# New-Password

### Function that can help you create pseudo-random passwords

Generate pseudo-random password. Can return either string or secure string.
By default returns password as plain text that will have:
 (5 lowerCase + 1 UpperCase + 1 SpecialChar + 1 Digit) = 8 in length

### Params
```
MinLowerChars
(Default = 5)Specify how many chars in lower case should be in the password.

MinUpperChars
(Default = 1)Specify how many chars in upper case should be in the password.

MinSpecialChars
(Default = 1)Specify how many special chars should be in the password.

MinDigits
(Default = 1)Specify how many special chars should be in the password.

ReturnAsSecureString
(Default = false)Return password as secure string. By default returns plain password.
```

### Examples
```csharp

C:\PS> New-Password
zSex0=vp


C:\PS> New-Password -MinLowerChars 5 -MinUpperChars 1 -MinSpecialChars 4
{yp!@P4alz

C:\PS> New-Password -MinLowerChars 5 -MinUpperChars 1 -MinSpecialChars 4 -ReturnAsSecureString
System.Security.SecureString
```