USE flower;
SELECT * FROM users;
INSERT INTO users (name, age) 
VALUES ('Jane', 26);
DELIMITER $$ -- temporary change way to end the code from ; to $$ 
CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18 -- NEW. means new row which we want to insert
          THEN
              SIGNAL SQLSTATE '45000' -- 45000 code is saying that developer created his own rule, not general sql rule.
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$
DELIMITER ;
INSERT INTO users (name, age) 
VALUES ('Jane', 16);

SELECT * FROM gajklsdfjfd;
SHOW errors;
DELIMITER $$ 

CREATE TRIGGER example_cannot_follow_self 
     BEFORE INSERT ON follows FOR EACH ROW 
     BEGIN IF NEW.follower_id = NEW.following_id 
          THEN SIGNAL SQLSTATE '45000' 
                    SET MESSAGE_TEXT = 'Cannot follow yourself, silly'; 
          END IF; 
     END; 
$$ DELIMITER ; 

-- login unfollows:
DELIMITER $$ CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id, followee_id = OLD.followee_id;
END$$
DELIMITER ;

SHOW TRIGGERS;
DROP TRIGGER must_be_adult;