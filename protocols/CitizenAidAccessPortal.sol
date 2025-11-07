// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenAidAccessPortal {
    address public steward;

    struct AccessRequest {
        string nationalID;
        string aidType;
        string requestDate;
        string status;
        string emotionalTag;
    }

    AccessRequest[] public requests;

    event AidAccessRequested(string nationalID, string aidType, string requestDate, string status, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function requestAidAccess(
        string memory nationalID,
        string memory aidType,
        string memory requestDate,
        string memory status,
        string memory emotionalTag
    ) public onlySteward {
        requests.push(AccessRequest(nationalID, aidType, requestDate, status, emotionalTag));
        emit AidAccessRequested(nationalID, aidType, requestDate, status, emotionalTag);
    }
}
