// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayCoolingMandateCodex {
    address public steward;

    struct CoolingMandate {
        string barangay;
        string mandateType;
        string implementationProtocol;
        string emotionalTag;
    }

    CoolingMandate[] public codex;

    event CoolingMandateTagged(string barangay, string mandateType, string implementationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCoolingMandate(
        string memory barangay,
        string memory mandateType,
        string memory implementationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CoolingMandate(barangay, mandateType, implementationProtocol, emotionalTag));
        emit CoolingMandateTagged(barangay, mandateType, implementationProtocol, emotionalTag);
    }
}
