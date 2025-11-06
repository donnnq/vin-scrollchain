// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ISFRelocationJusticeTreaty {
    address public steward;

    struct RelocationEntry {
        string familyID;
        string originBarangay;
        string relocationSite;
        string dignityProtocol;
        string emotionalTag;
    }

    RelocationEntry[] public treaty;

    event ISFRelocationTagged(string familyID, string originBarangay, string relocationSite, string dignityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRelocation(
        string memory familyID,
        string memory originBarangay,
        string memory relocationSite,
        string memory dignityProtocol,
        string memory emotionalTag
    ) public onlySteard {
        treaty.push(RelocationEntry(familyID, originBarangay, relocationSite, dignityProtocol, emotionalTag));
        emit ISFRelocationTagged(familyID, originBarangay, relocationSite, dignityProtocol, emotionalTag);
    }
}
