const db = require("../../models");

exports.showAll = (req, res) => {
    db.Vendor.findAll().then(vendors => res.render('showVendors', { vendors:vendors }));
};

exports.new = (req, res) => {
    res.render("addVendor");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Vendor.create({
            company: req.body.company,
            tel_num: req.body.tel_num,
            address: req.body.address,
            DeptId: null
        }).then(() => res.redirect('/vendors'));
    }
};

exports.edit = (req, res) => {
    db.Vendor.findAll({
        where: {
            id: req.params.id
        }
    }).then(vendor => res.render('editVendor', {
        vendor: vendor[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Vendor.update({
        company: req.body.company,
        tel_num: req.body.tel_num,
        address: req.body.address,
        DeptId: null
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/vendors'));
};

exports.delete = (req,res) => {
    db.Vendor.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/vendors"));
};