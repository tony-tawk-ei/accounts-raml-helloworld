%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "accountID": "AC123",
    "name": "The first account"
  },
  {
    "accountID": "AC456",
    "name": "The second acount"
  },
  {
    "accountID": "AC789",
    "name": "The third acount"
  },
  {
    "accountID": "AC000",
    "name": "The fifth acount"
  },
  {
    "accountID": "AC111",
    "name": "The sixth acount"
  }
])