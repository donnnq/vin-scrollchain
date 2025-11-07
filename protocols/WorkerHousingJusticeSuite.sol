// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerHousingJusticeSuite {
    address public steward;

    struct HousingEntry {
        string timestamp;
        string companyOrLGU;
        string housingType;
        string transportSupport;
        string emotionalTag;
    }

    HousingEntry[] public suite;

    event HousingJusticeDeployed(string timestamp, string companyOrLGU, string housingType, string transportSupport, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function deployHousingJustice(
        string memory timestamp,
        string memory companyOrLGU,
        string memory housingType,
        string memory transportSupport,
        string memory emotionalTag
    ) public onlySteward {
        suite.push(HousingEntry(timestamp, companyOrLGU, housingType, transportSupport, emotionalTag));
        emit HousingJusticeDeployed(timestamp, companyOrLGU, housingType, transportSupport, emotionalTag);
    }
}
