from flask import Flask, request, Response
import random

app = Flask(__name__)

status = 0

@app.route('/', methods=['GET'])
def handle_all_get():
    command = request.args.get('command')
    data = request.args.get('data')
    global status 

    if command == 'on':
        print("GET with command=on")
        status = 1
        return Response(str(status), mimetype='text/plain')
    elif command == 'off':
        print("GET with command=status")
        status = 0
        return Response(str(status), mimetype='text/plain')
    elif data == 'status':				#ask the TCP port for the status
        print("GET with command=status")
        return Response(str(status)+"," + str(random.randint(0, 359))+","+str(random.randint(0, 20)), mimetype='text/plain')
    elif data == 'speed':                           #ask the TCP port for the status
        print("GET with command=speed") #staus,speed,HDG,tws
        return Response(str(status)+"," + str(round(random.uniform(0, 20), 1))+","+str(random.randint(0, 359))+","+str(round(random.uniform(0, 20), 1)), mimetype='text/plain')
    elif data == 'wind':                           #ask the TCP port for the status
        print("GET with command=wind") #staus,TWS,TWA,SPD
        return Response(str(status)+"," + str(round(random.uniform(0, 20), 1))+","+str(random.randint(0, 359))+","+str(round(random.uniform(0, 20), 1)), mimetype='text/plain')
    elif data == 'engine':                           #ask the TCP port for the status
        print("GET with command=engine") #staus,cool,aux,exost
        return Response(str(status)+"," + str(round(random.uniform(0, 80), 1))+","+str(round(random.uniform(0, 80), 1))+","+str(round(random.uniform(0, 80), 1)), mimetype='text/plain')
    elif data == 'water':                           #ask the TCP port for the status
        print("GET with command=water")
        return Response(str(status)+"," + str(random.randint(0, 100)), mimetype='text/plain')
    else:
        print("GET without recognized command")
        return Response('ping!', mimetype='text/plain')

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5500, debug=True)

