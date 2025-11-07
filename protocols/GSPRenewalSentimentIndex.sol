// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GSPRenewalSentimentIndex {
    address public steward;

    struct SentimentEntry {
        string beneficiaryCountry;
        string exportSector;
        string renewalStatus;
        string emotionalTag;
    }

    SentimentEntry[] public index;

    event GSPRenewalTagged(string beneficiaryCountry, string exportSector, string renewalStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRenewalSentiment(
        string memory beneficiaryCountry,
        string memory exportSector,
        string memory renewalStatus,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SentimentEntry(beneficiaryCountry, exportSector, renewalStatus, emotionalTag));
        emit GSPRenewalTagged(beneficiaryCountry, exportSector, renewalStatus, emotionalTag);
    }
}
