<cfcomponent name="validSSN" extends="_rule" output="false" hint="I test that a value is a valid Social Security Number">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('ssn',arguments.value) />
	</cffunction>
	
</cfcomponent>