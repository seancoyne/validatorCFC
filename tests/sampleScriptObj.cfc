component accessors = true {

	property name = "firstName" required = true type = "string" rules = "noZeroLengthString" invalidMessage="Please provide your first name";
	property name = "lastName" required = true type = "string" rules = "noZeroLengthString" invalidMessage="Please provide your last name";
	property name = "email" required = true type = "string" rules = "noZeroLengthString,validEmail" invalidMessage="Please provide a valid email address";
	property name = "dob" required = true type = "string" rules = "validDate" invalidMessage="Please provide a valid date of birth";
	property name = "gpa" required = true type = "string" rules = "validNumber" invalidMessage="Please provide a valid number for GPA";

}