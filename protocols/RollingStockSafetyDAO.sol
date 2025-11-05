// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RollingStockSafetyDAO {
    address public steward;

    struct SafetyEntry {
        string trainSetID;
        string inspectionDate;
        string safetyProtocol;
        string emotionalTag;
    }

    SafetyEntry[] public registry;

    event RollingStockSafetyTagged(string trainSetID, string inspectionDate, string safetyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSafety(
        string memory trainSetID,
        string memory inspectionDate,
        string memory safetyProtocol,
        string memory emotionalTag
    ) public onlySteard {
        registry.push(SafetyEntry(trainSetID, inspectionDate, safetyProtocol, emotionalTag));
        emit RollingStockSafetyTagged(trainSetID, inspectionDate, safetyProtocol, emotionalTag);
    }
}
