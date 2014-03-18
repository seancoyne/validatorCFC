[![Build Status](https://travis-ci.org/framework-one/fw1.png)](https://travis-ci.org/seancoyne/validatorCFC)

# ValidatorCFC
Sean Coyne - [http://www.n42designs.com/](http://www.n42designs.com/)

### Change log:

**Edit:** Aaron Greenlee (http://www.aarongreenlee.com) on 2.26.2009
Validate all values defined by your object's "cfproperty" tag as originally designed, or, selectively validate
by passing a struct with keys matching the name of the cfproperty tag.

**Changes:** When passing a struct to the validate function, validations will only occur if the property name
found in the `<cfproperty>` tag of the object has a matching key in the passed struct.
This allows one to selectively validate fields. This may be useful objects where not all the fields were populated (example: an update).

### Credit

* This was inspired by [this article](http://coldfusion.sys-con.com/read/370835.htm). I tried to design it to be a bit more reusable.
* Thanks to [Aaron Greenlee](http://www.aarongreenlee.com) for some great enhancements
* Travis CI code grabbed from [FW1](https://github.com/framework-one/fw1)

Usage:

This component validates the data in an object according to custom rules you set up.  It is especially created to determine data validity for a data store (DBMS, etc) rather than for business rules, but you can set up your own complex rules.  Some may be out of its scope, however.

Create an instance of this object.  It should not be in any shared scope as its not thread safe. ex: 

```cfml
<cfset validator = createObject('component','com.n42designs.validation.validator').init() />
```

Next take whatever data you want to validate and put it in an object that follows some rules. You must use `<cfproperty>` tags to define what rules, whether it is required or not, and messages to use. You must create getters for each property like `getFirstName()` where FirstName is an example property name. You can specify any number of rules for each property in a comma separated list.  Each rule should be a CFC in the rules subfolder and should extend the _rule.cfc base object.

```cfml
<cfset testObj = createObject('component','testObj') />
<cfset testObj.setFirstName('sean') />
<cfset testObj.setLastName('coyne') />
<cfset testObj.setEmail('coyne.sean@gmail.com') />
<cfset testObj.setDOB('12/26/1981') />
<cfset testObj.setGPA('3.89') />
```

where testObj is a component defined as follows: (yes I know that my setGPA function allows for setting an obviously numeric property with a string value, this is for example only)

```cfml
<cfcomponent name="testObj" output="false">

	<cfproperty name="firstName" required="true" type="string" rules="noZeroLengthString" invalidMessage="Please provide your first name" />
	<cfproperty name="lastName" required="true" type="string" rules="noZeroLengthString" invalidMessage="Please provide your last name" />
	<cfproperty name="email" required="true" type="string" rules="noZeroLengthString,validEmail" invalidMessage="Please provide a valid email address" />
	<cfproperty name="dob" required="true" type="string" rules="validDate" invalidMessage="Please provide a valid date of birth" />
	<cfproperty name="gpa" required="true" type="numeric" rules="validNumber" invalidMessage="Please provide a valid number for GPA" />

	<cfset variables.firstName = '' />
	<cfset variables.lastName = '' />
	<cfset variables.email = '' />
	<cfset variables.dob = '' />
	<cfset variables.gpa = '' />

	<cffunction name="getFirstName" returntype="string" output="false" access="public">
		<cfreturn variables.firstName />
	</cffunction>
	<cffunction name="getLastName" returntype="string" output="false" access="public">
		<cfreturn variables.lastName />
	</cffunction>
	<cffunction name="getEmail" returntype="string" output="false" access="public">
		<cfreturn variables.email />
	</cffunction>
	<cffunction name="getDOB" returntype="string" output="false" access="public">
		<cfreturn variables.dob />
	</cffunction>
	<cffunction name="getGPA" returntype="numeric" output="false" access="public">
		<cfreturn variables.gpa />
	</cffunction>

	<cffunction name="setFirstName" returntype="void" output="false" access="public">
		<cfargument name="firstName" required="true" type="string" />
		<cfset variables.firstName = arguments.firstName />
	</cffunction>
	<cffunction name="setLastName" returntype="void" output="false" access="public">
		<cfargument name="lastName" required="true" type="string" />
		<cfset variables.lastName = arguments.lastName />
	</cffunction>
	<cffunction name="setEmail" returntype="void" output="false" access="public">
		<cfargument name="email" required="true" type="string" />
		<cfset variables.email = arguments.email />
	</cffunction>
	<cffunction name="setDOB" returntype="void" output="false" access="public">
		<cfargument name="DOB" required="true" type="string" />
		<cfset variables.DOB = arguments.DOB />
	</cffunction>
	<cffunction name="setGPA" returntype="void" output="false" access="public">
		<cfargument name="gpa" required="true" type="string" />
		<cfset variables.gpa = arguments.gpa />
	</cffunction>
</cfcomponent>
```

Now pass this object to the validator component validate function to perform the validation to validate all properties defined

```cfml
<cfset validator.validate(testObj) />
```

**OR**

Pass this object to the valuator component validate function along with a struct with keys matching the names defined in your cfproperty tags in your obj to validate only fields outlined in your struct

```cfml
<cfset formFields = structNew() />
<cfset formFields.lastName = true>
<cfset formFields.email = true>
<cfset formFields.dob = true>

<cfset validator.validate(testObj, formFields) />
```

In my applications, I generate this structure using Brian Kotek's FormUtilities

Use the getValid() and getMessages() functions to work with the data.

```cfml
<cfoutput>#validator.getValid()#</cfoutput>
<cfdump var="#validator.getMessages()#" />
```

If you want to reuse this instance run init() function. If you are not going to reuse then this is optional.

```cfml
<cfset validator.init() />
```