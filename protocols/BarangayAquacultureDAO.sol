// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayAquacultureDAO {
    address public steward;

    struct AquacultureEntry {
        string barangay;
        string speciesType;
        string aquafarmPartner;
        string emotionalTag;
    }

    AquacultureEntry[] public registry;

    event AquacultureTagged(string barangay, string speciesType, string aquafarmPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAquaculture(
        string memory barangay,
        string memory speciesType,
        string memory aquafarmPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AquacultureEntry(barangay, speciesType, aquafarmPartner, emotionalTag));
        emit AquacultureTagged(barangay, speciesType, aquafarmPartner, emotionalTag);
    }
}
