// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToPerimeterSafetyGrid {
    string public batchID = "1321.9.180";
    string public steward = "Vinvin";

    address public admin;

    struct PerimeterCheck {
        string location;     // event site, office, travel route
        string status;       // cleared, restricted, monitored
        uint256 timestamp;
    }

    PerimeterCheck[] public checks;

    event PerimeterLogged(string location, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPerimeter(string memory location, string memory status) public onlyAdmin {
        checks.push(PerimeterCheck(location, status, block.timestamp));
        emit PerimeterLogged(location, status);
    }

    function getPerimeter(uint256 index) public view returns (string memory location, string memory status, uint256 timestamp) {
        PerimeterCheck memory p = checks[index];
        return (p.location, p.status, p.timestamp);
    }
}
