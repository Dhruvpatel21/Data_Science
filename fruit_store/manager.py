import json
from datetime import datetime

DATA_FILE = "data.txt"
LOG_FILE = "log.txt"


def load_data():
    try:
        with open(DATA_FILE, "r") as f:
            return json.load(f)
    except:
        return {}


def save_data(data):
    with open(DATA_FILE, "w") as f:
        json.dump(data, f)


def log_action(action):
    with open(LOG_FILE, "a") as f:
        f.write(f"{datetime.now()} - {action}\n")


def add_fruit():
    data = load_data()

    name = input("Enter fruit name: ").capitalize()
    qty = int(input("Enter quantity (kg): "))
    price = int(input("Enter price per kg: "))

    data[name] = {"qty": qty, "price": price}
    save_data(data)

    log_action(f"Added {name} - Qty:{qty}, Price:{price}")
    print("✅ Fruit added successfully!")


def view_fruit():
    data = load_data()

    if not data:
        print("⚠️ No stock available.")
        return

    print("\n📦 Available Stock:")
    for fruit, details in data.items():
        print(f"{fruit} -> Qty: {details['qty']} kg, Price: ₹{details['price']}")


def update_fruit():
    data = load_data()

    name = input("Enter fruit name to update: ").capitalize()

    if name in data:
        qty = int(input("Enter new quantity: "))
        price = int(input("Enter new price: "))

        data[name] = {"qty": qty, "price": price}
        save_data(data)

        log_action(f"Updated {name} - Qty:{qty}, Price:{price}")
        print("✅ Fruit updated successfully!")
    else:
        print("❌ Fruit not found!")