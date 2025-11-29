// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAllianceAuditLedger {
    string public batchID = "1321.9.179";
    string public steward = "Vinvin";

    address public admin;

    struct Alliance {
        string actors;       // political figures, parties
        string purpose;      // impeachment, reform, opposition
        uint256 timestamp;
    }

    Alliance[] public alliances;

    event AllianceLogged(string actors, string purpose);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAlliance(string memory actors, string memory purpose) public onlyAdmin {
        alliances.push(Alliance(actors, purpose, block.timestamp));
        emit AllianceLogged(actors, purpose);
    }

    function getAlliance(uint256 index) public view returns (string memory actors, string memory purpose, uint256 timestamp) {
        Alliance memory a = alliances[index];
        return (a.actors, a.purpose, a.timestamp);
    }
}
