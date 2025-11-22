// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToTrustCorpBlacklistProtocol {
    string public batchID = "1321.9.94";
    string public steward = "Vinvin";

    address public admin;

    struct BlacklistEntry {
        bool listed;
        string sector; // e.g., "cloud", "defense", "finance", "healthcare"
        string reason;
    }

    mapping(address => BlacklistEntry) public trustCorpList;

    event BlacklistPublished(address indexed subject, string sector, string reason);
    event BlacklistRevoked(address indexed subject);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function publishBlacklist(address subject, string memory sector, string memory reason) public onlyAdmin {
        trustCorpList[subject] = BlacklistEntry(true, sector, reason);
        emit BlacklistPublished(subject, sector, reason);
    }

    function revokeBlacklist(address subject) public onlyAdmin {
        trustCorpList[subject].listed = false;
        emit BlacklistRevoked(subject);
    }

    function isListed(address subject) public view returns (bool) {
        return trustCorpList[subject].listed;
    }

    function getDetails(address subject) public view returns (string memory sector, string memory reason) {
        BlacklistEntry memory b = trustCorpList[subject];
        return (b.sector, b.reason);
    }
}
