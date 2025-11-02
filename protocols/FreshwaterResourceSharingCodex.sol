// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreshwaterResourceSharingCodex {
    address public steward;

    struct WaterClause {
        string sourceBarangay;
        string recipientBarangay;
        string waterUseType;
        string emotionalTag;
    }

    WaterClause[] public codex;

    event WaterShared(string sourceBarangay, string recipientBarangay, string waterUseType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function shareWater(
        string memory sourceBarangay,
        string memory recipientBarangay,
        string memory waterUseType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(WaterClause(sourceBarangay, recipientBarangay, waterUseType, emotionalTag));
        emit WaterShared(sourceBarangay, recipientBarangay, waterUseType, emotionalTag);
    }
}
