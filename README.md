## Enigma

I believe that overall, my project falls under the category of meets expectations.

**Functionality:** I think my project will be at meets expectations for functionality. The encrypt and decrypt command interfaces are working as expected. Additionally, I am able to use file i/o to encrypt and decrypt messages into a txt file.

**Object Oriented Programming:** I believe I will be between 3 and 4. I successfully implemented a super class (enigma default), a module (cipher), and had two classes (enigma and shift). I tried to keep my classes small with single responsibilities. Cipher is a module because it does not contain state and only has bevahiors. Engima default is a super class because the random numbers, letters, and date are built from there and this is information the other classes need. Cipher is where the encryption/decyrption occurs and enigma simply puts the encyryption/decryption into hash form with its associated keys and date per the project interaction pattern.

**Ruby Coventions and Mechanics:** I think will be at meets expectations. My cipher module only has two methods but they are both long, however, I found it challenging to break up because the method encrypted and decrypted the message which involved mulitple steps. However, aside from this, I believe my other classes were condensed and readable. I used while loops in cipher class to ensure that they letters index position could be used; I also implented if statments to check for special characters. I used each to iterate through each letter/chracter in the message string and map to generate my offset numbers.

**Test Driven Development:** Possibly between 3 and 4 as I successfully implemented stubs to test for random dates and 5 digit keys. I think my tests are thorough and are tested at both unit and integration level, and for edge cases. Testing is something I have been pushing myself to do more thoroughly and I hope that I successfully achieved that with this project.

**Version Control:** I believe I will be at a 4 for version control as I have 4 pull requests and over 40 commits.



