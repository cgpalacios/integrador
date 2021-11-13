from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION


Base= declarative_base()

class Copia_por_prestamo:
    print("entering copia_por_prestamo config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    copia_por_prestamo = Table('copia_por_prestamo', metadata, autoload=True, autoload_with=engine, schema='cristian')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for copia_por_prestamo")


    @classmethod
    def todos_las_copias_por_prestamo(cls):
        query = select([cls.copia_por_prestamo])
        return query
    
    @classmethod
    def copias_por_prestamo(cls,*, id_prestamo):
        query = select([cls.copia_por_prestamo]).where(cls.copia_por_prestamo.c.id_prestamo == id_prestamo)
        return query