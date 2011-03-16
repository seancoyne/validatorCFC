<cfcomponent name="validBool" extends="_rule" output="false" hint="I test that a value is a valid boolean">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isBoolean(arguments.value) />
	</cffunction>
	
</cfcomponent>