# Good Night App
Track your sleeping time into goodness. Good Sleeping quality, increase our life time duration.

## Minimum Tech Stack Requirement 
- MySQL 5
- Ubuntu 18.04/WSL2
- Rails 5.2.2
- ruby 2.5.1p57

## Installation
- Rename file `.env.sample` as `.env`.
- Set up `.env` value with your own database, username, and password.
- Generate rails first database setting with running command `rails db:create`.
- Run `rails db:migrate` to appliying database migration.
- Run `rails db:seed` to generate sample data. So, endpoint result will not be so empty.
- Make your backend running, excute command `rails s` to start the server.
- Access from your favourite browser/Postman into url `http://localhost:3000`.

## Features
### List Users
**GET** `http://localhost:3000/users`\
Rensponse Sample
```[
    {
        "id": 1,
        "name": "Valentino",
        "created_at": "2024-11-21T15:33:50.000Z",
        "updated_at": "2024-11-21T15:33:50.000Z"
    },
    {
        "id": 2,
        "name": "Joaquin",
        "created_at": "2024-11-21T15:33:50.000Z",
        "updated_at": "2024-11-21T15:33:50.000Z"
    },
    {
        "id": 3,
        "name": "Angel",
        "created_at": "2024-11-21T15:33:50.000Z",
        "updated_at": "2024-11-21T15:33:50.000Z"
    },
    .
    .
    .
    {
        "id": 10,
        "name": "Kristopher",
        "created_at": "2024-11-21T15:33:50.000Z",
        "updated_at": "2024-11-21T15:33:50.000Z"
    }
]
```

### Clock In
_Return all clock in times, ordered by created times._\
**POST** `http://localhost:3000/clock-in`\
Request Body
```
{
    "user": {
        "user_id": "3"
    }
}
```

Rensponse Sample
```
[
    "2024-11-21T15:59:38.000Z",
    "2024-11-21T15:48:41.000Z",
    "2024-11-20T15:48:41.000Z"
]
```

### Clock Out
_Return clock in & clock out duration, ordered by duration times in minutes._\
**POST** `http://localhost:3000/clock-out`\
Request Body
```
{
    "user": {
        "user_id": "3"
    }
}
```

Rensponse Sample
```
[
    {
        "id": null,
        "clock_in": "2024-11-21T15:59:38.000Z",
        "clock_out": "2024-11-22T15:59:45.000Z",
        "duration_in_minutes": 1440,
        "created_at": "2024-11-21T15:59:38.000Z"
    },
    {
        "id": null,
        "clock_in": "2024-11-21T15:48:41.000Z",
        "clock_out": "2024-11-21T23:58:41.000Z",
        "duration_in_minutes": 490,
        "created_at": "2024-11-21T15:58:41.000Z"
    },
    {
        "id": null,
        "clock_in": "2024-11-20T15:48:41.000Z",
        "clock_out": "2024-11-20T23:58:41.000Z",
        "duration_in_minutes": 490,
        "created_at": "2024-11-21T15:58:41.000Z"
    }
]
```
