<cfinclude template="tasks.cfc">
<cfset taskObj = createObject("component", "tasks")>

<!--- Adding CSS for styling --->  
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        text-align: center;
        padding: 20px;
    }
    
    .container {
        width: 400px;
        margin: 50px auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #333;
    }

    label {
        font-weight: bold;
    }

    input[type="text"] {
        width: 90%;
        padding: 8px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        background-color: #28a745;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }

    .message {
        margin-top: 15px;
        font-weight: bold;
        color: #007bff;
    }

    .back-link {
        display: inline-block;
        margin-top: 15px;
        padding: 8px 12px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
    }

    .back-link:hover {
        background-color: #0056b3;
    }
</style>

<!--- Main Container --->  
<div class="container">
    <h2>Add a New Task</h2>

    <form action="add_task.cfm" method="post">
        <label for="task">Task:</label>
        <input type="text" name="task" id="task" required />
        <input type="submit" value="Add Task" />
    </form>

    <!--- Check if the form was submitted --->  
    <cfif structKeyExists(form, "task")>
        <cftry>
            <cfset newTaskId = taskObj.addTask(trim(form.task))>
            
            <!--- Debugging Output --->  
            <cfdump var="#newTaskId#" label="Debug: New Task ID">
            
            <p class="message">Task added successfully! Task ID: <strong>#newTaskId#</strong></p>
        <cfcatch>
            <p class="message" style="color: red;">Error: #cfcatch.message#</p>
        </cfcatch>
        </cftry>
    </cfif>

    <a href="index.cfm" class="back-link">Back to To-Do List</a>
</div>
