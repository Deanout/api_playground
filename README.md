## Creating A Chapter Without An Existing Book
Post request should go to: http://localhost:3000/chapters/create_and_return_new_book
```json
{ 
    "chapter": 
    { 
        "name": "Chapter 1", 
        "body": "A lot of words",
        "author": "John Doe"
    } 
}
```

### Expected Response:
```json
[
  {
    "id": 1,
    "author": "John Doe",
    "created_at": "2022-02-05T03:24:31.034Z",
    "updated_at": "2022-02-05T03:24:31.034Z",
    "chapters": [
      {
        "id": 1,
        "name": "Chapter 1",
        "body": "A lot of words",
        "author": "John Doe",
        "book_id": 1,
        "created_at": "2022-02-05T03:24:31.051Z",
        "updated_at": "2022-02-05T03:24:31.051Z"
      }
    ]
  }
]
```
## Created A Chapter With An Existing Book
Post request should go to: http://localhost:3000/chapters
```json
{
    "chapter": 
    { 
        "name": "Chapter 1", 
        "body": "A lot of words",
        "author": "John Doe",
        "book_id": 1
    } 
}
```
### Expected Response:
```json
[
  {
    "id": 1,
    "author": "John Doe",
    "created_at": "2022-02-05T03:24:31.034Z",
    "updated_at": "2022-02-05T03:24:31.034Z",
    "chapters": [
      {
        "id": 1,
        "name": "Chapter 1",
        "body": "A lot of words",
        "author": "John Doe",
        "book_id": 1,
        "created_at": "2022-02-05T03:24:31.051Z",
        "updated_at": "2022-02-05T03:24:31.051Z"
      }
    ]
  }
]
```
