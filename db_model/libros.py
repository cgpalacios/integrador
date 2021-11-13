from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION

from . import autor

Base= declarative_base()

class Libros:
    print("entering libros config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    libros = Table('libros', metadata, autoload=True, autoload_with=engine, schema='cristian')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for libros")


    @classmethod
    def todos_los_libros(cls):
        query = select([cls.libros])
        return query
    
    @classmethod
    def un_libro(cls,*, id_libro):
        query = select([cls.libros]).where(cls.libros.c.id_libro == id_libro)
        return query
    
    
    @classmethod
    def autor_libro(cls,id_autor):
        j = join(cls.libros, autor.Autor.autor, cls.libros.c.id_autor == autor.Autor.autor.c.id_autor)
        query = select([cls.libros]).select_from(j).where(cls.libros.c.id_autor == id_autor)
        
        return query
    