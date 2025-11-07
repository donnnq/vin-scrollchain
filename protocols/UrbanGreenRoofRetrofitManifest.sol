// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanGreenRoofRetrofitManifest {
    address public steward;

    struct RetrofitEntry {
        string buildingName;
        string barangay;
        string timestamp;
        string retrofitType;
        string ecologicalBenefit;
        string emotionalTag;
    }

    RetrofitEntry[] public manifest;

    event GreenRoofRetrofitLogged(string buildingName, string barangay, string timestamp, string retrofitType, string ecologicalBenefit, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRetrofit(
        string memory buildingName,
        string memory barangay,
        string memory timestamp,
        string memory retrofitType,
        string memory ecologicalBenefit,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(RetrofitEntry(buildingName, barangay, timestamp, retrofitType, ecologicalBenefit, emotionalTag));
        emit GreenRoofRetrofitLogged(buildingName, barangay, timestamp, retrofitType, ecologicalBenefit, emotionalTag);
    }
}
