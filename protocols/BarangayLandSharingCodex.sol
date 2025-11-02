// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLandSharingCodex {
    address public steward;

    struct LandClause {
        string hostBarangay;
        string beneficiaryBarangay;
        string landUseType;
        string emotionalTag;
    }

    LandClause[] public codex;

    event LandShared(string hostBarangay, string beneficiaryBarangay, string landUseType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function shareLand(
        string memory hostBarangay,
        string memory beneficiaryBarangay,
        string memory landUseType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(LandClause(hostBarangay, beneficiaryBarangay, landUseType, emotionalTag));
        emit LandShared(hostBarangay, beneficiaryBarangay, landUseType, emotionalTag);
    }
}
