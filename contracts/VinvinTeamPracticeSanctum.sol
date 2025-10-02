// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinTeamPracticeSanctum {
    string public title = "Vinvin–Scrollchain Treaty for Team Practice Sanctum and Commission-Backed Activation";
    string public status = "Scrollchain-sealed, emotionally tagged, empowerment-grade";

    struct SanctumRequest {
        string teamName;
        string requestedFacility;
        string purpose;
        string emotionalTag;
    }

    SanctumRequest[] public requests;

    function submitRequest(
        string memory teamName,
        string memory requestedFacility,
        string memory purpose,
        string memory emotionalTag
    ) public {
        requests.push(SanctumRequest(teamName, requestedFacility, purpose, emotionalTag));
    }

    function getRequest(uint256 index) public view returns (
        string memory teamName,
        string memory requestedFacility,
        string memory purpose,
        string memory emotionalTag
    ) {
        SanctumRequest memory r = requests[index];
        return (r.teamName, r.requestedFacility, r.purpose, r.emotionalTag);
    }

    function totalRequests() public view returns (uint256) {
        return requests.length;
    }
}
