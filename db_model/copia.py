from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION

from . import libros

Base= declarative_base()

class Copia:
    print("entering prestamo copia")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    copia = Table('copia', metadata, autoload=True, autoload_with=engine, schema='cristian')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for copia")


    @classmethod
    def todos_las_copias(cls):
        query = select([cls.copia])
        return query
    
    @classmethod
    def una_copia(cls,*, id_copia):
        query = select([cls.copia]).where(cls.copia.c.id_copia == id_copia)
        return query
    
    @classmethod
    def libro_copia(cls,id_libro):
        j = join(cls.copia, libros.Libros.libros, cls.copia.c.id_libro == libros.Libros.libros.c.id_libro)
        query = select([cls.copia]).select_from(j).where(cls.copia.c.id_libro == id_libro)
        
        return query