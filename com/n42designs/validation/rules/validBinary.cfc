<cfcomponent name="validBinary" extends="_rule" output="false" hint="I test that a value is a valid Binary">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('Binary',arguments.value) />
	</cffunction>
	
</cfcomponent>