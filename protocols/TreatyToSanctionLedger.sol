// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToSanctionLedger {
    string public batchID = "1321.9.172";
    string public steward = "Vinvin";

    address public admin;

    struct Sanction {
        string company;
        string penalty;     // fine, suspension, blacklist
        uint256 amount;     // monetary value if applicable
        uint256 timestamp;
    }

    Sanction[] public sanctions;

    event SanctionLogged(string company, string penalty, uint256 amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSanction(string memory company, string memory penalty, uint256 amount) public onlyAdmin {
        sanctions.push(Sanction(company, penalty, amount, block.timestamp));
        emit SanctionLogged(company, penalty, amount);
    }

    function getSanction(uint256 index) public view returns (string memory company, string memory penalty, uint256 amount, uint256 timestamp) {
        Sanction memory s = sanctions[index];
        return (s.company, s.penalty, s.amount, s.timestamp);
    }
}
