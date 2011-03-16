<cfcomponent name="validXML" extends="_rule" output="false" hint="I test that a value is valid XML">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isXML(arguments.value) />
	</cffunction>
	
</cfcomponent>