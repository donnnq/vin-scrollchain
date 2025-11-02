// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayParadeDAO {
    address public steward;

    struct ParadeEntry {
        string barangay;
        string paradeTheme;
        string communityPartner;
        string emotionalTag;
    }

    ParadeEntry[] public registry;

    event ParadeTagged(string barangay, string paradeTheme, string communityPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagParade(
        string memory barangay,
        string memory paradeTheme,
        string memory communityPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ParadeEntry(barangay, paradeTheme, communityPartner, emotionalTag));
        emit ParadeTagged(barangay, paradeTheme, communityPartner, emotionalTag);
    }
}
