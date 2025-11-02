// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeadershipTrustLedgerDAO {
    address public steward;

    struct TrustEntry {
        string officialName;
        string corridor;
        uint256 trustScore;
        string emotionalTag;
    }

    TrustEntry[] public ledger;

    event TrustLogged(string officialName, string corridor, uint256 trustScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logTrust(
        string memory officialName,
        string memory corridor,
        uint256 trustScore,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(TrustEntry(officialName, corridor, trustScore, emotionalTag));
        emit TrustLogged(officialName, corridor, trustScore, emotionalTag);
    }
}
