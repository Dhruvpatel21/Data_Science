import manager
import customer


def manager_menu():
    while True:
        print("\n--- Fruit Market Manager ---")
        print("1. Add Fruit Stock")
        print("2. View Fruit Stock")
        print("3. Update Fruit Stock")
        print("4. Back")

        choice = input("Enter choice: ")

        try:
            if choice == "1":
                manager.add_fruit()
            elif choice == "2":
                manager.view_fruit()
            elif choice == "3":
                manager.update_fruit()
            elif choice == "4":
                break
            else:
                print("❌ Invalid choice!")
        except Exception as e:
            print("⚠️ Error:", e)


def customer_menu():
    while True:
        print("\n--- Customer Menu ---")
        print("1. Buy Fruit")
        print("2. Back")

        choice = input("Enter choice: ")

        try:
            if choice == "1":
                customer.buy_fruit()
            elif choice == "2":
                break
            else:
                print("❌ Invalid choice!")
        except Exception as e:
            print("⚠️ Error:", e)


def main():
    while True:
        print("\n===== WELCOME TO FRUIT MARKET =====")
        print("1. Manager")
        print("2. Customer")
        print("3. Exit")

        choice = input("Select role: ")

        if choice == "1":
            manager_menu()
        elif choice == "2":
            customer_menu()
        elif choice == "3":
            print("👋 Exiting... Thank you!")
            break
        else:
            print("❌ Invalid input!")


if __name__ == "__main__":
    main()