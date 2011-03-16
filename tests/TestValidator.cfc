<cfcomponent extends="mxunit.framework.TestCase">
	
	<cffunction name="beforeTests" access="public" output="false" returntype="void">
		<cfset variables.validator = createObject("component","com.n42designs.validation.validator") />
		<cfset variables.testObj = createObject("component","sampleObj") />
	</cffunction>
	
	<cffunction name="setUp" access="public" output="false" returntype="void">
		<cfset validator.init() />
		<cfset resetTestObj() />
	</cffunction>
	
	<cffunction name="resetTestObj" access="private" output="false" returntype="void">
		<cfset testObj.setFirstName("Sean") />
		<cfset testObj.setLastName("Coyne") />
		<cfset testObj.setEmail("test@test.com") />
		<cfset testObj.setDOB("12/16/1981") />
		<cfset testObj.setGPA(3.89) />
	</cffunction>
	
	<cffunction name="testValidCase" access="public" output="false" returntype="void">
		<cfset validator.validate(testObj) />
		<cfset assertTrue(validator.getValid()) />
	</cffunction>
	
	<cffunction name="testFields" access="public" output="false" returntype="void">
		<cfset var fields = { 
			firstname = false,
			lastname = true,
			email = true,
			dob = false,
			gpa = true 
		} />
		<cfset testObj.setFirstName("") />
		<cfset validator.validate(testObj,fields) />
		<cfset assertTrue(validator.getValid()) />
	</cffunction>
	
	<cffunction name="testInvalidCase" access="public" output="false" returntype="void">
		<cfset testObj.setFirstName('') />
		<cfset testObj.setLastName('') />
		<cfset testObj.setEmail('ThisIsNotAnEmail') />
		<cfset testObj.setDOB('ThisIsNotADate') />
		<cfset testObj.setGPA('test') /> 
		<cfset validator.validate(testObj) />
		<cfset assertTrue(validator.getValid() is false and arraylen(validator.getMessages()) eq 5) />
	</cffunction>
	
</cfcomponent>