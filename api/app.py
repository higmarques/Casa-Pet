from http import HTTPStatus
from json import JSONDecoder
from flask import Flask, Response, request
from flask_sqlalchemy import SQLAlchemy
import mysql.connector
import json
import urllib.parse
import urllib
import jwt
import string
import random
import helper
import datetime
from functools import wraps
from flask import request, jsonify
import jwt
from flask_jwt_extended import JWTManager, jwt_required, create_access_token, decode_token
from flask_migrate import Migrate
from datetime import timedelta
import chardet
import string
from datetime import timedelta
from flask import jsonify, make_response
import requests
import base64
import boto3
from botocore.exceptions import ClientError
import time
import io


# from flask_login import login_user, logout_user
# from app.models import User
# from src.db import mysql
# from src import app
app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

random_string = string.ascii_letters + string.digits+string.ascii_uppercase
key = ''.join(random.choice(random_string) for i in range(12))

usuario = 'root'
senha = '69845315Hig@'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://{}:{}@localhost/casapet'.format(
    urllib.parse.quote_plus(usuario), urllib.parse.quote_plus(senha))
app.config["SECRET_KEY"] = "secret"

s3 = boto3.resource('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
                    aws_secret_access_key="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")
bucket_name = 'casa-pet'

session = boto3.Session(
    aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
    aws_secret_access_key="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")
# app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:@localhost/casapet"

db = SQLAlchemy(app)
Migrate(app, db)
jwt = JWTManager(app)


class Users(db.Model):
    idusers = db.Column(db.Integer, primary_key=True)
    nomeCompleto = db.Column(db.String(50))
    email = db.Column(db.String(100))
    password = db.Column(db.String(100))
    token_id = db.Column(db.String(200))

    def to_json(self):
        return {"idusers": self.idusers, "nomeCompleto": self.nomeCompleto, "email": self.email, "password": self.password, "token_id": self.token_id}

    def __repr__(self):
        return f"Usuário: {self.nomeCompleto}"


class Pets(db.Model):
    idpets = db.Column(db.Integer, primary_key=True)
    NomePet = db.Column(db.String(100))
    Porte = db.Column(db.String(100))
    Localizacao = db.Column(db.String(100))
    Raca = db.Column(db.String(50))
    Sexo = db.Column(db.String(50))
    Descricao = db.Column(db.String(250))
    Castrado = db.Column(db.String(50))
    Imagens = db.Column(db.String(200))
    Tipo = db.Column(db.String(100))
    fk_idusers = db.Column(db.Integer, db.ForeignKey('users.idusers'))

    def to_json(self):
        return {"idpets": self.idpets, "NomePet": self.NomePet, "Porte": self.Porte, "Tipo": self.Tipo,
                "Localizacao": self.Localizacao, "Raca": self.Raca, "Sexo": self.Sexo,
                "Descricao": self.Descricao, "Castrado": self.Castrado, "Imagens": self.Imagens}


class Token(db.Model):
    idpets = db.Column(db.Integer, primary_key=True)
    NomePet = db.Column(db.String(100))
    Porte = db.Column(db.String(100))


# Selecionar Todos os Pets
@app.route("/pets", methods=["GET"])
def seleciona_usuarios():
    usuarios_objetos = Pets.query.all()
    pets_json = [pets.to_json() for pets in usuarios_objetos]

    return gera_response(200, "pets", pets_json, "todos os pets cadastrados no app")

# Selecionar Individual


@app.route("/usuario/<idusers>", methods=["GET"])
def seleciona_usuario(idusers):
    usuario_objeto = Users.query.filter_by(idusers=idusers).first()
    usuario_json = usuario_objeto.to_json()

    return gera_response(200, "usuario", usuario_json, "usuarios cadastrado no app")

# Cadastrar Usuário


@app.route("/cadastroUsuario", methods=["POST"])
def cria_usuario():
    body = request.get_json()
    email = body["email"]
    access_token = create_access_token(identity=email)

    try:
        usuario = Users(
            nomeCompleto=body["nomeCompleto"], email=body["email"], password=body["password"], token_id=access_token)
        db.session.commit()
        db.session.add(usuario)
        db.session.commit()
        return gera_response(201, "usuario", usuario.to_json(), "Criado com sucesso")
    except Exception as e:
        print('Erro', e)
        return gera_response(400, "usuario", {}, "Erro ao cadastrar")

# Cadastro Pets


@app.route("/cadastroPet", methods=["POST"])
def cria_pet():
    body = request.get_json()
    token = body["Token"]
    usuario = Users.query.filter_by(
        token_id=token).first()
    id_usuario_token = usuario.idusers

    file_name = body["Dados"]
    object_name = "TESTE" + "." + body["Formato"]
    bucket_name = 'casa-pet'
    s3_client = boto3.client('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
                             aws_secret_access_key="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")

    image_base64 = body["Dados"]
    file_name_with_extension = body["NomePet"] + ".jpeg"

    s3 = boto3.resource('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
                        aws_secret_access_key="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")
    obj = s3.Object(bucket_name, file_name_with_extension)
    obj.put(Body=base64.b64decode(image_base64))

    image = str(base64.b64decode(image_base64))
    s3_client = boto3.client('s3')
    # obj = s3.Object(bucket_name, file_name_with_extension)
    # obj.put(Body=base64.b64decode(image_base64))

    # s3_client.upload_file(image, bucket, file_name_with_extension,
    #                       ExtraArgs={'ACL': 'public-read'}, Callback=None, Config=None)
    # s3_client.upload_file(
    #     file_name, bucket, file_name_with_extension,
    #     ExtraArgs={'ACL': 'public-read'})

    # s3 = boto3.client('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
    #   aws_secret_access_key="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")
    # file_name = body["Dados"]

    # s3_client.upload_fileobj(file_name, bucket, object_name)
    # s3.upload_file(file_name, bucket, object_name)
    s3 = boto3.client('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
                      aws_secret_access_key="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")
    image_url = s3.generate_presigned_url('get_object', Params={'Bucket': bucket_name, 'Key': file_name_with_extension},
                                          )

    # print(image_url)

    # pegar token do body
    # fazer querry pra pegar usuario com o token acima
    # criar variavel com o id primario do objeto acima

    try:
        pets = Pets(
            NomePet=body["NomePet"], Porte=body["Porte"], Localizacao=body["Localizacao"],
            Raca=body["Raca"], Sexo=body["Sexo"], Descricao=body["Descricao"],
            Castrado=body["Castrado"], Imagens=image_url, Tipo=body["Tipo"], fk_idusers=id_usuario_token)
        db.session.add(pets)
        db.session.commit()
        return gera_response(201, "pets", pets.to_json(), "Criado com sucesso")
    except Exception as e:
        print('Erro', e)
        return gera_response(400, "usuario", {}, "Erro ao cadastrar")

# Validação Login


@app.route('/login', methods=['POST'])
def login():
    body = request.get_json()
    email = body['email']
    password = body['password']
    usuario_objeto = Users.query.filter_by(
        email=email, password=password).first()

    if (usuario_objeto):

        access_token = create_access_token(identity=email)

        usuario_objeto.token_id = access_token
        db.session.commit()

        # return gera_response(200, "usuario", access_token.to_json(), "Atualizado com sucesso")
        return jsonify(access_token=access_token)
        # return make_response(jsonify(access_token), 200)

    else:
        return gera_response_vazio(401)

# Atualizar Cadastro Usuário


@ app.route("/usuario/<idusers>", methods=["PUT"])
def atualiza_usuario(idusers):
    usuario_objeto = Users.query.filter_by(idusers=idusers).first()
    body = request.get_json()

    try:
        if ('nomeCompleto' in body):
            usuario_objeto.nomeCompleto = body['nomeCompleto']
        if ('email' in body):
            usuario_objeto.email = body['email']

        db.session.add(usuario_objeto)
        db.session.commit()
        return gera_response(200, "usuario", usuario_objeto.to_json(), "Atualizado com sucesso")
    except Exception as e:
        print('Erro', e)
        return gera_response(400, "usuario", {}, "Erro ao atualizar")

# Deletar


@ app.route("/usuario/<idusers>", methods=["DELETE"])
def deleta_usuario(idusers):
    usuario_objeto = Users.query.filter_by(idusers=idusers).first()

    try:
        db.session.delete(usuario_objeto)
        db.session.commit()
        return gera_response(200, "usuario", usuario_objeto.to_json(), "Deletado com sucesso")
    except Exception as e:
        print('Erro', e)
        return gera_response(400, "usuario", {}, "Erro ao deletar")


def gera_response(status, nome_do_conteudo, conteudo, mensagem=False):
    body = {}
    body[nome_do_conteudo] = conteudo

    if (mensagem):
        body["mensagem"] = mensagem

    return Response(json.dumps(body), status=status, mimetype="application/json")


def gera_response_vazio(status):
    return Response(status=status, mimetype="application/json")


@ app.route("/foto", methods=["GET"])
def lambda_handler():
    body = request.get_json()
    image_base64 = body["foto"]
    file_name_with_extension = body["nome_do_arquivo"]
    obj = s3.Object(bucket_name, file_name_with_extension)
    obj.put(Body=base64.b64decode(image_base64))


def create_presigned_url(bucket_name, object_name):
    s3_client = boto3.client('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
                             aws_secret_access_key="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")
    bucket_name = 'casa-pet'
    object_name = 'testehl.jpeg'

    response = s3_client.generate_presigned_url('get_object',
                                                Params={'Bucket': 'casa-pet',
                                                        'Key': 'testehl.jpeg'})

    # The response contains the presigned URL
    return response

    # # get bucket location
    # location = boto3.client('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
    #                       aws_secret_access_key="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").get_bucket_location(
    #  Bucket=bucket_name)['LocationConstraint']
    # response = s3_client.get_bucket_location(
    # Bucket = bucket_name)
    # response = s3.Object(bucket_name, "testehl.jpeg")
    # print(response)
    # # print(response)
    # # # get object url
    # object_url = "https://%s.s3.us-east-1.amazonaws.com/%s" % (
    #     bucket_name, file_name_with_extension)
    # print(object_url)
    # # Get Object

    # response = s3_client.download_file(bucket_name, "klee.png", "klee.png")
    # response = s3_client.get_object(Bucket=bucket_name, Key="klee.png")
    # print(response)
    # return gera_response_vazio(200)


app.run(host="192.168.15.14")
