<cfcomponent name="validZipCode" extends="_rule" output="false" hint="I test that a value is a valid Zip Code">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('ZipCode',arguments.value) />
	</cffunction>
	
</cfcomponent>