<cfcomponent output="false">
	
	<cfset this.name = "ValidatorCFCTests" />
	<cfset this.sessionManagement = true />
	<cfset this.applicationTimeout = createTimeSpan(0,1,0,0) />
	<cfset this.sessionTimeout = createTimeSpan(0,0,20,0) />
	<cfset this.mappings = {} />
	<cfset this.mappings["/com"] = expandPath("../com") />
	
</cfcomponent>