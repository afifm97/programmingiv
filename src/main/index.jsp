<html>
<style>
    body {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }
    form {
        display: flex;
        flex-direction: column;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    label, input {
        margin: 5px 0;
    }

    /* Center the submit button */
    input[type="submit"] {
        margin-top: 10px;
        align-items: center;
    }

</style>
<body>
<h2>Screen</h2>

<form action="resources/Index" method="post">

    <div>
        <label for="icnum">New IC Number   :</label>
        <input type="text" id="icnum" name="icnum" placeholder="971215" maxlength="6" required>
    </div>
    <div>
        <label for="gender">Gender         :</label>
        <select id="gender" name="gender">
            <option value="male">M</option>
            <option value="female">F</option>
        </select>
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob">
    </div>
    <div>
        <label for="postcode">Postcode     :</label>
        <input type="text" id="postcode" name="postcode" placeholder="68000" maxlength="5" required>
        <label for="town">Town:</label>
        <input type="text" id="town" name="town">
    </div>
    <button type="submit" id="index" value="Save">Save</button>
</form>

</body>
</html>
