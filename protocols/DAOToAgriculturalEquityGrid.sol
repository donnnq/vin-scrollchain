// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAgriculturalEquityGrid {
    string public batchID = "1321.9.238";
    string public steward = "Vinvin";

    address public admin;

    struct Agriculture {
        string crop;       // rice, corn, vegetables
        string status;     // equitable, pending, ghost
        uint256 timestamp;
    }

    Agriculture[] public farms;

    event AgricultureLogged(string crop, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAgriculture(string memory crop, string memory status) public onlyAdmin {
        farms.push(Agriculture(crop, status, block.timestamp));
        emit AgricultureLogged(crop, status);
    }

    function getAgriculture(uint256 index) public view returns (string memory crop, string memory status, uint256 timestamp) {
        Agriculture memory a = farms[index];
        return (a.crop, a.status, a.timestamp);
    }
}
