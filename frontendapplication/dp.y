# -*- mode: k8s -*-

apiVersion: v1
kind: Pod
metadata:
  name: webapp
  labels:
    app: webapp
  
spec:
  containers:
  - name: webapp
    image:  ghassent/testdocker:angularfrontapplication1
    
---

apiVersion: v1
kind: Service
metadata:
  name: webapp
  
spec:
  selector:
    app: webapp
    
  ports:
  - name: http
    port: 80
    nodePort: 30020 
  type: NodePort
