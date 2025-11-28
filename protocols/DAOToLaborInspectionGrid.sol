// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToLaborInspectionGrid {
    string public batchID = "1321.9.169";
    string public steward = "Vinvin";

    address public admin;

    struct Inspection {
        string company;     // name of company or org
        string scope;       // wages, benefits, safety
        string status;      // scheduled, completed, violation found
        uint256 timestamp;
    }

    Inspection[] public inspections;

    event InspectionLogged(string company, string scope, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logInspection(string memory company, string memory scope, string memory status) public onlyAdmin {
        inspections.push(Inspection(company, scope, status, block.timestamp));
        emit InspectionLogged(company, scope, status);
    }

    function getInspection(uint256 index) public view returns (string memory company, string memory scope, string memory status, uint256 timestamp) {
        Inspection memory i = inspections[index];
        return (i.company, i.scope, i.status, i.timestamp);
    }
}
