from flask import Flask, jsonify, request
import urllib.request, urllib.parse, urllib.error
import json

app=Flask(__name__)

@app.route("/api",methods=['GET'])
class Data:
    def __inti__(self, gstn, address, addPlace, statejur, corjur, taxtype, constBuis, startdate, enddate):
        self.gstIN= gstn
        self.primaryAddress= address
        self.additionalAddress= addPlace
        self.stateJurisdiction= statejur
        self.corrJurisdiction= corjur
        self.taxPayerType= taxtype
        self.buissnessCondition= constBuis
        self.registerationDate= startdate
        self.canellationDate= enddate

def index():
    # jsondata={}
    # jsondata['result']= str(request.args['query'])
    # print(jsondata)
    # return jsondata
    qry_str=request.args['query']
    print('query GSTIN',qry_str)
    temp_ls=[]
    temp_ls=qry_str.split(' ')
    
    #return qry_str
    loadedData=giveDummyData(qry_str)
    print(loadedData)
    return loadedData

def giveDummyData(query):
    base_url='https://content.guardianapis.com/search?q='+ query +'&api-key=56053666-9614-43e9-b99f-fbdabb55c3e4'
    response=urllib.request.urlopen(base_url)
    data = response.read().decode()
    json_res=json.loads(data)
    print(str(json_res['response']['results'][0]))
    return str(json_res['response']['results'][0])

if __name__ == '__main___':
    app.run()