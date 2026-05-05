from manager import load_data, save_data, log_action


def buy_fruit():
    data = load_data()

    if not data:
        print("⚠️ No fruits available.")
        return

    print("\nAvailable Fruits:")
    for fruit, details in data.items():
        print(f"{fruit} -> ₹{details['price']} per kg")

    name = input("Enter fruit name: ").capitalize()

    if name not in data:
        print("❌ Fruit not available!")
        return

    qty = int(input("Enter quantity (kg): "))

    if qty > data[name]["qty"]:
        print("❌ Not enough stock!")
        return

    total = qty * data[name]["price"]
    data[name]["qty"] -= qty

    save_data(data)
    log_action(f"Customer bought {name} - Qty:{qty}, Total:{total}")

    print(f"✅ Purchase successful! Total = ₹{total}")