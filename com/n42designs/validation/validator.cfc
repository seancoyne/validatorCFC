<cfcomponent name="validator" output="true" displayname="Object Validator" hint="I validate an object based on custom rules as defined in the objects metadata">
	
	<cfset variables.obj = '' />
	<cfset variables.valid = false />
	<cfset variables.messages = arrayNew(1) />
	<!--- Added by A.Greenlee --->
	<cfset variables.invalidFields 	= arrayNew(1) />
	<cfset variables.validFields 	= arrayNew(1) />
	<!--- /Added by A.Greenlee --->

	<cffunction name="init" access="public" output="false" returntype="validator">
		<cfset setObj('') />
		<cfset setValid(false) />
		<cfset setMessages(arrayNew(1)) />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" output="true" returntype="void">
		 <cfargument name="obj" required="false" type="any" />
		 <!--- START: Added by Aaron Greenlee on 2/26/2009 --->
		 <cfargument name="fields" required="false" type="struct" />
		 <!--- END	: Added by Aaron Greenlee on 2/26/2009 --->

		 <!--- assume valid --->
		 <cfset var result = true />
		 <cfset var objMD = '' />
		 <cfset var properties = arrayNew(1) />
		 <cfset var property = '' />
		 <cfset var prop = '' />
		 <cfset var rulesCollection = structNew() />
		 <cfset var rule = '' />
		 <cfset var val = '' />
		 <cfset var skipValidation = false />
		 <cfset var propertyResult = true />
		 <cfset var ruleResult = true />
		 <!--- Start: Added by Aaron Greenlee --->
		 <cfset var formFields 			= structNew() />
		 <cfset var evaulateNameMatch 	= false />
		 <cfset var formFieldMatch 		= false />
		 <!--- End	: Added by Aaron Greenlee --->


		 <cfif isDefined("arguments.obj")>
			 <cfset setObj(arguments.obj) />
		 </cfif>
		 <!--- Start: Added by Aaron Greenlee --->
		 <cfif isDefined("arguments.fields")>
		 	<cfset formFields = arguments.fields />
		 	<cfset evaulateNameMatch = true />
		 </cfif>
		 <!--- End	: Added by Aaron Greenlee --->

		 <!--- load object metadata --->
		 <cfset objMD = getMetaData(getObj()) />
		 <cfloop from="1" to="#arrayLen(objMD.properties)#" index="property">
			<cfif structKeyExists(objMD.properties[property],'rules')>

				<cfset prop = structNew() />
				<cfset prop.name = objMD.properties[property].name />

				<!--- determine if required or not --->
				<cfif structKeyExists(objMD.properties[property],'required')>
					<cfset prop.required = objMD.properties[property].required />
				<cfelse>
					<cfset prop.required = false />
				</cfif>

				<cfset prop.rules = listToArray(objMD.properties[property].rules) />

				<!--- if there is a message, append it.  if not, then create a message like "Property #propertyName# is in error" --->
				<cfif structKeyExists(objMD.properties[property],'invalidMessage') and len(trim(objMD.properties[property].invalidMessage))>
					<cfset prop.msg = objMD.properties[property].invalidMessage />
				<cfelse>
					<cfset prop.msg = 'Property #objMD.properties[property].name# is in error' />
				</cfif>

				<cfset arrayAppend(properties,prop) />

			</cfif>
		 </cfloop>


		 	<!--- determine rules for each property and load rules --->
		 	<!--- run each rule for each property in the object --->

		 <cfloop from="1" to="#arrayLen(properties)#" index="property">
			<cfset propertyResult = true />
			<cfset skipValidation = false />

			<!--- Start	: Added by Aaron Greenlee --->
			<cfif evaulateNameMatch AND (NOT structKeyExists(formFields, properties[property].name) or (structKeyExists(formFields, properties[property].name) and not formFields[properties[property].name]))>
				<cfset skipValidation = false />
				<cfset propertyResult = true />
			<cfelse>
			 <!--- End	: Added by Aaron Greenlee --->
				<cftry>
					<cfinvoke component="#obj#" method="get#properties[property].name#" returnvariable="val" />
					<cfcatch type="any">
						<!--- if it fails here, then the function probably did not return the datatype specified in the getters returntype attribute --->
						<!--- so we fail it  --->
						<cfset skipValidation = true />
					</cfcatch>
				</cftry>
				<cfif not skipValidation>
					<cfloop from="1" to="#arrayLen(properties[property].rules)#" index="rule">
						<cfset ruleResult = true />
						<cfif not structKeyExists(rulesCollection,properties[property].rules[rule])>
							<!--- load rule --->
							<cfset rulesCollection[properties[property].rules[rule]] = loadRule(properties[property].rules[rule]) />
						</cfif>
						<!--- each rule should return a boolean --->
						<cfif not rulesCollection[properties[property].rules[rule]].validate(val)>
							<cfif not properties[property].required>
								<!--- this property is not required --->
								<!--- is there a value? --->
								<cfif isSimpleValue(val)>
									<cfif len(trim(val))>
										<!--- there was a value, so we should mark false even though its not required --->
										<cfset ruleResult = false />
									</cfif>
								<cfelseif isArray(val)>
									<cfif arrayLen(val)>
										<!--- there was a value, so we should mark false even though its not required --->
										<cfset ruleResult = false />
									</cfif>
								<cfelseif isStruct(val)>
									<cfif not structIsEmpty(val)>
										<!--- there was a value, so we should mark false even though its not required --->
										<cfset ruleResult = false />
									</cfif>
								<cfelseif isQuery(val)>
									<cfif val.recordCount>
										<!--- there was a value, so we should mark false even though its not required --->
										<cfset ruleResult = false />
									</cfif>
								<cfelseif isObject(val)>
									<!--- hmm, i dont know if there is a good way to determine that this object has a value --->
									<!--- assume the user knows what they are doing and that if it failed validation its prob a failure --->
									<cfset ruleResult = false />
								<cfelse>
									<!--- we dont know what type this is.  hopefully we never get this far :) --->
									<!--- assume the user knows what they are doing and that if it failed validation its prob a failure --->
									<cfset ruleResult = false />
								</cfif>
							<cfelse>
								<!--- this is required, so if it failed, it failed! --->
								<cfset ruleResult = false />
							</cfif>
						</cfif>

						<cfif not ruleResult>
							<cfset propertyResult = false />
						</cfif>
					</cfloop>
				<cfelse>
					<!--- if we are skipping set the result to false so it is a failure --->
					<cfset propertyResult = false />
				</cfif>

				<!--- only add each message for each property once --->
				<cfif not propertyResult>
					<cfset result = false />
					<!--- Added by A.Greenlee --->
					<cfset addInvalidField( properties[property].name ) />
					<!--- /Added by A.Greenlee --->
					<cfset addMessage(properties[property].msg) />
				<cfelse>
					<cfset addValidField( properties[property].name ) />
				</cfif>
			<!--- Start	: Added by Aaron Greenlee --->
			</cfif>
			<!--- End	: Added by Aaron Greenlee --->
		 </cfloop>

	 	<!--- if the result is invalid, we need to mark this as failed --->
	 	<cfif not result>
		 	<!--- if at the end anything failed, the whole validation process failed so setValid(false) and exit the function --->
		 	<cfset setValid(false) />
	 	<cfelse>
		 	<!--- if not, then its valid so setValid(true) and exit the function --->
		 	<cfset setValid(true) />
	 	</cfif>

	</cffunction>

	<cffunction name="loadRule" access="private" output="false" returntype="any">
		<cfargument name="ruleName" required="true" type="string" />
		<cfreturn createObject('component','rules.' & arguments.ruleName).init() />
	</cffunction>

	<cffunction name="getObj" access="public" output="false" returntype="any">
		<cfreturn variables.obj />
	</cffunction>

	<cffunction name="setObj" access="public" output="false" returntype="void">
		<cfargument name="obj" type="any" required="true" />
		<cfset variables.obj = arguments.obj />
	</cffunction>

	<cffunction name="getValid" access="public" output="false" returntype="boolean">
		<cfif isBoolean(variables.valid)>
			<cfreturn variables.valid />
		<cfelse>
			<cfset setValid(false) />
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="setValid" access="private" output="false" returntype="void">
		<cfargument name="value" type="boolean" required="true" />
		<cfif isBoolean(arguments.value)>
			<cfset variables.valid = arguments.value />
		<cfelse>
			<cfset variables.valid = false />
		</cfif>
	</cffunction>

	<cffunction name="getMessages" access="public" output="false" returntype="array">
		<cfreturn variables.messages />
	</cffunction>

	<cffunction name="setMessages" access="private" output="false" returntype="void">
		<cfargument name="messages" type="array" required="true" />
		<cfset variables.messages = arguments.messages />
	</cffunction>

	<!--- Added by A. Greenlee --->
	<cffunction name="getFields" access="public" output="false" returntype="struct"
	hint="Returns a struct containing true/false flags to illustrate which fields passed/failed validation. Useful for altering the stylesheet when reviewing the form with a user to correct input.">
		<cfset var loopCount = 0 />
		<cfset var strResult = structNew() />
		<cfset var currentField = "" />
		<!--- Process Invalid Fields --->
		<cfif arrayLen(variables.invalidFields)>
			<cfloop from="1" to="#arrayLen(variables.invalidFields)#" step="1" index="loopCount">
				<cfset currentField = variables.invalidFields[loopCount] />
				<cfset strResult[currentField] = false />
			</cfloop>
		</cfif>
		<!--- Process Valid Fields --->
		<cfif arrayLen(variables.validFields)>
			<cfloop from="1" to="#arrayLen(variables.validFields)#" step="1" index="loopCount">
				<cfset currentField = variables.validFields[loopCount] />
				<cfset strResult[currentField] = true />
			</cfloop>
		</cfif>
		<cfreturn strResult />
	</cffunction>

	<cffunction name="addValidField" access="private" output="false" returntype="void">
		<cfargument name="validField" type="string" required="true" />
		<cfset arrayAppend(variables.validFields, arguments.validField) />
	</cffunction>

	<cffunction name="addInvalidField" access="private" output="false" returntype="void">
		<cfargument name="invalidField" type="string" required="true" />
		<cfset arrayAppend(variables.invalidFields, arguments.invalidField) />
	</cffunction>
	<!--- /Added by A. Greenlee --->

	<cffunction name="addMessage" access="private" output="false" returntype="void">
		<cfargument name="message" type="string" required="true" />
		<cfset arrayAppend(variables.messages,arguments.message) />
	</cffunction>

	<cffunction name="setBaseLocation" access="public" returntype="void" output="false">
		<cfargument name="baseLocation" required="true" type="string" />
		<cfset variables.baseLocation = arguments.baseLocation />
	</cffunction>

</cfcomponent>