Feature: Menta Login Screen

  Background: 
    Given android menta app is installed on the device and launched successfully
    When android user clink on the Sign in button
    Then android user should navigate to menta login screen

  @AndroidMenta_1 @AndroidMenta_Sanity
  Scenario Outline: To verify that when user performs login with valid credential then user navigates to menta dashboard screen.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen

    Examples: 
      | emailAddress | password   |
      | Moniker1		 | MentaPass1 |

  @AndroidMenta_2 @CA_1 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to ADD CASH into Menta Checking Account using new Ach card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance Before adding money into Menta Account
    When android user click on ADD CASH button
    And android user enters the "<Amount>"
    And android user click on Cash Add button
    When android user click on Add Ach button
    And android user enters the Identification number "<Identification>"
    And android user enters the Middle Name "<MiddleName>"
    And android user enters the Ach Zip Code "<AchZipCode>"
    And android user enters the Ach Country Code "<AchCountryCode>"
    And android user enters the Debitors Institution Name "<InstitutionName>"
    And android user enters the Debitors Identification "<DebIdent>"
    And android user enters the Debitors Institution Identification "<DebI>"
    And android user enters the Reason "<Reason>"
    And android user click on Save this information checkbox
    And android user click on Ach Submit button
    Then android user is on Transfer through Ach screen
    When android user click on Go To Dashboard button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance After adding money into Menta Account

    Examples: 
      | emailAddress | password   | Amount | Identification | MiddleName | AchZipCode | AchCountryCode | InstitutionName | DebIdent | DebI      | Reason |
      | Moniker1     | MentaPass1 |    180 |      123456789 | mm         |     411035 |          85555 | IDBI            | 22222222 | 101110802 | NewAch |

  @AndroidMenta_3 @CA_2 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to ADD CASH into Menta Checking Account using existing Ach card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance Before adding money into Menta Account
    When android user click on ADD CASH button
    And android user enters the "<Amount>"
    And android user click on Cash Add button
    When android user select the added Ach card base on "<InstitutionName>" and "<DebIdent>"
    Then android user land on Debitors account info screen
    When android user enters the Reason "<Reason>"
    And android user click on Ach Submit button
    Then android user is on Transfer through Ach screen
    When android user click on Go To Dashboard button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance After adding money into Menta Account

    Examples: 
      | emailAddress | password   | Amount | InstitutionName | DebIdent | Reason  |
      | Moniker1     | MentaPass1 |     20 | IDBI            | 22222222 | ExisAch |

	@AndroidMenta_4 @Set_Pin @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able Set the Pin.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on profile account option
    Then android user land on profile account screen
    When android user click on Privacy and Security option
    Then android user land on Privacy and Security screen
    When android user click on Set Pin option
    And android user enters the pin"<Pin>"
    And android user enters the confirm pin"<Pin>"
    Then android user land on Pin created screen
    When android user click on Back to Profile Options button
    Then android user land on profile account screen

    Examples: 
      | emailAddress | password   | Pin  |
      | Moniker1     | MentaPass1 | 0000 |
	
	@AndroidMenta_5 @CA_5 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to add beneficiary and Send the money from checking account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance Before sending the money to Menta user or beneficiary
    When android user click on Checking Account Send button
    And android user enters the "<Amount>"
    And android user click on Checking Account Send button
    And android user enters the beneficiary email"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Checking Account Send button
    And android user enters the pin"<Pin>"
    Then android user land on Money sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance After sending the money to Menta user or beneficiary

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note   | Pin  |
      | Moniker1     | MentaPass1 |     50 | BeneficiaryEmail2 | CASend | 0000 |
  
  @AndroidMenta_6 @CA_4 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Send the Money request to added beneficiary and refuse the request.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Request button
    And android user enters the "<Amount>"
    And android user click on Request button
    And android user select the added beneficiary"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Request button
    Then android user land on Money Request sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android menta app should be closed
    Given android menta app is installed on the device and launched successfully
    When android user clink on the Sign in button
    When android user provides menta Username "<Email>" and Password "<Pass>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Transactions Box
    Then android user land on Transactions screen
    When android user select the request base on note "<Note>" and amount "<ReqAmount>"
    And android user click on Refuse button
    Then android user land on Transactions screen

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note          | Email    | Pass             | ReqAmount |
      | Moniker1     | MentaPass1 |      4 | BeneficiaryEmail2 | RequestRefuse | Moniker2 | BeneficiaryPass2 | $  4.00   |
      
	@AndroidMenta_7 @CA_4 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Send the Money request to added beneficiary and accept the request.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Request button
    And android user enters the "<Amount>"
    And android user click on Request button
    And android user select the added beneficiary"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Request button
    Then android user land on Money Request sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android menta app should be closed
    Given android menta app is installed on the device and launched successfully
    When android user clink on the Sign in button
    When android user provides menta Username "<Email>" and Password "<Pass>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Transactions Box
    Then android user land on Transactions screen
    When android user select the request base on note "<Note>" and amount "<ReqAmount>"
    And android user click on PayBack button
    And android user click on Checking Account Send button
    Then android user land on Payment accept screen
    When android user click on Close button
    Then android user land on Transactions screen

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note           | Email    | Pass             | ReqAmount | Pin  |
      | Moniker1     | MentaPass1 |      5 | BeneficiaryEmail2 | RequestPayBack | Moniker2 | BeneficiaryPass2 | $  5.00   | 0000 |
       
  @AndroidMenta_8 @PA_1 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to create new pocket and add money using new card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user click on Create Pocket plus button
    Then android user land on Create Pocket screen
    When android user enter the pocket name"<PocketName>"
    And android user click on Pocket Submit button
    Then android user land on add money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Fund your pocket screen
    When android user click on Add a card button
    And android user enters the card number "<CardNumber>"
    And android user enters the expiry date "<ExpiryDate>"
    And android user enters the security code "<code>"
    And android user enters the Zip Code "<ZipCode>"
    And android user enters the card name "<CardName>"
    And android user click on Add button
    Then android user land on card created screen
    When android user select the newly created card
    And android user click on card Next button
    And android user enter the security code"<code>"
    And android user click on Pay button
    Then android user land on Amount Added screen
    When android user click on Go To Pocket Dashboard button
    Then android user land on Pocket Account screen
    Then android user verify newly added pocket should be displayed on the Pocket Account screen"<PocketName>"
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | CardNumber       | ExpiryDate | code | ZipCode | CardName |
      | Moniker1     | MentaPass1 | Book       |     50 | 4111111111111111 |       1224 |  123 |  411035 | HDFC     |

  @AndroidMenta_9 @PA_2 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to create new pocket and add money using menta checking account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user click on Create Pocket plus button
    Then android user land on Create Pocket screen
    When android user enter the pocket name"<PocketName>"
    And android user click on Pocket Submit button
    Then android user land on add money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Fund your pocket screen
    When android user click on Menta Checking Account button
    And android user enters the pin"<Pin>"
    Then android user land on Amount Added screen
    When android user click on Go To Pocket Dashboard button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | Pin  |
      | Moniker1     | MentaPass1 | School     |     10 | 0000 |

  @AndroidMenta_10 @PA_3 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Add Money into pocket using existing card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    When android user verify Pocket Balance before adding the money
    And android user click on Add Money button
    Then android user land on add money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Fund your pocket screen
    When android user select the newly created card
    And android user click on card Next button
    And android user enter the security code"<code>"
    And android user click on Pay button
    Then android user land on Amount Added screen
    When android user click on Go To Pocket Dashboard button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | code |
      | Moniker1     | MentaPass1 | Book       |     10 |  123 |

  @AndroidMenta_11 @PA_5 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Add Money into pocket using Menta Checking Account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    When android user verify Pocket Balance before adding the money
    And android user click on Add Money button
    Then android user land on add money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Fund your pocket screen
    When android user click on Menta Checking Account button
    And android user enters the pin"<Pin>"
    Then android user land on Amount Added screen
    When android user click on Go To Pocket Dashboard button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | Pin  |
      | Moniker1     | MentaPass1 | Book       |     10 | 0000 |

  @AndroidMenta_12 @PA_4 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Withdraw pocket money into Menta Checking Account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user verify Pocket Balance before adding the money
    And android user click on Withdraw button
    Then android user land on withdraw money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    When android user click on Menta Checking Account button
    And android user enters the pin"<Pin>"
    And android user click on Go To Pocket Dashboard withdraw button
    And android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | Pin  |
      | Moniker1     | MentaPass1 | Book       |     10 | 0000 |

  @AndroidMenta_13 @PA_7 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Send Pocket Money to added beneficiary.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user verify Pocket Balance Before Sending the money
    And android user click on Send Money button
    And android user enters the "<Amount>"
    And android user click on amount Send button
    And android user select the added beneficiary"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Send button
    And android user enters the pin"<Pin>"
    Then android user land on Money sent screen
    When android user click on Close button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After Sending the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | BeneficiaryEmail  | Note            | Pin  |
      | Moniker1     | MentaPass1 | Book       |      6 | BeneficiaryEmail2 | SendPocketMoney | 0000 |

  @AndroidMenta_14 @PA_8 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to update the pocket name.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user click on Edit Pocket name option
    Then android user land on Update Pocket screen
    When android user enters the new pocket name"<NewPocketName>"
    And android user click on Update button
    Then android user verify newly added pocket should be displayed on the Pocket Account screen"<NewPocketName>"

    Examples: 
      | emailAddress | password   | PocketName | NewPocketName |
      | Moniker1     | MentaPass1 | School     | Tea           |

  @AndroidMenta_15 @PA_9 @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to close pocket and deposite pocket money into menta checking account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user click on Close Pocket button
    Then android user land on Close Pocket confirmation screen
    When android user select the Menta Account for deposite pocket money
    And android user enters the pin"<Pin>"
    When android user click on Go To Pocket Dashboard button
    Then android user land on Pocket Account screen

    Examples: 
      | emailAddress | password   | PocketName | Pin  |
      | Moniker1     | MentaPass1 | Tea        | 0000 |

  @AndroidMenta_16 @RemoveCard @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to remove the card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on profile account option
    Then android user land on profile account screen
    When android user click on Linked Banks option
    Then android user land on Linked Banks screen
    When android user click on Link Debit Card option
    Then android user land on Cards screen
    When android user selecting the card "<Card>"
    And android user click on Remove Card button
    Then android user land on Card deleted screen
    Then android user land on Cards screen

    Examples: 
      | emailAddress | password   | Card |
      | Moniker1     | MentaPass1 | HDFC |

  @AndroidMenta_17 @Order_Card @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Order a Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on View Card button
    And android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    And android user select the Order A Card option
    And android user click on Yes button
    Then android user land on Card Ordered screen
    When android user click on Go to Checking Dashboard button
    Then android user land on Checking Account screen

    Examples: 
      | emailAddress | password   |
      |  Moniker1    | MentaPass1 |

  @AndroidMenta_18 @Replace_Card @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Replace the Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on View Card button
    And android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    When android user select the Card Settings option
    Then android user land on Card Settings screen
    When android user select the existing card
    And android user select the Replace Card option
    And android user click on Confirm button
    Then android user land on Card Replaced screen
    Then android user land on Menta Spending Card screen

    Examples: 
      | emailAddress | password   |
      | Moniker1     | MentaPass1 |

  @AndroidMenta_19 @AddVirtual_Card @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Add Virtual Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on View Card button
    And android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    When android user select the Card Settings option
    Then android user land on Card Settings screen
    When android user select the existing card
    And android user select the Add Vitual Card option
    Then android user land on Virtual Card Created screen
    Then android user land on Menta Spending Card screen

    Examples: 
      | emailAddress | password   |
      |  Moniker1    | MentaPass1 |

  @AndroidMenta_20 @OnlineAndATM_Options @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to change Online Payment and ATM Withdrawal Card settings options.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on View Card button
    And android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    When android user select the Card Settings option
    Then android user land on Card Settings screen
    When android user select the existing card
    And android user click on Online Payment option
    And android user click on ATM Withdrawal option
    And android user click on Apply button
    And android user land on Card Settings changes apply screen
    Then android user land on Menta Spending Card screen

    Examples: 
      | emailAddress | password   |
      | Moniker1     | MentaPass1 |

  @AndroidMenta_21 @Lost_Card @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Block the Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on View Card button
    And android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    When android user click on Lost Card button
    Then android user land on Block Card screen
    When android user click on Loss button
    And android user click on Block button
    Then android user land on Card Blocked screen
    Then android user land on Checking Account screen

    Examples: 
      | emailAddress | password   |
      | Moniker1     | MentaPass1 |

  @AndroidMenta_22 @Change_Pin @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Change the Pin.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on profile account option
    Then android user land on profile account screen
    When android user click on Privacy and Security option
    Then android user land on Privacy and Security screen
    When android user click on Change Pin option
    When android user enters the pin"<OldPin>"
    And android user enters the pin"<NewPin>"
    And android user enters the confirm pin"<NewPin>"
    Then android user land on Pin Changed screen
    When android user click on Back to Profile Options button
    Then android user land on profile account screen

    Examples: 
      | emailAddress | password   | OldPin | NewPin |
      | Moniker1     | MentaPass1 |   0000 |   1111 |

  @AndroidMenta_23 @ChangePassword @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to change the password.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Menu option
    And android user click on Account option
    Then android user land on Account screen
    When android user click on Change Password textbox
    Then android user land on Create new Password screen
    When android user enters the Old password"<OldPassword>"
    And android user enters the New password"<NewPassword>"and Confirm password"<NewPassword>"
    And android user click on Submit Password button
    Then android user land on Password updated screen
    When android user click on Okay button
    Then android user land on Enters password screen

    Examples: 
      | emailAddress | password   | OldPassword | NewPassword |
      | Moniker1     | MentaPass1 | MentaPass1  | MentaPass2  |

  @AndroidMenta_24 @ResetPassword @AndroidMenta_Sanity
  Scenario Outline: To verify that user should be able to Reset the password.
    When android user click on Forgot Password link text
    Then android user land on Forgot Password screen
    When android user enters the Email address"<EmailAddress>"
    And android user click on Reset Password Send button
    Then android user land on enter new password screen
    When android user enters the new password"<Respassword>"
    And android user click on Reset Password Send button
    Then android user land on Password changed screen
    When android user click on Finish button
    Then android user should navigate to menta login screen

    Examples: 
      | EmailAddress  | Respassword |
      | MentaEmail1   | MentaPass3  |
	
	
	
	#Extra Scenarios
	@AndroidMenta @Loan
  Scenario Outline: To verify that user should be able to Create or Apply for new loan and Pay EMI using Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on LOANS button
    Then android user land on Loan Dashboard screen
    When android user click on Apply new loan button
    And android user select the loan amount from dropdown"<LoanAmount>"
    And android user select the loan tenure"<Tenure>"
    And android user click on Loan Next button
    Then android user land on Loan Agreement screen
    When android user selects Terms and Condition checkbox

    #And android user click on Accept Contract button
    #And android user click on Agreement Next button
    #And android user click on Fee Accept button
    #And android user select the newly created card
    #And android user click on Make Payment button
    #And android user enter the security code"<code>"
    #And android user click on Pay button
    #And android user click on Go To Dashboard button
    #Then android app should load the menta dashboard screen
    #When android user click on LOANS button
    #Then android user land on Loan Dashboard screen
    #When android user select the newly created loan using Loan Name"<LoanName>" and Tenure"<Tenure>" and PaymentMethod "<PaymentMethod>" and code"<code>"
    #And android user click on EMI Make Payment button
    #And android user enters the EMI Amount
    #And android user click on EMI Amount Next button
    #And android user select the Payment Method for EMI"<PaymentMethod>"
    #And android user click on Make Payment Okay button
    #And android user enter the security code"<code>"
    #And android user click on Pay button
    #And android user click on Go To Dashboard button
    #Then android app should load the menta dashboard screen
    #When android user click on LOANS button
    #Then android user land on Loan Dashboard screen
    #When android user select the newly created loan using Loan Name"<LoanName>" and Tenure"<Tenure>"
    #Then Loan Closed button should be displayed on android app
    Examples: 
      | emailAddress | password   | LoanAmount | Tenure | code | LoanName       | PaymentMethod       |
      | MentaEmail1  | MentaPass1 |        500 |      2 |  123 | Builder Loan 1 | card ending in 1111 |
	
  @AndroidMenta @MentaRegistration
  Scenario Outline: To verify that user should be able to register the new users.
    When android user click on the Sign Up button
    And android user register the users depends on"<RegEmailCount>"and"<RegPassword>"
    And android user enter the registration email address
    And android user enter the registration password"<RegPassword>"
    And android user enter the registration confirm password"<RegPassword>"
    And android user click on register button
    And android user click on registration confirm button

    Examples: 
      | RegEmailCount | RegPassword |
      |             2 | RegPass     |

  @AndroidMenta @CA_3
  Scenario Outline: To verify that user should be able to add new beneficiary and Send the Money request and refuse the same request.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Request button
    And android user enters the "<Amount>"
    And android user click on Request button
    And android user enters the beneficiary email"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Request button
    Then android user land on Money Request sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android menta app should be closed
    Given android menta app is installed on the device and launched successfully
    When android user clink on the Sign in button
    When android user provides menta Username "<Email>" and Password "<Pass>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Transactions Box
    Then android user land on Transactions screen
    And android user select the request base on note "<Note>" and amount "<ReqAmount>"
    And android user click on Refuse button
    Then android user land on Transactions screen

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note             | Email         | Pass             | ReqAmount |
      | MentaEmail1  | MentaPass1 |      1 | BeneficiaryEmail2 | CARequestNewUser | Email2Moniker | BeneficiaryPass2 | $  1.00   |
	
	@AndroidMenta @CA_4
  Scenario Outline: To verify that user should be able to Send the Money request to added beneficiary and accept the request.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Request button
    And android user enters the "<Amount>"
    And android user click on Request button
    And android user select the added beneficiary"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Request button
    Then android user land on Money Request sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android menta app should be closed
    Given android menta app is installed on the device and launched successfully
    When android user clink on the Sign in button
    When android user provides menta Username "<Email>" and Password "<Pass>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Transactions Box
    Then android user land on Transactions screen
    When android user select the request base on note "<Note>" and amount "<ReqAmount>"
    And android user click on PayBack button
    And android user click on Checking Account Send button
    And android user enters the pin"<Pin>"
    Then android user land on Payment accept screen
    When android user click on Close button
    Then android user land on Transactions screen

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note              | Email         | Pass             | ReqAmount | Pin  |
      | MentaEmail1  | MentaPass1 |      2 | BeneficiaryEmail2 | CARequestExisUser | Email2Moniker | BeneficiaryPass2 | $  2.00   | 0000 |
	
  @AndroidMenta @CA_6 
  Scenario Outline: To verify that user should be able to Send the Money to added Menta user or beneficiary from checking account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance Before sending the money to Menta user or beneficiary
    When android user click on Checking Account Send button
    And android user enters the "<Amount>"
    And android user click on Checking Account Send button
    And android user select the added beneficiary"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Checking Account Send button
    And android user enters the pin"<Pin>"
    Then android user land on Money sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance After sending the money to Menta user or beneficiary

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note           | Pin  |
      | MentaEmail1  | MentaPass1 |      4 | BeneficiaryEmail3 | CASendExisUser | 0000 |
      
  @AndroidMenta @PA_6
  Scenario Outline: To verify that user should be able to Send Pocket Money to new Menta user or beneficiary.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user verify Pocket Balance Before Sending the money
    And android user click on Send Money button
    And android user enters the "<Amount>"
    And android user click on amount Send button
    And android user enters the beneficiary email"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Send button
    And android user enters the pin"<Pin>"
    Then android user land on Money sent screen
    When android user click on Close button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After Sending the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | BeneficiaryEmail  | Note          | Pin  |
      | MentaEmail1  | MentaPass1 | Book       |      5 | BeneficiaryEmail4 | PASendNewUser | 0000 |