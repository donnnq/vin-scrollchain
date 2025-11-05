// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySMRResilienceTreaty {
    address public steward;

    struct TreatyClause {
        string barangay;
        string SMRModel;
        string resilienceProtocol;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event SMRResilienceTagged(string barangay, string SMRModel, string resilienceProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory barangay,
        string memory SMRModel,
        string memory resilienceProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(barangay, SMRModel, resilienceProtocol, emotionalTag));
        emit SMRResilienceTagged(barangay, SMRModel, resilienceProtocol, emotionalTag);
    }
}
