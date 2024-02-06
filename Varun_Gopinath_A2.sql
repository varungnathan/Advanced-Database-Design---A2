-- Varun Gopinath - 8929281
-- Advanced Database Design - Assignment 2
DROP DATABASE IF EXISTS GOPINATH81;
CREATE DATABASE GOPINATH81;
USE GOPINATH81;

-- PART 1

SELECT * FROM ACCOUNT;

DELIMITER $$

CREATE PROCEDURE balance_Varun(IN accountNum CHAR(5), IN withdrawAmount DOUBLE)
BEGIN
    -- Start the transaction
    START TRANSACTION;

    -- Attempt to update the account balance if there are sufficient funds
    UPDATE account
    SET balance = balance - withdrawAmount
    WHERE account_number = accountNum AND balance >= withdrawAmount;

    -- Check if the update was successful
    IF ROW_COUNT() > 0 THEN
        -- If the update was successful, commit the transaction
        COMMIT;
        SELECT 'Transaction is successful.' AS message;
    ELSE
        -- If the update was not successful, rollback the transaction
        ROLLBACK;
        SELECT 'Transaction is unsuccessful. Insufficient funds.' AS message;
    END IF;
END$$

DELIMITER ;
-- Calling the procedure

-- Sucessfull Transaction

CALL balance_Varun('A-215', 500);  

-- Failed Transaction
CALL balance_Varun('A-215', 400);  

SELECT * FROM ACCOUNT;