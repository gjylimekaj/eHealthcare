const db = require("../../models");

exports.showAll = (req, res) => {
    db.Doctor.findAll().then(doctors => res.render('showDoctors', { doctors: doctors }));
};

exports.new = (req, res) => {
    res.render("addDoctor");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Doctor.create({
            speciality: req.body.spec,
            start_work: req.body.start_work,
            TeamId: null,
            UserId: null
        }).then(() => res.redirect('/doctors'));
    }
};

exports.edit = (req, res) => {
    db.Doctor.findAll({
        where: {
            id: req.params.id
        }
    }).then(doc => res.render('editDoctor', {
        doc: doc[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Doctor.update({
        speciality: req.body.spec,
        start_work: req.body.start_work,
        TeamId: null,
        UserId: null
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/doctors'));
};

exports.delete = (req,res) => {
    db.Doctor.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/doctors"));
};