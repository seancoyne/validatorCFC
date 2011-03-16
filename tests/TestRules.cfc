<cfcomponent output="false" extends="mxunit.framework.TestCase">
	
	<!--- Unit test for all built in rules --->
	
	<!--- MustByYOrN --->
	
	<cffunction name="mustBeYOrN_Y" access="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.MustBeYOrN" ) />
		<cfset assertTrue(rule.validate("Y")) />
	</cffunction>
	
	<cffunction name="mustBeYOrN_N" access="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.MustBeYOrN") />
		<cfset assertTrue(rule.validate("N")) />
	</cffunction>
	
	<cffunction name="mustBeYOrN_Fail" access="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.MustBeYOrN") />
		<cfset assertFalse(rule.validate("This is not Y or N")) />
	</cffunction>
	
	<!--- noEmptyArray --->
	
	<cffunction name="noEmptyArray_pass" access="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.noEmptyArray") />
		<cfset assertTrue(rule.validate([1,2,3])) />
	</cffunction>
	
	<cffunction name="noEmptyArray_fail_emptyArray" access="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.noEmptyArray") />
		<cfset assertFalse(rule.validate([])) />
	</cffunction>
	
	<cffunction name="noEmptyArray_fail_nonArray" access="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.noEmptyArray") />
		<cfset assertFalse(rule.validate("This is not an array")) />
	</cffunction>
	
	<!--- noZeroLengthString --->
		
	<cffunction name="noZeroLengthString_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.noZeroLengthString") />
		<cfset assertTrue(rule.validate("This should pass")) />
	</cffunction>
	
	<cffunction name="noZeroLengthString_fail_zeroLengthString" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.noZeroLengthString") />
		<cfset assertFalse(rule.validate("")) />
	</cffunction>
	
	<cffunction name="noZeroLengthString_fail_nonString" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.noZeroLengthString") />
		<cfset assertFalse(rule.validate([1,2,3])) />
	</cffunction>
	
	<!--- valid array --->
	
	<cffunction name="validArray_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validArray") />
		<cfset assertTrue(rule.validate([1,2,3])) />
	</cffunction>
	
	<cffunction name="validArray_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validArray") />
		<cfset assertFalse(rule.validate("this is not an array")) />
	</cffunction>
	
	<!--- valid binary --->
	
	<cffunction name="validBinary_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validBinary") />
		<cfset assertTrue(rule.validate(toBinary(toBase64("This is my value")))) />
	</cffunction>
	
	<cffunction name="validBinary_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validBinary") />
		<cfset assertFalse(rule.validate("this is not binary")) />
	</cffunction>
	
	<!--- valid bool --->
	
	<cffunction name="validBool_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validBool") />
		<cfset assertTrue(rule.validate(true) and rule.validate(false)) />
	</cffunction>
	
	<cffunction name="validBool_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validBool") />
		<cfset assertFalse(rule.validate("this is not a boolean")) />
	</cffunction>
	
	<!--- valid credit card --->
	
	<cffunction name="validCreditCard_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validCreditCard") />
		<cfset assertTrue(rule.validate("4111111111111111") and rule.validate("4111-1111-1111-1111")) />
	</cffunction>
	
	<cffunction name="validCreditCard_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validCreditCard") />
		<cfset assertFalse(rule.validate("this is not a credit card number")) />
	</cffunction>
	
	<!--- valid date --->
	
	<cffunction name="validDate_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validDate") />
		<cfset assertTrue(
			rule.validate("2010-10-01") and 
			rule.validate("10-01-2010") and 
			rule.validate("10/01/2010") and 
			rule.validate(createDate(2010,10,1))
		) />
	</cffunction>
	
	<cffunction name="validDate_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validDate") />
		<cfset assertFalse(rule.validate("this is not a date")) />
	</cffunction>
	
	<!--- valid email --->
		
	<cffunction name="validEmail_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validEmail") />
		<cfset assertTrue(rule.validate("test@test.com")) />
	</cffunction>
	
	<cffunction name="validEmail_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validEmail") />
		<cfset assertFalse(rule.validate("this is not an email address")) />
	</cffunction>
	
	<!--- valid Euro Date --->
		
	<cffunction name="validEuroDate_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validEuroDate") />
		<cfset assertTrue(
			rule.validate("01/01/2010") and 
			rule.validate("31/12/2010") and
			rule.validate("31 Dec 2010")
		) />
	</cffunction>
	
	<cffunction name="validEuroDate_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validEuroDate") />
		<cfset assertFalse(rule.validate("this is not a Euro date")) />
	</cffunction>
	
	<!--- valid float --->
		
	<cffunction name="validFloat_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validFloat") />
		<cfset assertTrue(
			rule.validate("1") and 
			rule.validate("1.2") and
			rule.validate("0.43948")
		) />
	</cffunction>
	
	<cffunction name="validFloat_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validFloat") />
		<cfset assertFalse(rule.validate("this is not a float")) />
	</cffunction>
	
	<!--- valid guid --->
		
	<cffunction name="validGUID_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validGUID") />
		<cfset assertTrue(rule.validate("21EC2020-3AEA-1069-A2DD-08002B30309D")) />
	</cffunction>
	
	<cffunction name="validGUID_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validGUID") />
		<cfset assertFalse(rule.validate("this is not a GUID")) />
	</cffunction>
	
	<!--- valid image --->
		
	<cffunction name="validImage_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validImage") />
		<cfset var img = ImageNew("sampleImage.png") />
		<cfset assertTrue(rule.validate(img)) />
	</cffunction>
	
	<cffunction name="validImage_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validImage") />
		<cfset assertFalse(rule.validate("this is not an image")) />
	</cffunction>
	
	<!--- valid int --->
		
	<cffunction name="validInt_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validInt") />
		<cfset assertTrue(rule.validate(1)) />
	</cffunction>
	
	<cffunction name="validInt_fail_float" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validInt") />
		<cfset assertFalse(rule.validate(1.2)) />
	</cffunction>
	
	<cffunction name="validInt_fail_string" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validInt") />
		<cfset assertFalse(rule.validate("this is not an integer")) />
	</cffunction>
	
	<!--- valid Number --->
		
	<cffunction name="validNumber_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validNumber") />
		<cfset assertTrue(rule.validate(1) and rule.validate(1.2) and rule.validate(0)) />
	</cffunction>
	
	<cffunction name="validNumber_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validNumber") />
		<cfset assertFalse(rule.validate("this is not a number")) />
	</cffunction>
	
	<!--- valid Query --->
		
	<cffunction name="validQuery_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validQuery") />
		<cfset assertTrue(rule.validate(QueryNew("test"))) />
	</cffunction>
	
	<cffunction name="validQuery_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validQuery") />
		<cfset assertFalse(rule.validate("this is not a query")) />
	</cffunction>
	
	<!--- valid SSN --->
		
	<cffunction name="validSSN_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validSSN") />
		<cfset assertTrue(rule.validate("123-45-6789")) />
	</cffunction>
	
	<cffunction name="validSSN_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validSSN") />
		<cfset assertFalse(rule.validate("this is not an SSN")) />
	</cffunction>
	
	<!--- valid Struct --->
		
	<cffunction name="validStruct_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validStruct") />
		<cfset assertTrue(rule.validate({}) and rule.validate(structNew()) and rule.validate({ test = "test", test2 = "test2"})) />
	</cffunction>
	
	<cffunction name="validStruct_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validStruct") />
		<cfset assertFalse(rule.validate("this is not a struct")) />
	</cffunction>
	
	<!--- valid time --->
		
	<cffunction name="validTime_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validTime") />
		<cfset assertTrue(
			rule.validate("11:00 AM") and 
			rule.validate("23:23") and
			rule.validate("12:00PM") and
			rule.validate("01/01/2011 11:00 AM")
		) />
	</cffunction>
	
	<cffunction name="validTime_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validTime") />
		<cfset assertFalse(rule.validate("this is not a time")) />
	</cffunction>
	
	<!--- valid URL --->
		
	<cffunction name="validURL_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validURL") />
		<cfset assertTrue(rule.validate("http://www.google.com")) />
	</cffunction>
	
	<cffunction name="validURL_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validURL") />
		<cfset assertFalse(rule.validate("this is not a URL")) />
	</cffunction>
	
	<!--- valid US date --->
	
	<cffunction name="validUSDate_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validUSDate") />
		<cfset assertTrue(
			rule.validate("10/01/2010") and
			rule.validate("1/1/2010") and
			rule.validate("10-10-2010")
		) />
	</cffunction>
	
	<cffunction name="validUSDate_fail_wrongformat" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validUSDate") />
		<cfset assertFalse(rule.validate("October 10, 2010")) />
	</cffunction>
	
	<cffunction name="validUSDate_fail_cfdateobj" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validUSDate") />
		<cfset assertFalse(rule.validate(createDate(2010,10,10))) />
	</cffunction>
	
	<cffunction name="validUSDate_fail_eurodate" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validUSDate") />
		<cfset assertFalse(rule.validate("31/12/2010")) />
	</cffunction>
	
	<cffunction name="validUSDate_fail_nondate" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validUSDate") />
		<cfset assertFalse(rule.validate("this is not a US date")) />
	</cffunction>
	
	<!--- valid UUID --->
		
	<cffunction name="validUUID_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validUUID") />
		<cfset assertTrue(rule.validate(createUUID())) />
	</cffunction>
	
	<cffunction name="validUUID_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validUUID") />
		<cfset assertFalse(rule.validate("this is not a UUID")) />
	</cffunction>
	
	<!--- valid XML --->
		
	<cffunction name="validXML_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validXML") />
		<cfset var xmlStr = "<root><test /></root>" />
		<cfset var xmlObj = xmlParse(xmlStr) /> 
		<cfset assertTrue(
			rule.validate(xmlStr) and
			rule.validate(xmlObj)
		) />
	</cffunction>
	
	<cffunction name="validXML_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validXML") />
		<cfset assertFalse(rule.validate("this is not xml")) />
	</cffunction>
	
	<!--- valid Zip Code --->
		
	<cffunction name="validZipCode_pass" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validZipCode") />
		<cfset assertTrue(rule.validate("06108") and rule.validate("06108-1528")) />
	</cffunction>
	
	<cffunction name="validZipCode_fail" acccess="public" output="false" returntype="void">
		<cfset var rule = createObject("component","com.n42designs.validation.rules.validZipCode") />
		<cfset assertFalse(rule.validate("this is not a zip code")) />
	</cffunction>
	
</cfcomponent>