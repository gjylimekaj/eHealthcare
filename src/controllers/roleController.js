const db = require("../../models");

exports.showAll = (req, res) => {
    db.Role.findAll().then(roles => res.render('showRoles', { roles: roles }));
};

exports.new = (req, res) => {
    res.render("addRole");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Role.create({
            role: req.body.role
        }).then(() => res.redirect('/roles'));
    }
};

exports.edit = (req, res) => {
    db.Role.findAll({
        where: {
            id: req.params.id
        }
    }).then(role => res.render('editRole', {
        role: role[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Role.update({
        role: req.body.role
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/roles'));
};

exports.delete = (req,res) => {
    db.Role.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/roles"));
};