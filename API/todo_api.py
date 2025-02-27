import requests

# Geoff Dev notes: I wanted to emphasize the use of the Facade Design Pattern to encapsulate the API calls.
# I believe this way designs for the future of the implementation and scalability of the API. 
# Although, this is a simple request and response API, I wanted to show my understanding of the design pattern.
# Which could help with state management as the api grows, using strategies like auth tokens, sessions, etc...

class TodoAPI:
    BASE_URL = "https://jsonplaceholder.typicode.com/todos"

    def get_todos(self, limit=200):
        # Retrieve TODOs from the API.
        response = requests.get(self.BASE_URL)
        if response.status_code == 200:
            todos = response.json()
            return todos[:limit]
        else:
            print("Error fetching TODOs:", response.status_code)
            return None

    def create_todo(self, todo_data):
        # Create a new TODO.
        response = requests.post(self.BASE_URL, json=todo_data)
        if response.status_code in [200, 201]:
            return response.json()
        else:
            print("Error creating TODO:", response.status_code)
            return None

    def delete_todo(self, todo_id):
        # Delete the TODO with the given ID.
        response = requests.delete(f"{self.BASE_URL}/{todo_id}")
        return response.status_code

if __name__ == "__main__":
    api = TodoAPI()

    # Fetch TODOs.
    todos = api.get_todos()
    print("Fetched TODOs:", todos)

    # Create a new TODO.
    new_todo = {"userId": 1, "title": "Service Metal Test", "completed": False}
    created_todo = api.create_todo(new_todo)
    print("Created TODO:", created_todo)

    # Delete a TODO with a given ID.
    status = api.delete_todo(1)
    print("Delete operation status code:", status)
