<cfcomponent name="MustBeYOrN" extends="_rule" output="false" hint="I test that a value is either 'Y' or 'N'">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isSimpleValue(arguments.value) and (arguments.value eq 'Y' or arguments.value eq 'N') />
	</cffunction>
	
</cfcomponent>