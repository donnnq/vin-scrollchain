// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorTrustIndexDAO {
    address public steward;

    struct TrustEntry {
        string contractorName;
        string corridor;
        uint256 trustScore;
        string emotionalTag;
    }

    TrustEntry[] public index;

    event TrustLogged(string contractorName, string corridor, uint256 trustScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logTrust(
        string memory contractorName,
        string memory corridor,
        uint256 trustScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(TrustEntry(contractorName, corridor, trustScore, emotionalTag));
        emit TrustLogged(contractorName, corridor, trustScore, emotionalTag);
    }
}
