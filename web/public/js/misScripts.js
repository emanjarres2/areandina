/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.addEventListener('load', function (){
    
    document.getElementById('btnformularioCrear').addEventListener('click', function (){
            var nombre =  document.getElementById('nombreCrearCampus').value;
            var direccion = document.getElementById('direccionCrearCampus').value;
            var tipo = document.getElementById('tipoCrearCampus').value;
            
            var confirmacion = false;
         
            if(nombre.length > 0 && direccion.length > 0 && tipo.length > 0 ){
             confirmacion = true;
            }
         
            if(confirmacion){
                "<script>Swal.fire('Good job','success','success')</script>";
                document.getElementById('formularioCrear').submit();             
                }else{
             alert('Por favor diligencie todos los campos');
                }
            }       
                    
        );    
    }
);

