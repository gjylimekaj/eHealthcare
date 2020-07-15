const db = require("../../models");

exports.showAll = (req, res) => {
    db.Department.findAll().then(depts => res.render('showDepts', { depts: depts }));
};

exports.new = (req, res) => {
    res.render("addDept");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Department.create({
            name: req.body.name,
            building: req.body.building
        }).then(() => res.redirect('/departments'));
    }
};

exports.edit = (req, res) => {
    db.Department.findAll({
        where: {
            id: req.params.id
        }
    }).then(dept => res.render('editDept', {
        dept: dept[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Department.update({
        name: req.body.name,
        building: req.body.building
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/departments'));
};

exports.delete = (req,res) => {
    db.Department.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/departments"));
};