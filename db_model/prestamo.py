from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION

from . import clientes

Base= declarative_base()

class Prestamo:
    print("entering prestamo config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    prestamo = Table('prestamo', metadata, autoload=True, autoload_with=engine, schema='cristian')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for prestamo")


    @classmethod
    def todos_los_prestamos(cls):
        query = select([cls.prestamo])
        return query
    
    @classmethod
    def un_prestamo(cls,*, id_prestamo):
        query = select([cls.prestamo]).where(cls.prestamo.c.id_prestamo == id_prestamo)
        return query
    
    @classmethod
    def prestamo_cliente(cls,*, id_cliente):
        j = join(cls.prestamo, clientes.Clientes.clientes, cls.prestamo.c.id_cliente == clientes.Clientes.clientes.c.id_cliente)
        query = select([cls.prestamo]).select_from(j).where(cls.prestamo.c.id_cliente == id_cliente)
        
        return query
    