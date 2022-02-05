## Creating a book
Post request should go to: http://localhost:3000/books
{ 
    "book": 
    { 
        "author": "John Doe"
    } 
}


## Expected Response
{
    "id": 1,
    "author": "John Doe",
    "created_at": "2022-02-05T04:02:20.774Z",
    "updated_at": "2022-02-05T04:02:20.774Z"
}

## Creating A Chapter But A Book With This ID Does Not Exist
Post request should go to: http://localhost:3000/chapters
```json
{ 
    "chapter": 
    { 
        "name": "A New Chapter", 
        "body": "A lot of words",
        "author": "Dean",
        "book_id": 2
    } 
}

```

### Expected Response:
Book is created, its ID is returned as a part of the response.
```json
{
    "id": 1,
    "name": "A New Chapter",
    "body": "A lot of words",
    "author": "Dean",
    "book_id": 2,
    "created_at": "2022-02-05T04:03:20.350Z",
    "updated_at": "2022-02-05T04:03:20.350Z"
}
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
Book is **not** created, its ID is returned as a part of the response.
```json
{
    "id": 2,
    "name": "Chapter 1",
    "body": "A lot of words",
    "author": "John Doe",
    "book_id": 1,
    "created_at": "2022-02-05T04:05:10.568Z",
    "updated_at": "2022-02-05T04:05:10.568Z"
}
```
## Created A Chapter Without Providing Any ID
Post request should go to: http://localhost:3000/chapters
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
Book is created, its ID is returned as a part of the response.
```json
{
    "id": 2,
    "name": "Chapter 1",
    "body": "A lot of words",
    "author": "John Doe",
    "book_id": 1,
    "created_at": "2022-02-05T04:05:10.568Z",
    "updated_at": "2022-02-05T04:05:10.568Z"
}
```


