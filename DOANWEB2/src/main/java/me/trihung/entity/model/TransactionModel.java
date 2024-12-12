package me.trihung.entity.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import me.trihung.entity.Transaction;

@Getter
@Setter
public class TransactionModel {
	
	private int transactionId;
	
	private Date transactionDay;
	
	private String transAddress;
	
	private int transStatus;	
	
	private long transTotalValue;
	
	private int userId;
	
	private String userName;
	
	public TransactionModel(Transaction trans) {
		transactionId = trans.getTransactionId();
		transactionDay = trans.getTransactionDay();
		transAddress = trans.getTransAddress();
		transStatus = trans.getTransStatus();
		transTotalValue = trans.getTransTotalValue();
		userId = trans.getUser().getUserId();
		userName = trans.getUser().getUserfullName();
	}
}
