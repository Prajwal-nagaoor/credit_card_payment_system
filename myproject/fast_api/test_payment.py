from fastapi.testclient import TestClient
from fast_api.main import app


client = TestClient(app)


def test_payment_without_token():
    response = client.post(
        "/payment/",
        json={
            "card_id": 1,
            "amount": 100.00
        }
    )

    assert response.status_code == 403


def test_payment_invalid_amount():
    response = client.post(
        "/payment/",
        json={
            "card_id": 1,
            "amount": -100.00
        }
    )

    assert response.status_code == 422