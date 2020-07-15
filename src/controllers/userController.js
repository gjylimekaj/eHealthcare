const db = require("../../models");

exports.showAll = (req, res) => {
    db.Team.findAll().then(teams => res.render('showTeams', { teams:teams }));
};

exports.new = (req, res) => {
    res.render("addTeam");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Team.create({
            description: req.body.desc,
            procedure_info: req.body.procedure,
            due_date: req.body.due_date,
            start_at: req.body.start_time,
            end_at: req.body.end_time,
            // created_at: null,
            // updated_at: null
        }).then(() => res.redirect('/teams'));
    }
};

exports.edit = (req, res) => {
    db.Team.findAll({
        where: {
            id: req.params.id
        }
    }).then(team => res.render('editTeam', {
        team: team[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Team.update({
        description: req.body.desc,
        procedure_info: req.body.procedure,
        due_date: req.body.due_date,
        start_at: req.body.start_time,
        end_at: req.body.end_time,
        // created_at: null,
        // updated_at: null
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/teams'));
};

exports.delete = (req,res) => {
    db.Team.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/teams"));
};