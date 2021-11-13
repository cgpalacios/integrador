from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION


Base= declarative_base()

class Autor:
    print("entering autor config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    Session = sessionmaker(bind=engine)
    session = Session()
    autor = Table('autor', metadata, autoload=True, autoload_with=engine, schema='cristian')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for autor")


    @classmethod
    def get_autores(cls):
        query = select([cls.autor])
        return query
    
    @classmethod
    def get_autor(cls,*, id_autor):
        query = select([cls.autor]).where(cls.autor.c.id_autor == id_autor)
        return query