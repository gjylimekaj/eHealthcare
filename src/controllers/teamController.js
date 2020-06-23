const db = require("../config/db");

exports.viewAllTeams = (req, res) => {
    db.query("SELECT * FROM teams", (err, rows, fields) => {
        if(err) throw err;
        res.render('showTeams', {
            teams: rows
        });
    });
};

exports.renderAddTeamPage = (req, res) => {
    res.render("addTeam");
}

exports.addTeam = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        let team = {
            description: req.body.desc,
            procedure_info: req.body.procedure,
            due_date: req.body.due_date,
            start_at: req.body.start_time,
            end_at: req.body.end_time
        }
        let sql = 'INSERT INTO teams SET ?';
        let query = db.query(sql, team, (err, result) => {
            if(err) throw err;
            console.log(result);
            res.redirect('/teams');
        });
    }
};

exports.editTeam = (req, res) => {
    db.query(`SELECT * FROM teams WHERE id=${req.params.team_id}`, (err, rows, fields) => {
        res.render('editTeam', {
            team: rows[0]
        });
    });
};

exports.update = (req, res) => {
    let team = {
        description: req.body.desc,
        procedure_info: req.body.procedure,
        due_date: req.body.due_date,
        start_at: req.body.start_time,
        end_at: req.body.end_time
    }
    let sql = `UPDATE teams SET ? WHERE id=${req.params.team_id}`;
    let query = db.query(sql, team, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.redirect('/teams');
    });
};

exports.delete = (req,res) => {
    db.query(`DELETE FROM teams WHERE id=${req.params.team_id}`, (err,result) => {
        if(err) throw err;
        console.log(result);
        res.redirect('/teams');
    });
};