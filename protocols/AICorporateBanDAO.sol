// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AICorporateBanDAO {
    address public steward;

    struct BanEntry {
        string corporationName;
        string violationType;
        string banStatus;
        string emotionalTag;
    }

    BanEntry[] public registry;

    event CorporateAIBanned(string corporationName, string violationType, string banStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function banCorporateAI(
        string memory corporationName,
        string memory violationType,
        string memory banStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BanEntry(corporationName, violationType, banStatus, emotionalTag));
        emit CorporateAIBanned(corporationName, violationType, banStatus, emotionalTag);
    }
}
