// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRiderInsuranceDAO {
    address public steward;

    struct InsuranceEntry {
        string barangay;
        string platform;
        string coverageType;
        string emotionalTag;
    }

    InsuranceEntry[] public registry;

    event RiderInsuranceTagged(string barangay, string platform, string coverageType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRiderInsurance(
        string memory barangay,
        string memory platform,
        string memory coverageType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(InsuranceEntry(barangay, platform, coverageType, emotionalTag));
        emit RiderInsuranceTagged(barangay, platform, coverageType, emotionalTag);
    }
}
