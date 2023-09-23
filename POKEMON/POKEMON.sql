USE POKEMON;

CREATE TABLE POKEMON (
    P_ID INT PRIMARY KEY,
    P_NAME VARCHAR(50),
    P_TYPE VARCHAR(20),
    S_TYPE VARCHAR(20)
);

CREATE TABLE MOVES (
    M_ID INT PRIMARY KEY,
    M_NAME VARCHAR(50),
    M_POWER INT,
    M_TYPE VARCHAR(20)
);

CREATE TABLE POKEMONMOVES (
    P_ID INT,
    M_ID INT,
    FOREIGN KEY (P_ID) REFERENCES POKEMON(P_ID),
    FOREIGN KEY (M_ID) REFERENCES MOVES(M_ID)
);

INSERT INTO POKEMON (P_ID, P_NAME, P_TYPE, S_TYPE)
VALUES
    (1, 'BULBASAUR', 'GRASS', 'NULL'),
    (2, 'CHARMANDER', 'FIRE', 'NULL'),
    (3, 'SQUIRTLE', 'WATER', 'NULL'),
    (4, 'EEVEE', 'NORMAL','NULL'),
    (5, 'PIDGEY', 'NORMAL', 'FLYING');
    
   INSERT INTO MOVES (M_ID, M_NAME, M_POWER, M_TYPE)
VALUES
    (1, 'TACKLE', 35, 'NORMAL'),
    (2, 'WATER GUN', 40, 'WATER'),
    (3, 'EMBER', 40, 'FIRE'),
    (4, 'VINE WHIP', 40, 'GRASS'),
    (5, 'WING ATTACK', 65, 'FLYING'),
    (6, 'HEADBUTT', 70, 'NORMAL'),
    (7, 'RETURN', 100, 'NORMAL');
   
  INSERT INTO POKEMONMOVES (P_ID, M_ID)
VALUES
    (1, 1),
    (1, 4),
    (1, 7),
    (2, 1),
    (2, 3),
    (2, 7),
    (3, 1),
    (3, 2),
    (3, 7),
    (4, 1),
    (4, 6),
    (4, 7),
    (5, 1),
    (5, 5),
    (5, 7);
   
SELECT P.P_NAME AS POKEMON_NAME
FROM POKEMON P
INNER JOIN POKEMONMOVES PM ON P.P_ID= PM.P_ID
INNER JOIN MOVES M ON PM.M_ID = M.M_ID
WHERE M.M_NAME = 'RETURN';

SELECT M.M_NAME AS MOVE_NAME
FROM MOVES M
WHERE M.M_TYPE IN ('FIRE', 'FLYING');




