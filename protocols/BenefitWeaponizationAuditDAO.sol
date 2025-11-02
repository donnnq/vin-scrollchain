// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BenefitWeaponizationAuditDAO {
    address public steward;

    struct WeaponizationEntry {
        string benefitType;
        string weaponizedBy;
        string impactSummary;
        string emotionalTag;
    }

    WeaponizationEntry[] public registry;

    event BenefitWeaponizationAudited(string benefitType, string weaponizedBy, string impactSummary, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditWeaponization(
        string memory benefitType,
        string memory weaponizedBy,
        string memory impactSummary,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(WeaponizationEntry(benefitType, weaponizedBy, impactSummary, emotionalTag));
        emit BenefitWeaponizationAudited(benefitType, weaponizedBy, impactSummary, emotionalTag);
    }
}
