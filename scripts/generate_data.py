import json
from datetime import date
import psycopg2
from psycopg2 import OperationalError

game_titles = [
    "Mario", "Halo", "Last of Us", "Sonic"
]
game_titles_size = 4
store_names = [
    "Store1", "Store2", "Store3", "Store4", "Store5", "Store6", "Store7", "Store8"
]
store_names_size = 8


def main():
    print("Hello World!")
    try:
        connection = psycopg2.connect(
            database="Adventureworks",
            user="postgres",
            password="postgres",
            host="localhost",
            port="5433"
        )
        print("Connection to PostgreSQL DB successful")
        insert_into_db(connection, create_game_sales())
    except OperationalError as e:
        print(f"The error '{e}' occurred")


def insert_into_db(conn, values):
    simple_values = [[value for value in value.values()] for value in values]
    sql = "INSERT INTO games.game_sales(customer, game_name, store, price, receipt) VALUES (%s, %s, %s, %s, %s)"
    with conn.cursor() as curs:
        try:
            for sv in simple_values:
                curs.execute(sql, (sv[0], sv[1], sv[2], sv[3], json.dumps(sv[4])))
        except Exception as e:
            raise e
        finally:
            conn.commit()


def create_game_sales():
    game_sales = []
    for i in range(10000):
        game_sales.append({
            "customer": i + 1,
            "game_name": game_titles[i % game_titles_size],
            "store": store_names[i % store_names_size],
            "price": i,
            "receipt": {
                "customer": 1,
                "game_name": game_titles[i % game_titles_size],
                "store": store_names[i % store_names_size],
                "price": i,
                "date": "" + str(date.today()),
                "customer_info": [
                    f"random_customer_info_{i % 100}",
                    f"more_customer_info_{i % 100}"
                ],
                "game_info": {
                    "random_game_info": f"info_{i % 100}",
                    "variable": f"variable_{i & 100}",
                    "number": i % 100
                }
            }
        })
    return game_sales


if __name__ == "__main__":
    main()
