CREATE TABLE accounts (
    id SERIAL PRIMARY KEY ,
    owner TEXT not null ,
    balance BIGINT NOT NULL CHECK ( balance >= 0 ),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE transfers (
    if BIGSERIAL PRIMARY KEY ,
    from_acc INT NOT NULL REFERENCES accounts(id) ,
    to_acc INT NOT NULL REFERENCES accounts(id) ,
    amount BIGINT NOT NULL CHECK (amount > 0) ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);







