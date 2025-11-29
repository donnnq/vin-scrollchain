// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToLoyaltyCheckGrid {
    string public batchID = "1321.9.183";
    string public steward = "Vinvin";

    address public admin;

    struct LoyaltyCheck {
        string actor;       // official, staff, institution
        string status;      // loyal, conflicted, compromised
        uint256 timestamp;
    }

    LoyaltyCheck[] public checks;

    event LoyaltyLogged(string actor, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logLoyalty(string memory actor, string memory status) public onlyAdmin {
        checks.push(LoyaltyCheck(actor, status, block.timestamp));
        emit LoyaltyLogged(actor, status);
    }

    function getLoyalty(uint256 index) public view returns (string memory actor, string memory status, uint256 timestamp) {
        LoyaltyCheck memory l = checks[index];
        return (l.actor, l.status, l.timestamp);
    }
}
