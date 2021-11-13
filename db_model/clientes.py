from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION


Base= declarative_base()

class Clientes:
    print("entering clientes config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    clientes = Table('clientes', metadata, autoload=True, autoload_with=engine, schema='cristian')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for clientes")


    @classmethod
    def todos_los_clientes(cls):
        query = select([cls.clientes])
        return query
    
    @classmethod
    def un_cliente(cls,*, id_cliente):
        query = select([cls.clientes]).where(cls.clientes.c.id_cliente == id_cliente)
        return query