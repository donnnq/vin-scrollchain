// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFireSafetyGrid {
    string public batchID = "1321.9.176";
    string public steward = "Vinvin";

    address public admin;

    struct FireIncident {
        string location;     // Hong Kong apartment complex, etc.
        uint256 casualties;  // death toll
        uint256 missing;     // unaccounted persons
        string accountability; // construction firm, regulators
        uint256 timestamp;
    }

    FireIncident[] public incidents;

    event FireLogged(string location, uint256 casualties, uint256 missing, string accountability);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFire(string memory location, uint256 casualties, uint256 missing, string memory accountability) public onlyAdmin {
        incidents.push(FireIncident(location, casualties, missing, accountability, block.timestamp));
        emit FireLogged(location, casualties, missing, accountability);
    }

    function getFire(uint256 index) public view returns (string memory location, uint256 casualties, uint256 missing, string memory accountability, uint256 timestamp) {
        FireIncident memory f = incidents[index];
        return (f.location, f.casualties, f.missing, f.accountability, f.timestamp);
    }
}
