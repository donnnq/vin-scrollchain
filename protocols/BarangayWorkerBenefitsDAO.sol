// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWorkerBenefitsDAO {
    address public steward;

    struct BenefitEntry {
        string workerName;
        string benefitType;
        string provider;
        string emotionalTag;
    }

    BenefitEntry[] public registry;

    event WorkerBenefitTagged(string workerName, string benefitType, string provider, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWorkerBenefit(
        string memory workerName,
        string memory benefitType,
        string memory provider,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BenefitEntry(workerName, benefitType, provider, emotionalTag));
        emit WorkerBenefitTagged(workerName, benefitType, provider, emotionalTag);
    }
}
