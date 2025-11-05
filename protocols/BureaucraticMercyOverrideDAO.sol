// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BureaucraticMercyOverrideDAO {
    address public steward;

    struct OverrideEntry {
        string agency;
        string overrideSignal;
        string mercyMechanism;
        string emotionalTag;
    }

    OverrideEntry[] public registry;

    event BureaucraticMercyOverrideTagged(string agency, string overrideSignal, string mercyMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function overrideBureaucracy(
        string memory agency,
        string memory overrideSignal,
        string memory mercyMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(OverrideEntry(agency, overrideSignal, mercyMechanism, emotionalTag));
        emit BureaucraticMercyOverrideTagged(agency, overrideSignal, mercyMechanism, emotionalTag);
    }
}
