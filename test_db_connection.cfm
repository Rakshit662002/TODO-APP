<cfquery name="getTasks" datasource="todo_db">
    SELECT id, task, completed
    FROM tasks
    ORDER BY id DESC;
</cfquery>

<h2>Task List</h2>
<cfoutput query="getTasks">
    <p>Task ID: #id# | Task: #task# | Completed: #completed#</p>
</cfoutput>
