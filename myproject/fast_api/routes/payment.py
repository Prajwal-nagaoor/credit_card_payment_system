from fastapi import APIRouter,Depends, HTTPException, status
from fast_api.schemas import paymentrequest
from fast_api.authentication import get_current_user
from sqlalchemy.orm import Session
from fast_api.database import get_db
from fast_api.models import Card, Transaction

router = APIRouter(
    prefix="/payment",
    tags=['payment']
    )
@router.post('/')
def make_payment(paymnet:paymentrequest,
                 user_id:int = Depends(get_current_user),
                 db:Session = Depends(get_db)):
    card = db.query(Card).filter(
        Card.id == paymnet.card_id,
        Card.user_id == user_id
    ).first()
    if not card:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Card not found or does not belong to the user"
        )
    transaction = Transaction(
        user_id = user_id,
        card_id = paymnet.card_id,
        amount = paymnet.amount,
        status = "PENDING"
    )
    db.add(transaction)
    db.commit()
    db.refresh(transaction)

    if paymnet.amount <= 1000:
        transaction.status = "SUCCESS"
    else:
        transaction.status = "FAILED"
    db.commit()
    db.refresh(transaction)
    return {
        "message":"payment request received",
        "transaction":{
            "id":transaction.id,
            "user_id":transaction.user_id,
            "card_id":transaction.card_id,
            "amount":float(transaction.amount),
            "Status":transaction.status,
            "timestamp":transaction.timestamp
        }
    }

