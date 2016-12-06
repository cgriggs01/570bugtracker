Prompt ******  Creating TEAMS table ....
CREATE TABLE teams
            (team_id          NUMBER(7)   NOT NULL,
                        CONSTRAINT team_id_PK PRIMARY KEY (team_id),
             team_name        VARCHAR2(25) NOT NULL);

Prompt ******  Creating PERSON table ....
CREATE TABLE person
            (user_id          NUMBER(7) NOT NULL,
                        CONSTRAINT user_id_PK PRIMARY KEY (user_id),
             username         VARCHAR2(25) NOT NULL,
             last_name        VARCHAR2(25),
             first_name       VARCHAR2(25),
             email            VARCHAR2(25) NOT NULL,
             team_id          NUMBER(7)
                        CONSTRAINT user_team_id_FK REFERENCES teams (team_id));

Prompt ******  Creating PROJECTS table ....
CREATE TABLE projects
            (project_id       NUMBER(7) NOT NULL,
                        CONSTRAINT project_id_PK PRIMARY KEY (project_id),
             project_name     VARCHAR2(25) NOT NULL,
             team_id          NUMBER(7)
                        CONSTRAINT project_team_id_FK REFERENCES teams (team_id));

Prompt ******  Creating BUGS table ....
CREATE TABLE bugs
            (bug_id           NUMBER(7) NOT NULL,
                        CONSTRAINT bug_id_PK PRIMARY KEY (bug_id),
             bug_name         VARCHAR(25) NOT NULL,
             user_id          NUMBER(7)
                        CONSTRAINT bug_user_id_FK REFERENCES person (user_id),
             project_id       NUMBER(7)
                        CONSTRAINT bug_project_id_FK REFERENCES projects (project_id),
             build_number     VARCHAR2(25),
             severity         VARCHAR2(25),
             priority         VARCHAR2(25),
             reason           VARCHAR2(25),
             status           NUMBER(7),
             environment      VARCHAR2(25));
