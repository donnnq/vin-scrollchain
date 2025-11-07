// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanRainGardenRetrofitLedger {
    address public steward;

    struct RainGardenEntry {
        string location;
        string barangay;
        string timestamp;
        string retrofitStatus;
        string ecologicalBenefit;
        string emotionalTag;
    }

    RainGardenEntry[] public ledger;

    event RainGardenRetrofitLogged(string location, string barangay, string timestamp, string retrofitStatus, string ecologicalBenefit, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRetrofit(
        string memory location,
        string memory barangay,
        string memory timestamp,
        string memory retrofitStatus,
        string memory ecologicalBenefit,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(RainGardenEntry(location, barangay, timestamp, retrofitStatus, ecologicalBenefit, emotionalTag));
        emit RainGardenRetrofitLogged(location, barangay, timestamp, retrofitStatus, ecologicalBenefit, emotionalTag);
    }
}
