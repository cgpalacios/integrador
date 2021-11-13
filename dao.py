import sys
import os
dirname = os.path.dirname(__file__)
 
sys.path.append(dirname)
sys.path.append(dirname+"/db_model/")
from sqlalchemy import create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION
from datetime import datetime

from db_model.autor import Autor
from db_model.clientes import Clientes
from db_model.libros import Libros
from db_model.prestamo import Prestamo
from db_model.copia import Copia
from db_model.copia_por_prestamo import Copia_por_prestamo

class Biblioteca:
    print("iniciando")
    engine = create_engine(BBDD_CONNECTION)
    connection = engine.connect()
    print("finalizando")
    metadata = MetaData()
    
    #Autores
    #/-------------------------------------------------------------------------------------------/
    

    
    def get_autores(self,*,id_autor=None):
        if id_autor is None:
            query = Autor.get_autores()
        else:
            query = Autor.get_autor(id_autor=id_autor)            
        
        return self.connection.execute(query).fetchall()
            
    
    def get_clientes(self,*,id_cliente=None):
        if id_cliente is None:
            query = Clientes.todos_los_clientes()
        else:
            query = Clientes.un_cliente(id_cliente=id_cliente)            
        
        return self.connection.execute(query).fetchall()
    
    def get_libros(self,*,id_libro=None):
        if id_libro is None:
            query = Libros.todos_los_libros()
        else:
            query = Libros.un_libro(id_libro=id_libro)            
        
        return self.connection.execute(query).fetchall()
    
    
    def get_prestamos(self,*,id_prestamo=None):
        if id_prestamo is None:
            query = Prestamo.todos_los_prestamos()
        else:
            query = Prestamo.un_prestamo(id_prestamo=id_prestamo)            
        
        return self.connection.execute(query).fetchall()    
    
    
    def get_copias(self,*,id_copia=None):
        if id_copia is None:
            query = Copia.todos_las_copias()
        else:
            query = Copia.una_copia(id_copia=id_copia)            
        
        return self.connection.execute(query).fetchall()    

    
    def get_copias_por_prestamos(self,*,id_prestamo=None):
        if id_prestamo is None:
            query = Copia_por_prestamo.todos_las_copias_por_prestamo()
        else:
            query = Copia_por_prestamo.copias_por_prestamo(id_prestamo=id_prestamo)            
        
        return self.connection.execute(query).fetchall()
    
    
    def get_autor_y_libro(self,*,id_autor):
        query = Libros.autor_libro(id_autor)
        return self.connection.execute(query).fetchall()
    
    
    def get_libro_y_copia(self,*,id_libro):
        query = Copia.libro_copia(id_libro)
        return self.connection.execute(query).fetchall()
    
    
    def get_cliente_y_prestamo(self,*,id_cliente):
        query = Prestamo.prestamo_cliente(id_cliente=id_cliente)
        return self.connection.execute(query).fetchall()
        