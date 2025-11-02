// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHousingMaterialsTreaty {
    address public steward;

    struct HousingClause {
        string barangay;
        string materialType;
        string subsidyStatus;
        string emotionalTag;
    }

    HousingClause[] public treatyLog;

    event HousingMaterialTagged(string barangay, string materialType, string subsidyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagHousingMaterial(
        string memory barangay,
        string memory materialType,
        string memory subsidyStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(HousingClause(barangay, materialType, subsidyStatus, emotionalTag));
        emit HousingMaterialTagged(barangay, materialType, subsidyStatus, emotionalTag);
    }
}
