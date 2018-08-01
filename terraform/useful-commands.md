apt-get install -y stress
stress --cpu 2 --timeout 366s

docker run -d --name this_socks_catalog_database --volume="/database/pgdata:/var/lib/postgresql/data" joaomanoel/this_socks_catalog_backend

docker run -d -p 2003:2003 joaomanoel/this_socks_catalog_backend

docker run -d \
--name=registrator \
--net=host \
--volume=/var/run/docker.sock:/tmp/docker.sock \
gliderlabs/registrator:latest \
   -cleanup=true consul://localhost:8500

docker run -d \
-p 3376:3376 \
swarm manage \
--host tcp://0.0.0.0:3376 \
--strategy spread \
--advertise $PRIVATE_IP2:3376 \
consul://localhost:8500

sudo docker run -d -p 4000:4000 swarm manage -H :4000 --replication --advertise 172.31.6.217:4000 consul://172.31.4.41:8500

sudo docker run -d swarm join --advertise=172.31.8.199:2375 consul://172.31.4.41:8500

sudo docker run -d -p 8400:8400 -p 8500:8500 -p 8600:53/udp --name node4 -h node4 progrium/consul -join 172.31.4.41

ssh -i public.pem -N -f -L 8500:localhost:8500 ubuntu@18.231.42.28

############################################################
CATALOG

curl -i --header "Content-Type: application/json" --request POST --data

curl http://localhost/this_socks_catalog_backend/api/v1/category/all

curl http://localhost/this_socks_catalog_backend/api/v1/category/byGenre

######################################################################################################################################################################################
CLIENT

curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"email": "jmanoel@x.com", "password": "123456"}' \
http://localhost/this_socks_client_backend/api/v1/user/


curl \
--request POST \
http://localhost/this_socks_client_backend/api/v1/user/activate/uIiO6NQsROcd5KGLt9dWkkDFiQKtQFdkHjASIdMgVA7ekpynw2vxZZXD0bjRwS4sgnIOY6kvM7MszoKUShjqlfugjvY0qXggSXxI

curl \
--header "Content-Type: application/json" \
--request PUT \
--data '{"password": "123PIN"}' \
http://localhost/this_socks_client_backend/api/v1/user/14/password

curl \
--request POST \
http://localhost/this_socks_client_backend/api/v1/user/1/recoveryPassword

curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"name": "Joao", "last_name": "Lins", "birthday": "10/02/1987", "landline_number": "988998899", "cellphone_number": "33333333", "user_id": 14}' \
http://localhost/this_socks_client_backend/api/v1/client/

curl \
http://localhost/this_socks_client_backend/api/v1/client/13

curl \
--header "Content-Type: application/json" \
--request PUT \
--data '{"name": "Pedro", "last_name": "Lins", "birthday": "10/02/1987", "landline_number": "988998899", "cellphone_number": "33333333", "user_id": 14}' \
http://localhost/this_socks_client_backend/api/v1/client/13

curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"address_name": "Casa de Campo", "zipcode": "65999-999", "address": "Av Lorem Ipsum 123", "state": "Ceara", "city": "Fortaleza", "client_id": 13}' \
http://localhost/this_socks_client_backend/api/v1/address/

curl \
http://localhost/this_socks_client_backend/api/v1/address/13

curl \
--header "Content-Type: application/json" \
--request PUT \
--data '{"address_name": "Casa de Praia", "zipcode": "60999-999", "address": "Av Lorem Ipsum 333", "state": "Ceara", "city": "Fortaleza", "client_id": 1}' \
http://localhost/this_socks_client_backend/api/v1/address/13

curl \
--request DELETE \
http://localhost/this_socks_client_backend/api/v1/address/13

######################################################################################################################################################################################
INVENTORY
curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"stock_total": 200, "stock_reserved": 0, "sku": "ABCD-0001"}' \
http://localhost/this_socks_inventory_backend/api/v1/inventory

curl \
http://localhost/this_socks_inventory_backend/api/v1/inventory/all

curl \
http://localhost/this_socks_inventory_backend/api/v1/inventory/bySKU/JOMA-0022

curl \
--header "Content-Type: application/json" \
--request PUT \
--data '{"quantity": 10}' \
http://localhost/this_socks_inventory_backend/api/v1/inventory/processing/JOMA-0022

curl \
--header "Content-Type: application/json" \
--request PUT \
--data '{"quantity": 10}' \
http://localhost/this_socks_inventory_backend/api/v1/inventory/canceled/JOMA-0022

curl \
--header "Content-Type: application/json" \
--request PUT \
--data '{"quantity": 10}' \
http://localhost/this_socks_inventory_backend/api/v1/inventory/confirmed/JOMA-0022

curl \
--request DELETE \
http://localhost/this_socks_inventory_backend/api/v1/inventory/195

######################################################################################################################################################################################
PAYMENT

curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"card": {"number": "4242424242424242","exp_month": 12,"exp_year": 2022,"cvc": "1234","name": "JOAO M X Y Z"},"address": {"address_name": "Minha casa","zipcode": "60888888","state": "Ceara","city": "Fortaleza","address": "Av. Lorem Ipsum 1234"}}' \
http://localhost/this_socks_payment_backend/api/v1/card/client/13

curl \
http://localhost/this_socks_payment_backend/api/v1/card/card_3f3e4d1a-bc73-4479-bc79-38e8a8d019ff/client/13

curl \
http://localhost/this_socks_payment_backend/api/v1/card/client/13/all

curl \
--header "Content-Type: application/json" \
--request PUT \
--data '{"card": {"number": "4242424242424242","exp_month": 12,"exp_year": 2029,"cvc": "1234","name": "JOAO M X Y Z"},"address": {"address_name": "Minha casa","zipcode": "62222000","state": "Ceara","city": "Fortaleza","address": "Av. Lorem Ipsum 1234"}}' \
http://localhost/this_socks_payment_backend/api/v1/card/card_3f3e4d1a-bc73-4479-bc79-38e8a8d019ff/client/13

curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"payment_id": "card_78b2ce43-15e2-497b-8fcc-275218978b51", "client_id": 1, "order_id": "order-1231313131", "amount": 123.20, "cvc": "3334"}' \
http://localhost/this_socks_payment_backend/api/v1/payment/

###############################################################################################################################################################################################################
REVIEW

curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"client_id": 1, "product_id": 1, "stars": "5", "title": "TOP", "review_date": "10/02/2018 18:00:00", "comment": "IRADO!!! RECOMENDO!!!"}' \
http://localhost/this_socks_review_backend/api/v1/review/

curl \
http://localhost/this_socks_review_backend/api/v1/review/1?page=1\&quantity=10

###############################################################################################################################################################################################################
RECOMMENDATION

curl \
--request POST \
http://localhost/this_socks_recommendation_backend/api/v1/recommendation/1/1/ABCX-9999

curl \
http://localhost/this_socks_recommendation_backend/api/v1/recommendation/ABCX-9999

curl http://localhost/this_socks_recommendation_backend/api/v1/recommendation/1/1

curl \
--request PUT \
http://localhost/this_socks_recommendation_backend/api/v1/recommendation/salesNumber/ABCX-9999

###############################################################################################################################################################################################################
ORDER

curl \
--header "Content-Type: application/json" \
--request POST \
--data @order.json \
http://localhost/this_socks_order_backend/api/v1/order/
