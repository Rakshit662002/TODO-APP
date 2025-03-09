<cfcomponent displayname="TaskManager">

    <!--- Fetch all tasks --->  
    <cffunction name="getTasks" access="public" returntype="array">
        <cftry>
            <cfquery name="getTasksQuery" datasource="todo_db">
                SELECT id, task, completed
                FROM tasks
                ORDER BY id DESC
            </cfquery>

            <cfset tasks = []>
            <cfloop query="getTasksQuery">
                <cfset taskStruct = {
                    "id" = getTasksQuery.id,
                    "task" = getTasksQuery.task,
                    "completed" = getTasksQuery.completed
                }>
                <cfset arrayAppend(tasks, taskStruct)>
            </cfloop>

            <cfreturn tasks>

        <cfcatch>
            <cfthrow message="Error fetching tasks: #cfcatch.message#">
        </cfcatch>
        </cftry>
    </cffunction>

    <!--- Add a new task --->  
    <cffunction name="addTask" access="public" returntype="numeric">
        <cfargument name="task" type="string" required="true">

        <cftry>
            <cfquery datasource="todo_db" result="addResult">
                INSERT INTO tasks (task, completed)
                VALUES (
                    <cfqueryparam value="#arguments.task#" cfsqltype="cf_sql_varchar">, 
                    'N'
                )
            </cfquery>

            <!--- Return the newly added task ID --->  
            <cfif structKeyExists(addResult, "GENERATED_KEY")>
                <cfreturn addResult.GENERATED_KEY>
            <cfelse>
                <cfthrow message="Task insertion failed. No ID returned.">
            </cfif>

        <cfcatch>
            <cfthrow message="Error adding task: #cfcatch.message#">
        </cfcatch>
        </cftry>
    </cffunction>

    <!--- Mark task as complete --->  
    <cffunction name="updateTask" access="public" returntype="void">
        <cfargument name="taskId" type="numeric" required="true">

        <cftry>
            <cfquery datasource="todo_db">
                UPDATE tasks
                SET completed = 'Y'
                WHERE id = <cfqueryparam value="#arguments.taskId#" cfsqltype="cf_sql_integer">
            </cfquery>

        <cfcatch>
            <cfthrow message="Error updating task: #cfcatch.message#">
        </cfcatch>
        </cftry>
    </cffunction>

    <!--- Delete a task --->  
    <cffunction name="deleteTask" access="public" returntype="boolean">
        <cfargument name="taskId" type="numeric" required="true">

        <cftry>
            <cfquery datasource="todo_db" result="deleteResult">
                DELETE FROM tasks
                WHERE id = <cfqueryparam value="#arguments.taskId#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfreturn deleteResult.recordcount GT 0>

        <cfcatch>
            <cfthrow message="Error deleting task: #cfcatch.message#">
        </cfcatch>
        </cftry>
    </cffunction>

</cfcomponent>
