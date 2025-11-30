// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToSustainableAgricultureGrid {
    string public batchID = "1321.9.202";
    string public steward = "Vinvin";

    address public admin;

    struct Agriculture {
        string crop;        // rice, corn, vegetables
        string method;      // organic, hydroponic, audited
        uint256 timestamp;
    }

    Agriculture[] public farms;

    event AgricultureLogged(string crop, string method);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAgriculture(string memory crop, string memory method) public onlyAdmin {
        farms.push(Agriculture(crop, method, block.timestamp));
        emit AgricultureLogged(crop, method);
    }

    function getAgriculture(uint256 index) public view returns (string memory crop, string memory method, uint256 timestamp) {
        Agriculture memory a = farms[index];
        return (a.crop, a.method, a.timestamp);
    }
}
