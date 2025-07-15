function addRow() {
	    const table = document.getElementById("parentTable").getElementsByTagName('tbody')[0];
	    const newRow = table.insertRow();

	    const cell1 = newRow.insertCell();
	    cell1.innerHTML = "<input type='checkbox' />";

	    const cell2 = newRow.insertCell();
	    cell2.innerHTML = "<input type='text' name='categoryIdx' id='categoryIdx' />";

	    const cell3 = newRow.insertCell();
	    cell3.innerHTML = "<input type='text' name='categoryName' id='categoryName' />";

	    const cell4 = newRow.insertCell();
	    cell4.innerHTML = "<input type='text' name='sortOrder' id='sortOrder' />";
	    
	    const cell5 = newRow.insertCell();
	    cell5.innerHTML = "<input type='hidden' value='1' name='depth' id='depth' />";
	    
}