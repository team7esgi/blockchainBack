const Escrow = artifacts.require("./Escrow");
const EstateFactory = artifacts.require("./EstateFactory");
const EstateHelper = artifacts.require("./EstateHelper");
const Ownable = artifacts.require("./Ownable");

module.exports = function (deployer) {

    deployer.deploy(Escrow);
    deployer.deploy(EstateFactory);
    deployer.deploy(EstateHelper);
    deployer.deploy(Ownable);

};
