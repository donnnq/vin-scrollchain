// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriceManipulationImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string commodity;
        string location;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event PriceManipulationImmunityTagged(string commodity, string location, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory commodity,
        string memory location,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(commodity, location, immunityProtocol, emotionalTag));
        emit PriceManipulationImmunityTagged(commodity, location, immunityProtocol, emotionalTag);
    }
}
