function filtrarByNombre() {
	  // Declare variables
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("filtroNombre");
	  filter = input.value.toUpperCase();
	  console.log(filter);
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
}
function filtrarBySeccion() {
	  // Declare variables
	  var input, filter, value, table, tr, td, i, txtValue;
	  input = document.getElementById("filtroSeccion");
	  filter = input.value;
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
}

window.addEventListener('keydown',function(e) {
    if (e.keyIdentifier=='U+000A' || e.keyIdentifier=='Enter' || e.keyCode==13) {
        if (e.target.nodeName=='INPUT' && e.target.type=='text') {
            e.preventDefault();

            return false;
        }
    }
}, true);

function deleteProducto(id){
    if (!confirm('Estas seguro de que quieres eliminar al usuario con id '+id+'?')){ 
    	e.preventDefault();
    } else {
    	window.location.href='DeleteServlet?eliminar='+id;
    }
}