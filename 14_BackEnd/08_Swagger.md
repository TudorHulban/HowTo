### Swagger Setup
#### Using Docker Image
```sh
docker pull swaggerapi/swagger-editor
docker run -p 80:8080 swaggerapi/swagger-editor
```
#### Using node
```sh
npm install -g http-server
git clone https://github.com/swagger-api/swagger-editor.git
http-server -p 8080 swagger-editor
```
### Example file
```yaml
openapi: 3.0.0
info:
  title: Sample API
  description: Minimal example.
  version: 0.1.0
servers:
  - url: http://api.inventory.com/v1
    description: Inventory Microservice.
paths:
  /warehouses/{warehouseID}:
    get:
      summary: Returns inventory from passed warehouse ID.
      description: Returns a list of inventory items belonging to warehouse ID passed as parameter.
      parameters:
       - name: warehouseID
         in: path
         required: true
         description: Numeric ID of the warehouse to get inventory from.
         schema:
           type: integer
           format: int64
           minimum: 1
      responses:
        '200':    # status code
          description: A JSON array of warehouses names
          content:
            application/json:
              schema: 
                type: array
                items: 
                  type: string
```
#### Resources
```html
https://swagger.io/docs/specification/basic-structure/
```

