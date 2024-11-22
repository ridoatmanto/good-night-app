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
Request JSON Body
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
Request JSON Body
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

### Followed List
_Return all followed user._\
**GET** `http://localhost:3000/followships/1`

Rensponse Sample
```
[
    {
        "id": 181,
        "follower_id": 1,
        "followee_id": 2,
        "created_at": "2024-11-21T16:49:04.000Z",
        "updated_at": "2024-11-21T16:49:04.000Z",
        "user": {
            "name": "Joaquin"
        }
    },
    {
        "id": 182,
        "follower_id": 1,
        "followee_id": 3,
        "created_at": "2024-11-21T16:49:04.000Z",
        "updated_at": "2024-11-21T16:49:04.000Z",
        "user": {
            "name": "Angel"
        }
    },
    {
        "id": 183,
        "follower_id": 1,
        "followee_id": 4,
        "created_at": "2024-11-21T16:49:04.000Z",
        "updated_at": "2024-11-21T16:49:04.000Z",
        "user": {
            "name": "Juliana"
        }
    },
    .
    .
    .
    {
        "id": 189,
        "follower_id": 1,
        "followee_id": 10,
        "created_at": "2024-11-21T16:49:04.000Z",
        "updated_at": "2024-11-21T16:49:04.000Z",
        "user": {
            "name": "Kristopher"
        }
    }
]
```

### Follow other user
_Return saved followee_id(user_id)._\
**POST** `http://localhost:3000/followships`\
Request JSON Body
```
{
    "user": {
        "followee_id": "3",
        "follower_id": "1"
    }
}
```

Rensponse Sample
```
{
    "message": "Already followed!"
}
```

### Unfollow other user
_Remoced followee_id(user_id) from following list._\
**DELETE** `http://localhost:3000/followships`\
Request JSON Body
```
{
    "user": {
        "followee_id": 2
    }
}
```
***

### Followed User Sleep Duration
_Return all followed user sleep duration._\
**GET** `http://localhost:3000/followed-user-sleep-duration/1`

Rensponse Sample
```
[
    {
        "id": 4,
        "user_id": 2,
        "clock_in": "2024-11-20T16:29:04.000Z",
        "clock_out": "2024-11-21T00:49:04.000Z",
        "duration_in_minutes": 500,
        "created_at": "2024-11-21T16:49:04.000Z",
        "updated_at": "2024-11-21T16:49:04.000Z",
        "user": {
            "name": "Joaquin"
        }
    },
    {
        "id": 3,
        "user_id": 2,
        "clock_in": "2024-11-21T16:34:04.000Z",
        "clock_out": "2024-11-22T00:49:04.000Z",
        "duration_in_minutes": 495,
        "created_at": "2024-11-21T16:49:04.000Z",
        "updated_at": "2024-11-21T16:49:04.000Z",
        "user": {
            "name": "Joaquin"
        }
    },
    {
        "id": 6,
        "user_id": 3,
        "clock_in": "2024-11-20T16:19:04.000Z",
        "clock_out": "2024-11-21T00:09:04.000Z",
        "duration_in_minutes": 470,
        "created_at": "2024-11-21T16:49:04.000Z",
        "updated_at": "2024-11-21T16:49:04.000Z",
        "user": {
            "name": "Angel"
        }
    },
    .
    .
    .
    {
        "id": 7,
        "user_id": 4,
        "clock_in": "2024-11-21T16:41:04.000Z",
        "clock_out": "2024-11-21T23:39:04.000Z",
        "duration_in_minutes": 418,
        "created_at": "2024-11-21T16:49:04.000Z",
        "updated_at": "2024-11-21T16:49:04.000Z",
        "user": {
            "name": "Juliana"
        }
    }
]
```

_Created at November 22th 2024 by Rido Atmanto._
